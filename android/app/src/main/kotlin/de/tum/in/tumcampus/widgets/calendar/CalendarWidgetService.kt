package de.tum.`in`.tumcampus.widgets.calendar

import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import android.widget.RemoteViewsService
import de.tum.`in`.tumcampus.util.DateTimeUtils
import de.tum.`in`.tumcampus.R
import de.tum.`in`.tumcampus.util.Const
import es.antonborri.home_widget.HomeWidgetPlugin
import kotlinx.serialization.json.Json
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.time.format.TextStyle
import java.util.*
import kotlin.collections.ArrayList

class CalendarWidgetService : RemoteViewsService() {

    override fun onGetViewFactory(intent: Intent): RemoteViewsFactory {
        return CalendarRemoteViewFactory(this.applicationContext)
    }

    private class CalendarRemoteViewFactory(
        private val applicationContext: Context
    ) : RemoteViewsFactory {
        private var calendarEvents: List<WidgetCalendarItem> = ArrayList()

        override fun onCreate() {}

        override fun onDataSetChanged() {
            val widgetData = HomeWidgetPlugin.getData(applicationContext)
            val data = widgetData.getString("calendar", null)
            if (data != null) {
                calendarEvents = Json.decodeFromString<Array<WidgetCalendarItem>>(data).asList()
            }

            calendarEvents.filter { widgetCalendarItem ->
                widgetCalendarItem.endDate.isAfter(LocalDateTime.now())
            }

            // Set isFirstOnDay flags
            if (calendarEvents.isNotEmpty()) {
                calendarEvents[0].isFirstOnDay = true
            }

            for (index in 1 until calendarEvents.size) {
                val startTime = calendarEvents[index - 1].startDate

                val thisEvent = calendarEvents[index]
                val thisTime = thisEvent.startDate

                if (!DateTimeUtils.isSameDay(startTime, thisTime)) {
                    thisEvent.isFirstOnDay = true
                }
            }
        }

        override fun onDestroy() {}

        override fun getCount() = calendarEvents.size

        override fun getViewAt(position: Int): RemoteViews? {
            if (position >= calendarEvents.size) {
                return null
            }

            val remoteViews = RemoteViews(
                applicationContext.packageName,
                R.layout.calendar_widget_item
            )

            // Get the lecture for this view
            val currentItem = this.calendarEvents[position]
            val startTime = currentItem.startDate

            // Setup the date
            if (currentItem.isFirstOnDay) {
                remoteViews.setTextViewText(
                    R.id.calendar_widget_date_day,
                    startTime.dayOfMonth.toString()
                )
                remoteViews.setTextViewText(
                    R.id.calendar_widget_date_weekday,
                    startTime.month.getDisplayName(TextStyle.SHORT, Locale.getDefault())
                )
                remoteViews.setViewPadding(R.id.calendar_widget_item, 0, 15, 0, 0)
            } else {
                // Overwrite unused parameters, as the elements are reused they may could be filled with old parameters
                remoteViews.setTextViewText(R.id.calendar_widget_date_day, "")
                remoteViews.setTextViewText(R.id.calendar_widget_date_weekday, "")
                remoteViews.setViewPadding(R.id.calendar_widget_item, 0, 0, 0, 0)
            }

            // Setup event color
            remoteViews.setInt(
                R.id.calendar_widget_event,
                "setBackgroundColor",
                currentItem.getEventColor(applicationContext)
            )

            // Setup event title
            remoteViews.setTextViewText(R.id.calendar_widget_event_title, currentItem.title)

            // Setup event time
            val formatter = DateTimeFormatter.ofPattern("hh:mm a")
            val startTimeText = formatter.format(startTime)
            val endTimeText = formatter.format(currentItem.endDate)
            val eventTime = applicationContext.getString(
                R.string.event_start_end_format_string,
                startTimeText,
                endTimeText
            )
            remoteViews.setTextViewText(R.id.calendar_widget_event_time, eventTime)

            // Setup event location
            if (currentItem.location?.isNotEmpty() == true) {
                val locationText = currentItem.location.firstOrNull()
                    ?: applicationContext.getString(R.string.unknown)
                remoteViews.setTextViewText(R.id.calendar_widget_event_location, locationText)
            }

            // Setup action to open calendar
            val fillInIntent = Intent().apply {
                putExtra(Const.EVENT_TIME, currentItem.startDate)
            }
            remoteViews.setOnClickFillInIntent(R.id.calendar_widget_event, fillInIntent)

            return remoteViews
        }

        override fun getLoadingView() = null

        override fun getViewTypeCount() = 1

        override fun getItemId(position: Int) = position.toLong()

        override fun hasStableIds() = true
    }
}

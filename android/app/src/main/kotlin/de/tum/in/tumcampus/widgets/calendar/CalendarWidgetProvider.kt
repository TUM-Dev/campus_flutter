package de.tum.`in`.tumcampus.widgets.calendar

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.view.View
import android.widget.RemoteViews
import de.tum.`in`.tumcampus.MainActivity
import de.tum.`in`.tumcampus.R
import de.tum.`in`.tumcampus.util.DateTimeSerializer
import de.tum.`in`.tumcampus.util.timeAgo
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.Period
import java.time.format.DateTimeFormatter
import java.time.format.FormatStyle
import java.time.format.TextStyle
import java.util.Locale
import androidx.core.net.toUri

class CalendarWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        // There may be multiple widgets active, so update all of them
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId, widgetData)
        }
    }

    private fun updateAppWidget(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        widgetData: SharedPreferences
    ) {
        // Instantiate the RemoteViews object for the app widget layout.
        val remoteViews = RemoteViews(context.packageName, R.layout.calendar_widget)

        // Set formatted date in the header
        val localDate = LocalDate.now()
        val dateFormatter =
            DateTimeFormatter.ofLocalizedDate(FormatStyle.MEDIUM).withLocale(Locale.getDefault())
        val date = localDate.format(dateFormatter)
        val weekday = localDate.dayOfWeek.getDisplayName(TextStyle.FULL, Locale.getDefault())
        remoteViews.setTextViewText(R.id.calendar_widget_date, "$weekday, $date")

        // Set last saved date in the header
        val lastSaved = widgetData.getString("calendar_save", null)
        val lastSavedDate = DateTimeSerializer.deserializeStringToDate(lastSaved)
        val lastSavedDateString = (lastSavedDate ?: LocalDateTime.now()).timeAgo(context)
        remoteViews.setTextViewText(R.id.calendar_widget_updated_on, lastSavedDateString)

        if (lastSavedDate != null && Period.between(
                LocalDate.now(),
                lastSavedDate.toLocalDate(),
            ).days < 14
        ) {
            // Set up the intent that starts the calendarWidgetService
            val intent = Intent(context, CalendarWidgetService::class.java)
            intent.putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, appWidgetId)
            intent.data = intent.toUri(Intent.URI_INTENT_SCHEME).toUri()
            remoteViews.setRemoteAdapter(R.id.calendar_widget_listview, intent)

            // The empty view is displayed when the collection has no items.
            // It should be in the same layout used to instantiate the RemoteViews
            // object above.
            remoteViews.setEmptyView(R.id.calendar_widget_listview, R.id.empty_list_item)
            remoteViews.setViewVisibility(R.id.old_data_item, View.INVISIBLE)
        } else {
            remoteViews.setViewVisibility(R.id.old_data_item, View.VISIBLE)
            remoteViews.setViewVisibility(R.id.calendar_widget_listview, View.INVISIBLE)
        }

        val pendingIntentWithData = HomeWidgetLaunchIntent.getActivity(
            context,
            MainActivity::class.java,
            "tumCampusApp://message?homeWidget=calendar".toUri()
        )
        remoteViews.setOnClickPendingIntent(R.id.calendar_widget, pendingIntentWithData)

        // Instruct the widget manager to update the widget
        appWidgetManager.updateAppWidget(appWidgetId, remoteViews)
        appWidgetManager.notifyAppWidgetViewDataChanged(appWidgetId, R.id.calendar_widget_listview)
    }
}

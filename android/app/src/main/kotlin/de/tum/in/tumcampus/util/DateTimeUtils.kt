package de.tum.`in`.tumcampus.util

import java.time.Duration
import java.time.LocalDateTime

object DateTimeUtils {
    /**
     * Checks whether two DateTime contain the same day
     *
     * @return true if both dates are on the same day
     */
    fun isSameDay(first: LocalDateTime, second: LocalDateTime) =
            first.year == second.year && first.dayOfYear == second.dayOfYear

}

fun LocalDateTime.timeAgo(): String {
    val now = LocalDateTime.now()
    val duration = Duration.between(this, now)

    val years = duration.toDays() / 365
    val months = duration.toDays() / 30
    val days = duration.toDays()
    val hours = duration.toHours()
    val minutes = duration.toMinutes()

    return when {
        years > 0 -> "$years year${if (years > 1) "s" else ""} ago"
        months > 0 -> "$months month${if (months > 1) "s" else ""} ago"
        days > 0 -> "$days day${if (days > 1) "s" else ""} ago"
        hours > 0 -> "$hours hour${if (hours > 1) "s" else ""} ago"
        minutes > 0 -> "$minutes minute${if (minutes > 1) "s" else ""} ago"
        else -> "moments ago"
    }
}

package de.tum.`in`.tumcampus.util

import com.google.gson.JsonDeserializationContext
import com.google.gson.JsonDeserializer
import com.google.gson.JsonElement
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat
import java.lang.reflect.Type

class LocalDateTimeDeserializer : JsonDeserializer<DateTime> {
    override fun deserialize(
            json: JsonElement?,
            typeOfT: Type?,
            context: JsonDeserializationContext?
    ): DateTime {
        return deserializeStringToDate(json?.asString)
    }
}

fun deserializeStringToDate(dateString: String?): DateTime {
    val formatter = DateTimeFormat.forPattern("yyyy-MM-dd'T'HH:mm:ss.SSSSSS")
    return DateTime.parse(dateString, formatter)
}
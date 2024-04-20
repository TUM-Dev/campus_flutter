package de.tum.`in`.tumcampus.util


import kotlinx.serialization.ExperimentalSerializationApi
import kotlinx.serialization.KSerializer
import kotlinx.serialization.Serializer
import kotlinx.serialization.encoding.Decoder
import kotlinx.serialization.encoding.Encoder
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat

@OptIn(ExperimentalSerializationApi::class)
@Serializer(forClass = DateTime::class)
object DateTimeSerializer : KSerializer<DateTime> {
    private val formatter = DateTimeFormat.forPattern("yyyy-MM-dd'T'HH:mm:ss.SSSSSS")

    override fun serialize(encoder: Encoder, value: DateTime) {
        encoder.encodeString(value.toString(formatter))
    }

    override fun deserialize(decoder: Decoder): DateTime {
        return DateTime.parse(decoder.decodeString(), formatter)
    }

    fun deserializeStringToDate(dateString: String?): DateTime? {
        return try {
            val formatter = DateTimeFormat.forPattern("yyyy-MM-dd'T'HH:mm:ss.SSSSSS")
            DateTime.parse(dateString, formatter)
        } catch (_: Exception) {
            null
        }
    }
}

/*
class LocalDateTimeDeserializer : JsonDeserializer<DateTime?> {
    override fun deserialize(
            json: JsonElement?,
            typeOfT: Type?,
            context: JsonDeserializationContext?
    ): DateTime? {
        return deserializeStringToDate(json?.asString)
    }
}

fun deserializeStringToDate(dateString: String?): DateTime? {
    return try {
        val formatter = DateTimeFormat.forPattern("yyyy-MM-dd'T'HH:mm:ss.SSSSSS")
        DateTime.parse(dateString, formatter)
    } catch (_: Exception) {
        null
    }
}
 */
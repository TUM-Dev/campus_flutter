# Remote Config status messages

Publish these case-sensitive Firebase Remote Config parameters to control the
banner in debug, profile, and release builds. Debug builds fetch on every startup;
profile and release builds use a one-hour minimum fetch interval. Live updates
also refresh activated values while the app is running.

The banner appears on the login screen and in the main app. On the login screen,
it spans the full width and stays above the form. The form scrolls when needed on
small displays or with the keyboard open.

| Key | Type | Default | Effect |
| --- | --- | --- | --- |
| `tumOnlineStatusMessage_en` | String | Empty | Custom English announcement |
| `tumOnlineStatusMessage_de` | String | Empty | Custom German announcement |
| `isTUMOnlineMaintenanceMode` | Boolean | `false` | Built-in localized maintenance message |
| `isTUMOnlineDegraded` | Boolean | `false` | Built-in localized degraded-service message |

When either custom string contains non-whitespace text, it takes priority over
both Boolean flags. The app selects the current language and falls back to the
other translation if that language is empty. Surrounding whitespace is removed.
The strings are displayed as plain text and wrap within the banner.

To remove a custom announcement, clear both strings and publish the changes.
The app then shows maintenance if enabled, otherwise degraded service if enabled,
otherwise no banner. Missing parameters behave like their defaults above.

Activated values are restored from the device cache on startup and refreshed
through fetching and live updates. Previously released apps without custom
string support continue to use the Boolean flags.

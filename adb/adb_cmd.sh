
# 1) list pkg

adb -s <device_id> shell pm list packages | grep com.google.android.mobly.snippet.bundled

# 2) get pkg path

adb -s <device_id> shell pm path com.google.android.mobly.snippet.bundled

# 3) pull pkg from device (to local path)

# 4) install pkg to device directly

adb -s <device_id> install --bypass-low-target-sdk-block mobly_bundled_snippets.apk

# 5) push to a device

adb -s <device_id> push /path/to/your/app.apk /data/local/tmp/

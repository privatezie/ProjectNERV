LOG_STEP_IN "- Disable Vulkan rendering"
SET_PROP "vendor" "ro.hwui.use_vulkan" "false"
SET_PROP "vendor" "debug.hwui.renderer" "skiagl"
SET_PROP "vendor" "debug.renderengine.backend" "skiagl"
SET_PROP "vendor" "renderthread.skia.reduceopstasksplitting" "true"
SET_PROP "vendor" "debug.hwui.skia_atrace_enabled" "false"
LOG_STEP_OUT

LOG_STEP_IN "- Netflix props"
SET_PROP "vendor" "ro.netflix.bsp_rev" "MTK6789-35965-1"
LOG_STEP_OUT

LOG_STEP_IN "- Enable UFFD GC"
SET_PROP "product" "ro.dalvik.vm.enable_uffd_gc" "true"
LOG_STEP_OUT

DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk"

FTP="
system/priv-app/SecSettings/SecSettings.apk/smali_classes4/com/samsung/android/settings/deviceinfo/batteryinfo/BatteryRegulatoryPreferenceController.smali
system/priv-app/SecSettings/SecSettings.apk/smali_classes4/com/samsung/android/settings/deviceinfo/batteryinfo/SecBatteryFirstUseDatePreferenceController.smali
system/priv-app/SecSettings/SecSettings.apk/smali_classes4/com/samsung/android/settings/deviceinfo/batteryinfo/SecBatteryInfoFragment.smali
"
for f in $FTP; do
    sed -i "s/SM-A236B/SM-S711B/g" "$APKTOOL_DIR/$f"
done

LOG_STEP_OUT

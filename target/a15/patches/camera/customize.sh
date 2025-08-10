LOG_STEP_IN "- Add stock camera libs"
#dualcam, arcsoft
BLOBS_LIST="
system/lib64/libdualcam_portraitlighting_gallery_360.so
system/lib64/libdualcam_refocus_image.so
system/lib64/libDualCamBokehCapture.camera.samsung.so
system/lib64/libhigh_res.arcsoft.so
system/lib64/lib_pet_detection.arcsoft.so
system/lib64/libae_bracket_hdr.arcsoft.so
system/lib64/libFaceRecognition.arcsoft.so
system/lib64/libfrtracking_engine.arcsoft.so
system/lib64/libhighres_enhancement.arcsoft.so
system/lib64/libsuperresolution_raw.arcsoft.so
system/lib64/libarcsoft_superresolution_bokeh.so
system/lib64/libPortraitDistortionCorrection.arcsoft.so
system/lib64/libPortraitDistortionCorrectionCali.arcsoft.so
system/lib64/libarcsoft_single_cam_glasses_seg.so
system/lib64/libarcsoft_dualcam_portraitlighting.so
"
for blob in $BLOBS_LIST
do
    DELETE_FROM_WORK_DIR "system" "$blob"
done

BLOBS_LIST="
system/lib64/libdualcam_portraitlighting_gallery_360_lite.so
system/lib64/libFacialAttributeDetection.arcsoft.so
system/lib64/libGalleryDistortionCorrection.arcsoft.so
system/lib64/libGalleryDistortionDetector.arcsoft.so
system/lib64/libPortraitDistortionCorrection.arcsoft.so
system/lib64/libPortraitDistortionCorrectionCali.arcsoft.so
system/lib64/libarcsoft_photoeditor.arcsoft.so
"
for blob in $BLOBS_LIST
do
    ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "$blob" 0 0 644 "u:object_r:system_lib_file:s0"
done

#camera
BLOBS_LIST="
system/lib64/libHpr_RecFace_dl_v1.0.camera.samsung.so
system/lib64/libsaiv_HprFace_cmh_support_jni.camera.samsung.so
system/lib64/libSceneDetector_v1.camera.samsung.so
system/lib64/libtensorflowLite.camera.samsung.so
system/lib64/libtensorflowLite.myfilter.camera.samsung.so
system/lib64/libtensorflowlite_inference_api.camera.samsung.so
system/lib64/libtensorflowlite_inference_api.myfilter.camera.samsung.so
system/lib64/libImageTagger.camera.samsung.so
system/lib64/libImageCropper.camera.samsung.so
"
for blob in $BLOBS_LIST
do
    ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "$blob" 0 0 644 "u:object_r:system_lib_file:s0"
done
{
    echo "libLttEngine.camera.samsung.so"
} >> "$WORK_DIR/system/system/etc/public.libraries-camera.samsung.txt"
LOG_STEP_OUT

LOG_STEP_IN "- Add stock public librairies"
BLOBS_LIST="
system/etc/public.libraries-arcsoft.txt
system/etc/public.libraries-camera.samsung.txt
"
for blob in $BLOBS_LIST
do
    ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "$blob" 0 0 644 "u:object_r:system_lib_file:s0"
done

LOG_STEP_OUT
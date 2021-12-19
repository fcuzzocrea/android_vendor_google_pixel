include vendor/google_pixel/codenames.mk

## Google Fonts
PRODUCT_COPY_FILES += \
   vendor/google_pixel/google-fonts/google-fonts.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml

PRODUCT_PACKAGES += \
    GoogleFonts

## Pixel Apps
include vendor/google_pixel/apps/GoogleApps.mk

## Pixel Sounds
# Don't build on devices with limited partition sizes
ifneq ($(WITH_GMS_MINIMAL),true)
include vendor/google_pixel/sounds/GoogleAudio.mk
endif

## Pixel Theme
PRODUCT_PACKAGES += \
    PixelSetupWizardStringsOverlay

PRODUCT_PACKAGE_OVERLAYS += vendor/google_pixel/overlays/overlay-theme
PRODUCT_PRODUCT_PROPERTIES += ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural;com.android.theme.icon.circle;org.lineageos.overlay.customization.navbar.nohint \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.theme_id=5 \
    ro.opa.eligible_device=true \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.esim_cid_ignore=00000001 \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
    setupwizard.feature.show_pixel_tos=true \
    setupwizard.feature.skip_button_use_mobile_data.carrier1839=true

# Artifact Path Exclusions
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/app/GoogleExtShared/GoogleExtShared.apk \
    system/app/SoundPickerPrebuilt/SoundPickerPrebuilt.apk \
    system/etc/permissions/privapp-permissions-pixel-s.xml \
    system/etc/permissions/privapp-permissions-pixel.xml \
    system/priv-app/GoogleExtServices/GoogleExtServices.apk


include vendor/google_pixel/codenames.mk

## Google Fonts
# LineageOS already defines font_customization.xml, and there's no way to override it.
# Therefore, on LineageOS run `repopick -f 289513` prior to every build.
ifndef LINEAGE_BUILD
PRODUCT_COPY_FILES += \
   vendor/google_pixel/google-fonts/google-fonts.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml
endif

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
    PixelTheme \
    PixelQuickstep

PRODUCT_PACKAGE_OVERLAYS += vendor/google_pixel/overlays/overlay-theme
PRODUCT_PRODUCT_PROPERTIES += ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.boot.vendor.overlay.theme=com.google.android.theme.pixel;com.android.theme.icon.circle \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.theme_id=5 \
    ro.opa.eligible_device=true

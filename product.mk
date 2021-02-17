include vendor/google_pixel/codenames.mk

## Exclude us from RRO enforcement, as it is broken at the moment
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/google_pixel

## Google Fonts
PRODUCT_PACKAGES += \
    GoogleFonts

ADDITIONAL_FONTS_FILE += vendor/google_pixel/pixel-theme/google-fonts.xml

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

ifndef LINEAGE_BUILD
PRODUCT_PACKAGE_OVERLAYS += vendor/google_pixel/overlays/overlay-lineage
endif
PRODUCT_PACKAGE_OVERLAYS += vendor/google_pixel/overlays/overlay-theme
PRODUCT_PRODUCT_PROPERTIES += ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.boot.vendor.overlay.theme=com.google.android.theme.pixel;com.android.internal.systemui.navbar.gestural;com.android.theme.icon.circle
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.theme_id=5 \
    ro.opa.eligible_device=true

## Turbo
# Only include on Pixels
ifneq ($(filter $(TURBO_CODENAMES),$(TARGET_PRODUCT)),)
$(call inherit-product-if-exists, vendor/partner_gms/products/turbo.mk)
PRODUCT_PACKAGE_OVERLAYS += vendor/google_pixel/overlays/overlay-turbo
endif

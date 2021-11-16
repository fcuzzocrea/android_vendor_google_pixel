## Build appropriate year wallpaper package on Pixels
ifneq ($(filter $(PIXEL2016_CODENAMES),$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    NexusWallpapersStubPrebuilt
endif
ifneq ($(filter $(PIXEL2017_CODENAMES),$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    NexusWallpapersStubPrebuilt2017
endif
ifneq ($(filter $(PIXEL2018_CODENAMES) $(PIXEL2019_MIDYEAR_CODENAMES),$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    NexusWallpapersStubPrebuilt2018
endif
ifneq ($(filter $(PIXEL2019_CODENAMES),$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    NexusWallpapersStubPrebuilt2019
endif
ifneq ($(filter $(PIXEL2020_CODENAMES),$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    PixelWallpapers2020
endif

## Only build DevicePersonalizationServices on non-Pixels
ifeq ($(filter $(PIXEL_CODENAMES),$(TARGET_PRODUCT)),)
PRODUCT_PACKAGES += \
    DeviceIntelligenceNetworkPrebuilt2021 \
    DevicePersonalizationPrebuiltPixel2021
endif

## Core packages
PRODUCT_PACKAGES += \
    GoogleExtServices \
    NexusLauncherRelease \
    PixelSetupWizard \
    PixelSetupWizardOverlay \
    PlayAutoInstallConfig \
    TurboPrebuilt \
    WallpaperPickerGooglePrebuilt

## Extra packages
ifneq ($(WITH_GMS_MINIMAL),true)
PRODUCT_PACKAGES += \
    MarkupGoogle
endif

## Privledged App Permissions
# Not split to account for the fact these apps are put in different locations by different GApps packages
PRODUCT_COPY_FILES += \
    vendor/google_pixel/apps/permissions/privapp-permissions-pixel.xml:system/etc/permissions/privapp-permissions-pixel.xml
PRODUCT_COPY_FILES += \
    vendor/google_pixel/apps/permissions/privapp-permissions-pixel.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-pixel.xml
PRODUCT_COPY_FILES += \
    vendor/google_pixel/apps/permissions/privapp-permissions-pixel.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-pixel.xml
PRODUCT_COPY_FILES += \
    vendor/google_pixel/apps/permissions/privapp-permissions-pixel-s.xml:system/etc/permissions/privapp-permissions-pixel-s.xml
PRODUCT_COPY_FILES += \
    vendor/google_pixel/apps/permissions/privapp-permissions-google-p-pixel.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-p-pixel.xml
PRODUCT_COPY_FILES += \
    vendor/google_pixel/apps/permissions/privapp-permissions-google-se-pixel.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-google-se-pixel.xml

PRODUCT_PACKAGE_OVERLAYS += vendor/google_pixel/overlays/overlay-gms

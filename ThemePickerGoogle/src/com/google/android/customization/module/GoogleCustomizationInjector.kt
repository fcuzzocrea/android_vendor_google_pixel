package com.google.android.customization.module

import com.android.wallpaper.module.CustomizationSections

import com.android.customization.module.DefaultCustomizationInjector

public class GoogleCustomizationInjector : DefaultCustomizationInjector() {

    private var customizationSections: CustomizationSections? = null

    override fun getCustomizationSections(): CustomizationSections {
        if (customizationSections == null) {
            customizationSections = GoogleCustomizationSections()
        }
        return customizationSections!!
    }

}

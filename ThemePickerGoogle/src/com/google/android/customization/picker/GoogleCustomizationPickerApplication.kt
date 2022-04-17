package com.google.android.customization.picker

import android.app.Application;

import com.android.wallpaper.module.InjectorProvider;

import com.google.android.customization.module.GoogleCustomizationInjector;

public class GoogleCustomizationPickerApplication : Application() {

    override fun onCreate() {
        super.onCreate()

        InjectorProvider.setInjector(GoogleCustomizationInjector());
    }

}

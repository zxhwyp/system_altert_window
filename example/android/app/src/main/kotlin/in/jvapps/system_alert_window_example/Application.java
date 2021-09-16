package in.jvapps.system_alert_window_example;

import android.os.Bundle;

import in.jvapps.system_alert_window.SystemAlertWindowPlugin;
import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugins.urllauncher.UrlLauncherPlugin;

public class Application extends FlutterApplication implements PluginRegistry.PluginRegistrantCallback {

    @Override
    public void onCreate() {
        super.onCreate();
        SystemAlertWindowPlugin.setPluginRegistrant(this);
    }

    @Override
    public void registerWith(PluginRegistry pluginRegistry) {
        registerWithPluginRegistry(pluginRegistry);
    }

    public static void registerWithPluginRegistry(PluginRegistry registry) {
        if (alreadyRegisteredWith(registry)) {
            return;
        }
        SystemAlertWindowPlugin.registerWith(registry.registrarFor("in.jvapps.system_alert_window.SystemAlertWindowPlugin"));
    }

    private static boolean alreadyRegisteredWith(PluginRegistry registry) {
        final String key = GeneratedPluginRegistrant.class.getCanonicalName();
        if (registry.hasPlugin(key)) {
            return true;
        }
        registry.registrarFor(key);
        return false;
    }
}
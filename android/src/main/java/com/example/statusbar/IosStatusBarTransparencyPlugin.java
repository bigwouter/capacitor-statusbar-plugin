package com.example.statusbar;

import android.graphics.Color;
import android.view.Window;
import androidx.core.view.WindowCompat;
import androidx.core.view.WindowInsetsControllerCompat;
import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "IosStatusBarTransparency")
public class IosStatusBarTransparencyPlugin extends Plugin {

    @PluginMethod
    public void enableTransparency(PluginCall call) {
        String style = call.getString("style", "default");

        if (getActivity() == null) {
            call.reject("Activity is unavailable");
            return;
        }

        getActivity().runOnUiThread(() -> {
            Window window = getActivity().getWindow();

            // Let the web view draw behind the status bar, and make the bar itself transparent
            WindowCompat.setDecorFitsSystemWindows(window, false);
            window.setStatusBarColor(Color.TRANSPARENT);

            // "light" means white status bar text (dark icons off), "dark" means dark text
            WindowInsetsControllerCompat controller = new WindowInsetsControllerCompat(window, window.getDecorView());
            if ("light".equals(style)) {
                controller.setAppearanceLightStatusBars(false);
            } else if ("dark".equals(style)) {
                controller.setAppearanceLightStatusBars(true);
            }

            JSObject ret = new JSObject();
            ret.put("status", "success");
            ret.put("message", "Android status bar transparency unlocked.");
            call.resolve(ret);
        });
    }
}

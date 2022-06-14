package slayer.bg.launcher.bg_launcher;

import android.content.Context;
import android.content.Intent;
import android.util.Log;

import androidx.annotation.NonNull;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

public class BgLauncherPlugin implements FlutterPlugin, MethodCallHandler {
    private static Context context;
    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "bg_launcher");
        channel.setMethodCallHandler(this);
        context = flutterPluginBinding.getApplicationContext();
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("bringAppToForeground")) {
            String action = call.argument("action");
            Map<String, String> extras = call.argument("extras");
            Intent bgLauncherIntent = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
            if (extras != null && !extras.isEmpty()) {
                for (Map.Entry<String, String> entry : extras.entrySet()) {
                    bgLauncherIntent.putExtra(entry.getKey(), entry.getValue());
                }
            }
            if (action != null) {
                bgLauncherIntent.setAction(action);
            }
            bgLauncherIntent.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT);
            context.startActivity(bgLauncherIntent);
            result.success(null);
        } else {
            result.notImplemented();
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}

# bg_launcher

A flutter plugin that brings an in-background android app to the foreground (Android only)

# Restrictions on starting activities from the background 

Apps running on Android 10 or higher can start activities only when one or more of the following conditions are met:

* To make the app works try to add `SYSTEM_ALERT_WINDOW` permission and grant it by the user
 for more info check here [background-starts#exceptions](https://developer.android.com/guide/components/activities/background-starts#exceptions)

## Getting Started

```dart

  /// `extras` & `action` are useful if you want to determine
  /// what you will do when you bring the app from background
  /// you can use `receive_intent` package and filter them with
  /// the action & extras to show your own UI/ logic ...  
  
    BgLauncher.bringAppToForeground(
      action: 'FBI-OPEN-UP',
      extras: 'https://youtu.be/dQw4w9WgXcQ',
    );

```

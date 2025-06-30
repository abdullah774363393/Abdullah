# Flutter wrapper rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }

+++++++# Firebase SDK rules
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }

# Play Core (Fix R8 Missing Classes)
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**
-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }
-keep class io.flutter.embedding.android.FlutterPlayStoreSplitApplication { *; }

# Rules for Gson
-keep class com.google.gson.** { *; }

# الحفاظ على الحقول المعلّمة بالـ @SerializedName
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# للحفاظ على التعليقات والعلامات
-keepattributes Signature
-keepattributes *Annotation*

# قواعد إضافية للحماية من حذف أي كود reflection
-keep class * {
    *;
}

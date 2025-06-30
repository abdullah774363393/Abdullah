# Flutter wrapper rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }

# Firebase SDK rules (لتجنب حذف الكود المستخدم في Firebase)
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }

# Rules for Gson (إذا تستخدم Json)
-keep class com.google.gson.** { *; }

# للحفاظ على أسماء الحقول (إذا تستخدم Json serialization)
-keepattributes Signature
-keepattributes *Annotation*

# تجنب حذف الرموز الخاصة بالـ reflection
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# قواعد أخرى يمكن إضافتها حسب الحاجة

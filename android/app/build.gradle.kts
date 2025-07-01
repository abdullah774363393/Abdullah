plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // ✅ تم إضافته هنا
}

android {
    // تأكد أن 'namespace' يتطابق مع اسم الحزمة في مشروعك
    namespace = "com.example.abdullah_new" // تم التعديل إلى الاسم الأصلي
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // تأكد أن 'applicationId' يتطابق مع اسم الحزمة في مشروعك
        applicationId = "com.example.abdullah_new" // تم التعديل إلى الاسم الأصلي
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true // ← لدعم أكثر من 64K method
    }

    buildTypes {
        getByName("release") {
            isMinifyEnabled = true
            isShrinkResources = true
            signingConfig = signingConfigs.getByName("debug")
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                file("proguard-rules.pro")
            )
        }
    }

    packagingOptions {
        resources.excludes.add("META-INF/*")
    }
}

flutter {
    source = "../.."
}

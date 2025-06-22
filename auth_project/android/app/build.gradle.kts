plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android") version "2.1.0" // ✅ here
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}


android {
    namespace = "com.example.auth_project"
    compileSdk = 34 // Or use: flutter.compileSdkVersion if defined globally
    ndkVersion = "27.0.12077973"

    defaultConfig {
        applicationId = "com.example.auth_project"
        minSdk = 23 // Or use: flutter.minSdkVersion
        targetSdk = 34 // Or: flutter.targetSdkVersion
        versionCode = 1 // Or: flutter.versionCode
        versionName = "1.0" // Or: flutter.versionName
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    // Firebase BoM
    implementation(platform("com.google.firebase:firebase-bom:33.15.0"))

    // Firebase dependencies
    implementation("com.google.firebase:firebase-auth-ktx")
    implementation("com.google.firebase:firebase-analytics-ktx")
}

flutter {
    source = "../.."
}

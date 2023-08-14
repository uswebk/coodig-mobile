generate:
	flutter pub pub run build_runner build --delete-conflicting-outputs

package:
	flutter clean
	flutter pub get

icon:
	flutter pub run flutter_launcher_icons:main

debugview:
	adb shell setprop debug.firebase.analytics.app com.example.coodig_mobile

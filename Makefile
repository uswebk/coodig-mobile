build_runner:
	flutter pub pub run build_runner build --delete-conflicting-outputs

clean:
	flutter clean

icon:
	flutter pub run flutter_launcher_icons:main

# Minimalist Bloc Clean Architecture

A base flutter project using clean architecture and bloc with minimalist structure

## Getting Started

### Assets in this project
  - This project use flutter_gen for generate assets:
    You just need add your assets to assets folder then run script to apply new assets.
  - Script:
    dart run build_runner build --delete-conflicting-outputs
  - You can change generate configs in pubspec.yaml (flutter_gen).
  About flutter_gen: https://pub.dev/packages/flutter_gen
### Fonts in this project
  Steps to config:
  - Add and config in pubspec.yaml
  - Add to the theme
### Languages in this project
  This project use easy_localization for multi languages.
  Steps to config:
  - Add new language file to assets/languages. 
  - Config in app_languages.dart file
  - Init EasyLocalization in main.dart
  - Run this command in root to gen codegen_loader:
      flutter pub run easy_localization:generate --source-dir ./assets/languages  
      --output-dir ./lib/resource/gen
  - (Optional): If you have many localization keys and are confused, key generation will help you.
  The code editor will automatically prompt keys:
    - Run this command in root:
      flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart 
      --source-dir ./assets/languages  --output-dir ./lib/resource/gen
  * Note: For translation to work on iOS you need to add supported locales to ios/Runner/Info.plist
  About easy_localization: https://pub.dev/packages/easy_localization
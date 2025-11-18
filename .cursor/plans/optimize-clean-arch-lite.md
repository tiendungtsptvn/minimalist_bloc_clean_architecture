# Kế hoạch Tối Ưu Codebase

## 1. Chuẩn hóa import và cấu trúc core/data
- [ ] Kiểm tra tất cả import sang `core/base/*` và `core/api/*` trong toàn bộ project, đảm bảo không còn đường dẫn cũ (ví dụ: `base/bloc/bloc.dart` thay vì `core/base/bloc/bloc.dart`).
  - Files cần kiểm tra: `lib/presentation/**/*.dart`
  - Sử dụng `grep` để tìm các import không đúng
- [ ] Cập nhật `lib/core/core.dart` để export các module cần thiết, cho phép import rút gọn `import 'package:.../core/core.dart'` thay vì import từng file riêng lẻ.
- [ ] Tổ chức lại nội dung `lib/data/` để phân biệt rõ với `lib/core/`:
  - Xác định các repository cần tạo trong `lib/data/repositories/`
  - Xác định các model cần tạo trong `lib/data/models/`
  - Đảm bảo `lib/core/` chỉ chứa base classes và utilities dùng chung

## 2. Cải tiến GlobalAppCubit để giảm phụ thuộc hạ tầng
- [ ] Tạo abstraction `AppSettingsStorage` trong `lib/core/storage/app_settings_storage.dart`:
  - Định nghĩa interface/abstract class với methods: `getString(String key)`, `setString(String key, String value)`, `getDeviceLocale()`
  - Tạo implementation `SharedPreferencesAppSettingsStorage` trong `lib/core/storage/shared_preferences_app_settings_storage.dart`
- [ ] Refactor `lib/presentation/app/bloc/app_bloc.dart`:
  - Inject `AppSettingsStorage` qua constructor thay vì gọi trực tiếp `SharedPreferences.getInstance()` và `Platform.localeName`
  - Cập nhật `initLocale()` và các methods liên quan để sử dụng abstraction
- [ ] Cập nhật `lib/presentation/app/app.dart` để inject `SharedPreferencesAppSettingsStorage` vào `GlobalAppCubit`
- [ ] Thêm test nhỏ (nếu cần) trong `test/presentation/app/bloc/app_bloc_test.dart` để đảm bảo cubit vẫn đổi theme/locale đúng

## 3. Làm an toàn hơn cho RestClientBase
- [ ] Refactor `lib/core/api/rest_api_client.dart`:
  - Bổ sung generic type parameter cho các methods: `Future<T> get<T>(...)`, `Future<T> post<T>(...)`, etc.
  - Thêm optional parameter `T Function(dynamic)? fromJson` để map response data
  - Nếu `fromJson` null, trả về `dynamic` (backward compatible)
- [ ] Cải thiện `_mapError()` method:
  - Xử lý an toàn các case non-Dio exception, tránh truy cập property không tồn tại
  - Fallback về `ApiError(code: 'UNKNOWN', message: e.toString(), data: '')` cho các exception không xác định
- [ ] Kiểm tra và cập nhật (nếu có) các nơi sử dụng `RestClientBase` để đảm bảo tương thích với signature mới

## 4. Tối ưu quản lý theme và AppColors
- [ ] Tạo `AppColorsTheme` extension trong `lib/resource/style/app_colors.dart`:
  - Implement `ThemeExtension<AppColorsTheme>` để lưu `AppColors` trong `ThemeData.extensions`
  - Thêm methods: `copyWith()`, `lerp()` theo yêu cầu của Flutter
- [ ] Refactor `lib/resource/style/app_themes.dart`:
  - Thay `AppThemeSetting.currentAppThemeType` (static mutable state) bằng cách add `AppColorsTheme` vào `ThemeData.extensions`
  - Cập nhật `lightTheme` và `darkTheme` để include `AppColorsTheme` extension
- [ ] Cập nhật `ThemeDataExtensions` trong `lib/resource/style/app_themes.dart`:
  - Thay `_appColorMap` và `AppThemeSetting.currentAppThemeType` bằng cách đọc từ `Theme.of(context).extension<AppColorsTheme>()`
- [ ] Đảm bảo `lib/presentation/app/bloc/app_bloc.dart` chỉ lưu state (`isDarkTheme`), không còn cập nhật `AppThemeSetting.currentAppThemeType`

## 5. Dọn dẹp nhỏ trong state & utils
- [ ] Cập nhật `copyWith()` methods trong các state classes:
  - `lib/presentation/app/bloc/app_state.dart`: Đảm bảo `copyWith()` trả về `GlobalAppState`
  - `lib/presentation/shared_view/bottom_bar/bloc/bottom_bar_state.dart`: Đảm bảo `copyWith()` trả về `BottomBarState`
  - Thêm doc comments cho các methods nếu cần
- [ ] Cải thiện `lib/utils/app_utils.dart`:
  - Cập nhật `getLocaleFromLocaleName()` để xử lý trường hợp thiếu country code:
    - Nếu `localeInfo.length == 1`, fallback về `Locale(localeInfo[0])` thay vì `null`
    - Xử lý edge cases khác nếu có

## 6. Xác nhận chất lượng
- [ ] Chạy `flutter analyze` để kiểm tra không còn lỗi hoặc warning
- [ ] Chạy `flutter test` (nếu có test cases) để đảm bảo không có regression
- [ ] Kiểm tra app vẫn chạy bình thường sau các thay đổi
- [ ] Cập nhật `README.md` (nếu cần) với ghi chú về cách enable/disable các module tiện ích:
  - API client module
  - Localization module
  - Theme management

## Lưu ý khi thực hiện

> **Quan trọng**: 
> - Kiểm tra lại một lượt xem bước nào đã hoàn thành (checkbox đã được đánh dấu `[x]`)
> - Chỉ tiếp tục thực hiện các bước chưa hoàn thành
> - Cập nhật checkbox trong plan file (`.cursor/plans/optimize-clean-arch-lite.md`) sau khi hoàn thành mỗi bước
> - Nếu có lỗi phát sinh, dừng lại và báo cáo trước khi tiếp tục
> - Đảm bảo mỗi bước đều được test và verify trước khi chuyển sang bước tiếp theo
> - Tuân thủ các quy tắc trong `.cursor/rules/plan-rule.mdc` và `.cursor/rules/flutter-rule.mdc`


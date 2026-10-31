# Responsive & Adaptive UI - Flutter

Demo dashboard dùng chung một source code cho Android, iOS, Web, Windows, Linux và macOS.

## Breakpoints
- Mobile: chiều rộng < 600 logical pixels: 1 cột, `NavigationBar` phía dưới.
- Tablet: 600–899 logical pixels: 2 cột, `NavigationRail` bên trái.
- Desktop: >= 900 logical pixels: 3 cột, `NavigationRail` mở rộng.

## Chạy dự án
```bash
flutter pub get
flutter devices
flutter run -d chrome
```

Các lệnh khác:
```bash
flutter run -d windows
flutter run -d linux
flutter run -d macos
flutter run                 # chọn emulator/điện thoại đang kết nối
```

## Bật nền tảng nếu chưa có thư mục runner
```bash
flutter config --enable-web
flutter config --enable-windows-desktop
flutter config --enable-linux-desktop
flutter create --platforms=android,ios,web,windows,linux,macos .
```

Lưu ý:
- Windows cần Visual Studio (không phải VS Code) và workload **Desktop development with C++**.
- Linux cần các thư viện desktop development theo hướng dẫn Flutter.
- iOS/macOS cần macOS và Xcode.
- `flutter doctor -v` dùng để kiểm tra môi trường.

## Cấu trúc
- `models/`: model dữ liệu công việc.
- `data/`: dữ liệu demo.
- `utils/`: breakpoint và tiện ích responsive.
- `widgets/`: các thành phần giao diện dùng lại.
- `screens/`: màn hình chính.

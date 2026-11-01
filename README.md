# Chủ đề 03 Responsive và Adaptive UI trong Flutter

Dashboard minh họa cách chọn bố cục và điều hướng theo không gian khả dụng.

## Chạy demo

```bash
cd responsive_adaptive_flutter
flutter pub get
flutter run -d linux
```

Có thể thay `linux` bằng `chrome` để chạy Web. Dự án cũng có cấu hình Android
và Windows; cần cài công cụ tương ứng để chạy trên các nền tảng đó.

## Phân công

| Thành viên | Nội dung | Mã nguồn chính |
| --- | --- | --- |
| Lê Minh Chiến | Responsive UI, breakpoint, thẻ nội dung, lưới theo chiều rộng khả dụng và phần lý thuyết | `lib/utils/responsive.dart`, `lib/widgets/summary_card.dart`, `lib/widgets/task_grid.dart`, `lib/widgets/task_card.dart` |
| Hứa Quốc Cường | Adaptive Navigation, màn hình chính và kết nối giao diện | `lib/screens/home_screen.dart`, `lib/widgets/adaptive_navigation.dart`, `lib/widgets/dashboard_header.dart`, `lib/app.dart`, `lib/main.dart` |

Các đường dẫn trong bảng tính từ `responsive_adaptive_flutter/`.
Màn hình chính là điểm kết nối: đọc kích thước cửa sổ bằng `MediaQuery`, gọi API
`Responsive` và hiển thị các widget nội dung. Việc sửa lỗi tích hợp được ghi trong commit tương ứng.

- [Tài liệu nền tảng và phân công](docs/Chu_de_03_Phan_cong.docx)
- [Slide phần lý thuyết của Chiến](slides/Bao_cao_Chu_de_03_Phan_ly_thuyet.pptx)
- [Hướng dẫn app và kiểm tra](responsive_adaptive_flutter/README.md)

## Quan sát điều gì khi đổi kích thước

- Cửa sổ dưới 600 logical pixels dùng `NavigationBar` ở dưới.
- Từ 600 đến dưới 900 dùng `NavigationRail` thu gọn bên trái.
- Từ 900 trở lên dùng `NavigationRail` mở rộng.
- Lưới nội dung chọn 1, 2 hoặc 3 cột theo chiều rộng còn lại sau thanh điều hướng,
  khoảng đệm và giới hạn nội dung. Vì vậy chế độ Desktop có thể chỉ hiển thị 2 cột.
- Bảng thông tin cuối trang hiển thị kích thước cửa sổ, chiều rộng nội dung và số cột.

Tên Mobile, Tablet và Desktop biểu thị nhóm chiều rộng, không phải nhận diện phần cứng.
Dashboard dùng dữ liệu mẫu. Các nút thêm/sửa/xóa và bộ lọc tháng chưa có nghiệp vụ;
điều hướng hiện thay đổi trạng thái chọn.

## Kiểm tra

```bash
cd responsive_adaptive_flutter
flutter analyze
flutter test
flutter build linux --debug
flutter build web
```

Kiểm tra widget gồm 9 chiều rộng từ 360 đến 1600 logical pixels, giữ lựa chọn
khi đổi từ thanh dưới sang thanh bên, và phân biệt chiều rộng cửa sổ với nội dung.
Môi trường chuẩn bị: Flutter 3.47.7, Dart 3.13.5 trên Linux.

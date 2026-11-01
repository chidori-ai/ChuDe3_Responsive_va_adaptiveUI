# Responsive và Adaptive UI

Dashboard minh họa thay đổi bố cục khi cửa sổ được thu nhỏ hoặc mở rộng.

## Chạy app

Từ thư mục này:

```bash
flutter pub get
flutter run -d linux
```

Chạy trên trình duyệt bằng `flutter run -d chrome`.
Kéo cạnh cửa sổ qua các chiều rộng khoảng 390, 800 và 1400 logical pixels để
quan sát thanh điều hướng và số cột. Cuộn xuống cuối trang để xem thông tin đo được.

## Hai phạm vi kích thước

`MediaQuery.sizeOf(context)` lấy chiều rộng và chiều cao cửa sổ ứng dụng.
`LayoutBuilder` lấy ràng buộc tại vị trí widget, từ đó dùng `constraints.maxWidth`
để chọn số cột nội dung.

| Chiều rộng đang xét | Nhóm | Điều hướng theo cửa sổ | Số cột theo vùng nội dung |
| --- | --- | --- | --- |
| Dưới 600 | Mobile | Thanh dưới | 1 |
| Từ 600 đến dưới 900 | Tablet | Thanh bên thu gọn | 2 |
| Từ 900 trở lên | Desktop | Thanh bên mở rộng | 3 |

Hai phép chọn dùng hai chiều rộng khác nhau. Ví dụ cửa sổ rộng 900 có thanh bên
220, đường phân cách 1 và khoảng đệm hai bên tổng 64, nên vùng nội dung còn 615.
Điều hướng lúc này thuộc nhóm Desktop, còn lưới hiển thị 2 cột.

Thẻ tổng quan có chiều cao 220 logical pixels để tránh tràn chữ khi số cột tăng.
Thẻ công việc dùng chiều cao 270. Chiều rộng các ô thay đổi theo không gian khả dụng.

## Phạm vi demo

Dữ liệu công việc và các số liệu tổng quan là dữ liệu minh họa có sẵn.
Nút thêm mới, bộ lọc tháng và menu sửa/xóa chưa xử lý dữ liệu.
Các mục điều hướng mới thay đổi trạng thái chọn, chưa chuyển sang màn hình nghiệp vụ khác.

## Kiểm tra

```bash
flutter analyze
flutter test
flutter build linux --debug
flutter build web
```

Bộ kiểm tra có 11 tình huống: 9 chiều rộng từ 360 đến 1600, giữ trạng thái điều hướng
khi đổi bố cục và kiểm tra lưới theo chiều rộng nội dung tại cửa sổ rộng 900.

## Cấu trúc

- `lib/utils/responsive.dart`: ngưỡng và API chọn bố cục.
- `lib/widgets/summary_card.dart`: thẻ tổng quan.
- `lib/widgets/task_grid.dart`: lưới công việc theo không gian thực tế.
- `lib/widgets/task_card.dart`: thẻ công việc.
- `lib/widgets/adaptive_navigation.dart`: thanh điều hướng bên cạnh.
- `lib/widgets/dashboard_header.dart`: tiêu đề và các điều khiển phía trên.
- `lib/screens/home_screen.dart`: ghép giao diện, chọn điều hướng và hiển thị thông tin kích thước.
- `lib/models/`, `lib/data/`: kiểu công việc và dữ liệu mẫu.

## Nền tảng

Đã có cấu hình Linux, Web, Android và Windows. Linux và Web được dùng để kiểm tra
bản tích hợp này. Android cần Android SDK; Windows cần Visual Studio với workload
Desktop development with C++ để biên dịch trên máy tương ứng.

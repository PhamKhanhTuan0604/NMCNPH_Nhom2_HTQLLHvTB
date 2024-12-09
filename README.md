# Quản Lý Lịch Học
# Ứng dụng Quản Lý Lịch Học được xây dựng bằng PHP và sử dụng XAMPP để làm môi trường phát triển. Dự án cung cấp giao diện quản lý lịch học, bài tập, và các chức năng liên quan cho quản trị viên và học sinh.
# Yêu cầu phiên bản phần mềm
1. Visual Studio Code
- Visual Studio Code (VS Code) là trình soạn thảo mã nguồn mạnh mẽ và phổ biến để phát triển ứng dụng PHP. Dưới đây là phiên bản và các tiện ích hỗ trợ cần thiết:
- Phiên bản khuyến nghị:
 a.Tải bản mới nhất từ trang chính thức: Visual Studio Code.
 b.Yêu cầu hệ điều hành:
 c.Windows: Phiên bản Windows 7 SP1 trở lên.
 d.macOS: Từ macOS 10.11 (El Capitan) trở lên.
 e.Linux: Bản phân phối phổ biến như Ubuntu, Fedora.
 f.Extensions cần thiết:
 g.PHP Intelephense: Hỗ trợ tự động gợi ý mã, kiểm tra cú pháp, và định dạng mã PHP.
 h.XDebug: Hỗ trợ gỡ lỗi mã PHP.
 i.Prettier: Định dạng mã để dễ đọc hơn.
 j.Live Server: Khởi chạy máy chủ tạm thời để xem trực tiếp các thay đổi trong trình duyệt.
2. XAMPP
- XAMPP là môi trường máy chủ giả lập phổ biến hỗ trợ PHP, MySQL và các công cụ quản lý như phpMyAdmin.
- Phiên bản khuyến nghị:
 a.XAMPP bản 7.4.x hoặc 8.x.x (tùy theo mã nguồn PHP bạn sử dụng).
 b.PHP 7.4.x: Tương thích tốt với các dự án cũ.
 c.PHP 8.x.x: Cập nhật hiệu năng và bảo mật cho các dự án mới.
 d.Hệ điều hành hỗ trợ:
 e.Windows: Bản Windows 7 trở lên.
 f.macOS: Phiên bản hỗ trợ x64 (Intel hoặc M1/M2 với Rosetta).
 g.Linux: Ubuntu, Fedora, hoặc các bản phân phối phổ biến.
 h.Tải xuống:Từ trang chính thức: XAMPP Download.
# Lưu ý tương thích
- Kiểm tra phiên bản PHP trong XAMPP:
- Sau khi cài đặt, kiểm tra bằng cách mở http://localhost trong trình duyệt và xem thông tin PHP phiên bản trên trang Dashboard.
Kiểm tra file mã PHP:
- Nếu mã nguồn yêu cầu PHP 8+, đảm bảo XAMPP đã cập nhật tương ứng.
- Cấu hình MySQL:
 a.Sử dụng phpMyAdmin (đi kèm XAMPP) để quản lý cơ sở dữ liệu.
 b.Kiểm tra MySQL chạy ổn định qua XAMPP Control Panel.
# Cài đặt và cấu hình
1. Cài đặt XAMPP
- Tải XAMPP
- Truy cập trang web chính thức của XAMPP.
- Tải xuống phiên bản phù hợp với hệ điều hành (Windows, MacOS hoặc Linux).
- Cài đặt XAMPP

- Chạy file cài đặt và làm theo hướng dẫn:
- Chọn các thành phần: Apache, MySQL, PHP, phpMyAdmin.
- Chọn thư mục cài đặt (mặc định: C:\xampp).
- Mở XAMPP Control Panel sau khi cài đặt xong.
- Khởi động dịch vụ

- Trong XAMPP Control Panel, nhấn Start cho các mục:
- Apache (máy chủ web).
- MySQL (cơ sở dữ liệu).
- Đảm bảo trạng thái của hai mục chuyển sang màu xanh lá.
2. Sao chép mã nguồn
- Thư mục mã nguồn
- Sao chép thư mục dự án QuanLyLichHoc vào thư mục htdocs trong thư mục cài đặt XAMPP (thường là C:\xampp\htdocs).
Cấu trúc thư mục
- Đảm bảo các file chính như index.php, admin.php, và thư mục con scheduling nằm trong thư mục QuanLyLichHoc.
3. Tạo cơ sở dữ liệu
- Truy cập phpMyAdmin
- Trong XAMPP Control Panel, nhấn Admin bên cạnh MySQL.
- Truy cập phpMyAdmin qua trình duyệt tại: http://localhost/phpmyadmin.
- Tạo cơ sở dữ liệu:Trong tab Databases, nhập tên cơ sở dữ liệu: scheduling_db và nhấn Create.
- Nhập dữ liệu
- Chọn cơ sở dữ liệu vừa tạo → vào tab Import → chọn file scheduling_db.sql từ thư mục dự án → nhấn Go để nhập dữ liệu.
4. Chạy ứng dụng
- Truy cập giao diện admin
- Mở trình duyệt và nhập http://localhost/QuanLyLichHoc/scheduling/admin
- Đăng nhập với thông tin tài khoản admin:
- Username: admin
- Password: admin123
- Truy cập giao diện học sinh
- Mở trình duyệt và nhập:http://localhost/QuanLyLichHoc/scheduling/index.php
- Đăng nhập bằng ID học sinh hoặc tạo tài khoản mới qua giao diện.
# Hướng dẫn sử dụng
1. Dành cho quản trị viên
- Quản lý khóa học:
 a.Thêm, xóa, sửa thông tin khóa học, đảm bảo lịch học không bị trùng lặp.
- Danh sách môn học:
 a.Thêm, sửa, xóa các môn học hoặc các buổi sinh hoạt ngoại khóa.
- Danh sách học sinh:
 a.Quản lý thông tin học sinh gồm: ID, Họ, Tên, Email, Lớp.
- Lịch học:
 a.Sắp xếp và quản lý lịch học theo ngày, tuần, hoặc tháng.
- Danh sách người dùng:
 a.Hiển thị danh sách người dùng (admin, giáo viên).
- Bài tập:
 a.Quản lý bài tập, hạn nộp.
2. Dành cho học sinh
- Đăng nhập bằng ID được cấp.
- Xem lịch học, bài tập qua giao diện cá nhân.
- Xử lý lỗi phổ biến
3. Apache hoặc MySQL không khởi động
- Kiểm tra cổng bị chiếm dụng (80 hoặc 3306).
- Đổi cổng Apache:
 a.Vào XAMPP Control Panel → Config → Service and Port Settings.
 b.Đổi cổng Apache từ 80 thành 8080, sau đó truy cập qua http://localhost:8080.
4. Không kết nối cơ sở dữ liệu
- Kiểm tra file cấu hình (vd: db.php):
Sao chép mã
$host = 'localhost';
$user = 'root'; 
$password = ''; 
$dbname = 'scheduling_db';
5. Lỗi 404 Not Found
- Kiểm tra đường dẫn URL và đảm bảo thư mục QuanLyLichHoc nằm trong htdocs.
- Công cụ sử dụng
 a.Ngôn ngữ lập trình: PHP.
 b.IDE: Visual Studio Code.
 c.Môi trường phát triển: XAMPP.
- Hoàn thiện và kiểm tra
- Kiểm tra các chức năng quản trị, giáo viên, và học sinh.
- Đảm bảo dữ liệu hiển thị chính xác, không có lỗi khi thao tác.
- Kiểm tra phân quyền và trải nghiệm người dùng.
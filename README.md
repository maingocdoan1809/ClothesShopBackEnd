# About

Phần code của đồ án này sẽ được tìm thấy trên `github`

- [Front-end](https://github.com/maingocdoan1809/ClothesShopFrontend)
- [Back-end](https://github.com/maingocdoan1809/ClothesShopBackEnd)

Các bạn chỉ cần clone về thế là ok.

### Cách dùng sau khi clone project.

- Đối với phần Front-end:
  - Sau khi clone về thì các bạn vào termial, chuyển đường dẫn đến thư mục chứa folder vừa tạo.
  - Gõ `npm install` để download các file cần thiết cho project.
  - Tại thư mục `src`, tạo một file có tên `env.ts`. Thêm câu lệnh `export const BACKEND_URL = "YOUR_BACKEND_URL";` với `YOUR_BACKEND_URL` là địa chỉ đến máy chủ backend của bạn.
  - Sau khi hoàn thành các bước trên, gõ `npm run dev` trên termial để run project.
- Đối với phần Back-end:

  - Sau khi clone về thì các bạn vào termial, chuyển đường dẫn đến thư mục chứa folder vừa tạo.
  - Gõ `npm install` để download các file cần thiết cho project.
  - Tạo một file `.env` bên trong folder vừa clone, file này nằm cùng cấp với folder `src`
  - Trong file `.env` khai báo hai biến môi trường:
    `SQL_STR="YOUR_DB_CONN_STR"`

    `TOKEN="YOUR_CUSTOM_TOKEN"`

    Với `SQL_STR` là một `connection string` đến cơ sở dữ liệu `MySQL`

    `TOKEN` là một dãy kí tự ngẫu nhiên tùy ý. Dùng vào mục đích tạo random token cho người dùng đăng nhập.

  - `npm start` để chạy. Mặc định backend sẽ được run trên port _3000_

# File convention

Các phần code được lưu trong thư mục `src`.

Trong thư mục `src` hiện tại có _3_ thư mục:

- `api`: Lưu các file xử lý việc lấy thông tin từ Database và gửi lên front-end.
  - Mỗi route (API endpoint) được lưu vào thư mục với tên [api].[endpoint-name]. Ví dụ tạo api đăng nhập thì trong thư mục `api` ta tạo một thư mục tên là `api.login`
- `db`: Lưu các file xử lý cho cơ sở dữ liệu

  - Trong thư mục `db` có thư mục `MySql`. Hiện tại ta sẽ dùng `MySql` cho việc lưu trữ dữ liệu của đồ án.
  - File `IDatabase.ts` có khai báo như sau:

    > export const Database = MySql;

    Như vậy trong suốt quá trình code nếu muốn tạo một instance của `MySql` thì khai báo như sau:

    > const dbname = new Database(SQL_STR)

    `SQL_STR` sẽ được khai báo mặc định trong file `.env`. Nếu muốn dùng database của riêng mình thì hãy đổi giá trị của nó trong file `.env`. File này sẽ không được đưa lên github dùng chung nhé.

- `utils`: Lưu các hàm xử lý chung, ví dụ như hàm kiểm tra password, email...

# API:

Hiện tại có 5 API được tạo:

- POST: `/login`: Api dùng cho hành động login.

  Người dùng gửi một `POST` request lên `/login` với phần `body` buộc phải có hai trường dữ liệu là `username` và `password` được hash bằng thuật toán `sha256`.

  - Server sẽ trả về một `Response` chứa thuộc tính `isAuthenticated`. Nếu (tài khoản mật khẩu chính xác) thì `isAuthenticated = true` và các thuộc tính liên quan đến người dùng ngược lại là `false` và thông báo lỗi.

- POST: `/register` Tạo một tài khoản mới. Lưu ý các thông tin cần có trong body khi gửi đi:

  > const { username, password, fullname, email, phonenumber, isExist } = req.body;

  Nếu đăng kí thành công thì `hasRegistered` sẽ có giá trị `true` trong `Response` trả về.

- GET: `/checkuser/:username` Nhận một `params` là `username` (đã được hash bằng `sha265`) và trả về kết quả là `username` này đã tồn tại trong server hay chưa thông qua thuộc tính của `Response` trả về là `isExist : boolean`

- GET: `/auth?username="xxy"&token=xyz` Route này sẽ xác thực xem người có `username` và `token` có hợp lệ hay không. Nếu có cả `username` và `token` nhưng `origin` (máy request cái yêu cầu này) không khớp trong database thì trả về `isAuthenticated=false` ngược lại là `true`.
- GET: `/users` Lấy tất cả các thông tin cơ bản của `user` trong database. Route này chưa hoàn thiện vì cần làm chức năng phân quyền chỉ có admin mới được truy cập.

# Database

Sơ đồ về database và các thứ khác được lưu ở [đây nè](https://drive.google.com/file/d/1exfc-oxhigk3hjJLl4RnhSq1RaqzgTp7/view?usp=sharing)

# WORK - DEADLINE: 13/5/23

- Đoàn:
  - Hoàn thiện chức năng xem profile người dùng, chỉnh sửa thông tin, cập nhật avt (tôi sẽ cố chỉnh lại cho giống của Hiệp thiết kế, chỉ thêm cái avatar và không có tỉnh thành các thứ vì database không có lưu:))) ).
  - Hoàn thiện chức năng đăng ký, thông báo cho người dùng nếu đăng kí thành công.
  - Viết API cho việc upload ảnh, sửa thông tin người dùng
  - Viết API cho việc lấy dữ liệu của thông tin hàng hóa.
- Hà:
  - Tạo trang giỏ hàng.
- Dũng:
  - Tạo trang đăng kí thông tin đặt hàng. (giống thiết kế của hiệp ok luôn).
  - Làm box tìm kiếm
    - box tìm kiếm có thể tìm khoảng giá tiền, màu sắc, số lượng sản phẩm
- Hiệp:
  - Viết dữ liệu cho bảng `product`. Tầm 30 sản phẩm trở lên nhưng mà càng nhiều càng tốt.
  - Làm footer
- Đức:

  - Viết trigger cho hành động thêm, sửa vào bảng product:

    - Khi thêm mới, sửa, một product có trong bảng product thì phải cập nhật lại totalbought ở trong bảng productinfo sao cho totalbought ở bảng productinfo = tổng của productinfo trong bảng product (nhớ là phải đúng id )

# Công việc cần làm

- Giỏ hàng
- Show chi tiết sản phẩm
- Admin
- Thanh toán
-

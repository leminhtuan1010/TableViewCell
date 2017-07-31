# Table View Cell

### **Ứng dụng 5 châu .**

* Sử dụng section trong table view 

## Giới thiệu

* [ ] Bài toán được dựng trên hình ảnh có 5 châu lục và mỗi châu sẽ có 5 nước tượng trưng và sử dụng  section trong table view để giải quyết bài toán.

* [ ] Trong bài viết giới đây sẽ mô tả chi tiết các bước để hoàn thành bài toán được giao.

### Bước 1:

#### Tạo một table view controller :

![](/assets/Screen Shot 2017-07-31 at 10.54.04 AM.png)

#### Tạo ra một Navigation Controller :

![](/assets/Screen Shot 2017-07-31 at 10.55.52 AM.png)

### Bước 2:

#### Khởi tạo một file Property List

Khởi tạo file property list . File này có chứa các dữ liệu cần thiết :

* Chứa các châu lục
* Chứa tên các nước nằm trong từng châu lục khác nhau
* Chứa các thành phố của các quốc gia
* Chứa cờ của các quốc gia 

Sau khi khời tạo xong chúng ta sẽ có 1 file dữ liệu.

### Bước 3:

#### Truyền dữ liệu và bóc tách dữ liệu để truyền ra table view

* Đầu tiên chúng ta sẽ hứng dữ liệu từ trong file property list.
* Tiếp theo sẽ kiểm tra từng phần tử trong file data.plist để lấy ra tên các Châu lục sau đó đưa tên các châu này vào mảng Arraykeys
* Sau khi lấy được các tên châu lục .Tiếp tục chúng ta sẽ tác dữ liệu để lấy tên các nược nằm trong châu lục đó rồi chuyền chúng vào mảng DicCountry với kiểu dữ liệu là NSMutableDictionary \(Một đối tượng đại diện cho một bộ sưu tập các cặp key - value, để sử dụng thay cho một từ điển. Biến trong các trường hợp cần phải tham chiếu\)

![](/assets/Screen Shot 2017-07-31 at 11.05.36 AM.png)

### Bước 4:

#### Đổ dữ liệu lên table view:

1. Đầu tiên chúng ta sẽ truyền số các Section lên trên table bằng cách đưa danh sách tên các châu chúng ta vừa gom lại vào mảng Arraykeys đưa vào func numberOfSections .Tại đây chúng ta sẽ đưa ra được số phần tử có trong sections.![](/assets/Screen Shot 2017-07-31 at 11.18.38 AM.png)
2. Kiểm tra và trả lại số hàng có trong từng bảng sections bằng cách kiểm tra số phần tử có trong tùng sections.![](/assets/Screen Shot 2017-07-31 at 11.25.02 AM.png)
3. Yêu cầu  nguồn dữ cho một ô để chèn vào một vị trí cụ thể.![](/assets/Screen Shot 2017-07-31 at 11.28.12 AM.png)

### Bước 5:

#### Truyền dữ liệu tên các nước cờ và quốc gia lên một ViewController mới

1. Tạo một ViewController mới :                                                                              ![](/assets/Screen Shot 2017-07-31 at 11.33.19 AM.png)
2. Sử dụng segue để đầy dữ liệu data sang trang mới và hiển thị chúng lên màn hình :![](/assets/Screen Shot 2017-07-31 at 11.35.33 AM.png)
3. Kế thừa và hiển thị dữ liệu được đấy sang lên màn hình: ![](/assets/Screen Shot 2017-07-31 at 11.37.31 AM.png)

## Kết quả đạt được:

![](/assets/Screen Shot 2017-07-31 at 11.39.11 AM.png)

![](/assets/Screen Shot 2017-07-31 at 11.39.40 AM.png)


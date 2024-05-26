﻿CREATE DATABASE Dictionary 

USE Dictionary

-- Tạo bảng tblUser với cột id tự động tăng
CREATE TABLE tblUser (
    Id INT IDENTITY PRIMARY KEY,
    sEmail VARCHAR(255) NOT NULL,
    sPassword VARCHAR(255) NOT NULL,
    sRole VARCHAR(50)
);

-- Tạo bảng tblLanguage với cột id tự động tăng
CREATE TABLE tblLanguage (
    Id INT IDENTITY PRIMARY KEY,
    sLanguage NVARCHAR(50) NOT NULL
);

-- Tạo bảng tblWord_type với cột id tự động tăng
CREATE TABLE tblWord_type (
    Id INT IDENTITY PRIMARY KEY,
    sWordtype NVARCHAR(50) NOT NULL
);

-- Tạo bảng tblWord với cột id tự động tăng
CREATE TABLE tblWord (
    Id INT IDENTITY PRIMARY KEY,
    Id_Language INT,
    Id_Language_trans INT,
    Id_wordtype INT,
    Id_user INT,
    sWord NVARCHAR(255) NOT NULL,
    sExample  NVARCHAR(255),
    sDefinition  NVARCHAR(255),
    FOREIGN KEY (Id_Language) REFERENCES tblLanguage(Id),
    FOREIGN KEY (Id_Language_trans) REFERENCES tblLanguage(Id),
    FOREIGN KEY (Id_wordtype) REFERENCES tblWord_type(Id),
    FOREIGN KEY (Id_user) REFERENCES tblUser(Id)
);
ALTER TABLE tblWord
add  sWordTrans nvarchar(255);

-- Tạo bảng tblHistory_search với cột id tự động tăng
CREATE TABLE tblHistory_search (
    Id INT IDENTITY PRIMARY KEY,
    Id_user INT,
    Id_word INT,
    dDatetime DATETIME,
    FOREIGN KEY (Id_user) REFERENCES tblUser(Id),
    FOREIGN KEY (Id_word) REFERENCES tblWord(Id)
);


Insert into tblLanguage 
values('English'),('VietNamese');

Insert into tblWord_type 
values(N'Động từ'),(N'Danh từ'),(N'Tính từ'),(N'Trạng từ');

Insert into tblUser 
values (N'vuonghuy12345@gmail.com',N'123456',N'Admin')


INSERT INTO tblWord (Id_Language, Id_Language_trans, Id_wordtype, Id_user, sWord, sExample, sDefinition)
VALUES 
(1, 2, 2, 1, N'Book', N'This is a book', N'Một tài liệu vật lý hoặc kỹ thuật số bao gồm các trang được liên kết với nhau'),
(1, 2, 1, 1, N'Run', N'He runs every morning', N'Anh ấy chạy vào mỗi buổi sáng'),
(2, 1, 3, 1, N'Đẹp', N'Cô ấy rất đẹp', N'She is very beautiful'),
(1, 2, 2, 1, N'Apple', N'This apple is delicious', N'Quả táo'),
(1, 2, 3, 1, N'Beautiful', N'He is a beautiful girl', N'Xinh đẹp'),
(1, 2, 3, 1, N'Cat', N'The cat is sleeping', N'Con mèo'),
(1, 2, 2, 1, N'Orange', N'I like to eat oranges', N'Tôi thích ăn cam'),
(1, 2, 3, 1, N'Playful', N'The puppy is very playful', N'Con chó con rất nghịch ngợm'),
(1, 2, 3, 1, N'Quiet', N'Please be quiet in the library', N'Vui lòng giữ yên tĩnh trong thư viện'),
(1, 2, 1, 1, N'Read', N'She loves to read books', N'Cô ấy thích đọc sách'),
(1, 2, 2, 1, N'Sun', N'The sun is shining brightly', N'Mặt trời đang chiếu sáng rực rỡ'),
(1, 2, 3, 1, N'Tree', N'I planted a tree in my backyard', N'Tôi trồng một cây trong sân sau của mình'),
(1, 2, 2, 1, N'Umbrella', N'Take an umbrella, it might rain', N'Mang theo cái ô, có thể sẽ mưa'),
(1, 2, 1, 1, N'Very', N'The movie was very interesting', N'Bộ phim rất thú vị'),
(1, 2, 2, 1, N'Water', N'Drink plenty of water', N'Hãy uống nhiều nước'),
(1, 2, 3, 1, N'Xylophone', N'The xylophone produces beautiful music', N'Kén xylophone tạo ra âm nhạc đẹp'),
(1, 2, 2, 1, N'Yellow', N'The sunflower is yellow', N'Hoa hướng dương màu vàng'),
(1, 2, 3, 1, N'Zoo', N'We visited the zoo last weekend', N'Chúng tôi đã thăm sở thú cuối tuần trước'),
(1, 2, 1, 1, N'Exercise', N'Daily exercise is good for health', N'Tập thể dục hàng ngày tốt cho sức khỏe'),
(1, 2, 3, 1, N'Giraffe', N'The giraffe has a long neck', N'Hươu cao cổ có cổ dài'),
(1, 2, 2, 1, N'Kite', N'Flying a kite in the park', N'Bay cánh diều ở công viên'),
(1, 2, 2, 1, N'Juice', N'I like to drink orange juice', N'Tôi thích uống nước cam'),
(1, 2, 1, 1, N'Laugh', N'The joke made everyone laugh', N'Câu đùa khiến mọi người cười'),
(2, 1, 3, 1, N'Hạnh phúc', N'Cả gia đình họ sống trong hạnh phúc', N'The whole family lives in happiness'),
(1, 2, 2, 1, N'Mountain', N'The mountain peak was covered in snow', N'Đỉnh núi được phủ tuyết'),
(1, 2, 3, 1, N'Nature', N'I love spending time in nature', N'Tôi thích dành thời gian ở trong thiên nhiên'),
(1, 2, 3, 1, N'Ocean', N'The ocean waves were mesmerizing', N'Những con sóng biển làm say mê'),
(1, 2, 2, 1, N'Piano', N'She plays the piano beautifully', N'Cô ấy chơi đàn piano đẹp'),
(1, 2, 3, 1, N'Quiet', N'Enjoy the quiet moments in life', N'Hãy tận hưởng những khoảnh khắc yên bình trong cuộc sống'),
(1, 2, 1, 1, N'Relax', N'Take a break and relax for a while', N'Nghỉ ngơi một chút và thư giãn'),
(1, 2, 2, 1, N'Smile', N'Her smile brightened up the room', N'Nụ cười của cô ấy làm sáng lên căn phòng'),
(1, 2, 3, 1, N'Tree', N'Trees provide shade and oxygen', N'Cây cung cấp bóng mát và oxy'),
(1, 2, 2, 1, N'Umbrella', N'Carry an umbrella in case it rains', N'Mang theo cái ô trường hợp mưa'),
(1, 2, 1, 1, N'Vivid', N'The sunset painted the sky in vivid colors', N'Hoàng hôn tô màu bầu trời rực rỡ'),
(1, 2, 2, 1, N'Whale', N'We saw a whale during our boat trip', N'Chúng tôi thấy một con cá voi trong chuyến đi thuyền'),
(1, 2, 3, 1, N'Xylophone', N'Playing the xylophone requires precision', N'Chơi kén xylophone đòi hỏi sự chính xác'),
(1, 2, 2, 1, N'Yellow', N'She wore a bright yellow dress', N'Cô ấy mặc một chiếc váy màu vàng sáng'),
(1, 2, 3, 1, N'Zest', N'Cooking with zest adds flavor to dishes', N'Nấu ăn với sự hứng thú thêm hương vị cho món ăn'),
(1, 2, 1, 1, N'Adventure', N'Traveling is an exciting adventure', N'Du lịch là một cuộc phiêu lưu thú vị'),
(1, 2, 3, 1, N'Gentle', N'A gentle breeze rustled the leaves', N'Một làn gió nhẹ làm lay động lá cây'),
(1, 2, 2, 1, N'Kangaroo', N'Kangaroos are native to Australia', N'Kangaroo là loài đặc hữu của Australia');


-- Từ điển tiếng việt
INSERT INTO tblWord (Id_Language, Id_Language_trans, Id_wordtype, Id_user, sWord, sExample, sDefinition)
VALUES 
(2, 1, 2, 1, N'Sách', N'Dây là một quyển sách', N'A physical or digital document consisting of pages linked together'),
(2, 1, 1, 1, N'Chạy', N'Anh ấy chạy mỗi buổi sáng', N'He runs every morning'),
(1, 2, 3, 1, N'Đẹp', N'Cô ấy rất đẹp', N'She is very beautiful'),
(2, 1, 2, 1, N'Mâm cơm', N'Mâm cơm này thơm ngon', N'This meal is delicious'),
(2, 1, 3, 1, N'Xinh đẹp', N'Anh ấy là một cô gái xinh đẹp', N'Beautiful'),
(2, 1, 3, 1, N'Con mèo', N'Con mèo đang ngủ', N'The cat is sleeping'),
(2, 1, 2, 1, N'Cam', N'Tôi thích ăn cam', N'I like to eat oranges'),
(2, 1, 3, 1, N'Nghịch ngợm', N'Con chó con rất nghịch ngợm', N'The puppy is very playful'),
(2, 1, 3, 1, N'Yên tĩnh', N'Vui lòng giữ yên tĩnh trong thư viện', N'Please be quiet in the library'),
(2, 1, 1, 1, N'Đọc', N'Cô ấy thích đọc sách', N'She loves to read books'),
(2, 1, 2, 1, N'Mặt trời', N'Mặt trời đang chiếu sáng rực rỡ', N'The sun is shining brightly'),
(2, 1, 3, 1, N'Cây', N'Tôi trồng một cây trong sân sau của mình', N'I planted a tree in my backyard'),
(2, 1, 2, 1, N'Ô', N'Mang theo cái ô, có thể sẽ mưa', N'Take an umbrella, it might rain'),
(2, 1, 1, 1, N'Rất', N'Bộ phim rất thú vị', N'The movie was very interesting'),
(2, 1, 2, 1, N'Nước', N'Hãy uống nhiều nước', N'Drink plenty of water'),
(2, 1, 3, 1, N'Kén xylophone', N'Kén xylophone tạo ra âm nhạc đẹp', N'The xylophone produces beautiful music'),
(2, 1, 2, 1, N'Màu vàng', N'Hoa hướng dương màu vàng', N'The sunflower is yellow'),
(2, 1, 3, 1, N'Sở thú', N'Chúng tôi đã thăm sở thú cuối tuần trước', N'We visited the zoo last weekend'),
(2, 1, 1, 1, N'Tập thể dục', N'Tập thể dục hàng ngày tốt cho sức khỏe', N'Daily exercise is good for health'),
(2, 1, 3, 1, N'Hươu cao cổ', N'Hươu cao cổ có cổ dài', N'The giraffe has a long neck'),
(2, 1, 2, 1, N'Cánh diều', N'Bay cánh diều ở công viên', N'Flying a kite in the park'),
(2, 1, 3, 1, N'Mang theo cái ô', N'Mang theo cái ô, có thể sẽ mưa', N'Take an umbrella, it might rain'),
(2, 1, 2, 1, N'Kéo', N'Tôi đang kéo chiếc xe', N'I am pulling the car'),
(2, 1, 1, 1, N'Ngủ', N'Cô ấy đang ngủ', N'She is sleeping'),
(1, 2, 3, 1, N'Bánh mì', N'Tôi muốn một ổ bánh mì', N'I want a loaf of bread'),
(2, 1, 2, 1, N'Lạnh', N'Ngày hôm nay thời tiết rất lạnh', N'Today the weather is very cold'),
(2, 1, 3, 1, N'Vui', N'Chúng tôi có một buổi tiệc vui vẻ', N'We had a joyful party'),
(2, 1, 3, 1, N'Trường học', N'Trường học này rất lớn', N'This school is very big'),
(2, 1, 2, 1, N'Bút mực', N'Tôi cần một cây bút mực', N'I need a fountain pen'),
(2, 1, 3, 1, N'Đỏ', N'Đoan trang đang mặc chiếc váy màu đỏ', N'Doan Trang is wearing a red dress'),
(2, 1, 1, 1, N'Ăn', N'Chúng ta hãy đi ăn tối', N'Lets go out for dinner'),
(2, 1, 2, 1, N'Máy tính', N'Tôi sử dụng máy tính hàng ngày', N'I use a computer every day'),
(2, 1, 3, 1, N'Biển', N'Chúng ta hãy đi đến bờ biển', N'Lets go to the beach'),
(2, 1, 2, 1, N'Điện thoại', N'Tôi đã để quên điện thoại ở nhà', N'I left my phone at home'),
(2, 1, 1, 1, N'Học', N'Cô ấy đang học tiếng Pháp', N'She is learning French'),
(2, 1, 2, 1, N'Bóng đá', N'Tôi thích xem bóng đá', N'I enjoy watching football'),
(2, 1, 3, 1, N'Bé', N'Em bé đang cười', N'The baby is laughing'),
(2, 1, 3, 1, N'Sân bay', N'Tôi sẽ đón bạn ở sân bay', N'I will pick you up at the airport'),
(2, 1, 2, 1, N'Xe hơi', N'Tôi muốn mua một chiếc xe hơi mới', N'I want to buy a new car'),
(2, 1, 3, 1, N'Đẹp trai', N'Anh chàng này rất đẹp trai', N'This guy is very handsome'),
(2, 1, 2, 1, N'Bàn ăn', N'Chúng ta hãy ngồi vào bàn ăn', N'Lets sit at the dining table'),
(2, 1, 1, 1, N'Nói', N'Đừng nói nữa, hãy nghe tôi nói', N'Dont speak anymore, listen to me');

INSERT INTO tblWord (Id_Language, Id_Language_trans, Id_wordtype, Id_user, sWord, sExample, sDefinition, sWordTrans,sTime)
VALUES 
(1, 2, 2, 1, N'Book', N'This is a book', N'Một tài liệu vật lý hoặc kỹ thuật số bao gồm các trang được liên kết với nhau', N'Sách',GETDATE()),
(1, 2, 1, 1, N'Run', N'He runs every morning', N'Anh ấy chạy vào mỗi buổi sáng', N'Chạy',GETDATE()),
(2, 1, 3, 1, N'Đẹp', N'Cô ấy rất đẹp', N'She is very beautiful', N'Beautiful',GETDATE()),
(1, 2, 2, 1, N'Apple', N'This apple is delicious', N'Quả táo', N'Quả táo',GETDATE()),
(1, 2, 3, 1, N'Beautiful', N'He is a beautiful girl', N'Xinh đẹp', N'Đẹp',GETDATE()),
(1, 2, 3, 1, N'Cat', N'The cat is sleeping', N'Con mèo', N'Con mèo',GETDATE()),
(1, 2, 2, 1, N'Orange', N'I like to eat oranges', N'Tôi thích ăn cam', N'Cam',GETDATE()),
(1, 2, 3, 1, N'Playful', N'The puppy is very playful', N'Con chó con rất nghịch ngợm', N'Trẻ trung',GETDATE()),
(1, 2, 3, 1, N'Quiet', N'Please be quiet in the library', N'Vui lòng giữ yên tĩnh trong thư viện', N'Lặng lẽ',GETDATE()),
(1, 2, 1, 1, N'Read', N'She loves to read books', N'Cô ấy thích đọc sách', N'Đọc',GETDATE()),
(1, 2, 2, 1, N'Sun', N'The sun is shining brightly', N'Mặt trời đang chiếu sáng rực rỡ', N'Mặt trời',GETDATE()),
(1, 2, 3, 1, N'Tree', N'I planted a tree in my backyard', N'Tôi trồng một cây trong sân sau của mình', N'Cây',GETDATE()),
(1, 2, 2, 1, N'Umbrella', N'Take an umbrella, it might rain', N'Mang theo cái ô, có thể sẽ mưa', N'Cái ô',GETDATE()),
(1, 2, 1, 1, N'Very', N'The movie was very interesting', N'Bộ phim rất thú vị', N'Rất',GETDATE()),
(1, 2, 2, 1, N'Water', N'Drink plenty of water', N'Hãy uống nhiều nước', N'Nước',GETDATE()),
(1, 2, 3, 1, N'Xylophone', N'The xylophone produces beautiful music', N'Kén xylophone tạo ra âm nhạc đẹp', N'Kén xylophone',GETDATE()),
(1, 2, 2, 1, N'Yellow', N'The sunflower is yellow', N'Hoa hướng dương màu vàng', N'Màu vàng',GETDATE()),
(1, 2, 3, 1, N'Zoo', N'We visited the zoo last weekend', N'Chúng tôi đã thăm sở thú cuối tuần trước', N'Sở thú',GETDATE()),
(1, 2, 1, 1, N'Exercise', N'Daily exercise is good for health', N'Tập thể dục hàng ngày tốt cho sức khỏe', N'Tập thể dục',GETDATE()),
(1, 2, 3, 1, N'Giraffe', N'The giraffe has a long neck', N'Hươu cao cổ có cổ dài', N'Hươu cao cổ',GETDATE()),
(1, 2, 2, 1, N'Kite', N'Flying a kite in the park', N'Bay cánh diều ở công viên', N'Cánh diều',GETDATE()),
(1, 2, 2, 1, N'Juice', N'I like to drink orange juice', N'Tôi thích uống nước cam', N'Nước ép cam',GETDATE()),
(1, 2, 1, 1, N'Laugh', N'The joke made everyone laugh', N'Câu đùa khiến mọi người cười', N'Cười',GETDATE()),
(2, 1, 3, 1, N'Hạnh phúc', N'Cả gia đình họ sống trong hạnh phúc', N'The whole family lives in happiness', N'Happiness',GETDATE()),
(1, 2, 2, 1, N'Mountain', N'The mountain peak was covered in snow', N'Đỉnh núi được phủ tuyết', N'Núi',GETDATE()),
(1, 2, 3, 1, N'Nature', N'I love spending time in nature', N'Tôi thích dành thời gian ở trong thiên nhiên', N'Thiên nhiên',GETDATE()),
(1, 2, 3, 1, N'Ocean', N'The ocean waves were mesmerizing', N'Những con sóng biển làm say mê', N'Đại dương',GETDATE()),
(1, 2, 2, 1, N'Piano', N'She plays the piano beautifully', N'Cô ấy chơi đàn piano đẹp', N'Đàn piano',GETDATE()),
(1, 2, 3, 1, N'Quiet', N'Enjoy the quiet moments in life', N'Hãy tận hưởng những khoảnh khắc yên bình trong cuộc sống', N'Yên bình',GETDATE()),
(1, 2, 1, 1, N'Relax', N'Take a break and relax for a while', N'Nghỉ ngơi một chút và thư giãn', N'Nghỉ ngơi',GETDATE()),
(1, 2, 2, 1, N'Smile', N'Her smile brightened up the room', N'Nụ cười của cô ấy làm sáng lên căn phòng', N'Cười',GETDATE()),
(1, 2, 3, 1, N'Tree', N'Trees provide shade and oxygen', N'Cây cung cấp bóng mát và oxy', N'Cây',GETDATE()),
(1, 2, 2, 1, N'Umbrella', N'Carry an umbrella in case it rains', N'Mang theo cái ô trường hợp mưa', N'Cái ô',GETDATE()),
(1, 2, 1, 1, N'Vivid', N'The sunset painted the sky in vivid colors', N'Hoàng hôn tô màu bầu trời rực rỡ', N'Rực rỡ',GETDATE()),
(1, 2, 2, 1, N'Whale', N'We saw a whale during our boat trip', N'Chúng tôi thấy một con cá voi trong chuyến đi thuyền', N'Cá voi',GETDATE()),
(1, 2, 3, 1, N'Xylophone', N'Playing the xylophone requires precision', N'Chơi kén xylophone đòi hỏi sự chính xác', N'Kén xylophone',GETDATE()),
(1, 2, 2, 1, N'Yellow', N'She wore a bright yellow dress', N'Cô ấy mặc một chiếc váy màu vàng sáng', N'Màu vàng',GETDATE()),
(1, 2, 3, 1, N'Zest', N'Cooking with zest adds flavor to dishes', N'Nấu ăn với sự hứng thú thêm hương vị cho món ăn', N'Hứng thú',GETDATE()),
(1, 2, 1, 1, N'Adventure', N'Traveling is an exciting adventure', N'Du lịch là một cuộc phiêu lưu thú vị', N'Phiêu lưu',GETDATE()),
(1, 2, 3, 1, N'Gentle', N'A gentle breeze rustled the leaves', N'Một làn gió nhẹ làm lay động lá cây', N'Nhẹ nhàng',GETDATE()),
(2, 2, 2, 1, N'Kangaroo', N'Kangaroos are native to Australia', N'Kangaroo là loài đặc hữu của Australia', N'Kangaroo',GETDATE());


-- Từ điển tiếng việt
INSERT INTO tblWord (Id_Language, Id_Language_trans, Id_wordtype, Id_user, sWord, sExample, sDefinition, sWordTrans, sTime)
VALUES 
(2, 1, 2, 1, N'Sách', N'Dây là một quyển sách', N'A physical or digital document consisting of pages linked together', N'Book', GETDATE()),
(2, 1, 1, 1, N'Chạy', N'Anh ấy chạy mỗi buổi sáng', N'He runs every morning', N'Run', GETDATE()),
(1, 2, 3, 1, N'Đẹp', N'Cô ấy rất đẹp', N'She is very beautiful', N'Beautiful', GETDATE()),
(2, 1, 2, 1, N'Mâm cơm', N'Mâm cơm này thơm ngon', N'This meal is delicious', N'Meal', GETDATE()),
(2, 1, 3, 1, N'Xinh đẹp', N'Anh ấy là một cô gái xinh đẹp', N'Beautiful', N'Beautiful', GETDATE()),
(2, 1, 3, 1, N'Con mèo', N'Con mèo đang ngủ', N'The cat is sleeping', N'Cat', GETDATE()),
(2, 1, 2, 1, N'Cam', N'Tôi thích ăn cam', N'I like to eat oranges', N'Orange', GETDATE()),
(2, 1, 3, 1, N'Nghịch ngợm', N'Con chó con rất nghịch ngợm', N'The puppy is very playful', N'Playful', GETDATE()),
(2, 1, 3, 1, N'Yên tĩnh', N'Vui lòng giữ yên tĩnh trong thư viện', N'Please be quiet in the library', N'Quiet', GETDATE()),
(2, 1, 1, 1, N'Đọc', N'Cô ấy thích đọc sách', N'She loves to read books', N'Read', GETDATE()),
(2, 1, 2, 1, N'Mặt trời', N'Mặt trời đang chiếu sáng rực rỡ', N'The sun is shining brightly', N'Sun', GETDATE()),
(2, 1, 3, 1, N'Cây', N'Tôi trồng một cây trong sân sau của mình', N'I planted a tree in my backyard', N'Tree', GETDATE()),
(2, 1, 2, 1, N'Ô', N'Mang theo cái ô, có thể sẽ mưa', N'Take an umbrella, it might rain', N'Umbrella', GETDATE()),
(2, 1, 1, 1, N'Rất', N'Bộ phim rất thú vị', N'The movie was very interesting', N'Very', GETDATE()),
(2, 1, 2, 1, N'Nước', N'Hãy uống nhiều nước', N'Drink plenty of water', N'Water', GETDATE()),
(2, 1, 3, 1, N'Kén xylophone', N'Kén xylophone tạo ra âm nhạc đẹp', N'The xylophone produces beautiful music', N'Xylophone', GETDATE()),
(2, 1, 2, 1, N'Màu vàng', N'Hoa hướng dương màu vàng', N'The sunflower is yellow', N'Yellow', GETDATE()),
(2, 1, 3, 1, N'Sở thú', N'Chúng tôi đã thăm sở thú cuối tuần trước', N'We visited the zoo last weekend', N'Zoo', GETDATE()),
(2, 1, 1, 1, N'Tập thể dục', N'Tập thể dục hàng ngày tốt cho sức khỏe', N'Daily exercise is good for health', N'Exercise', GETDATE()),
(2, 1, 3, 1, N'Hươu cao cổ', N'Hươu cao cổ có cổ dài', N'The giraffe has a long neck', N'Giraffe', GETDATE()),
(2, 1, 2, 1, N'Cánh diều', N'Bay cánh diều ở công viên', N'Flying a kite in the park', N'Kite', GETDATE()),
(2, 1, 3, 1, N'Mang theo cái ô', N'Mang theo cái ô, có thể sẽ mưa', N'Take an umbrella, it might rain', N'Umbrella', GETDATE()),
(2, 1, 2, 1, N'Kéo', N'Tôi đang kéo chiếc xe', N'I am pulling the car', N'Pull', GETDATE()),
(2, 1, 1, 1, N'Ngủ', N'Cô ấy đang ngủ', N'She is sleeping', N'Sleep', GETDATE()),
(1, 2, 3, 1, N'Bánh mì', N'Tôi muốn một ổ bánh mì', N'I want a loaf of bread', N'Bread', GETDATE()),
(2, 1, 2, 1, N'Lạnh', N'Ngày hôm nay thời tiết rất lạnh', N'Today the weather is very cold', N'Cold', GETDATE()),
(2, 1, 3, 1, N'Vui', N'Chúng tôi có một buổi tiệc vui vẻ', N'We had a joyful party', N'Joyful', GETDATE()),
(2, 1, 3, 1, N'Trường học', N'Trường học này rất lớn', N'This school is very big', N'School', GETDATE()),
(2, 1, 2, 1, N'Bút mực', N'Tôi cần một cây bút mực', N'I need a fountain pen', N'Pen', GETDATE()),
(2, 1, 3, 1, N'Đỏ', N'Đoan trang đang mặc chiếc váy màu đỏ', N'Doan Trang is wearing a red dress', N'Red', GETDATE()),
(2, 1, 1, 1, N'Ăn', N'Chúng ta hãy đi ăn tối', N'Lets go out for dinner', N'Eat', GETDATE()),
(2, 1, 2, 1, N'Máy tính', N'Tôi sử dụng máy tính hàng ngày', N'I use a computer every day', N'Computer', GETDATE()),
(2, 1, 3, 1, N'Biển', N'Chúng ta hãy đi đến bờ biển', N'Lets go to the beach', N'Beach', GETDATE()),
(2, 1, 2, 1, N'Điện thoại', N'Tôi đã để quên điện thoại ở nhà', N'I left my phone at home', N'Phone', GETDATE()),
(2, 1, 1, 1, N'Học', N'Cô ấy đang học tiếng Pháp', N'She is learning French', N'Study', GETDATE()),
(2, 1, 2, 1, N'Bóng đá', N'Tôi thích xem bóng đá', N'I enjoy watching football', N'Football', GETDATE()),
(2, 1, 3, 1, N'Bé', N'Em bé đang cười', N'The baby is laughing', N'Baby', GETDATE()),
(2, 1, 3, 1, N'Sân bay', N'Tôi sẽ đón bạn ở sân bay', N'I will pick you up at the airport', N'Airport', GETDATE()),
(2, 1, 2, 1, N'Xe hơi', N'Tôi muốn mua một chiếc xe hơi mới', N'I want to buy a new car', N'Car', GETDATE()),
(2, 1, 3, 1, N'Đẹp trai', N'Anh chàng này rất đẹp trai', N'This guy is very handsome', N'Handsome', GETDATE()),
(2, 1, 2, 1, N'Bàn ăn', N'Chúng ta hãy ngồi vào bàn ăn', N'Lets sit at the dining table', N'Dining table', GETDATE()),
(2, 1, 1, 1, N'Nói', N'Đừng nói nữa, hãy nghe tôi nói', N'Dont speak anymore, listen to me', N'Speak', GETDATE());

go


create PROCEDURE SearchWords
     @word NVARCHAR(255),
    @lang int,
    @lang_trans int
AS
BEGIN
    SELECT w.sWord, wt.sWordtype, w.sExample, w.sDefinition,w.Id,w.sWordTrans
   FROM tblWord w,  tblWord_type wt
        WHERE @lang =w.Id_Language and @lang_trans= w.Id_Language_trans
          AND LOWER(w.sWord) LIKE LOWER(@word) + '%' and wt.Id= w.Id_wordtype;
END;

EXEC SearchWords  N'N', 2, 1

go
create PROCEDURE getForceWords
     @word NVARCHAR(255),
    @lang int,
    @lang_trans int
AS
BEGIN
    SELECT w.sWord, wt.sWordtype, w.sExample, w.sDefinition,w.Id,w.sWordTrans
   FROM tblWord w,  tblWord_type wt
        WHERE @lang =w.Id_Language and @lang_trans= w.Id_Language_trans
          AND LOWER(w.sWord) LIKE LOWER(@word) and wt.Id= w.Id_wordtype;
END;

EXEC getForceWords  N'Nói', 2, 1

CREATE PROCEDURE getWordsByID
     @wordID int
AS
BEGIN
    SELECT w.sWord, wt.sWordtype, w.sExample, w.sDefinition,w.Id
   FROM tblWord w,  tblWord_type wt
        WHERE w.Id= @wordID and wt.Id= w.Id_wordtype;
END;

EXEC getWordsByID  49


go
CREATE PROCEDURE GetWordByUserIDAdd
     @ID int  
AS
BEGIN
    SELECT *
   FROM tblWord w,  tblWord_type wt
        WHERE w.Id_user= @ID and wt.Id= w.Id_wordtype;
END;
EXEC GetWordByUserIDAdd  2



go
create proc getHistorySearchUser
 @ID int  
AS
BEGIN
    SELECT w.sWord, wt.sWordtype, w.sDefinition, w.sExample,lang.sLanguage, trans.sLanguage as N'trans language', htr.Id_user, htr.dDatetime
   FROM tblWord w,  tblWord_type wt,tblHistory_search htr, tblLanguage lang, tblLanguage trans
        WHERE htr.Id_user= @ID and w.Id= htr.Id_word and w.Id_wordtype=wt.Id and w.Id_Language=lang.Id
		and w.Id_Language_trans= trans.Id
END;

exec getHistorySearchUser 1


go

alter table tblWord
add sTime datetime
create proc addNewWord
 @Id_Language int,@Id_Language_trans int, @Id_wordtype int, @Id_user int, @sWord NVARCHAR(255),@sExample NVARCHAR(255), @sDefinition NVARCHAR(255), @sWordTrans NVARCHAR(255)   
AS
BEGIN
   insert into tblWord(Id_Language, Id_Language_trans, Id_wordtype, Id_user, sWord, sExample, sDefinition, sWordTrans, sTime)
   values(@Id_Language,@Id_Language_trans,@Id_wordtype,@Id_user,@sWord,@sExample,@sDefinition,@sWordTrans, GETDATE())
END;

exec getHistorySearchUser 1

create proc getAllUser
AS
BEGIN
select *
from tblUser
where tblUser.sRole != N'Admin'
END;

exec getAllUser

create proc upgradeRoleUser
@IdUser int,@Role nvarchar(50)
AS
BEGIN
update tblUser
set sRole=@Role
where tblUser.Id =@IdUser
END;
exec upgradeRoleUser 2, N'User'

create proc deleteUser
@IdUser int
AS
BEGIN
delete tblUser
where tblUser.Id =@IdUser
END;

alter proc filterUser
@email  nvarchar(50), @role nvarchar(50)
AS
BEGIN
select *
from tblUser
where tblUser.sEmail like '%'+ @email+ '%' and tblUser.sRole like '%'+ @role+ '%' and tblUser.sRole not like N'Admin'
END;

exec filterUser 'd',''

drop proc getwordbyid
create proc getwordbyid
@id int
as
begin
select * from tblWord
where ID = @id
end

create proc deleteWord
@idword int
AS
BEGIN
delete tblWord
where tblWord.Id = @idword
END;
exec deleteWord 'Nói'

create proc editWord
@id int, @Id_Language int,@Id_Language_trans int, @Id_wordtype int, @Id_user int,
@sWord NVARCHAR(255),@sExample NVARCHAR(255), @sDefinition NVARCHAR(255), @sWordTrans NVARCHAR(255)   
as
begin
update tblWord
set Id_Language=@Id_Language ,
	Id_Language_trans = @Id_Language_trans,
	Id_wordtype = @Id_wordtype,
	Id_user = @Id_user,
	sWord = @sWord ,
	sExample = @sExample ,
	sDefinition = @sDefinition ,
	sWordTrans = @sWordTrans,
	sTime= GetDate()
where  tblWord.Id=@id
end;

update tblWord
set sTime= GetDate()

create proc searchword 
@word  nvarchar(50)
AS
BEGIN
select *
from tblWord
where tblWord.sWord like '%'+ @word+ '%' 
END;

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2020 at 11:01 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `scheduling_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `class_schedule_info`
--

CREATE TABLE `class_schedule_info` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `course_id` int(30) NOT NULL,
  `subject` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(30) NOT NULL,
  `course` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course`, `description`) VALUES
(1, 'Tin học 10', 'Bài 1:Thông tin và xử lý thông tin - 7h::7h45 - Thứ Ba'),
(2, 'Tin học 10', 'Bài 2:Vai trò của thiết bị thông minh và tin học đối với xã hội - 7h::7h45 - Thứ Tư'),
(3, 'Tin học 10', 'Bài 3:Một số kiểu dữ liệu và dữ liệu văn bản - 7h::7h45 - Thứ Ba'),
(4, 'Tin học 11', 'Bài 1:Hệ điều hành - 8h45::9h30 - Thứ Hai'),
(5, 'Tin học 11', 'Bài 2:Thực hành sử dụng hệ điều hành - 8h45::9h30 - Thứ Tư'),
(6, 'Tin học 11', 'Bài 3:Phần mềm nguồn mở và phần mềm Internet - 8h45::9h30 - Thứ Hai'),
(7, 'Ngữ văn 10', 'Bài 1:Truyện về các vị thần sáng tạo thế giới(Thần thoại Việt Nam)'),
(8, 'Ngữ văn 10', 'Bài 2:Tản viên từ Phán sự lục'),
(9, 'Ngữ văn 10', 'Bài 3:Chữ người tử tù'),
(10, 'Ngữ văn 11', 'Bài 1:Vợ nhặt'),
(11, 'Ngữ văn 11', 'Bài 2:Chí phèo'),
(12, 'Ngữ văn 11', 'Bài 3:Thực hành Tiếng Việt'),
(13, 'Vật lý 11', 'Bài 1:Dao động điều hòa'),
(14, 'Vật lý 11', 'Bài 2:Mô tả dao động điều hòa'),
(15, 'Vật lý 11', 'Bài 3:Vận tốc, gia tốc trong dao động điều hòa'),
(16, 'Hóa học 11', 'Bài 1:Khái niệm về cân bằng hóa học'),
(17, 'Hóa học 11', 'Bài 2:Cân bằng trong dung dịch nước'),
(18, 'Hóa học 11', 'Bài 3:Ôn tập chương 1'),
(19, 'Sinh học 11', 'Bài 1:Khái quát về trao đổi chất và chuyển hóa năng lượng'),
(20, 'Sinh học 11', 'Bài 2:Trao đổi nước và khoáng ở thực vật'),
(21, 'Sinh học 11', 'Bài 3:Thực hành:Trao đổi nước và khoáng ở thực vật'),
(22, 'Lịch sử 11', 'Bài 1:Một số vấn đề chung của cách mạng tư sản'),
(23, 'Lịch sử 11', 'Bài 2:Sự xác lập và phát triển của chữ nghĩa tư bản'),
(24, 'Lịch sử 11', 'Bài 3:Sự hình thành Liên bang Cộng hòa xã hội chủ nghĩa Xô Viết'),
(25, 'Địa lý 11', 'Bài 1:Sự khác biệt về trình độ phát triển kinh tế - xã hội của các nhóm nước'),
(26, 'Địa lý 11', 'Bài 2:Toàn cầu hóa và khu vực hóa kinh tế'),
(27, 'Địa lý 11', 'Bài 3:Thực hành tìm hiểu về cơ hội và thách thức của toàn cầu hóa và khu vực hóa kinh tế'),
(28, 'Tiếng anh 11', 'Unit 1:A long and healthy life'),
(29, 'Tiếng anh 11', 'Unit 2:The generation gap'),
(30, 'Tiếng anh 11', 'Unit 3:Cities of the future');



-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(30) NOT NULL,
  `id_no` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `id_no`, `firstname`, `middlename`, `lastname`, `contact`, `gender`, `address`, `email`) VALUES
(1, '12345678', 'Tuấn', 'Khánh', 'Phạm', '11A10', 'Male', 'TPHCM', '4801103089@student.hcmue.edu.vn'),
(2, '23568974', 'Tuấn', 'Văn', 'Trần', '11A10', 'Male', 'TPHCM', '4801103086@student.hcmue.edu.vn'),
(3, '59863274', 'Phát', 'Thành', 'Võ', '11A10', 'Male', 'Tây Ninh', '4801103060@student.hcmue.edu.vn');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(30) NOT NULL,
  `faculty_id` int(30) NOT NULL,
  `title` varchar(200) NOT NULL,
  `schedule_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= class, 2= meeting,3=others',
  `description` text NOT NULL,
  `location` text NOT NULL,
  `is_repeating` tinyint(1) NOT NULL DEFAULT 1,
  `repeating_data` text  NULL,
  `schedule_date` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `faculty_id`, `title`, `schedule_type`, `description`, `location`, `is_repeating`, `repeating_data`, `schedule_date`, `time_from`, `time_to`, `date_created`) VALUES
(7, 0, 'Tin học 11', 1, 'Bài 1:Hệ điều hành - 8h45::9h30 - Thứ Hai', '11A10', 0,NULL , '2024-09-09', '08:45:00', '09:30:00', '2024-11-19 18:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(30) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject`, `description`) VALUES
(1, 'Tin học', 'IT'),
(2, 'Toán', 'Math'),
(3, 'Tiếng Anh', 'English'),
(4, 'Ngữ văn', 'Literature'),
(5, 'Vật lý', 'Physic'),
(6, 'Hóa học', 'Chemistry'),
(7, 'Sinh học', 'Biology'),
(8, 'Lịch sử', 'History'),
(9, 'Địa lý', 'Geography'),
(10, 'Giáo dục công dân', 'GDCD'),
(11, 'Công nghệ', 'Technology'),
(12, 'Thể chất', 'PE'),
(13, 'Giáo dục quốc phòng', 'NDE');



-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Teacher'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', '0192023a7bbd73250516f069df18b500', 1),
(2, 'Phan Tấn Trung', 'teacher','trung123',2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class_schedule_info`
--
ALTER TABLE `class_schedule_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_schedule_info`
--
ALTER TABLE `class_schedule_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

CREATE TABLE `homework` (
  `id` int(30) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `due_date` date NOT NULL,
  `course_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `homework`
--

INSERT INTO `homework` (`id`, `title`, `description`, `due_date`, `course_id`) VALUES
(1, 'Bài tập 1: Lập trình cơ bản', 'Viết một chương trình đơn giản bằng PHP.', '2023-10-30', 1),
(2, 'Bài tập 2: Giải tích', 'Giải các bài toán về hàm số.', '2023-11-05', 4),
(3, 'Bài tập 3: Tiếng Anh', 'Viết một đoạn văn ngắn về sở thích.', '2023-11-10', 10);
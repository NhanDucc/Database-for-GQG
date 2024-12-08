-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 08, 2024 lúc 05:53 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quiz_game`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `answers`
--

CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_text` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `answers`
--

INSERT INTO `answers` (`answer_id`, `question_id`, `answer_text`, `is_correct`) VALUES
(132, 18, 'A. United States', 0),
(133, 18, 'B. Russia', 0),
(134, 18, 'C. Canada', 0),
(135, 18, 'D. China', 0),
(136, 19, 'A. Mississippi', 0),
(137, 19, 'B. Nile', 0),
(138, 19, 'C. Amazon', 0),
(139, 19, 'D. Yangtze', 0),
(140, 20, 'A. Brisbane', 0),
(141, 20, 'B. Melbourne', 0),
(142, 20, 'C. Sydney', 0),
(143, 20, 'D. Canberra', 0),
(144, 21, 'False', 1),
(145, 22, 'True', 1),
(146, 26, 'Aconcagua', 1),
(147, 26, 'Aconcagua Mountain', 1),
(148, 27, 'Seine', 1),
(149, 27, 'Seine River', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `question_text` varchar(255) NOT NULL,
  `question_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `questions`
--

INSERT INTO `questions` (`question_id`, `question_text`, `question_type`) VALUES
(18, 'Which is the largest country by area?', 'MultipleChoice'),
(19, 'Which of these rivers is the longest in the world?', 'MultipleChoice'),
(20, 'The capital city of Australia is:', 'MultipleChoice'),
(21, 'The Sahara is the largest desert in the world.', 'TrueFalse'),
(22, 'Mount Everest is located in both Nepal and China.', 'TrueFalse'),
(26, 'What is the name of the highest mountain in South America?', 'OpenEnded'),
(27, 'Name the river that flows through Paris.', 'OpenEnded');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Player','Admin') NOT NULL DEFAULT 'Player',
  `score` int(11) DEFAULT 0,
  `time_taken` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `score`, `time_taken`) VALUES
(4, 'admin', '$2a$11$85DmyAaLWIiNWMV0ydBPxOE0rOhXvygsFnASwjXEDrk3JIt8EgeeS', 'Admin', 0, 0),
(5, 'ducky', '$2a$11$/NOmynBitzjjGCuoH.SJVO5PqhL/nrrAgDcK/TQ8FJ6KNOu0zH6gG', 'Player', 5, 0.8309273233333333),
(6, 'user1', '$2a$11$NK9m6fhqZmx/OPpo0xrGAeScOhVMGdm72oMEK04MDVBDeTu57e9zC', 'Player', 3, 0.20038389833333334),
(7, 'user2', '$2a$11$hNmRzi216QCiCK.UeYtALuDBXrZSnNKZ/NJKc/Z29f4FAxiAwojve', 'Player', 0, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Chỉ mục cho bảng `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `answers`
--
ALTER TABLE `answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT cho bảng `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

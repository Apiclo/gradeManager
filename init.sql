-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： mysql
-- 生成日期： 2024-06-15 12:36:05
-- 服务器版本： 8.2.0
-- PHP 版本： 8.2.19
-- 022201230237wcl
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `fnex`
--

-- --------------------------------------------------------

--
-- 表的结构 `course`
--

CREATE TABLE `course` (
  `id` int NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `course_score` int NOT NULL,
  `course_time` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `course`
--

INSERT INTO `course` (`id`, `name`, `course_score`, `course_time`) VALUES
(6, '捉羊100法(专业必修)', 4, 8),
(7, '防狼100招(专业必修)', 6, 12),
(8, '计算机系统结构(专业选修)', 8, 16),
(9, '青青草原动物行为学(通识必修)', 8, 8),
(10, '马克思主义基本原理(通识必修)', 4, 16);

-- --------------------------------------------------------

--
-- 表的结构 `score`
--

CREATE TABLE `score` (
  `id` int NOT NULL,
  `teacher_no` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `student_no` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `score` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `score`
--

INSERT INTO `score` (`id`, `teacher_no`, `course_id`, `student_no`, `score`) VALUES
(7, '20001', 7, '410001', 86),
(8, '20001', 7, '410002', 75),
(9, '20001', 7, '410003', 62),
(10, '20001', 7, '410004', 67),
(11, '20001', 7, '410005', 89),
(12, '20001', 7, '410006', 90),
(13, '20002', 6, '410011', 32),
(14, '20002', 6, '410012', 59),
(15, '20002', 6, '410013', 57),
(16, '20002', 6, '410014', 53),
(17, '20002', 6, '410015', 46),
(18, '20002', 6, '410016', 56),
(19, '20011', 8, '410026', 56),
(20, '20011', 8, '410025', 45),
(21, '20011', 8, '410024', 24),
(22, '20011', 8, '410023', 54),
(23, '20011', 8, '410022', 57),
(24, '20011', 8, '410021', 98),
(25, '20003', 9, '410001', 79),
(26, '20003', 9, '410002', 83),
(27, '20003', 9, '410003', 98),
(28, '20003', 9, '410004', 93),
(29, '20003', 9, '410005', 68),
(30, '20003', 9, '410006', 74),
(31, '20003', 9, '410011', 84),
(32, '20003', 9, '410012', 63),
(33, '20003', 9, '410013', 65),
(34, '20003', 9, '410014', 62),
(35, '20003', 9, '410015', 75),
(36, '20003', 9, '410016', 59),
(37, '20011', 10, '410001', 89),
(38, '20011', 10, '410002', 76),
(39, '20011', 10, '410003', 95),
(40, '20011', 10, '410004', 85),
(41, '20011', 10, '410005', 73),
(42, '20011', 10, '410006', 94),
(43, '20011', 10, '410011', 84),
(44, '20011', 10, '410012', 83),
(45, '20011', 10, '410013', 93),
(46, '20011', 10, '410014', 81),
(47, '20011', 10, '410015', 84),
(48, '20011', 10, '410016', 52),
(49, '20011', 10, '410021', 97),
(50, '20011', 10, '410022', 93),
(51, '20011', 10, '410023', 83),
(52, '20011', 10, '410024', 56),
(53, '20011', 10, '410025', 86),
(54, '20011', 10, '410026', 94);

-- --------------------------------------------------------

--
-- 表的结构 `teach`
--

CREATE TABLE `teach` (
  `id` int NOT NULL,
  `teacher_no` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `course_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `teach`
--

INSERT INTO `teach` (`id`, `teacher_no`, `course_id`) VALUES
(3, '20001', 7),
(4, '20002', 6),
(5, '20011', 8),
(6, '20003', 9),
(7, '20011', 10);

--
-- 触发器 `teach`
--
DELIMITER $$
CREATE TRIGGER `remove_from_score` AFTER DELETE ON `teach` FOR EACH ROW BEGIN
    DECLARE `tno` VARCHAR(50);
    DECLARE `cid` INT;
    SET `tno` = OLD.`teacher_no`;
    SET `cid` = OLD.`course_id`;
    DELETE FROM `score` WHERE `score`.`teacher_no` = `tno` AND `score`.`course_id` = `cid`;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `no` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `role` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`no`, `name`, `password`, `role`) VALUES
('10086', '窗外', '8cb2237d0679ca88db6464eac60da96345513964', 0),
('20001', '慢羊羊', '8cb2237d0679ca88db6464eac60da96345513964', 1),
('20002', '灰太狼', '8cb2237d0679ca88db6464eac60da96345513964', 1),
('20003', '包包大人', '8cb2237d0679ca88db6464eac60da96345513964', 1),
('20011', '健康哥哥', '8cb2237d0679ca88db6464eac60da96345513964', 1),
('410001', '懒羊羊', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410002', '沸羊羊', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410003', '美羊羊', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410004', '喜羊羊', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410005', '暖羊羊', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410006', '小飞机', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410011', '小灰灰', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410012', '小白狼', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410013', '夜太狼', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410014', '灰二太太狼', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410015', '蕉太狼', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410016', '黑太狼', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410021', '胡图图', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410022', '小美', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410023', '张帅子', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410024', '壮壮', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410025', '大虎', '8cb2237d0679ca88db6464eac60da96345513964', 2),
('410026', '跳跳', '8cb2237d0679ca88db6464eac60da96345513964', 2);

--
-- 触发器 `user`
--
DELIMITER $$
CREATE TRIGGER `remove_score_info` BEFORE DELETE ON `user` FOR EACH ROW BEGIN
    IF OLD.`role` = 1 THEN
        DELETE FROM `score` WHERE `score`.`teacher_no` = OLD.`no`;
        DELETE FROM `teach` WHERE `teach`.`teacher_no` = OLD.`no`;
    END IF;
    IF OLD.`role` = 2 THEN
        DELETE FROM `score` WHERE `score`.`student_no` = OLD.`no`;
    END IF;
END
$$
DELIMITER ;

--
-- 转储表的索引
--

--
-- 表的索引 `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id`),
  ADD KEY `score_student_no_fk` (`student_no`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `teacher_no` (`teacher_no`);

--
-- 表的索引 `teach`
--
ALTER TABLE `teach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `teacher_no` (`teacher_no`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`no`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `course`
--
ALTER TABLE `course`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `score`
--
ALTER TABLE `score`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- 使用表AUTO_INCREMENT `teach`
--
ALTER TABLE `teach`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 限制导出的表
--

--
-- 限制表 `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `score_student_no_fk` FOREIGN KEY (`student_no`) REFERENCES `user` (`no`),
  ADD CONSTRAINT `score_teacher_no_fk` FOREIGN KEY (`teacher_no`) REFERENCES `user` (`no`);

--
-- 限制表 `teach`
--
ALTER TABLE `teach`
  ADD CONSTRAINT `teach_course_id_fk` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `teach_teacher_no_fk` FOREIGN KEY (`teacher_no`) REFERENCES `user` (`no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

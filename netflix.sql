-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mariadb
-- Generation Time: Apr 25, 2026 at 08:54 AM
-- Server version: 10.6.20-MariaDB-ubu2004
-- PHP Version: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `netflix`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`%` FUNCTION `count_active_reviews_by_movie` (`p_movie_id` VARCHAR(10)) RETURNS INT(11) DETERMINISTIC BEGIN
    DECLARE review_count INT;

    SELECT COUNT(*)
    INTO review_count
    FROM reviews
    WHERE review_movie_id = p_movie_id
      AND review_deleted_at = 0;

    RETURN review_count;
END$$

CREATE DEFINER=`root`@`%` FUNCTION `count_users_mylist` (`p_user_pk` CHAR(32)) RETURNS INT(11) DETERMINISTIC BEGIN
    DECLARE mylist_count INT;

    SELECT COUNT(*)
    INTO mylist_count
    FROM mylists
    WHERE mylist_user_fk = p_user_pk
    AND mylist_deleted_at = 0;

    RETURN mylist_count;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `block_blocker_user_fk` char(32) NOT NULL,
  `block_blocking_user_fk` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`block_blocker_user_fk`, `block_blocking_user_fk`) VALUES
('750ff67a52cb41d18ffb89e0ca44b945', 'a25389f1957e49bda5c1892512f9b2c3');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_pk` char(32) NOT NULL,
  `comment_user_fk` char(32) NOT NULL,
  `comment_review_fk` varchar(32) NOT NULL,
  `comment_text` varchar(250) NOT NULL,
  `comment_created_at` bigint(20) UNSIGNED NOT NULL,
  `comment_deleted_at` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_pk`, `comment_user_fk`, `comment_review_fk`, `comment_text`, `comment_created_at`, `comment_deleted_at`) VALUES
('240f43ad1a3f4f5388c63457c4dc4379', '240f43ad1a3f4f5388c63457c4dc4379', '9d3d61b6f949402084e1b16a9351d10a', 'This is a comment', 1765192301, 0),
('4bb0d0b68b9d46788a32d15ec5183e72', '750ff67a52cb41d18ffb89e0ca44b945', '9d3d61b6f949402084e1b16a9351d10a', 'I totally disagree', 1765793012, 0),
('5e29e87cc4024e19815776a679b69214', '750ff67a52cb41d18ffb89e0ca44b945', '6e83f1cc6fe54f58bb12fa0cde79cdeb', 'I really hated this movie', 1765794126, 0),
('5fb87d6917224c068812a9ac800c8c53', '750ff67a52cb41d18ffb89e0ca44b945', '8a0ff5f15c734bcdab92dce283d3e61d', 'I agree alot with you', 1765806022, 0),
('72a49b358a5e4f89a66afc16272dd947', '750ff67a52cb41d18ffb89e0ca44b945', '6e83f1cc6fe54f58bb12fa0cde79cdeb', 'Me too! It really moved me', 1765794038, 0),
('7dd94d11855d44bb9a9107d7381001a6', '750ff67a52cb41d18ffb89e0ca44b945', '9d3d61b6f949402084e1b16a9351d10a', 'I totally ageee', 1765792644, 0),
('b36d15aa711246c595b58721d9433355', '750ff67a52cb41d18ffb89e0ca44b945', '5acfb5b0a3224cd18c2cccbc2c97b905', 'i aggreee with you', 1765874577, 0),
('bc41c7889f9044d7ba26ed7ffefe8adb', '750ff67a52cb41d18ffb89e0ca44b945', '931130c474e947e79f4cbe90a8344eed', 'work good enough', 1765806774, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mylists`
--

CREATE TABLE `mylists` (
  `mylist_user_fk` char(32) NOT NULL,
  `mylist_movie_id` varchar(10) NOT NULL,
  `mylist_created_at` bigint(20) UNSIGNED NOT NULL,
  `mylist_deleted_at` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mylists`
--

INSERT INTO `mylists` (`mylist_user_fk`, `mylist_movie_id`, `mylist_created_at`, `mylist_deleted_at`) VALUES
('355793fa9839476d932bb1fc5494ab5f', '967941', 1765039644, 0),
('750ff67a52cb41d18ffb89e0ca44b945', '1083637', 1764922776, 1765188844),
('750ff67a52cb41d18ffb89e0ca44b945', '1084242', 1765188239, 1765189635),
('750ff67a52cb41d18ffb89e0ca44b945', '1180831', 1764926288, 1765188841),
('750ff67a52cb41d18ffb89e0ca44b945', '1218925', 1765188988, 1765189640),
('750ff67a52cb41d18ffb89e0ca44b945', '1246049', 1765188748, 1765188852),
('750ff67a52cb41d18ffb89e0ca44b945', '1429520', 1765187410, 1765187434),
('750ff67a52cb41d18ffb89e0ca44b945', '1523145', 1765628537, 0),
('750ff67a52cb41d18ffb89e0ca44b945', '533533', 1765187414, 1765189644),
('750ff67a52cb41d18ffb89e0ca44b945', '967941', 1764962672, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_pk` char(32) NOT NULL,
  `review_user_fk` varchar(32) NOT NULL,
  `review_movie_id` varchar(10) NOT NULL,
  `review_text` varchar(250) NOT NULL,
  `review_created_at` bigint(20) UNSIGNED NOT NULL,
  `review_deleted_at` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_pk`, `review_user_fk`, `review_movie_id`, `review_text`, `review_created_at`, `review_deleted_at`) VALUES
('0983b84d1ded4335a0f975434676531e', '750ff67a52cb41d18ffb89e0ca44b945', '1246049', 'This movie was too scary for me!', 1765192069, 0),
('1b75bd2f96984786ae7db091772c0543', '750ff67a52cb41d18ffb89e0ca44b945', '967941', 'Such a beautiful movie', 1765623232, 0),
('2393fc5e93554ccdb0ef1449c2e7632b', '750ff67a52cb41d18ffb89e0ca44b945', '967941', 'nice movie', 1765047194, 0),
('5acfb5b0a3224cd18c2cccbc2c97b905', '355793fa9839476d932bb1fc5494ab5f', '967941', 'Writing a texive message to be conveyed to the reader. Achieving this precise length is a fun linguistic puzzle!', 1765134745, 0),
('603d5ea1eed041569b2d5f56dd2ddc7b', '750ff67a52cb41d18ffb89e0ca44b945', '1180831', 'I really liked the action', 1765189533, 0),
('64428590372b415c941e3e5de2a2e719', 'a1f2503151cc4f3ca411327f3ed8128a', '1180831', 'I like this movie', 1765131067, 0),
('6be06b4de6a64b6386f962a6ee29b9f0', '355793fa9839476d932bb1fc5494ab5f', '967941', 'This is such a good movie', 1765035588, 0),
('6e83f1cc6fe54f58bb12fa0cde79cdeb', 'a1f2503151cc4f3ca411327f3ed8128a', '967941', 'I really enjoyed this movie!', 1765131346, 0),
('8a0ff5f15c734bcdab92dce283d3e61d', '750ff67a52cb41d18ffb89e0ca44b945', '967941', 'This movie made me angry', 1765622995, 0),
('931130c474e947e79f4cbe90a8344eed', '750ff67a52cb41d18ffb89e0ca44b945', '967941', 'really enjoyed this', 1765047167, 0),
('9d3d61b6f949402084e1b16a9351d10a', '750ff67a52cb41d18ffb89e0ca44b945', '967941', 'I did not enjoy this movi', 1765627353, 0),
('a21c96385c494be2b285ecfa58836f4e', '750ff67a52cb41d18ffb89e0ca44b945', '967941', 'I liked this movie', 1765047389, 0),
('acd0e4b16f5a4394a4e757e1e75246b4', '750ff67a52cb41d18ffb89e0ca44b945', '967941', 'Such a beautiful movie', 1765623280, 0),
('b9cff509c4ca413f81ae3f932d1f3e66', '355793fa9839476d932bb1fc5494ab5f', '967941', 'This is such a great movie', 1765039376, 1765039455),
('baa3abbe40b2479eadb451efc6215f51', '355793fa9839476d932bb1fc5494ab5f', '967941', 'I love this movie! it is so good!', 1765035490, 1765036472),
('eaf0536d9aee4c7ab1dafd2dce5941c0', '750ff67a52cb41d18ffb89e0ca44b945', '1403735', 'Great movie', 1765352887, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_pk` char(32) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_first_name` varchar(20) NOT NULL,
  `user_last_name` varchar(20) NOT NULL DEFAULT '',
  `user_avatar_path` char(100) NOT NULL,
  `user_verification_key` char(32) NOT NULL,
  `user_verified_at` bigint(20) UNSIGNED NOT NULL,
  `user_new_password_key` char(32) NOT NULL,
  `user_deleted_at` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_pk`, `user_email`, `user_password`, `user_first_name`, `user_last_name`, `user_avatar_path`, `user_verification_key`, `user_verified_at`, `user_new_password_key`, `user_deleted_at`) VALUES
('240f43ad1a3f4f5388c63457c4dc4379', 'claus@email.com', 'scrypt:32768:8:1$8ZdT1bobaJOfkHji$5e923c250b9d04dcbdb6b65b5d0516067d4d91ebcab3921576f4428884cb000d2af2f1aa7c32da13dffff1d1899bddcfcceda9a3057cd476b17efcb0b89aaaaa', 'Claus', '', 'images/twitter_default.png', '0', 1765121526, '0', 0),
('355793fa9839476d932bb1fc5494ab5f', 'caroline@email.com', 'scrypt:32768:8:1$8ZdT1bobaJOfkHji$5e923c250b9d04dcbdb6b65b5d0516067d4d91ebcab3921576f4428884cb000d2af2f1aa7c32da13dffff1d1899bddcfcceda9a3057cd476b17efcb0b89aaaaa', 'Caroline', '', 'images/user_uploads/avatars/753ea915f9ea46ffbbdd999ae4e7474a.jpeg', '0', 1765121526, '0', 0),
('750ff67a52cb41d18ffb89e0ca44b945', 'niels@email.com', 'scrypt:32768:8:1$wAy2F7quSpzauqOQ$16990cbb8c5c315a081001c9f345c4fa64bff361ff296745703262a5a4ab27eedac4aeb88838f0799134d2e6408f262f4afc07114ca70693179bc1f1d3c0ab4d', 'Niels', '', 'images/user_uploads/avatars/afef14e704634765ac0408f04f5b3bb0.jpeg', '0', 1764861934, '0', 0),
('a1f2503151cc4f3ca411327f3ed8128a', 'jorislolking@gmail.com', 'scrypt:32768:8:1$z51tOPLrJlrVvExv$0139afc6280543d3b80e483b183cda8ae08fca9132d0ad610a8325fc2e0a9248cb6ea17e672fc1806d081a55da87c602093d1d58deae4c51fdace3ccc94224b0', 'Joris', '', 'images/user_uploads/avatars/b0e47bb36b574962b5c2a4add8e88b6a.jpeg', '0', 1765121526, '0', 0),
('a25389f1957e49bda5c1892512f9b2c3', 'silver@email.com', 'scrypt:32768:8:1$mKgMut4wW3UvxLRT$c09396210215644ad6dcd889adbc5859604c163c459ad9119b1b717c0d5e046de7a6b42f20d41971a04862b7aa9123be5726aea42ef81d5fec3465eb286e691e', 'Silver', '', 'images/twitter_default.png', '0', 1765121526, '0', 1765641386);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `delete_user_comments` AFTER UPDATE ON `users` FOR EACH ROW BEGIN
    IF OLD.user_deleted_at = 0 AND NEW.user_deleted_at <> 0 THEN
        UPDATE comments
        SET comment_deleted_at = NEW.user_deleted_at
        WHERE comment_user_fk = NEW.user_pk;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `delete_user_reviews` AFTER UPDATE ON `users` FOR EACH ROW BEGIN
    IF OLD.user_deleted_at = 0 AND NEW.user_deleted_at <> 0 THEN
        UPDATE reviews
        SET review_deleted_at = NEW.user_deleted_at 
        WHERE review_user_fk = NEW.user_pk;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `reactivate_user_reviews` AFTER UPDATE ON `users` FOR EACH ROW BEGIN
    IF OLD.user_deleted_at != 0 AND NEW.user_deleted_at = 0 THEN
        UPDATE reviews
        SET review_deleted_at = NEW.user_deleted_at
        WHERE review_user_fk = NEW.user_pk;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_active_reviews`
-- (See below for the actual view)
--
CREATE TABLE `view_active_reviews` (
`review_pk` char(32)
,`review_movie_id` varchar(10)
,`review_text` varchar(250)
,`review_created_at` bigint(20) unsigned
,`user_first_name` varchar(20)
,`user_avatar_path` char(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_deleted_users`
-- (See below for the actual view)
--
CREATE TABLE `view_deleted_users` (
`user_pk` char(32)
,`user_first_name` varchar(20)
,`user_avatar_path` char(100)
,`user_deleted_at` bigint(20) unsigned
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`block_blocker_user_fk`,`block_blocking_user_fk`),
  ADD KEY `idx_blocks_blocker_blocking` (`block_blocker_user_fk`,`block_blocking_user_fk`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_pk`),
  ADD KEY `comment_deleted_at` (`comment_deleted_at`);

--
-- Indexes for table `mylists`
--
ALTER TABLE `mylists`
  ADD PRIMARY KEY (`mylist_user_fk`,`mylist_movie_id`),
  ADD KEY `mylist_deleted_at` (`mylist_deleted_at`),
  ADD KEY `mylist_movie_id` (`mylist_movie_id`),
  ADD KEY `mylist_user_fk` (`mylist_user_fk`),
  ADD KEY `mylist_deleted_at_2` (`mylist_deleted_at`),
  ADD KEY `mylist_created_at` (`mylist_created_at`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_pk`),
  ADD KEY `review_user_fk` (`review_user_fk`),
  ADD KEY `review_movie_id` (`review_movie_id`),
  ADD KEY `review_created_at` (`review_created_at`),
  ADD KEY `review_deleted_at` (`review_deleted_at`);
ALTER TABLE `reviews` ADD FULLTEXT KEY `review_text` (`review_text`);
ALTER TABLE `reviews` ADD FULLTEXT KEY `review_text_2` (`review_text`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_pk`),
  ADD UNIQUE KEY `user_pk` (`user_pk`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `user_deleted_at` (`user_deleted_at`),
  ADD KEY `user_verified_at` (`user_verified_at`);

-- --------------------------------------------------------

--
-- Structure for view `view_active_reviews`
--
DROP TABLE IF EXISTS `view_active_reviews`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_active_reviews`  AS SELECT `reviews`.`review_pk` AS `review_pk`, `reviews`.`review_movie_id` AS `review_movie_id`, `reviews`.`review_text` AS `review_text`, `reviews`.`review_created_at` AS `review_created_at`, `users`.`user_first_name` AS `user_first_name`, `users`.`user_avatar_path` AS `user_avatar_path` FROM (`reviews` join `users` on(`users`.`user_pk` = `reviews`.`review_user_fk`)) WHERE `reviews`.`review_deleted_at` = 0 AND `users`.`user_deleted_at` = 0 ;

-- --------------------------------------------------------

--
-- Structure for view `view_deleted_users`
--
DROP TABLE IF EXISTS `view_deleted_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_deleted_users`  AS SELECT `users`.`user_pk` AS `user_pk`, `users`.`user_first_name` AS `user_first_name`, `users`.`user_avatar_path` AS `user_avatar_path`, `users`.`user_deleted_at` AS `user_deleted_at` FROM `users` WHERE `users`.`user_deleted_at` <> 0 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `review_user_fk` FOREIGN KEY (`review_user_fk`) REFERENCES `users` (`user_pk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

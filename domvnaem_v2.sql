-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Мар 17 2016 г., 17:27
-- Версия сервера: 5.6.21
-- Версия PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `domvnaem_v2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `countries_regiones_id` int(11) NOT NULL,
  `regional_center` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`id`, `name`, `countries_regiones_id`, `regional_center`) VALUES
(1, 'Киев', 1, 1),
(2, 'Харьков', 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1457609776),
('m130524_201442_init', 1457609797);

-- --------------------------------------------------------

--
-- Структура таблицы `objects`
--

CREATE TABLE IF NOT EXISTS `objects` (
`id` int(11) NOT NULL,
  `users_user_id` int(11) NOT NULL,
  `objects_types_id` int(11) NOT NULL,
  `regions_id` int(11) NOT NULL,
  `cities_id` int(11) NOT NULL,
  `rayon_id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `description` text,
  `condition` varchar(5000) DEFAULT NULL,
  `rooms` int(11) NOT NULL,
  `total_space` float DEFAULT NULL,
  `living_space` float DEFAULT NULL,
  `newbuilding` int(11) DEFAULT NULL,
  `bidding` tinyint(1) DEFAULT NULL,
  `price` float NOT NULL,
  `currency` varchar(5) NOT NULL,
  `utility_bills` tinyint(1) DEFAULT NULL,
  `mebel` tinyint(1) DEFAULT NULL,
  `address` varchar(1024) NOT NULL,
  `street` int(11) NOT NULL,
  `house` int(11) NOT NULL,
  `appart` int(11) NOT NULL,
  `etag` int(11) NOT NULL,
  `etag_all` int(11) NOT NULL,
  `lat` double NOT NULL,
  `lon` double NOT NULL,
  `subway_station` int(11) NOT NULL,
  `parking` int(11) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `views` int(11) NOT NULL,
  `date_add` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `timetable` varchar(400) NOT NULL,
  `rented` tinyint(1) DEFAULT NULL,
  `was_rented` tinyint(1) DEFAULT NULL,
  `video` varchar(255) NOT NULL,
  `full_name` text NOT NULL,
  `status` int(11) DEFAULT NULL,
  `package` int(11) DEFAULT NULL,
  `my_up` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `objects`
--

INSERT INTO `objects` (`id`, `users_user_id`, `objects_types_id`, `regions_id`, `cities_id`, `rayon_id`, `name`, `description`, `condition`, `rooms`, `total_space`, `living_space`, `newbuilding`, `bidding`, `price`, `currency`, `utility_bills`, `mebel`, `address`, `street`, `house`, `appart`, `etag`, `etag_all`, `lat`, `lon`, `subway_station`, `parking`, `date_start`, `views`, `date_add`, `timetable`, `rented`, `was_rented`, `video`, `full_name`, `status`, `package`, `my_up`) VALUES
(1, 1, 1, 1, 1, 1, 1, 'qwerty', '1', 1, 1, 1, 1, 1, 12, 'qwe', 1, 1, 'qweasd', 1, 1, 1, 1, 1, 1, 1, 1, 1, '0000-00-00', 1, '0000-00-00 00:00:00', '1', 1, 1, 'qwe', 'qweqwe', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
`user_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `number_phone` varchar(32) NOT NULL,
  `number_phone2` varchar(32) NOT NULL,
  `skype` varchar(50) NOT NULL,
  `social` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', '4ddzs6rwPmNTLl_APTcR6dZodi_t0lru', '$2y$13$sPUDA5qyOaFUQnCTlP3sxuPBWBn5XpJZt6twHTBvdQmEfC/tRU/Va', NULL, 'ruszwn@mail.ru', 10, 1457616041, 1457616041),
(2, 'AdamFirst', 'yGKR3ScO13x6rWRV2jPwBTU4uHY90YWJ', '$2y$13$a5tY8cpGkenBWEeXYuadteWQGDDxqCH9roJARiRCMqRcB/WkQJ6ba', NULL, 'ruszvn@ukr.net', 10, 1457625581, 1457625581);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
 ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
 ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `objects`
--
ALTER TABLE `objects`
 ADD PRIMARY KEY (`id`), ADD KEY `users_user_id` (`users_user_id`);

--
-- Индексы таблицы `profiles`
--
ALTER TABLE `profiles`
 ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `email` (`email`), ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `objects`
--
ALTER TABLE `objects`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `profiles`
--
ALTER TABLE `profiles`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

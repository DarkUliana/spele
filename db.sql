-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.20-log - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных spl
CREATE DATABASE IF NOT EXISTS `spl` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `spl`;

-- Дамп структуры для таблица spl.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `active` tinyint(4) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы spl.articles: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`, `title`, `link`, `image`, `date`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '5 ефективних вправ для тих, кому не вистачає часу на спортзал', 'http://spelelife.com/5-%D0%B5%D1%84%D0%B5%D0%BA%D1%82%D0%B8%D0%B2%D0%BD%D0%B8%D1%85-%D0%B2%D0%BF%D1%80%D0%B0%D0%B2-%D0%B4%D0%BB%D1%8F-%D1%82%D0%B8%D1%85-%D0%BA%D0%BE%D0%BC%D1%83-%D0%BD%D0%B5-%D0%B2%D0%B8%D1%81%D1%82%D0%B0/', '1522696199-new-chums-beach.jpg', '2018-04-02', 1, '2018-04-02 19:10:00', '2018-04-04 18:56:33', '2018-04-04 18:56:33'),
	(2, 'На відміну від поширеної думки Lorem Ipsum не є випадковим', '#', '1522868285-pic-blog1.jpg', '2018-03-01', 1, '2018-04-04 18:58:05', '2018-04-04 18:58:05', NULL),
	(3, 'Нове дослідження дає відповідь, як поліпшити сон', '#', '1522868325-pic-blog2.jpg', '2018-03-01', 1, '2018-04-04 18:58:45', '2018-04-04 18:58:45', NULL);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;

-- Дамп структуры для таблица spl.menus
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `menu_type` int(11) NOT NULL DEFAULT '1',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы spl.menus: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` (`id`, `position`, `menu_type`, `icon`, `name`, `title`, `parent_id`, `created_at`, `updated_at`) VALUES
	(1, NULL, 0, NULL, 'User', 'User', NULL, NULL, NULL),
	(2, NULL, 0, NULL, 'Role', 'Role', NULL, NULL, NULL),
	(6, 0, 1, 'fa-newspaper-o', 'Articles', 'Статьи', NULL, '2018-04-02 19:04:36', '2018-04-02 19:04:36'),
	(7, 0, 1, 'fa-comment-o', 'Reviews', 'Отзывы', NULL, '2018-04-04 18:43:09', '2018-04-04 18:43:09'),
	(8, 0, 1, 'fa-map-marker', 'Сoordinates', 'Координаты', NULL, '2018-04-05 20:41:01', '2018-04-05 20:41:29');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;

-- Дамп структуры для таблица spl.menu_role
CREATE TABLE IF NOT EXISTS `menu_role` (
  `menu_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `menu_role_menu_id_role_id_unique` (`menu_id`,`role_id`),
  KEY `menu_role_menu_id_index` (`menu_id`),
  KEY `menu_role_role_id_index` (`role_id`),
  CONSTRAINT `menu_role_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы spl.menu_role: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `menu_role` DISABLE KEYS */;
INSERT INTO `menu_role` (`menu_id`, `role_id`) VALUES
	(6, 1),
	(6, 2),
	(7, 1),
	(7, 2),
	(8, 1),
	(8, 2);
/*!40000 ALTER TABLE `menu_role` ENABLE KEYS */;

-- Дамп структуры для таблица spl.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы spl.migrations: ~8 rows (приблизительно)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2015_10_10_000000_create_menus_table', 1),
	(4, '2015_10_10_000000_create_roles_table', 1),
	(5, '2015_10_10_000000_update_users_table', 1),
	(6, '2015_12_11_000000_create_users_logs_table', 1),
	(7, '2016_03_14_000000_update_menus_table', 1),
	(9, '2018_04_02_190436_create_articles_table', 2),
	(10, '2018_04_04_184309_create_reviews_table', 3),
	(11, '2018_04_05_204101_create_Сoordinates_table', 4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Дамп структуры для таблица spl.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы spl.password_resets: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Дамп структуры для таблица spl.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы spl.reviews: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` (`id`, `name`, `text`, `photo`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Ігор', 'Найкраща вода для активного відпочинку.', '1522867980-feed1.jpeg', '2018-04-04 18:53:01', '2018-04-04 18:53:01', NULL),
	(2, 'Виктория', 'Я люблю водичку SPELE!! Я не представляю утро без этой водички. Она мягкая, вкусная и полезная!', '1522868020-feed2.jpeg', '2018-04-04 18:53:40', '2018-04-04 18:53:40', NULL),
	(3, 'Drachuk Anastasia', 'Серед основних переваг Spele я би виділила чудовий сервіс.Водичка завжди доставляється швидко і вчасно.', '1522868064-feed3.png', '2018-04-04 18:54:25', '2018-04-04 18:54:25', NULL),
	(4, 'Лена', 'Нарешті знайшла ідеальну для себе воду, рекомендую Spele!', '1522868091-feed4.png', '2018-04-04 18:54:52', '2018-04-04 18:54:52', NULL),
	(5, 'Віка', 'Задоволена водою Spele, вживаємо всією родиною.', '1522868130-feed5.png', '2018-04-04 18:55:30', '2018-04-04 18:55:30', NULL),
	(6, 'Вадим', 'Рекомендую Spele для активного відпочинку!', '1522868164-feed6.jpeg', '2018-04-04 18:56:04', '2018-04-04 18:56:04', NULL);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

-- Дамп структуры для таблица spl.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы spl.roles: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`) VALUES
	(1, 'Administrator', '2018-04-02 17:46:14', '2018-04-02 17:46:14'),
	(2, 'User', '2018-04-02 17:46:14', '2018-04-02 17:46:14');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Дамп структуры для таблица spl.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы spl.users: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 1, 'speleAdmin', 'riznyk.uliana.a@gmail.com', '$2y$10$UnHPtH9H5ovoK7Yf3/yz7O2ClLjRz9BuU54sLRjAre6i/uu8TzLoK', NULL, '2018-04-02 17:48:05', '2018-04-02 17:48:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Дамп структуры для таблица spl.users_logs
CREATE TABLE IF NOT EXISTS `users_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы spl.users_logs: ~13 rows (приблизительно)
/*!40000 ALTER TABLE `users_logs` DISABLE KEYS */;
INSERT INTO `users_logs` (`id`, `user_id`, `action`, `action_model`, `action_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 'created', 'articles', 1, '2018-04-02 19:10:00', '2018-04-02 19:10:00'),
	(2, 1, 'created', 'reviews', 1, '2018-04-04 18:53:01', '2018-04-04 18:53:01'),
	(3, 1, 'created', 'reviews', 2, '2018-04-04 18:53:40', '2018-04-04 18:53:40'),
	(4, 1, 'created', 'reviews', 3, '2018-04-04 18:54:25', '2018-04-04 18:54:25'),
	(5, 1, 'created', 'reviews', 4, '2018-04-04 18:54:52', '2018-04-04 18:54:52'),
	(6, 1, 'created', 'reviews', 5, '2018-04-04 18:55:30', '2018-04-04 18:55:30'),
	(7, 1, 'created', 'reviews', 6, '2018-04-04 18:56:04', '2018-04-04 18:56:04'),
	(8, 1, 'deleted', 'articles', 1, '2018-04-04 18:56:33', '2018-04-04 18:56:33'),
	(9, 1, 'created', 'articles', 2, '2018-04-04 18:58:05', '2018-04-04 18:58:05'),
	(10, 1, 'created', 'articles', 3, '2018-04-04 18:58:45', '2018-04-04 18:58:45'),
	(11, 1, 'created', 'Сoordinates', 1, '2018-04-05 20:45:00', '2018-04-05 20:45:00'),
	(12, 1, 'created', 'Сoordinates', 2, '2018-04-05 20:45:26', '2018-04-05 20:45:26'),
	(13, 1, 'created', 'Сoordinates', 3, '2018-04-05 20:45:51', '2018-04-05 20:45:51');
/*!40000 ALTER TABLE `users_logs` ENABLE KEYS */;

-- Дамп структуры для таблица spl.Сoordinates
CREATE TABLE IF NOT EXISTS `Сoordinates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lng` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы spl.Сoordinates: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `Сoordinates` DISABLE KEYS */;
INSERT INTO `Сoordinates` (`id`, `title`, `lat`, `lng`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'TМ Spele', '50.6400264', '26.243686799999978', '2018-04-05 20:45:00', '2018-04-05 20:45:00', NULL),
	(2, 'TМ for test', '50.617311', '26.26902330000007', '2018-04-05 20:45:26', '2018-04-05 20:45:26', NULL),
	(3, 'TМ for test', '50.624198', '26.285831', '2018-04-05 20:45:51', '2018-04-05 20:45:51', NULL);
/*!40000 ALTER TABLE `Сoordinates` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

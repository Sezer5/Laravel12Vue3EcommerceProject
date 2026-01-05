-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 05 Oca 2026, 09:32:51
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `backend`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'admin', 'admin@email.com', '2025-12-09 10:10:02', '$2y$12$I6U0RAS783Wy0pDvJLAmRuyZE95zcofJvE9WDFX4gPWnP9ZQM6Tjq', 'MoHxX12HtRvu0HLLbGsXGsPtKVPOkkqgM6g3LuSzKtrM1DM99mRGpv7fC6mn', '2025-12-09 10:10:02', '2025-12-09 10:10:02');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Nike', 'nike', '2025-12-10 08:36:23', '2025-12-10 08:36:23'),
(2, 'Adidas', 'adidas', '2025-12-10 08:36:35', '2025-12-10 08:36:35'),
(3, 'Kappa', 'kappa', '2025-12-10 08:36:44', '2025-12-10 08:36:44'),
(4, 'Reebok', 'reebok', '2025-12-10 08:37:07', '2025-12-10 08:37:26');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Women', 'women', '2025-12-10 05:37:32', '2025-12-10 05:37:32'),
(2, 'Men', 'men', '2025-12-10 05:39:15', '2025-12-10 05:39:15'),
(3, 'Kids', 'kids', '2025-12-10 05:41:05', '2025-12-10 05:41:05');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `colors`
--

INSERT INTO `colors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Black', '2025-12-10 09:53:00', '2025-12-10 09:53:00'),
(2, 'White', '2025-12-10 09:59:13', '2025-12-10 09:59:13'),
(3, 'Pink', '2025-12-10 10:04:57', '2025-12-10 10:04:57'),
(4, 'Yellow', '2025-12-10 10:05:12', '2025-12-10 10:07:37'),
(5, 'Blue', '2025-12-10 10:09:25', '2025-12-10 10:09:25'),
(6, 'Red', '2025-12-10 10:09:31', '2025-12-10 10:09:31'),
(7, 'Gray', '2025-12-10 10:09:38', '2025-12-10 10:09:38');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `color_product`
--

CREATE TABLE `color_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `color_product`
--

INSERT INTO `color_product` (`id`, `product_id`, `color_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 3, NULL, NULL),
(3, 1, 4, NULL, NULL),
(4, 2, 1, NULL, NULL),
(5, 2, 4, NULL, NULL),
(6, 2, 6, NULL, NULL),
(7, 2, 7, NULL, NULL),
(8, 3, 1, NULL, NULL),
(9, 3, 2, NULL, NULL),
(10, 3, 3, NULL, NULL),
(11, 3, 4, NULL, NULL),
(12, 4, 1, NULL, NULL),
(13, 4, 3, NULL, NULL),
(14, 4, 4, NULL, NULL),
(15, 5, 1, NULL, NULL),
(16, 5, 2, NULL, NULL),
(17, 5, 3, NULL, NULL),
(18, 5, 4, NULL, NULL),
(19, 6, 1, NULL, NULL),
(20, 6, 2, NULL, NULL),
(21, 6, 3, NULL, NULL),
(22, 7, 1, NULL, NULL),
(23, 7, 2, NULL, NULL),
(24, 7, 4, NULL, NULL),
(25, 8, 2, NULL, NULL),
(26, 8, 3, NULL, NULL),
(27, 8, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `discount` int(11) NOT NULL,
  `valid_until` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_12_09_081248_create_admins_table', 1),
(5, '2025_12_09_081317_create_colors_table', 1),
(6, '2025_12_09_081338_create_categories_table', 1),
(7, '2025_12_09_081357_create_sizes_table', 1),
(8, '2025_12_09_081500_create_brands_table', 1),
(9, '2025_12_09_081518_create_coupons_table', 1),
(10, '2025_12_09_081543_create_products_table', 1),
(11, '2025_12_09_081605_create_orders_table', 2),
(12, '2025_12_09_081623_create_reviews_table', 2),
(13, '2025_12_09_105709_create_order_product_table', 3),
(14, '2025_12_09_105756_create_color_product_table', 3),
(15, '2025_12_09_105825_create_product_size_table', 3),
(16, '2025_12_15_123540_create_personal_access_tokens_table', 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `delivered_at` datetime NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(9, 'App\\Models\\User', 3, 'new_user', 'af2ff2736eda219bddbed063d5d54096f9ab2ef8907f8badf0c10d6a3340c3d0', '[\"*\"]', '2026-01-04 17:03:07', NULL, '2026-01-04 15:41:22', '2026-01-04 17:03:07'),
(11, 'App\\Models\\User', 3, 'new_user', 'eee6d66a522e7b31fb0a64ab544d08c4273ce52b2a8ea20e1623a78bc46be275', '[\"*\"]', '2026-01-05 05:00:07', NULL, '2026-01-05 02:29:42', '2026-01-05 05:00:07');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `desc` longtext NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `first_image` varchar(255) DEFAULT NULL,
  `second_image` varchar(255) DEFAULT NULL,
  `third_image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `qty`, `price`, `desc`, `thumbnail`, `first_image`, `second_image`, `third_image`, `status`, `category_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'T-Shirt for Women', 't-shirt-for-women', 13, 133, '<p>Phasellus ac eros at urna condimentum lacinia. Donec et metus mollis, ultricies est at, ultricies nulla.</p>', 'storage/images/products/1766988576_woman-7979848_640.jpg', 'storage/images/products/1765794621_woman-7979848_640.jpg', 'storage/images/products/1765794621_woman-7979850_1280.jpg', 'storage/images/products/1765794621_tshirt-7979851_1280.jpg', 1, 1, 1, '2025-12-11 11:30:54', '2025-12-29 03:09:36'),
(2, 'T-Shirt for Men', 't-shirt-for-men', 33, 17, '<p>Praesent placerat, magna in vehicula vestibulum, felis urna cursus lorem, sed vestibulum quam eros vel libero. Nullam nec turpis et arcu egestas commodo. Curabitur lacinia nisl ut turpis convallis, at dictum urna aliquet. Nullam non urna eget felis interdum feugiat. Donec et urna vel risus feugiat pharetra.</p>', 'storage/images/products/1766988562_tshirt-7979852_640.jpg', 'storage/images/products/1766052653_unnamed (2).jpg', 'storage/images/products/1766052653_unnamed (4).jpg', 'storage/images/products/1766052653_tshirt-7979854_1280.jpg', 1, 2, 1, '2025-12-18 07:10:53', '2025-12-29 03:09:22'),
(3, 'Old Man Tshirt', 'old-man-tshirt', 12, 17, '<p>Praesent placerat, magna in vehicula vestibulum, felis urna cursus lorem, sed vestibulum quam eros vel libero. Nullam nec turpis et arcu egestas commodo. Curabitur lacinia nisl ut turpis convallis, at dictum urna aliquet. Nullam non urna eget felis interdum feugiat. Donec et urna vel risus feugiat pharetra.</p>', 'storage/images/products/1766988545_unnamed (5).jpg', 'storage/images/products/1766052739_unnamed (4).jpg', 'storage/images/products/1766052739_unnamed (5).jpg', 'storage/images/products/1766052739_unnamed (6).jpg', 1, 2, 1, '2025-12-18 07:12:19', '2025-12-29 03:09:05'),
(4, 'Nice Woman Tshirt', 'nice-woman-tshirt', 15, 12, '<p>Praesent placerat, magna in vehicula vestibulum, felis urna cursus lorem, sed vestibulum quam eros vel libero. Nullam nec turpis et arcu egestas commodo. Curabitur lacinia nisl ut turpis convallis, at dictum urna aliquet. Nullam non urna eget felis interdum feugiat. Donec et urna vel risus feugiat pharetra.</p>', 'storage/images/products/1766988527_tshirt-7979851_1280.jpg', 'storage/images/products/1766052794_woman-7979850_1280.jpg', 'storage/images/products/1766052794_tshirt-7979851_1280.jpg', 'storage/images/products/1766052794_woman-7979848_640.jpg', 1, 1, 4, '2025-12-18 07:13:14', '2025-12-29 03:08:47'),
(5, 'Nice Man Tshirt', 'nice-man-tshirt', 12, 12, '<p>Praesent placerat, magna in vehicula vestibulum, felis urna cursus lorem, sed vestibulum quam eros vel libero. Nullam nec turpis et arcu egestas commodo. Curabitur lacinia nisl ut turpis convallis, at dictum urna aliquet. Nullam non urna eget felis interdum feugiat. Donec et urna vel risus feugiat pharetra.</p>', 'storage/images/products/1766988514_unnamed.jpg', 'storage/images/products/1766052849_unnamed (2).jpg', 'storage/images/products/1766052849_unnamed (1).jpg', 'storage/images/products/1766052849_tshirt-7979852_640.jpg', 1, 2, 3, '2025-12-18 07:14:09', '2025-12-29 03:08:34'),
(6, 'Nice Kid Tshirt', 'nice-kid-tshirt', 12, 12, '<p>Praesent placerat, magna in vehicula vestibulum, felis urna cursus lorem, sed vestibulum quam eros vel libero. Nullam nec turpis et arcu egestas commodo. Curabitur lacinia nisl ut turpis convallis, at dictum urna aliquet. Nullam non urna eget felis interdum feugiat. Donec et urna vel risus feugiat pharetra.</p>', 'storage/images/products/1766988498_tshirt-7979854_1280.jpg', 'storage/images/products/1766052901_tshirt-7979854_1280.jpg', 'storage/images/products/1766052901_unnamed (2).jpg', 'storage/images/products/1766052901_unnamed (1).jpg', 1, 3, 2, '2025-12-18 07:15:01', '2025-12-29 03:08:18'),
(7, 'Kids Normal Tshirt', 'kids-normal-tshirt', 12, 12, '<p>Praesent placerat, magna in vehicula vestibulum, felis urna cursus lorem, sed vestibulum quam eros vel libero. Nullam nec turpis et arcu egestas commodo. Curabitur lacinia nisl ut turpis convallis, at dictum urna aliquet. Nullam non urna eget felis interdum feugiat. Donec et urna vel risus feugiat pharetra.</p>', 'storage/images/products/1766988483_unnamed (1).jpg', 'storage/images/products/1766052961_unnamed (2).jpg', 'storage/images/products/1766052961_tshirt-7979852_640.jpg', 'storage/images/products/1766052961_tshirt-7979854_1280.jpg', 0, 3, 1, '2025-12-18 07:16:01', '2025-12-29 03:08:03'),
(8, 'Nice Old Man Tshirt', 'nice-old-man-tshirt', 12, 12, '<p>Praesent placerat, magna in vehicula vestibulum, felis urna cursus lorem, sed vestibulum quam eros vel libero. Nullam nec turpis et arcu egestas commodo. Curabitur lacinia nisl ut turpis convallis, at dictum urna aliquet. Nullam non urna eget felis interdum feugiat. Donec et urna vel risus feugiat pharetra.</p>', 'storage/images/products/1767535625_o1.jpg', 'storage/images/products/1766053013_unnamed (3).jpg', 'storage/images/products/1766053013_unnamed (5).jpg', 'storage/images/products/1766053013_unnamed (4).jpg', 1, 2, 1, '2025-12-18 07:16:53', '2026-01-04 11:07:05');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product_size`
--

CREATE TABLE `product_size` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `product_size`
--

INSERT INTO `product_size` (`id`, `product_id`, `size_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 4, NULL, NULL),
(4, 1, 8, NULL, NULL),
(5, 2, 3, NULL, NULL),
(6, 2, 4, NULL, NULL),
(7, 2, 7, NULL, NULL),
(8, 2, 8, NULL, NULL),
(9, 3, 2, NULL, NULL),
(10, 3, 3, NULL, NULL),
(11, 3, 4, NULL, NULL),
(12, 3, 9, NULL, NULL),
(13, 4, 2, NULL, NULL),
(14, 4, 3, NULL, NULL),
(15, 4, 4, NULL, NULL),
(16, 5, 2, NULL, NULL),
(17, 5, 7, NULL, NULL),
(18, 5, 9, NULL, NULL),
(19, 6, 2, NULL, NULL),
(20, 6, 4, NULL, NULL),
(21, 6, 7, NULL, NULL),
(22, 6, 9, NULL, NULL),
(23, 7, 1, NULL, NULL),
(24, 7, 3, NULL, NULL),
(25, 7, 4, NULL, NULL),
(26, 8, 1, NULL, NULL),
(27, 8, 3, NULL, NULL),
(28, 8, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `rating` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `reviews`
--

INSERT INTO `reviews` (`id`, `title`, `body`, `rating`, `approved`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'Good Product222', 'Donec at magna ut nulla pharetra cursus. In hac habitasse platea dictumst. Donec non urna et erat vehicula porttitor. Nam tempor finibus lorem, nec 2222varius arcu convallis sed. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 5, 1, 3, 8, '2026-01-04 11:42:36', '2026-01-04 17:32:53');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('rGOzS5DmkBnBwnY1AQPgbTsxkjYbq24RUtkOBlKU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS25DT2xLazZ3ZVlWM255b1Z5MU5hNWt5bW9SSTJwczBVQmdHYlFUVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9kYXNoYm9hcmQiO3M6NToicm91dGUiO3M6MTE6ImFkbWluLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MjoibG9naW5fYWRtaW5fNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O30=', 1767594207),
('sL1xOfMUPBc64twJ5eV7EiJh7RedDZcCcdFK4yDn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFAwV0wyWWtCMWlkemVaQVFFUVRYNURNUlRqRGQ1RjZtUEFaem9aNyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czoxMToiYWRtaW4ubG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1767590706);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'XS', '2025-12-10 11:01:56', '2025-12-10 11:01:56'),
(2, 'XXS', '2025-12-10 11:02:08', '2025-12-10 11:02:08'),
(3, 'S', '2025-12-10 11:02:17', '2025-12-10 11:02:17'),
(4, 'M', '2025-12-10 11:02:26', '2025-12-10 11:02:26'),
(6, 'L', '2025-12-10 11:02:58', '2025-12-10 11:02:58'),
(7, 'XL', '2025-12-10 11:03:05', '2025-12-10 11:03:05'),
(8, 'XXL', '2025-12-10 11:03:13', '2025-12-10 11:03:13'),
(9, 'XXXL', '2025-12-10 11:03:22', '2025-12-10 11:03:22');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `profile_completed` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `address`, `city`, `country`, `zip_code`, `phone_number`, `profile_image`, `profile_completed`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'John Doe', 'johndoe@email.com', NULL, '$2y$12$dKlenwIQ23/jD4qpklkNiOq/rq8a5i.WoKNFLJBOx3vj76Ihv8b1i', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'New York', 'United States Of America', '32212', '1', 'storage/images/users/1767545736_o4.jpg', 1, NULL, '2025-12-28 17:34:03', '2026-01-04 13:55:36'),
(4, 'John Doe', 'johndoe2@email.com', NULL, '$2y$12$ZX78JutNSN9c.kApiasjFOmEpjJ76RW1FEKuWRE95T/AMLM71j0NC', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2026-01-04 14:12:42', '2026-01-04 14:12:42');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Tablo için indeksler `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Tablo için indeksler `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `color_product`
--
ALTER TABLE `color_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_product_product_id_foreign` (`product_id`),
  ADD KEY `color_product_color_id_foreign` (`color_id`);

--
-- Tablo için indeksler `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Tablo için indeksler `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Tablo için indeksler `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_coupon_id_foreign` (`coupon_id`);

--
-- Tablo için indeksler `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`);

--
-- Tablo için indeksler `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Tablo için indeksler `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Tablo için indeksler `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Tablo için indeksler `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_size_product_id_foreign` (`product_id`),
  ADD KEY `product_size_size_id_foreign` (`size_id`);

--
-- Tablo için indeksler `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Tablo için indeksler `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Tablo için indeksler `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `color_product`
--
ALTER TABLE `color_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Tablo için AUTO_INCREMENT değeri `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `product_size`
--
ALTER TABLE `product_size`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Tablo için AUTO_INCREMENT değeri `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `color_product`
--
ALTER TABLE `color_product`
  ADD CONSTRAINT `color_product_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `color_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `product_size`
--
ALTER TABLE `product_size`
  ADD CONSTRAINT `product_size_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_size_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

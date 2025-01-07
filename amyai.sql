-- -------------------------------------------------------------
-- TablePlus 6.2.1(578)
--
-- https://tableplus.com/
--
-- Database: magicai
-- Generation Time: 2024-12-24 20:25:55.8670
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `account_deletion_reqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_deletion_reqs_user_id_foreign` (`user_id`),
  CONSTRAINT `account_deletion_reqs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `activity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `activity_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_user_id_foreign` (`user_id`),
  CONSTRAINT `activity_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `advanced_features_section` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `advertis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_code` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ai_chat_model_plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int NOT NULL,
  `entity_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ai_chat_model_plans_entity_id_foreign` (`entity_id`),
  CONSTRAINT `ai_chat_model_plans_entity_id_foreign` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `app_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_settings_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `article_wizard` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic_keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_titles` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image_style` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image_count` int NOT NULL DEFAULT '0',
  `outline` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_outlines` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic_outline` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_step` int NOT NULL DEFAULT '0',
  `result` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `generated_count` int NOT NULL DEFAULT '0',
  `creativity` double(8,2) NOT NULL DEFAULT '0.50',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bad_words` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `words` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `banner_bottom_texts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `blogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `category` text COLLATE utf8mb4_unicode_ci,
  `tag` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blogs_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `chat_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `chatbot` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `chatbot_interests` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'not-trained',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `chatbot_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chatbot_id` bigint DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `chatbot_data_vectors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chatbot_id` bigint DEFAULT NULL,
  `chatbot_data_id` bigint DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `embedding` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `chatbot_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_openai_chat_id` int DEFAULT NULL,
  `openai_chat_category_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assets/img/auth/default-avatar.png',
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `industry` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `target_audience` text COLLATE utf8mb4_unicode_ci,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tagline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tone_of_voice` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_user_id_foreign` (`user_id`),
  CONSTRAINT `companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `comparison_section_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `others` tinyint(1) NOT NULL DEFAULT '0',
  `ours` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `coupon_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coupon_users_coupon_id_foreign` (`coupon_id`),
  KEY `coupon_users_user_id_foreign` (`user_id`),
  CONSTRAINT `coupon_users_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `coupon_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(5,2) NOT NULL,
  `limit` int DEFAULT NULL,
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coupons_created_by_foreign` (`created_by`),
  CONSTRAINT `coupons_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thousand_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `custom_biling_plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gateway` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_plan_price_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_plan_price_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `customsettings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_str` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_text` text COLLATE utf8mb4_unicode_ci,
  `value_longtext` longtext COLLATE utf8mb4_unicode_ci,
  `value_html` text COLLATE utf8mb4_unicode_ci,
  `value_int` int NOT NULL DEFAULT '0',
  `value_bigint` bigint DEFAULT NULL,
  `value_ubigint` bigint unsigned DEFAULT NULL,
  `value_double` double NOT NULL DEFAULT '0',
  `value_bool` tinyint(1) NOT NULL DEFAULT '0',
  `value_date` date DEFAULT NULL,
  `value_timestamp` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `domains` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_key` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chatbot_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domains_chatbot_id_domain_unique` (`chatbot_id`,`domain`),
  UNIQUE KEY `domains_uuid_unique` (`uuid`),
  KEY `domains_chatbot_id_index` (`chatbot_id`),
  CONSTRAINT `domains_chatbot_id_foreign` FOREIGN KEY (`chatbot_id`) REFERENCES `chatbot` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `elevenlab_voices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voice_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `email_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `engines` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `entities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `engine` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'openai',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `selected_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_selected` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'enabled',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `extensions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_theme` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `faq` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `favourite_list` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `features_marquees` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `folders_created_by_foreign` (`created_by`),
  CONSTRAINT `folders_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `footer_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `frontend_footer_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `header_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Limited Offer',
  `header_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sign up and receive 20% bonus discount on checkout.',
  `hero_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unleash the Power of AI',
  `hero_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Ultimate AI',
  `hero_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'All-in-one platform to generate AI content and start making money in minutes.',
  `hero_scroll_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Discover MagicAI',
  `hero_button` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Start Making Money',
  `hero_button_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hero_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/themes/dark/assets/landing-page/banner-img.jpg',
  `hero_button_type` int NOT NULL DEFAULT '1',
  `footer_header` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Start your free trial.',
  `footer_text_small` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pay once, own forever.',
  `footer_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unlock your business potential by letting the AI work and generate money for you.',
  `footer_button_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Join our community',
  `footer_button_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'https://codecanyon.net/item/magicai-openai-content-text-image-chat-code-generator-as-saas/45408109',
  `footer_copyright` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'All images are for demo purposes.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hero_title_text_rotator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Generator,Chatbot,Assistant',
  `sign_in` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sign In',
  `join_hub` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Join Hub',
  `floating_button_small_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floating_button_bold_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floating_button_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `floating_button_active` tinyint(1) NOT NULL DEFAULT '0',
  `footer_text_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `frontend_future` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `frontend_generators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_one` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle_two` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `frontend_sections_statuses_titles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `features_active` tinyint(1) NOT NULL DEFAULT '1',
  `features_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'The future of AI.',
  `features_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unleash the Power of AI',
  `features_description` text COLLATE utf8mb4_unicode_ci,
  `generators_active` tinyint(1) NOT NULL DEFAULT '1',
  `who_is_for_active` tinyint(1) NOT NULL DEFAULT '1',
  `custom_templates_active` tinyint(1) NOT NULL DEFAULT '1',
  `custom_templates_subtitle_one` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Custom',
  `custom_templates_subtitle_two` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Prompts',
  `custom_templates_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Custom Templates.',
  `custom_templates_learn_more_link_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#templates',
  `custom_templates_learn_more_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Discover MagicAI',
  `custom_templates_description` text COLLATE utf8mb4_unicode_ci,
  `tools_active` tinyint(1) NOT NULL DEFAULT '1',
  `tools_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Magic Tools.',
  `tools_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unleash the Power of AI',
  `tools_description` text COLLATE utf8mb4_unicode_ci,
  `how_it_works_active` tinyint(1) NOT NULL DEFAULT '1',
  `how_it_works_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'So, how does it work?',
  `how_it_works_link_label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Learn More',
  `how_it_works_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#',
  `how_it_works_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'To create content quickly and effectively, <strong>here are the steps you can follow:</strong>',
  `how_it_works_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unleash the Power of AI',
  `testimonials_active` tinyint(1) NOT NULL DEFAULT '1',
  `testimonials_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Trusted by millions.',
  `testimonials_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Content and <strong>kickstart your earnings</strong> in minutes  kickstart your earnings in minutes',
  `testimonials_subtitle_one` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Testimonials',
  `testimonials_subtitle_two` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Trustpilot',
  `pricing_active` tinyint(1) NOT NULL DEFAULT '1',
  `pricing_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Flexible Pricing.',
  `pricing_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Unleash the Power of AI',
  `pricing_description` text COLLATE utf8mb4_unicode_ci,
  `pricing_save_percent` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Save 30%',
  `faq_active` tinyint(1) NOT NULL DEFAULT '1',
  `faq_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Have a question?',
  `faq_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Our support team will get assistance from AI-powered suggestions, making it quicker than ever to handle support requests.',
  `faq_text_one` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'FAQ',
  `faq_text_two` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Help Center',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `preheader_active` tinyint(1) NOT NULL DEFAULT '1',
  `blog_active` tinyint(1) NOT NULL DEFAULT '0',
  `blog_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Latest News',
  `blog_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Stay up-to-date',
  `blog_posts_per_page` int NOT NULL DEFAULT '3',
  `blog_button_text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Show more',
  `blog_a_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Blog Posts',
  `blog_a_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Latest News',
  `blog_a_description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Welcome to our cozy corner of the internet, where you will find a delightful collection of our heartfelt and thought-provoking blog posts.',
  `blog_a_posts_per_page` int NOT NULL DEFAULT '6',
  `marquee_items` text COLLATE utf8mb4_unicode_ci,
  `generators_subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generators_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generators_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_footer_text` text COLLATE utf8mb4_unicode_ci,
  `advanced_features_section_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `advanced_features_section_description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `frontend_tools` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `buy_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Start Making Money',
  `buy_link_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'https://codecanyon.net/item/magicai-openai-content-text-image-chat-code-generator-as-saas/45408109',
  `learn_more_link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Discover MagicAI',
  `learn_more_link_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#templates',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `frontend_who_is_for` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `gateway_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gateway_id` int DEFAULT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `gatewayproducts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int NOT NULL DEFAULT '0',
  `plan_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `gateways` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT '0',
  `mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sandbox_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sandbox_client_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sandbox_app_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_client_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_client_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_app_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_action` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notify_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sandbox_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validate_ssl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webhook_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logger` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `webhook_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `bank_account_details` text COLLATE utf8mb4_unicode_ci,
  `bank_account_other` text COLLATE utf8mb4_unicode_ci,
  `country_tax_enabled` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `health_check_result_history_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `check_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `check_label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notification_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_summary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` json NOT NULL,
  `ended_at` timestamp NOT NULL,
  `batch` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `health_check_result_history_items_created_at_index` (`created_at`),
  KEY `health_check_result_history_items_batch_index` (`batch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `howitworks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order` int NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bg_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `integrations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `app` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `introductions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `intro` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `svg` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `params` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bolt_menu` tinyint(1) DEFAULT '0',
  `bolt_background` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bolt_foreground` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `letter_icon` tinyint(1) DEFAULT '0',
  `letter_icon_bg` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_menu` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `oldgatewayproducts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int NOT NULL DEFAULT '0',
  `plan_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_price_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_price_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `old_product_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `openai` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `questions` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `premium` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prompt` text COLLATE utf8mb4_unicode_ci,
  `custom_template` tinyint(1) NOT NULL DEFAULT '0',
  `tone_of_voice` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filters` text COLLATE utf8mb4_unicode_ci,
  `package` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `openai_chat_category` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `chatbot_id` bigint DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `first_message` text COLLATE utf8mb4_unicode_ci,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `human_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helps_with` text COLLATE utf8mb4_unicode_ci,
  `prompt_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `chat_completions` text COLLATE utf8mb4_unicode_ci,
  `plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assistant` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `openai_filters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `titlebar_status` tinyint NOT NULL DEFAULT '1',
  `is_custom` tinyint(1) NOT NULL DEFAULT '0',
  `show_on_footer` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `payment_proofs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` bigint unsigned NOT NULL,
  `total_amount` decimal(15,2) DEFAULT NULL,
  `proof_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_proofs_user_id_foreign` (`user_id`),
  KEY `payment_proofs_plan_id_foreign` (`plan_id`),
  CONSTRAINT `payment_proofs_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_proofs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `paystack_payment_infos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trxref` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paystack_payment_infos_user_id_foreign` (`user_id`),
  CONSTRAINT `paystack_payment_infos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `pdf_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vector` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `pebblely` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `photo_studios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci,
  `credits` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double NOT NULL DEFAULT '0',
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'monthly',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `stripe_product_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ai_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_tokens` bigint DEFAULT NULL,
  `can_create_ai_images` tinyint(1) DEFAULT NULL,
  `plan_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `features` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscription',
  `is_team_plan` tinyint(1) NOT NULL DEFAULT '0',
  `plan_allow_seat` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trial_days` int NOT NULL DEFAULT '0',
  `open_ai_items` json DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `plan_ai_tools` json NOT NULL,
  `plan_features` json NOT NULL,
  `default_ai_model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'gpt-3.5-turbo',
  `ai_models` json DEFAULT NULL,
  `hidden_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `max_subscribe` int DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `privacy_terms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int DEFAULT NULL,
  `key_features` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_user_id_foreign` (`user_id`),
  KEY `products_company_id_foreign` (`company_id`),
  CONSTRAINT `products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `prompt_library` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prompt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `rate_limits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `revenuecat_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` bigint unsigned DEFAULT NULL,
  `gatewayproduct_id` bigint unsigned DEFAULT NULL,
  `entitlement_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `package_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apple_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amazon_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revenuecat_products_plan_id_foreign` (`plan_id`),
  KEY `revenuecat_products_gatewayproduct_id_foreign` (`gatewayproduct_id`),
  CONSTRAINT `revenuecat_products_gatewayproduct_id_foreign` FOREIGN KEY (`gatewayproduct_id`) REFERENCES `gatewayproducts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `revenuecat_products_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_postal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_vat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2',
  `tax_rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_active` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `stripe_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_base_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'https://api.stripe.com',
  `bank_transfer_active` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `bank_transfer_instructions` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_transfer_informations` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'MagicAI',
  `site_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'https://liquid-themes.com',
  `site_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_analytics_active` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `google_analytics_code` text COLLATE utf8mb4_unicode_ci,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'magicAI-logo.svg',
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `facebook_active` tinyint(1) NOT NULL DEFAULT '0',
  `facebook_api_key` text COLLATE utf8mb4_unicode_ci,
  `facebook_api_secret` text COLLATE utf8mb4_unicode_ci,
  `facebook_redirect_url` text COLLATE utf8mb4_unicode_ci,
  `github_active` tinyint(1) NOT NULL DEFAULT '0',
  `github_api_key` text COLLATE utf8mb4_unicode_ci,
  `github_api_secret` text COLLATE utf8mb4_unicode_ci,
  `github_redirect_url` text COLLATE utf8mb4_unicode_ci,
  `google_active` tinyint(1) NOT NULL DEFAULT '0',
  `google_api_key` text COLLATE utf8mb4_unicode_ci,
  `google_api_secret` text COLLATE utf8mb4_unicode_ci,
  `google_redirect_url` text COLLATE utf8mb4_unicode_ci,
  `twitter_active` tinyint(1) NOT NULL DEFAULT '0',
  `twitter_api_key` text COLLATE utf8mb4_unicode_ci,
  `twitter_api_secret` text COLLATE utf8mb4_unicode_ci,
  `twitter_redirect_url` text COLLATE utf8mb4_unicode_ci,
  `register_active` tinyint(1) NOT NULL DEFAULT '1',
  `default_country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'United States',
  `smtp_host` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_sender_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_encryption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'TLS',
  `openai_api_secret` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `logo_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assets/img/logo/magicAI-logo.svg',
  `favicon_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `openai_default_model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gpt-3.5-turbo',
  `openai_default_language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en-US',
  `openai_default_tone_of_voice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'professional',
  `openai_default_creativity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.75',
  `openai_max_input_length` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '300',
  `openai_max_output_length` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '200',
  `affiliate_minimum_withdrawal` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '10',
  `affiliate_commission_percentage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '10',
  `frontend_pricing_section` tinyint(1) NOT NULL DEFAULT '1',
  `frontend_custom_templates_section` tinyint(1) NOT NULL DEFAULT '1',
  `frontend_business_partners_section` tinyint(1) NOT NULL DEFAULT '1',
  `frontend_additional_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_custom_js` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_custom_css` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_footer_facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_footer_twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `frontend_footer_instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script_version` double NOT NULL DEFAULT '7.4',
  `logo_collapsed` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'magicAI-logo-Collapsed.png',
  `logo_collapsed_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assets/img/logo/magicAI-logo-Collapsed.png',
  `stripe_status_for_now` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'disabled',
  `logo_dark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'magicAI-logo-dark.svg',
  `logo_dashboard` text COLLATE utf8mb4_unicode_ci,
  `logo_dashboard_dark` text COLLATE utf8mb4_unicode_ci,
  `logo_collapsed_dark` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'magicAI-logo-collapsed-dark.svg',
  `logo_2x` text COLLATE utf8mb4_unicode_ci,
  `logo_dark_2x` text COLLATE utf8mb4_unicode_ci,
  `logo_dashboard_2x` text COLLATE utf8mb4_unicode_ci,
  `logo_dashboard_dark_2x` text COLLATE utf8mb4_unicode_ci,
  `logo_collapsed_2x` text COLLATE utf8mb4_unicode_ci,
  `logo_collapsed_dark_2x` text COLLATE utf8mb4_unicode_ci,
  `logo_dark_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assets/img/logo/magicAI-logo-dark.svg',
  `logo_dashboard_path` text COLLATE utf8mb4_unicode_ci,
  `logo_dashboard_dark_path` text COLLATE utf8mb4_unicode_ci,
  `logo_collapsed_dark_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assets/img/logo/magicAI-logo-collapsed-dark.svg',
  `logo_2x_path` text COLLATE utf8mb4_unicode_ci,
  `logo_dark_2x_path` text COLLATE utf8mb4_unicode_ci,
  `logo_dashboard_2x_path` text COLLATE utf8mb4_unicode_ci,
  `logo_dashboard_dark_2x_path` text COLLATE utf8mb4_unicode_ci,
  `logo_collapsed_2x_path` text COLLATE utf8mb4_unicode_ci,
  `logo_collapsed_dark_2x_path` text COLLATE utf8mb4_unicode_ci,
  `feature_ai_writer` tinyint(1) NOT NULL DEFAULT '1',
  `feature_ai_image` tinyint(1) NOT NULL DEFAULT '1',
  `feature_ai_chat` tinyint(1) NOT NULL DEFAULT '1',
  `feature_ai_code` tinyint(1) NOT NULL DEFAULT '1',
  `feature_ai_voice_clone` tinyint(1) NOT NULL DEFAULT '0',
  `feature_ai_speech_to_text` tinyint(1) NOT NULL DEFAULT '1',
  `feature_affilates` tinyint(1) NOT NULL DEFAULT '1',
  `logo_sticky` text COLLATE utf8mb4_unicode_ci,
  `logo_sticky_path` text COLLATE utf8mb4_unicode_ci,
  `logo_sticky_2x` text COLLATE utf8mb4_unicode_ci,
  `logo_sticky_2x_path` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `gdpr_status` tinyint(1) NOT NULL DEFAULT '0',
  `gdpr_button` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Accept',
  `gdpr_content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'This website uses cookies to improve your web experience.',
  `menu_options` text COLLATE utf8mb4_unicode_ci,
  `privacy_enable` tinyint(1) NOT NULL DEFAULT '0',
  `privacy_enable_login` tinyint(1) NOT NULL DEFAULT '0',
  `privacy_content` text COLLATE utf8mb4_unicode_ci,
  `terms_content` text COLLATE utf8mb4_unicode_ci,
  `login_without_confirmation` tinyint(1) NOT NULL DEFAULT '1',
  `feature_ai_voiceover` tinyint(1) DEFAULT '1',
  `gcs_file` text COLLATE utf8mb4_unicode_ci,
  `gcs_name` text COLLATE utf8mb4_unicode_ci,
  `frontend_code_before_head` text COLLATE utf8mb4_unicode_ci,
  `frontend_code_before_body` text COLLATE utf8mb4_unicode_ci,
  `dashboard_code_before_head` text COLLATE utf8mb4_unicode_ci,
  `dashboard_code_before_body` text COLLATE utf8mb4_unicode_ci,
  `feature_ai_article_wizard` tinyint NOT NULL DEFAULT '1',
  `feature_ai_vision` tinyint NOT NULL DEFAULT '1',
  `feature_ai_pdf` tinyint NOT NULL DEFAULT '1',
  `feature_ai_chat_image` tinyint NOT NULL DEFAULT '1',
  `mobile_payment_active` tinyint(1) NOT NULL DEFAULT '0',
  `feature_ai_rewriter` tinyint NOT NULL DEFAULT '1',
  `feature_ai_youtube` tinyint NOT NULL DEFAULT '1',
  `feature_ai_rss` tinyint NOT NULL DEFAULT '1',
  `team_functionality` tinyint(1) NOT NULL DEFAULT '0',
  `feature_ai_advanced_editor` tinyint(1) NOT NULL DEFAULT '1',
  `user_count` int NOT NULL DEFAULT '0',
  `free_open_ai_items` json DEFAULT NULL,
  `user_api_option` tinyint NOT NULL DEFAULT '0',
  `auth_view_options` text COLLATE utf8mb4_unicode_ci,
  `tour_seen` tinyint(1) NOT NULL DEFAULT '0',
  `recaptcha_login` tinyint(1) NOT NULL DEFAULT '0',
  `recaptcha_register` tinyint(1) NOT NULL DEFAULT '0',
  `recaptcha_sitekey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recaptcha_secretkey` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_with_otp` tinyint(1) NOT NULL DEFAULT '0',
  `synthesia_secret_key` text COLLATE utf8mb4_unicode_ci,
  `pebblely_key` text COLLATE utf8mb4_unicode_ci,
  `mrrobot_name` text COLLATE utf8mb4_unicode_ci,
  `mrrobot_search_words` text COLLATE utf8mb4_unicode_ci,
  `x_logo` text COLLATE utf8mb4_unicode_ci,
  `xx_logo` text COLLATE utf8mb4_unicode_ci,
  `heygen_secret_key` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `settings_two` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `stable_diffusion_api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stable_diffusion_default_model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_recaptcha_status` tinyint(1) NOT NULL DEFAULT '0',
  `google_recaptcha_site_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_recaptcha_secret_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `languages` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `languages_default` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `liquid_license_type` text COLLATE utf8mb4_unicode_ci,
  `liquid_license_domain_key` text COLLATE utf8mb4_unicode_ci,
  `openai_default_stream_server` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'backend',
  `ai_image_storage` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `stablediffusion_default_language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en-US',
  `stablediffusion_default_model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stable-diffusion-xl-1024-v1-0',
  `unsplash_api_key` text COLLATE utf8mb4_unicode_ci,
  `dalle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'dall-e-3',
  `daily_limit_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_images_count` int NOT NULL DEFAULT '2',
  `daily_voice_limit_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_voice_count` int NOT NULL DEFAULT '1',
  `serper_api_key` text COLLATE utf8mb4_unicode_ci,
  `elevenlabs_api_key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_tts_google` tinyint(1) NOT NULL DEFAULT '0',
  `feature_tts_openai` tinyint(1) NOT NULL DEFAULT '1',
  `feature_tts_elevenlabs` tinyint(1) NOT NULL DEFAULT '0',
  `fine_tune_list` json DEFAULT NULL,
  `chatbot_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'disabled',
  `chatbot_template` int DEFAULT NULL,
  `chatbot_position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'bottom-left',
  `chatbot_login_require` tinyint NOT NULL DEFAULT '1',
  `chatbot_rate_limit` int DEFAULT '10',
  `feature_ai_video` tinyint(1) NOT NULL DEFAULT '1',
  `chatbot_show_timestamp` tinyint(1) NOT NULL DEFAULT '0',
  `stablediffusion_bedrock_model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stability.stable-diffusion-xl-v1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `share_links` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat` int NOT NULL,
  `message` int NOT NULL,
  `time` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `social_media_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` longtext COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_media_accounts_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `subscription_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint unsigned NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `subscriptions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `plan_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `paid_with` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `tax_rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_renewal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  KEY `subscriptions_plan_id_foreign` (`plan_id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`),
  CONSTRAINT `subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `subscriptions_yokassa` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `plan_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `next_pay_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_renewal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `subscriptions_yokassa_plan_id_foreign` (`plan_id`),
  KEY `subscriptions_yokassa_user_id_subscription_status_index` (`user_id`,`subscription_status`),
  CONSTRAINT `subscriptions_yokassa_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `team_members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'waiting',
  `allow_unlimited_credits` tinyint(1) NOT NULL DEFAULT '1',
  `remaining_images` decimal(15,2) DEFAULT NULL,
  `remaining_words` decimal(15,2) DEFAULT NULL,
  `used_image_credit` int NOT NULL DEFAULT '0',
  `used_word_credit` int NOT NULL DEFAULT '0',
  `joined_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_members_team_id_foreign` (`team_id`),
  KEY `team_members_user_id_foreign` (`user_id`),
  CONSTRAINT `team_members_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `team_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_seats` int NOT NULL DEFAULT '0',
  `used_image_credit` int NOT NULL DEFAULT '0',
  `word_credit` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_user_id_foreign` (`user_id`),
  CONSTRAINT `teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `telescope_entries` (
  `sequence` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_family_hash_index` (`family_hash`),
  KEY `telescope_entries_created_at_index` (`created_at`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `telescope_monitoring` (
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assets/img/auth/default-avatar.png',
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `words` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'word',
  `entity_id` bigint unsigned NOT NULL,
  `cost_per_token` decimal(15,2) NOT NULL DEFAULT '1.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tokens_entity_id_foreign` (`entity_id`),
  CONSTRAINT `tokens_entity_id_foreign` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `usage` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `total_user_count` int unsigned NOT NULL DEFAULT '0',
  `this_week_user_count` int unsigned NOT NULL DEFAULT '0',
  `last_week_user_count` int unsigned NOT NULL DEFAULT '0',
  `total_word_count` int unsigned NOT NULL DEFAULT '0',
  `this_week_word_count` int unsigned NOT NULL DEFAULT '0',
  `last_week_word_count` int unsigned NOT NULL DEFAULT '0',
  `total_image_count` int unsigned NOT NULL DEFAULT '0',
  `this_week_image_count` int unsigned NOT NULL DEFAULT '0',
  `last_week_image_count` int unsigned NOT NULL DEFAULT '0',
  `total_sales` int unsigned NOT NULL DEFAULT '0',
  `this_week_sales` int unsigned NOT NULL DEFAULT '0',
  `last_week_sales` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_affiliates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Waiting',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_affiliates_user_id_foreign` (`user_id`),
  CONSTRAINT `user_affiliates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_credits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `credits` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_docs_favorite` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `user_openai_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_docs_favorite_user_id_foreign` (`user_id`),
  KEY `user_docs_favorite_user_openai_id_foreign` (`user_openai_id`),
  CONSTRAINT `user_docs_favorite_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_docs_favorite_user_openai_id_foreign` FOREIGN KEY (`user_openai_id`) REFERENCES `user_openai` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_favorites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `openai_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_favorites_user_id_foreign` (`user_id`),
  KEY `user_favorites_openai_id_foreign` (`openai_id`),
  CONSTRAINT `user_favorites_openai_id_foreign` FOREIGN KEY (`openai_id`) REFERENCES `openai` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_integrations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `integration_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `credentials` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_openai` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `request_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` bigint DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `openai_id` bigint unsigned DEFAULT NULL,
  `input` text COLLATE utf8mb4_unicode_ci,
  `response` text COLLATE utf8mb4_unicode_ci,
  `output` text COLLATE utf8mb4_unicode_ci,
  `hash` text COLLATE utf8mb4_unicode_ci,
  `credits` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `words` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned DEFAULT NULL,
  `payload` json DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'COMPLETED',
  PRIMARY KEY (`id`),
  KEY `user_openai_openai_id_foreign` (`openai_id`),
  KEY `user_openai_folder_id_foreign` (`folder_id`),
  KEY `user_openai_user_id_updated_at_index` (`user_id`,`updated_at` DESC),
  CONSTRAINT `user_openai_folder_id_foreign` FOREIGN KEY (`folder_id`) REFERENCES `folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_openai_openai_id_foreign` FOREIGN KEY (`openai_id`) REFERENCES `openai` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_openai_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_openai_chat` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `chatbot_id` bigint DEFAULT NULL,
  `openai_chat_category_id` bigint unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_credits` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_words` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_chatbot` tinyint NOT NULL DEFAULT '0',
  `website_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `reference_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `doc_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `thread_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_openai_chat_user_id_foreign` (`user_id`),
  KEY `user_openai_chat_openai_chat_category_id_foreign` (`openai_chat_category_id`),
  CONSTRAINT `user_openai_chat_openai_chat_category_id_foreign` FOREIGN KEY (`openai_chat_category_id`) REFERENCES `openai_chat_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_openai_chat_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_openai_chat_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_openai_chat_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `input` text COLLATE utf8mb4_unicode_ci,
  `response` text COLLATE utf8mb4_unicode_ci,
  `output` text COLLATE utf8mb4_unicode_ci,
  `hash` text COLLATE utf8mb4_unicode_ci,
  `credits` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `words` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `pdfName` text COLLATE utf8mb4_unicode_ci,
  `pdfPath` text COLLATE utf8mb4_unicode_ci,
  `outputImage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realtime` tinyint(1) NOT NULL DEFAULT '0',
  `is_chatbot` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_openai_chat_messages_user_openai_chat_id_foreign` (`user_openai_chat_id`),
  KEY `user_openai_chat_messages_user_id_foreign` (`user_id`),
  CONSTRAINT `user_openai_chat_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_openai_chat_messages_user_openai_chat_id_foreign` FOREIGN KEY (`user_openai_chat_id`) REFERENCES `user_openai_chat` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_id` bigint unsigned DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Waiting',
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'United States of America',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscription',
  `affiliate_earnings` double NOT NULL DEFAULT '0',
  `tax_rate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_orders_plan_id_foreign` (`plan_id`),
  KEY `user_orders_user_id_foreign` (`user_id`),
  CONSTRAINT `user_orders_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE SET NULL,
  CONSTRAINT `user_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_support` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Waiting for answer',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ticket_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Low',
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_support_user_id_foreign` (`user_id`),
  CONSTRAINT `user_support_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_support_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_support_id` bigint unsigned DEFAULT NULL,
  `sender` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_support_messages_user_support_id_foreign` (`user_support_id`),
  CONSTRAINT `user_support_messages_user_support_id_foreign` FOREIGN KEY (`user_support_id`) REFERENCES `user_support` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `entity_credits` json DEFAULT NULL,
  `coingate_subscriber_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `team_id` bigint unsigned DEFAULT NULL,
  `team_manager_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(1055) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assets/img/auth/default-avatar.png',
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remaining_words` decimal(15,2) DEFAULT '0.00',
  `remaining_images` decimal(15,2) DEFAULT '0.00',
  `last_seen` date DEFAULT NULL,
  `github_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_token` text COLLATE utf8mb4_unicode_ci,
  `google_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_token` text COLLATE utf8mb4_unicode_ci,
  `facebook_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_token` text COLLATE utf8mb4_unicode_ci,
  `twitter_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google2fa_secret` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pm_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `affiliate_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliate_earnings` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `affiliate_bank_account` text COLLATE utf8mb4_unicode_ci,
  `affiliate_id` bigint unsigned DEFAULT NULL,
  `email_confirmation_code` text COLLATE utf8mb4_unicode_ci,
  `email_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `password_reset_code` text COLLATE utf8mb4_unicode_ci,
  `github_refresh_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_refresh_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iyzico_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revenuecat_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apple_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apple_token` text COLLATE utf8mb4_unicode_ci,
  `apple_refresh_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razorpay_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_keys` text COLLATE utf8mb4_unicode_ci,
  `gemini_api_keys` text COLLATE utf8mb4_unicode_ci,
  `anthropic_api_keys` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `defi_setting` text COLLATE utf8mb4_unicode_ci,
  `affiliate_status` tinyint DEFAULT '1',
  `tour_seen` tinyint(1) NOT NULL DEFAULT '0',
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dash_notify_seen` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_stripe_id_index` (`stripe_id`),
  KEY `users_affiliate_id_foreign` (`affiliate_id`),
  KEY `users_razorpay_id_index` (`razorpay_id`),
  CONSTRAINT `users_affiliate_id_foreign` FOREIGN KEY (`affiliate_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users_activity` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `webhookhistory` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gatewaycode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `webhook_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_payment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_total` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `incoming_json` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `ads` (`id`, `type`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'landing-header-section', '', 0, '2023-08-30 13:10:37', '2023-08-30 13:10:37'),
(2, 'landing-features-section-728x90', '', 0, '2023-08-30 13:10:37', '2023-08-30 13:10:37'),
(3, 'landing-templates-section-728x90', '', 0, '2023-08-30 13:10:37', '2023-08-30 13:10:37'),
(4, 'landing-tools-section-728x90', '', 0, '2023-08-30 13:10:37', '2023-08-30 13:10:37'),
(5, 'landing-how-it-works-section-728x90', '', 0, '2023-08-30 13:10:37', '2023-08-30 13:10:37'),
(6, 'landing-testimonials-section-728x90', '', 0, '2023-08-30 13:10:37', '2023-08-30 13:10:37'),
(7, 'landing-pricing-section-728x90', '', 0, '2023-08-30 13:10:37', '2023-08-30 13:10:37'),
(8, 'landing-faq-section-728x90', '', 0, '2023-08-30 13:10:37', '2023-08-30 13:10:37');

INSERT INTO `advanced_features_section` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Article Wizard', 'Create a social media post and schedule it to be published directly on Linkedin or X.', '/themes/default/assets/landing-page/advanced-feature-1.png', NULL, NULL),
(2, 'Intelligent AI Assistant', 'Create a social media post and schedule it to be published directly on Linkedin or X.', '/themes/default/assets/landing-page/advanced-feature-1.png', NULL, NULL),
(3, 'Publish on Social Media', 'Create a social media post and schedule it to be published directly on Linkedin or X.', '/themes/default/assets/landing-page/advanced-feature-1.png', NULL, NULL),
(4, 'SEO Tool', 'Create a social media post and schedule it to be published directly on Linkedin or X.', '/themes/default/assets/landing-page/advanced-feature-1.png', NULL, NULL),
(5, 'Real-Time Data', 'Create a social media post and schedule it to be published directly on Linkedin or X.', '/themes/default/assets/landing-page/advanced-feature-1.png', NULL, NULL),
(6, 'AI Photo Editor', 'Create a social media post and schedule it to be published directly on Linkedin or X.', '/themes/default/assets/landing-page/advanced-feature-1.png', NULL, NULL);

INSERT INTO `app_settings` (`id`, `key`, `value`) VALUES
(1, 'front_theme', 'default'),
(2, 'dash_theme', 'default');

INSERT INTO `banner_bottom_texts` (`id`, `text`, `created_at`, `updated_at`) VALUES
(1, 'No Credit Card Required', NULL, NULL),
(2, 'Free Trial', NULL, NULL),
(3, '30 Day Money Back Guarentee', NULL, NULL);

INSERT INTO `chatbot` (`id`, `user_id`, `title`, `role`, `model`, `first_message`, `instructions`, `chatbot_interests`, `image`, `color`, `width`, `height`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Default', 'Support', 'gpt-3.5-turbo-16k', 'I am AI Assistant. How can I help you?', 'Your name is John Doe. Remember that you are an assistant who only gives information about wordpress and don\'t give any other information.', NULL, NULL, NULL, NULL, NULL, 'not-trained', NULL, NULL);

INSERT INTO `clients` (`id`, `avatar`, `alt`, `title`, `created_at`, `updated_at`) VALUES
(1, '1c.svg', 'Envato', 'Envato', '2023-06-02 17:09:35', '2023-06-02 17:09:35'),
(2, '2c.svg', 'Envato', 'Envato', '2023-06-02 17:09:35', '2023-06-02 17:09:35'),
(3, '4c.svg', 'Envato', 'Envato', '2023-06-02 17:09:35', '2023-06-02 17:09:35'),
(4, '5c.svg', 'Envato', 'Envato', '2023-06-02 17:09:35', '2023-06-02 17:09:35'),
(5, '6c.svg', 'Envato', 'Envato', '2023-06-02 17:09:35', '2023-06-02 17:09:35');

INSERT INTO `comparison_section_items` (`id`, `label`, `others`, `ours`, `created_at`, `updated_at`) VALUES
(1, 'Multiple AI Tools', 0, 1, NULL, NULL),
(2, 'Custom Templates and Chatbot Personas', 0, 1, NULL, NULL),
(3, 'All-in-one Platform', 0, 1, NULL, NULL),
(4, 'Knows Your Brand', 0, 1, NULL, NULL),
(5, 'Intelligent AI Assistant', 0, 1, NULL, NULL),
(6, 'PrePaid', 0, 1, NULL, NULL),
(7, 'Lifetime Access', 0, 1, NULL, NULL);

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.'),
(2, 'America', 'Dollars', 'USD', '$', ',', '.'),
(3, 'Afghanistan', 'Afghanis', 'AFN', '؋', ',', '.'),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.'),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.'),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.'),
(7, 'Azerbaijan', 'New Manats', 'AZN', 'ман', ',', '.'),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.'),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.'),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.'),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.'),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.'),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.'),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.'),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.'),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.'),
(17, 'Bulgaria', 'Leva', 'BGN', 'лв', ',', '.'),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.'),
(19, 'Britain (United Kingdom)', 'Pounds', 'GBP', '£', ',', '.'),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.'),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.'),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.'),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.'),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.'),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.'),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.'),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.'),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.'),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.'),
(30, 'Cyprus', 'Euro', 'EUR', '€', ',', '.'),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.'),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.'),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.'),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.'),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.'),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.'),
(37, 'England (United Kingdom)', 'Pounds', 'GBP', '£', ',', '.'),
(38, 'Euro', 'Euro', 'EUR', '€', ',', '.'),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.'),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.'),
(41, 'France', 'Euro', 'EUR', '€', ',', '.'),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.'),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.'),
(44, 'Greece', 'Euro', 'EUR', '€', ',', '.'),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.'),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.'),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.'),
(48, 'Holland (Netherlands)', 'Euro', 'EUR', '€', ',', '.'),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.'),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.'),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.'),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.'),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.'),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.'),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.'),
(56, 'Ireland', 'Euro', 'EUR', '€', ',', '.'),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.'),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.'),
(59, 'Italy', 'Euro', 'EUR', '€', ',', '.'),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.'),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.'),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.'),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.'),
(64, 'Korea (North)', 'Won', 'KPW', '₩', ',', '.'),
(65, 'Korea (South)', 'Won', 'KRW', '₩', ',', '.'),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.'),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.'),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.'),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.'),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.'),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.'),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.'),
(73, 'Luxembourg', 'Euro', 'EUR', '€', ',', '.'),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.'),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.'),
(76, 'Malta', 'Euro', 'EUR', '€', ',', '.'),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.'),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.'),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.'),
(80, 'Mozambique', 'Meticais', 'MZN', 'MT', ',', '.'),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.'),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.'),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.'),
(84, 'Netherlands', 'Euro', 'EUR', '€', ',', '.'),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.'),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.'),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.'),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.'),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.'),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.'),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.'),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.'),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.'),
(94, 'Peru', 'Nuevos Soles', 'PEN', 'S/.', ',', '.'),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.'),
(96, 'Poland', 'Zlotych', 'PLN', 'zł', ',', '.'),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.'),
(98, 'Romania', 'New Lei', 'RON', 'lei', ',', '.'),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.'),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.'),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.'),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.'),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.'),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.'),
(105, 'Slovenia', 'Euro', 'EUR', '€', ',', '.'),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.'),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.'),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.'),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.'),
(110, 'Spain', 'Euro', 'EUR', '€', ',', '.'),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.'),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.'),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.'),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.'),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.'),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.'),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.'),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.'),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.'),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.'),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.'),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.'),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.'),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.'),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.'),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.'),
(127, 'Vatican City', 'Euro', 'EUR', '€', ',', '.'),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.'),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.'),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.'),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.'),
(132, 'West African CFA franc', 'Francs', 'XOF', 'CFA', ',', '.');

INSERT INTO `email_templates` (`id`, `system`, `title`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'Confirmation', 'Confirmation Email', '<div style=\"padding: 0 19px\">\r\n    <h1>Hello, {user_name}!</h1>\r\n    <h2>Welcome to {site_name}!</h2>\r\n\r\n    <p>We are pleased to inform you that your {site_name} account has been successfully created. </p>\r\n    <p>Our platform offers a wide range of features and services to help you achieve your goals.</p>\r\n    <p>You can use {site_name} for: </p>\r\n    <p>\r\n    <ul>\r\n        <li>Copywriting</li>\r\n        <li>Images</li>\r\n        <li>ChatBot</li>\r\n        <li>Speech to Text</li>\r\n        <li>Coding</li>\r\n    </ul>\r\n    </p>\r\n    <p>Thank you for choosing {site_name} as your partner in achieving your goals. We look forward to working with you and helping you succeed.</p>\r\n</div>\r\n\r\n<br>\r\n\r\n<a href=\"{user_activation_url}\" class=\"btn btn-lg btn-block btn-round\">\r\n    Confirm My Account\r\n</a>\r\n\r\n<p class=\"need-help-p\">Need help? <a href=\"{site_url}\">Contact us.</a></p>', NULL, '2023-06-23 15:34:21'),
(2, 1, 'Invite', 'Invite Email', '<div style=\"padding: 0 19px\">\r\n    <h1>You are Invited! Congrats!</h1>\r\n    <h1>{site_name}</h1>\r\n    <p>Hey,</p>\r\n    <p>We’re excited to invite you to join {site_name}. It is designed to help businesses and individuals leverage the power of artificial intelligence to generate any kind of content easily.</p>\r\n    <p>You can use {site_name} for: </p>\r\n    <p>\r\n    <ul>\r\n        <li>Copywriting</li>\r\n        <li>Images</li>\r\n        <li>ChatBot</li>\r\n        <li>Speech to Text</li>\r\n        <li>Coding</li>\r\n    </ul>\r\n    </p>\r\n    <p>Once you have created your account, you can start exploring the platform and see for yourself how it can benefit you.</p>\r\n    <p>Thank you for considering this invitation. I look forward to seeing you on {site_name}.</p>\r\n</div>\r\n\r\n<br>\r\n\r\n<a href=\"{affiliate_url}\" class=\"btn btn-lg btn-block btn-round\">\r\n    Discover {site_name}\r\n</a>\r\n\r\n<p class=\"need-help-p\">Need help? <a href=\"{site_url}\">Contact us.</a></p>', NULL, '2023-07-14 17:29:47'),
(3, 1, 'Password Reset', 'Password Reset', '<div style=\"padding: 0 19px\">\r\n    <h1>Password Reset</h1>\r\n    <p>Hey,</p>\r\n    <p>We noticed that you recently requested to reset your password. To ensure the security of your account, we have reset your password for you.</p>\r\n    <p>Sincerely,</p>\r\n    <p>{site_name}</p>\r\n</div>\r\n\r\n<br>\r\n\r\n<a href=\"{reset_url}\" class=\"btn btn-lg btn-block btn-round\">\r\n    Reset Password\r\n</a>\r\n\r\n<p class=\"need-help-p\">Need help? <a href=\"{site_url}\">Contact us.</a></p>', NULL, '2023-06-23 15:38:48'),
(4, 1, 'Team Invite', 'Team Invite Email', '<div style=\"padding: 0 19px\">\n    <h1>You are Invited! Congrats!</h1>\n    <h1>{site_name}</h1>\n    <p>Hey,</p>\n    <p>We’re excited to invite you to join {site_name}. It is designed to help businesses and individuals leverage the power of artificial intelligence to generate any kind of content easily.</p>\n    <p>You can use {site_name} for: </p>\n    <p>\n    <ul>\n        <li>Copywriting</li>\n        <li>Images</li>\n        <li>ChatBot</li>\n        <li>Speech to Text</li>\n        <li>Coding</li>\n    </ul>\n    </p>\n    <p>Once you have created your account, you can start exploring the platform and see for yourself how it can benefit you.</p>\n    <p>Thank you for considering this invitation. I look forward to seeing you on {site_name}.</p>\n</div>\n\n<br>\n\n<a href=\"{register_url}\" class=\"btn btn-lg btn-block btn-round\">\n    Discover {site_name}\n</a>\n\n<p class=\"need-help-p\">Need help? <a href=\"{site_url}\">Contact us.</a></p>', NULL, '2024-02-06 10:37:15');

INSERT INTO `engines` (`id`, `key`, `status`, `created_at`, `updated_at`) VALUES
(1, 'openai', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(2, 'stable_diffusion', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(3, 'anthropic', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(4, 'gemini', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(5, 'unsplash', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(6, 'pexels', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(7, 'pixabay', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(8, 'elevenlabs', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(9, 'google', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(10, 'azure', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(11, 'serper', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(12, 'clipdrop', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(13, 'plagiarism_check', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(14, 'synthesia', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(15, 'heygen', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(16, 'pebblely', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(17, 'fal_ai', 'enabled', '2024-12-24 17:25:27', '2024-12-24 17:25:27');

INSERT INTO `entities` (`id`, `key`, `title`, `engine`, `created_at`, `updated_at`, `selected_title`, `is_selected`, `status`) VALUES
(1, 'claude-3-5-sonnet-20240620', 'Claude 3.5 Sonnet', 'anthropic', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Claude 3.5 Sonnet', 0, 'enabled'),
(2, 'claude-3-sonnet-20240229', 'Claude 3 Sonnet', 'anthropic', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Claude 3 Sonnet', 0, 'enabled'),
(3, 'claude-3-opus-20240229', 'Claude 3 Opus', 'anthropic', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Claude 3 Opus', 0, 'enabled'),
(4, 'claude-3-haiku-20240307', 'Claude 3 Haiku', 'anthropic', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Claude 3 Haiku', 0, 'enabled'),
(5, 'claude-2.1', 'Claude 2.1', 'anthropic', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Claude 2.1', 0, 'enabled'),
(6, 'claude-2.0', 'Claude 2', 'anthropic', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Claude 2', 0, 'enabled'),
(7, 'voyage-2', 'Voyage 2', 'anthropic', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Voyage 2', 0, 'enabled'),
(8, 'voyage-large-2', 'Voyage Large 2', 'anthropic', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Voyage Large 2', 0, 'enabled'),
(9, 'voyage-code-2', 'Voyage Code 2', 'anthropic', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Voyage Code 2', 0, 'enabled'),
(10, 'davinci-002', 'Davinci 002 (Expensive &amp; Capable)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Davinci 002 (Expensive &amp; Capable)', 0, 'enabled'),
(11, 'text-davinci-003', 'Davinci 003 (Expensive &amp; Capable)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Davinci 003 (Expensive &amp; Capable)', 0, 'enabled'),
(12, 'gpt-3.5-turbo-16k', 'GTP (3.5-turbo-16k)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'GTP (3.5-turbo-16k)', 0, 'enabled'),
(13, 'gpt-3.5-turbo', 'GPT 3.5-turbo (Most Expensive & Fastest & Most Capable)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'GPT 3.5-turbo (Most Expensive & Fastest & Most Capable)', 0, 'enabled'),
(14, 'gpt-3.5-turbo-0125', 'GTP 3.5-turbo-0125 (Updated Knowleddge cutoff of Sep 2021, 16k)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'GTP 3.5-turbo-0125 (Updated Knowleddge cutoff of Sep 2021, 16k)', 0, 'enabled'),
(15, 'gpt-3.5-turbo-1106', 'GTP 3.5-turbo-1106 (Updated Knowleddge cutoff of Nov 2021, 16k)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'GTP 3.5-turbo-1106 (Updated Knowleddge cutoff of Nov 2021, 16k)', 0, 'enabled'),
(16, 'gpt-4', 'GPT-4 (Most Expensive & Fastest & Most Capable)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'GPT-4 (Most Expensive & Fastest & Most Capable)', 0, 'enabled'),
(17, 'gpt-4-turbo', 'GPT-4 Turbo (Most Expensive & Fastest & Most Capable)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'GPT-4 Turbo (Most Expensive & Fastest & Most Capable)', 0, 'enabled'),
(18, 'gpt-4-1106-preview', 'GPT-4-1106 Turbo (Updated Knowleddge cutoff of April 2023, 128k)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'GPT-4-1106 Turbo (Updated Knowleddge cutoff of April 2023, 128k)', 0, 'enabled'),
(19, 'gpt-4-0125-preview', 'GPT-4-0125 Turbo (Updated Knowleddge cutoff of Dec 2023, 128k)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'GPT-4-0125 Turbo (Updated Knowleddge cutoff of Dec 2023, 128k)', 0, 'enabled'),
(20, 'gpt-4-vision-preview', 'GPT-4 Turbo with vision (Understand images, in addition to all other GPT-4 Turbo capabilites)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'GPT-4 Turbo with vision (Understand images, in addition to all other GPT-4 Turbo capabilites)', 0, 'enabled'),
(21, 'gpt-4o', 'GPT-4o Most advanced, multimodal flagship model that’s cheaper and faster than GPT-4 Turbo.  (Updated Knowleddge cutoff of Oct 2023, 128k)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'GPT-4o Most advanced, multimodal flagship model that’s cheaper and faster than GPT-4 Turbo.  (Updated Knowleddge cutoff of Oct 2023, 128k)', 0, 'enabled'),
(22, 'gpt-4o-mini', 'GPT-4o mini Our affordable and intelligent small model for fast, lightweight tasks. GPT-4o mini is cheaper and more capable than GPT-3.5 Turbo.', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'GPT-4o mini Our affordable and intelligent small model for fast, lightweight tasks. GPT-4o mini is cheaper and more capable than GPT-3.5 Turbo.', 0, 'enabled'),
(23, 'o1-preview', 'GPT o1-preview (Updated Knowledge cutoff of Dec 2023, 128k)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'GPT o1-preview (Updated Knowledge cutoff of Dec 2023, 128k)', 0, 'enabled'),
(24, 'o1-mini', 'GPT o1-mini (Updated Knowledge cutoff of Dec 2023, 128k)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'GPT o1-mini (Updated Knowledge cutoff of Dec 2023, 128k)', 0, 'enabled'),
(25, 'text-embedding-ada-002', 'Text Embedding Ada (Expensive &amp; Capable)', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Text Embedding Ada (Expensive &amp; Capable)', 0, 'enabled'),
(26, 'text-embedding-3-small', 'Text Embedding Small', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Text Embedding Small', 0, 'enabled'),
(27, 'text-embedding-3-large', 'Text Embedding Large', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Text Embedding Large', 0, 'enabled'),
(28, 'image-to-video', 'AI Video', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'AI Video', 0, 'enabled'),
(29, 'stable-diffusion-xl-1024-v1-0', 'Stable Diffusion XL 1.0', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Stable Diffusion XL 1.0', 0, 'enabled'),
(30, 'stable-diffusion-v1-6', 'Stable Diffusion 1.6', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Stable Diffusion 1.6', 0, 'enabled'),
(31, 'sd3', 'Stable Diffusion 3', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Stable Diffusion 3', 0, 'enabled'),
(32, 'sd3-turbo', 'Stable Diffusion 3 turbo', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Stable Diffusion 3 turbo', 0, 'enabled'),
(33, 'sd3-medium', 'Stable Diffusion 3 Medium', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Stable Diffusion 3 Medium', 0, 'enabled'),
(34, 'sd3-large', 'Stable Diffusion 3 Large', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Stable Diffusion 3 Large', 0, 'enabled'),
(35, 'sd3-large-turbo', 'Stable Diffusion 3 Large Turbo', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Stable Diffusion 3 Large Turbo', 0, 'enabled'),
(36, 'sd3.5-large', 'Stable Diffusion 3.5 Large', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Stable Diffusion 3.5 Large', 0, 'enabled'),
(37, 'sd3.5-large-turbo', 'Stable Diffusion 3.5 Large Turbo', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Stable Diffusion 3.5 Large Turbo', 0, 'enabled'),
(38, 'sd3.5-medium', 'Stable Diffusion 3.5 Medium', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Stable Diffusion 3.5 Medium', 0, 'enabled'),
(39, 'core', 'Core', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Core', 0, 'enabled'),
(40, 'ultra', 'Ultra', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Ultra', 0, 'enabled'),
(41, 'aws_bedrock', 'AWS Bedrock', 'stable_diffusion', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'AWS Bedrock', 0, 'enabled'),
(42, 'clipdrop', 'Clipdrop for Photo Studio', 'clipdrop', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Clipdrop for Photo Studio', 0, 'enabled'),
(43, 'plagiarismcheck', 'Plagiarism Check', 'plagiarism_check', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Plagiarism Check', 0, 'enabled'),
(44, 'synthesia', 'Synthesia', 'synthesia', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Synthesia', 0, 'enabled'),
(45, 'heygen', 'Heygen', 'heygen', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Heygen', 0, 'enabled'),
(46, 'pebblely', 'Pebblely', 'pebblely', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Pebblely', 0, 'enabled'),
(47, 'text-embedding-004', 'Gemini Text Embeding 004', 'gemini', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Gemini Text Embeding 004', 0, 'enabled'),
(48, 'gemini-1.5-pro-latest', 'Gemini 1.5 Pro (Preview only) (Model last updated: April 2024)', 'gemini', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Gemini 1.5 Pro (Preview only) (Model last updated: April 2024)', 0, 'enabled'),
(49, 'gemini-pro', 'Gemini 1.0 Pro (Model last updated: February 2024)', 'gemini', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Gemini 1.0 Pro (Model last updated: February 2024)', 0, 'enabled'),
(50, 'gemini-1.5-flash', 'Gemini 1.0 Pro Vision (Model last updated: February 2023)', 'gemini', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Gemini 1.0 Pro Vision (Model last updated: February 2023)', 0, 'enabled'),
(51, 'gemini-pro-vision', 'Gemini Pro Vision', 'gemini', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Gemini Pro Vision', 0, 'enabled'),
(52, 'unsplash', 'Unsplash for AI Article Wizard', 'unsplash', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Unsplash for AI Article Wizard', 0, 'enabled'),
(53, 'pexels', 'Pexels for AI Article Wizard', 'pexels', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Pexels for AI Article Wizard', 0, 'enabled'),
(54, 'pixabay', 'Pixabay for AI Article Wizard', 'pixabay', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Pixabay for AI Article Wizard', 0, 'enabled'),
(55, 'elevenlabs', 'Elevenlabs for TTS', 'elevenlabs', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Elevenlabs for TTS', 0, 'enabled'),
(56, 'isolator', 'Voice Isolator (1 word = 5 used characters of elevenlabs) X 1 token', 'elevenlabs', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Voice Isolator (1 word = 5 used characters of elevenlabs) X 1 token', 0, 'enabled'),
(57, 'google', 'Google for TTS', 'google', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Google for TTS', 0, 'enabled'),
(58, 'azure', 'Azure for TTS', 'azure', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Azure for TTS', 0, 'enabled'),
(59, 'serper', 'Serper for Realtime Data', 'serper', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Serper for Realtime Data', 0, 'enabled'),
(60, 'whisper-1', 'WHISPER 1 The latest text to speech model, optimized for speed.', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'WHISPER 1 The latest text to speech model, optimized for speed.', 0, 'enabled'),
(61, 'dall-e-2', 'DALL-E 2 The previous DALL·E model released in Nov 2022.', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'DALL-E 2 The previous DALL·E model released in Nov 2022.', 0, 'enabled'),
(62, 'dall-e-3', 'DALL-E 3 The latest DALL·E model released in Nov 2023.', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'DALL-E 3 The latest DALL·E model released in Nov 2023.', 0, 'enabled'),
(63, 'tts-1', 'TTS 1 The latest text to speech model, optimized for speed.', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'TTS 1 The latest text to speech model, optimized for speed.', 0, 'enabled'),
(64, 'tts-1-hd', 'TTS 1 HD The latest text to speech model, optimized for quality.', 'openai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'TTS 1 HD The latest text to speech model, optimized for quality.', 0, 'enabled'),
(65, 'flux-pro', 'Flux Pro', 'fal_ai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Flux Pro', 0, 'enabled'),
(66, 'flux-pro/v1.1', 'Flux Pro 1.1', 'fal_ai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Flux Pro 1.1', 0, 'enabled'),
(67, 'flux-realism', 'Flux Realism', 'fal_ai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Flux Realism', 0, 'enabled'),
(68, 'flux/schnell', 'Flux Schnell', 'fal_ai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Flux Schnell', 0, 'enabled'),
(69, 'kling', 'Kling 1.0', 'fal_ai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Kling 1.0', 0, 'enabled'),
(70, 'luma-dream-machine', 'Luma Dream Machine', 'fal_ai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Luma Dream Machine', 0, 'enabled'),
(71, 'haiper', 'Haiper', 'fal_ai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Haiper', 0, 'enabled'),
(72, 'minimax', 'Minimax', 'fal_ai', '2024-12-24 17:25:27', '2024-12-24 17:25:28', 'Minimax', 0, 'enabled');

INSERT INTO `faq` (`id`, `question`, `answer`, `image`, `created_at`, `updated_at`) VALUES
(1, 'How does it generate responses?', 'MagicAI uses the most popular AI models such as GPT, Dall-E, Ada to create text, image, code and more within seconds. The process is simple. All you have to do is provide a topic or idea, and our AI-based generator will take care of the rest.', NULL, '2023-06-02 12:14:35', '2023-06-02 12:14:35'),
(2, 'Can I create templates or chat bots?', 'You can use pre-made templates and examples for various content types and industries to help you get started quickly. You can even create your own chatbot or custom prompt template for further customization.', NULL, '2023-06-02 12:15:43', '2023-06-02 12:15:43'),
(3, 'Should I buy regular or extended license?', 'If you plan to charge end users for the final product or service, you should buy the extended license in compliance with Envato’s terms of service, same as other projects: https://codecanyon.net/licenses/standard', NULL, '2023-06-02 12:16:02', '2023-06-02 12:16:02'),
(4, 'Can I translate the script into another language?', 'Yes! MagicAI\'s multilingual capabilities apply to both content generation and dashboard language. You can easily translate it into other languages. A built-in translation tool is coming soon!', NULL, '2023-06-02 12:16:25', '2023-06-02 12:16:25'),
(5, 'Is there a mobile app for MagicAI?', 'MagicAI provides an almost native-app experience thanks to its mobile-first approach. The entire layout is responsive and works great on any device regardless of the size.', NULL, '2023-06-02 12:16:53', '2023-06-02 12:16:53');

INSERT INTO `features_marquees` (`id`, `title`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Designed for mobile', 'top', NULL, NULL),
(2, 'Easy to use', 'top', NULL, NULL),
(3, 'Customizable', 'top', NULL, NULL),
(4, 'No coding required', 'top', NULL, NULL),
(5, '10 Reasons to use MagicAI', 'bottom', NULL, NULL),
(6, 'No sign up required', 'bottom', NULL, NULL),
(7, 'No watermarks', 'bottom', NULL, NULL),
(8, 'No hidden fees', 'bottom', NULL, NULL);

INSERT INTO `footer_items` (`id`, `item`, `created_at`, `updated_at`) VALUES
(1, 'Premium Support 30-Day', NULL, NULL),
(2, 'Money Back Guarantee', NULL, NULL),
(3, 'Instant Access', NULL, NULL),
(4, 'Free Trial', NULL, NULL),
(5, 'Lifetime Updates', NULL, NULL);

INSERT INTO `frontend_footer_settings` (`id`, `header_title`, `header_text`, `hero_subtitle`, `hero_title`, `hero_description`, `hero_scroll_text`, `hero_button`, `hero_button_url`, `hero_image`, `hero_button_type`, `footer_header`, `footer_text_small`, `footer_text`, `footer_button_text`, `footer_button_url`, `footer_copyright`, `created_at`, `updated_at`, `hero_title_text_rotator`, `sign_in`, `join_hub`, `floating_button_small_text`, `floating_button_bold_text`, `floating_button_link`, `floating_button_active`, `footer_text_color`) VALUES
(1, 'Limited Offer', 'Sign up and receive 20% bonus discount on checkout.', 'Unleash the Power of AI', 'Ultimate AI', 'All-in-one platform to generate AI content and start making money in minutes.', 'Discover MagicAI', 'Start Making Money', NULL, '/themes/dark/assets/landing-page/banner-img.jpg', 1, 'Start your free trial.', 'Pay once, own forever.', 'Unlock your business potential by letting the AI work and generate money for you.', 'Join our community', 'https://codecanyon.net/item/magicai-openai-content-text-image-chat-code-generator-as-saas/45408109', 'All images are for demo purposes.', '2024-12-24 17:25:27', '2024-12-24 17:25:27', 'Generator,Chatbot,Assistant', 'Sign In', 'Join Hub', NULL, NULL, NULL, 0, NULL);

INSERT INTO `frontend_future` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'AI Generator', 'Generate <strong>text, image, code, chat</strong> and even more with', ' <svg width=\"20\" height=\"21\" viewBox=\"0 0 20 21\" fill=\"none\" stroke=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n                                <path d=\"M2.333 14.204L14.571 1.966C15.0509 1.48609 15.7018 1.21648 16.3805 1.21648C16.7166 1.21648 17.0493 1.28267 17.3598 1.41127C17.6703 1.53988 17.9524 1.72837 18.19 1.966C18.4276 2.20363 18.6161 2.48573 18.7447 2.79621C18.8733 3.10668 18.9395 3.43944 18.9395 3.7755C18.9395 4.11156 18.8733 4.44432 18.7447 4.75479C18.6161 5.06527 18.4276 5.34737 18.19 5.585L5.952 17.823C5.6728 18.1022 5.31719 18.2926 4.93 18.37L1 19.156L1.786 15.226C1.86345 14.8388 2.05378 14.4832 2.333 14.204Z\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M12.5 4.656L15.5 7.656\" stroke-width=\"2\"/>\n                            </svg>', '2023-06-02 15:32:56', '2023-06-02 15:32:56'),
(2, 'Advanced Dashboard', 'Access to valuable user insight, analytics and activity.', '  <svg width=\"16\" height=\"18\" viewBox=\"0 0 16 18\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n                                <path d=\"M3.46 13.838H5.19V3.46H3.46V13.838ZM6.92 17.298H8.65V0H6.92V17.298ZM0 10.379H1.73V6.919H0V10.379ZM10.379 13.839H12.109V3.46H10.379V13.839ZM13.839 6.92V10.38H15.569V6.92H13.839Z\"/>\n                            </svg>', '2023-06-02 15:32:56', '2023-06-02 15:32:56'),
(3, 'Payment Gateways', 'Securely process credit card, debit card, or other methods.', ' <svg width=\"19\" height=\"19\" viewBox=\"0 0 19 19\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n                                <path d=\"M3.421 -6.80448e-08L3.267 0.643L0.231 14.636L0 15.636H4.013L3.524 17.925L3.293 18.925H9.029L9.158 18.256L10.007 14.295H12.219C13.7458 14.318 15.2324 13.8059 16.4212 12.8475C17.6099 11.8891 18.4257 10.5449 18.727 9.048C18.9117 8.34466 18.9335 7.60848 18.7909 6.89542C18.6483 6.18237 18.345 5.51122 17.904 4.933C17.2726 4.18389 16.4149 3.66026 15.46 3.441C15.303 2.67914 14.9378 1.97574 14.405 1.409C13.9537 0.955562 13.416 0.597241 12.8237 0.355227C12.2315 0.113213 11.5967 -0.00757721 10.957 -6.80448e-08H3.421ZM4.758 1.646H10.958C11.8009 1.63923 12.613 1.96222 13.221 2.546C13.563 2.92723 13.7979 3.39222 13.9019 3.89369C14.0059 4.39516 13.9752 4.91523 13.813 5.401C13.6186 6.54221 13.0154 7.57362 12.116 8.30255C11.2167 9.03148 10.0827 9.40808 8.926 9.362H5.376L5.25 10.006L4.401 13.993H2.058L4.758 1.646ZM6.841 2.855L6.687 3.498L5.839 7.3L5.608 8.3H8.515C9.23308 8.28426 9.92567 8.0308 10.4843 7.57932C11.0429 7.12783 11.436 6.50381 11.602 5.805H11.628C11.628 5.789 11.628 5.77 11.628 5.754C11.7218 5.41549 11.7405 5.06056 11.6828 4.71406C11.6252 4.36756 11.4924 4.03785 11.294 3.748C11.0809 3.46596 10.8048 3.23768 10.4878 3.0814C10.1707 2.92513 9.82147 2.8452 9.468 2.848L6.841 2.855ZM8.15 4.5H9.462C9.55438 4.48894 9.64804 4.50213 9.73378 4.53824C9.81952 4.57436 9.89438 4.63218 9.951 4.706C10.0148 4.80392 10.055 4.91532 10.0683 5.03143C10.0817 5.14753 10.0679 5.26515 10.028 5.375V5.4C9.92453 5.73467 9.72591 6.032 9.45637 6.25573C9.18682 6.47947 8.858 6.61993 8.51 6.66H7.661L8.15 4.5ZM15.506 5.22C15.9416 5.37924 16.3307 5.64457 16.638 5.992C16.9265 6.37171 17.1192 6.81536 17.1998 7.28537C17.2804 7.75537 17.2465 8.23787 17.101 8.692C16.9066 9.83321 16.3034 10.8646 15.404 11.5935C14.5047 12.3225 13.3707 12.6991 12.214 12.653H8.664L8.535 13.296L7.686 17.283H5.35L5.71 15.637H5.736L5.865 14.968L6.714 11.007H8.926C10.4528 11.03 11.9394 10.5179 13.1282 9.55954C14.3169 8.60115 15.1327 7.25692 15.434 5.76C15.472 5.575 15.488 5.4 15.51 5.221L15.506 5.22Z\"/>\n                            </svg>', '2023-06-02 15:32:56', '2023-06-02 15:32:56'),
(4, 'Multi-Lingual', 'Ability to understand and generate content in different languages', ' <svg width=\"22\" height=\"22\" viewBox=\"0 0 22 22\" fill=\"none\" stroke=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n                                <path d=\"M10.85 20.85C16.3728 20.85 20.85 16.3728 20.85 10.85C20.85 5.32715 16.3728 0.85 10.85 0.85C5.32715 0.85 0.85 5.32715 0.85 10.85C0.85 16.3728 5.32715 20.85 10.85 20.85Z\" stroke-width=\"1.7\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M6.85 10.85C6.85 16.3728 8.64086 20.85 10.85 20.85C13.0591 20.85 14.85 16.3728 14.85 10.85C14.85 5.32715 13.0591 0.85 10.85 0.85C8.64086 0.85 6.85 5.32715 6.85 10.85Z\" stroke-width=\"1.7\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                                <path d=\"M0.85 10.85H20.85\" stroke-width=\"1.7\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                            </svg>', '2023-06-02 15:32:56', '2023-06-02 15:32:56'),
(5, 'Custom Templates', 'Add unlimited number of custom prompts for your customers.', '  <svg width=\"19\" height=\"16\" viewBox=\"0 0 19 16\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n                                <path d=\"M14.84 6.509H7.29C6.571 6.509 6.509 7.091 6.509 7.809C6.509 8.527 6.571 9.109 7.29 9.109H14.84C15.559 9.109 15.621 8.527 15.621 7.809C15.621 7.091 15.558 6.509 14.84 6.509ZM17.44 13.018H7.29C6.571 13.018 6.509 13.6 6.509 14.318C6.509 15.036 6.571 15.618 7.29 15.618H17.443C18.162 15.618 18.224 15.036 18.224 14.318C18.224 13.6 18.162 13.018 17.443 13.018H17.44ZM7.29 2.6H17.443C18.162 2.6 18.224 2.018 18.224 1.3C18.224 0.582 18.162 0 17.443 0H7.29C6.571 0 6.509 0.582 6.509 1.3C6.509 2.018 6.571 2.6 7.29 2.6ZM3.124 6.509H0.781C0.0619999 6.509 0 7.091 0 7.809C0 8.527 0.0619999 9.109 0.781 9.109H3.124C3.843 9.109 3.905 8.527 3.905 7.809C3.905 7.091 3.843 6.509 3.124 6.509ZM3.124 13.018H0.781C0.0619999 13.018 0 13.6 0 14.318C0 15.036 0.0619999 15.618 0.781 15.618H3.124C3.843 15.618 3.905 15.036 3.905 14.318C3.905 13.6 3.843 13.018 3.124 13.018ZM3.124 0H0.781C0.0619999 0 0 0.582 0 1.3C0 2.018 0.0619999 2.6 0.781 2.6H3.124C3.843 2.6 3.905 2.018 3.905 1.3C3.905 0.582 3.843 0 3.124 0Z\"/>\n                            </svg>', '2023-06-02 15:32:56', '2023-06-02 15:32:56'),
(6, 'Support Platform', 'Access and manage your support tickets from your dashboard.', '<svg width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\">\n                                <path d=\"M9.217 1.068L9.635 7.968M13.818 7.968L14.236 1.068M9.217 22.191L9.635 15.291M13.818 15.291L14.236 22.191M22.287 9.121L15.387 9.539M15.387 13.722L22.287 14.14M1.164 9.121L8.064 9.539M8.064 13.722L1.164 14.14M22.85 11.85C22.85 17.9251 17.9251 22.85 11.85 22.85C5.77487 22.85 0.849998 17.9251 0.849998 11.85C0.849998 5.77487 5.77487 0.849998 11.85 0.849998C17.9251 0.849998 22.85 5.77487 22.85 11.85ZM15.85 11.85C15.85 14.0591 14.0591 15.85 11.85 15.85C9.64086 15.85 7.85 14.0591 7.85 11.85C7.85 9.64086 9.64086 7.85 11.85 7.85C14.0591 7.85 15.85 9.64086 15.85 11.85Z\" stroke-width=\"1.7\" stroke-linecap=\"round\" stroke-linejoin=\"round\"/>\n                            </svg>', '2023-06-02 15:32:56', '2023-06-02 15:32:56');

INSERT INTO `frontend_generators` (`id`, `menu_title`, `subtitle_one`, `subtitle_two`, `title`, `text`, `image`, `image_title`, `image_subtitle`, `color`, `created_at`, `updated_at`, `icon`) VALUES
(1, 'AI Text Generator', 'Say goodbye to writer\'s block', 'AI', 'Intelligent Writing Assistant', 'Writer is designed to help you <strong>generate high-quality texts instantly</strong>, without breaking a sweat. With our intuitive interface and powerful features, you can easily edit, export, or publish your AI-generated result.', 'assets/img/site/text-generator.jpg', 'Generate, edit, export.', 'Powered by OpenAI.', '#EADDF9', '2023-06-02 15:33:09', '2023-06-02 15:33:09', NULL),
(2, 'AI Image Generator', 'Unleash your creativity', 'AI', 'Create eye-catching images and graphics.', 'Generate high-quality images for a wide range of applications.', 'assets/img/site/image-generator.jpg', 'Imagine, Generate, Publish.', 'Powered by Dall-E.', '#DFE5EB', '2023-06-02 15:33:09', '2023-06-02 15:33:09', NULL),
(3, 'AI Code Generator', 'The future of development', 'AI', 'Generate high-quality code in no time.', 'MagicAI is designed to make coding faster, easier, and more efficient than ever before. Whether you’re a seasoned developer or a coding newbie, our tool will help you streamline your coding process and get your projects up and running in no time.', 'assets/img/site/code-generator.jpg', 'Fix. Improve. Generate.', 'Powered by OpenAI.', '#DDE6FF', '2023-06-02 15:33:09', '2023-06-02 15:33:09', NULL),
(4, 'AI Chat Bot', 'Intuitive / Humanlike Chatbot', 'AI', 'Meet your next virtual assistant.', 'Get instant answers to your questions, no matter the topic. Whether you’re looking to book a reservation, get product recommendations, or just chat about the weather, MagicAI is always ready and willing to help.', 'assets/img/site/ai-chat.jpg', 'Chat, Solve, Repeat.', 'Powered by OpenAI.', '#F9DDDF', '2023-06-02 15:33:09', '2023-06-02 15:33:09', NULL),
(5, 'AI Speech To Text', 'Say goodbye to writer\'s block', 'AI', 'Transcribe your speech into text.', 'Accurately transcribe your recordings in just minutes. With our user-friendly interface, you can upload your files and have them transcribed in a matter of clicks.', 'assets/img/site/ai-speech.jpg', 'Upload, Analyze, Generate.', 'Powered by OpenAI.', '#FFF8EB', '2023-06-02 15:33:09', '2023-06-02 15:33:09', NULL),
(6, 'Empower Your Message with AI', 'Say goodbye to writer\'s block', 'AI', 'Transcribe your speech into text.', 'From captivating commercials to engaging narrations, our AI voice will bring your words to life. With its seamless delivery, natural intonation, and unrivaled versatility, our AI VoiceOver is the perfect choice for any project. Effortlessly choose from a variety of voices and languages while adjusting the pace to your preference.', 'assets/img/site/voiceover.jpg', 'Upload, Analyze, Generate.', 'Powered by OpenAI.', '#FFF8EB', '2023-06-02 15:33:09', '2023-06-02 15:33:09', NULL);

INSERT INTO `frontend_sections_statuses_titles` (`id`, `features_active`, `features_title`, `features_subtitle`, `features_description`, `generators_active`, `who_is_for_active`, `custom_templates_active`, `custom_templates_subtitle_one`, `custom_templates_subtitle_two`, `custom_templates_title`, `custom_templates_learn_more_link_url`, `custom_templates_learn_more_link`, `custom_templates_description`, `tools_active`, `tools_title`, `tools_subtitle`, `tools_description`, `how_it_works_active`, `how_it_works_title`, `how_it_works_link_label`, `how_it_works_link`, `how_it_works_description`, `how_it_works_subtitle`, `testimonials_active`, `testimonials_title`, `testimonials_description`, `testimonials_subtitle_one`, `testimonials_subtitle_two`, `pricing_active`, `pricing_title`, `pricing_subtitle`, `pricing_description`, `pricing_save_percent`, `faq_active`, `faq_title`, `faq_subtitle`, `faq_text_one`, `faq_text_two`, `created_at`, `updated_at`, `preheader_active`, `blog_active`, `blog_title`, `blog_subtitle`, `blog_posts_per_page`, `blog_button_text`, `blog_a_title`, `blog_a_subtitle`, `blog_a_description`, `blog_a_posts_per_page`, `marquee_items`, `generators_subtitle`, `generators_title`, `generators_description`, `plan_footer_text`, `advanced_features_section_title`, `advanced_features_section_description`) VALUES
(1, 1, 'The future of AI.', 'Unleash the Power of AI', NULL, 1, 1, 1, 'Custom', 'Prompts', 'Custom Templates.', '#templates', 'Discover MagicAI', NULL, 1, 'Magic Tools.', 'Unleash the Power of AI', NULL, 1, 'So, how does it work?', 'Learn More', '#', 'To create content quickly and effectively, <strong>here are the steps you can follow:</strong>', 'Unleash the Power of AI', 1, 'Trusted by millions.', 'Content and <strong>kickstart your earnings</strong> in minutes  kickstart your earnings in minutes', 'Testimonials', 'Trustpilot', 1, 'Flexible Pricing.', 'Unleash the Power of AI', NULL, 'Save 30%', 1, 'Have a question?', 'Our support team will get assistance from AI-powered suggestions, making it quicker than ever to handle support requests.', 'FAQ', 'Help Center', '2024-12-24 17:25:28', '2024-12-24 17:25:28', 1, 0, 'Latest News', 'Stay up-to-date', 3, 'Show more', 'Blog Posts', 'Latest News', 'Welcome to our cozy corner of the internet, where you will find a delightful collection of our heartfelt and thought-provoking blog posts.', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `frontend_tools` (`id`, `title`, `description`, `image`, `created_at`, `updated_at`, `buy_link`, `buy_link_url`, `learn_more_link`, `learn_more_link_url`) VALUES
(1, 'Advanced Dashboard', 'Track a wide range of data points, including user traffic and sales.', 'upload/images/frontent/tools/v6sP-test.png', '2023-05-29 14:18:13', '2023-05-29 14:18:31', 'Start Making Money', 'https://codecanyon.net/item/magicai-openai-content-text-image-chat-code-generator-as-saas/45408109', 'Discover MagicAI', '#templates'),
(2, 'Payment Gateways', 'Securely process credit card or other electronic payment methods.', 'upload/images/frontent/tools/Payments100.jpg', '2023-05-29 14:19:49', '2023-05-29 14:19:49', 'Start Making Money', 'https://codecanyon.net/item/magicai-openai-content-text-image-chat-code-generator-as-saas/45408109', 'Discover MagicAI', '#templates'),
(3, 'Multilingual', 'Ability to understand and generate content in different languages.', 'upload/images/frontent/tools/NZBW-multilingual.png', '2023-05-29 14:20:18', '2023-05-29 14:20:18', 'Start Making Money', 'https://codecanyon.net/item/magicai-openai-content-text-image-chat-code-generator-as-saas/45408109', 'Discover MagicAI', '#templates'),
(4, 'Affiliate System', 'Ability to invite friends, and earn commission from their first purchase.', 'upload/images/frontent/tools/RAhq-affiliate-system.png', '2023-05-29 14:20:49', '2023-05-29 14:20:49', 'Start Making Money', 'https://codecanyon.net/item/magicai-openai-content-text-image-chat-code-generator-as-saas/45408109', 'Discover MagicAI', '#templates'),
(5, 'Easy Export', 'Export generated content as plain text, PDF, Word or HTML easily.', 'upload/images/frontent/tools/mPWB-easy-export.png', '2023-05-29 14:21:05', '2023-05-29 14:21:05', 'Start Making Money', 'https://codecanyon.net/item/magicai-openai-content-text-image-chat-code-generator-as-saas/45408109', 'Discover MagicAI', '#templates'),
(6, 'Support Platform', 'Access and mage support tickets from your dashboard.', 'upload/images/frontent/tools/rIwa-support-platform.png', '2023-05-29 14:21:21', '2023-05-29 14:21:21', 'Start Making Money', 'https://codecanyon.net/item/magicai-openai-content-text-image-chat-code-generator-as-saas/45408109', 'Discover MagicAI', '#templates');

INSERT INTO `frontend_who_is_for` (`id`, `title`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Digital Agencies', 'orange', '2023-06-02 13:16:34', '2023-06-02 10:38:34'),
(2, 'Product Designers', 'purple', '2023-06-02 13:16:34', '2023-06-02 13:16:34'),
(3, 'Enterpreneurs', 'teal', '2023-06-02 13:16:34', '2023-06-02 13:16:34'),
(4, 'Copywriters', 'blue', '2023-06-02 13:16:34', '2023-06-02 13:16:34'),
(5, 'Digital Marketers', 'green', '2023-06-02 13:16:34', '2023-06-02 13:16:34'),
(6, 'Developers', 'red', '2023-06-02 13:16:34', '2023-06-02 13:16:34');

INSERT INTO `howitworks` (`id`, `order`, `title`, `created_at`, `updated_at`, `bg_color`, `bg_image`, `text_color`, `image`, `description`) VALUES
(1, 1, 'Simply explain what your content is about and adjust settings according to your needs.', '2023-06-02 08:41:26', '2023-06-02 08:41:26', NULL, NULL, NULL, NULL, NULL),
(2, 2, 'Simply input some basic information or keywords about your brand or product, and let our AI algorithms do the rest.', '2023-06-02 08:41:34', '2023-06-02 08:41:34', NULL, NULL, NULL, NULL, NULL),
(3, 3, 'View, edit or export your result with a few clicks. And you’re done!', '2023-06-02 08:41:41', '2023-06-02 08:41:41', NULL, NULL, NULL, NULL, NULL);

INSERT INTO `integrations` (`id`, `app`, `description`, `image`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Wordpress', 'Wordpress integration', 'images/integrations/wordpress.png', 'wordpress', 0, '2024-03-08 23:28:43', '2024-03-08 23:28:44');

INSERT INTO `introductions` (`id`, `key`, `intro`, `order`, `created_at`, `updated_at`) VALUES
(1, 'initialize', 'Welcome to MagicAI. Let\'s take a quick tour', 1, '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(2, 'ai_writer', 'A great tool for using the Text Generator & AI Copywriting Assistant.', 2, '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(3, 'ai_image', 'A great tool for using the Text Generator & AI Copywriting Assistant.', 3, '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(4, 'ai_pdf', 'Simply upload a PDF, find specific information. extract key insights or summarize the entire document.', 4, '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(5, 'ai_code', 'Generate high quality code in seconds.', 5, '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(6, 'select_plan', 'Choose the plan that suits you and start creating right away.', 6, '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(7, 'affiliate_send', 'Invite your friends and start earning commissions.', 7, '2024-12-24 17:25:28', '2024-12-24 17:25:28');

INSERT INTO `menus` (`id`, `parent_id`, `key`, `route`, `route_slug`, `label`, `icon`, `svg`, `order`, `is_active`, `params`, `type`, `extension`, `bolt_menu`, `bolt_background`, `bolt_foreground`, `letter_icon`, `letter_icon_bg`, `created_at`, `updated_at`, `custom_menu`) VALUES
(1, NULL, 'user_label', NULL, NULL, 'User', NULL, NULL, 1, 1, '[]', 'label', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(2, NULL, 'dashboard', 'dashboard.user.index', NULL, 'Dashboard', 'tabler-layout-2', NULL, 2, 1, '[]', 'item', NULL, 1, '#9A6FFD', '#fff', NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:28', 0),
(3, NULL, 'ext_chat_bot', 'dashboard.chatbot.index', NULL, 'AI Bots', 'tabler-message-chatbot', NULL, 2, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(4, NULL, 'documents', 'dashboard.user.openai.documents.all', NULL, 'Documents', 'tabler-archive', NULL, 3, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(5, NULL, 'ai_editor', 'dashboard.user.generator.index', NULL, 'AI Editor', 'tabler-notebook', NULL, 4, 1, '[]', 'item', NULL, 1, '#E29CB6', '#fff', NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:28', 0),
(6, NULL, 'ai_writer', 'dashboard.user.openai.list', NULL, 'AI Writer', 'tabler-notes', NULL, 5, 1, '[]', 'item', NULL, 1, '#468EA6', '#fff', NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:28', 0),
(7, NULL, 'ai_video', 'dashboard.user.openai.generator', 'ai_video', 'AI Video', 'tabler-video', NULL, 6, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(8, NULL, 'ai_image_generator', 'dashboard.user.openai.generator', 'ai_image_generator', 'AI Image', 'tabler-photo', NULL, 7, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(9, NULL, 'ai_article_wizard', 'dashboard.user.openai.articlewizard.new', 'ai_article_wizard', 'AI Article Wizard', 'tabler-ad-2', NULL, 8, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(10, NULL, 'ai_pdf', 'dashboard.user.openai.generator.workbook', 'ai_pdf', 'AI File Chat', 'tabler-file-pencil', NULL, 9, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(11, NULL, 'ai_vision', 'dashboard.user.openai.generator.workbook', 'ai_vision', 'AI Vision', 'tabler-scan-eye', NULL, 10, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(12, NULL, 'ai_rewriter', 'dashboard.user.openai.rewriter', 'ai_rewriter', 'AI ReWriter', 'tabler-ballpen', NULL, 11, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(13, NULL, 'ai_chat_image', 'dashboard.user.openai.generator.workbook', 'ai_chat_image', 'AI Chat Image', 'tabler-photo', NULL, 12, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(14, NULL, 'ai_chat_all', 'dashboard.user.openai.chat.list', NULL, 'AI Chat', 'tabler-message-dots', NULL, 13, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(15, NULL, 'ai_code_generator', 'dashboard.user.openai.generator.workbook', 'ai_code_generator', 'AI Code', 'tabler-terminal-2', NULL, 14, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(16, NULL, 'ai_youtube', 'dashboard.user.openai.generator.workbook', 'ai_youtube', 'AI YouTube', 'tabler-brand-youtube', NULL, 15, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(17, NULL, 'ai_rss', 'dashboard.user.openai.generator.workbook', 'ai_rss', 'AI RSS', 'tabler-rss', NULL, 15, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(18, NULL, 'ai_speech_to_text', 'dashboard.user.openai.generator', 'ai_speech_to_text', 'AI Speech to Text', 'tabler-microphone', NULL, 16, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(19, NULL, 'ai_voiceover', 'dashboard.user.openai.generator', 'ai_voiceover', 'AI Voiceover', 'tabler-volume', NULL, 17, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(20, NULL, 'ai_voice_isolator', 'dashboard.user.openai.generator', 'ai_voice_isolator', 'AI Voice Isolator', 'tabler-ear-scan', NULL, 18, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(21, NULL, 'ai_voiceover_clone', 'dashboard.user.voice.index', NULL, 'AI Voice Clone', 'tabler-microphone-2', NULL, 18, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(22, NULL, 'team_menu', 'dashboard.user.team.index', NULL, 'Team', 'tabler-user-plus', NULL, 19, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(23, NULL, 'brand_voice', 'dashboard.user.brand.index', NULL, 'Brand Voice', 'tabler-brand-trello', NULL, 20, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(24, NULL, 'advanced_image', 'dashboard.user.advanced-image.index', NULL, 'Advanced Image Editor', 'tabler-photo-edit', NULL, 20, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(25, NULL, 'ai_avatar', 'dashboard.user.ai-avatar.index', NULL, 'AI Avatar', 'tabler-slideshow', NULL, 20, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(26, NULL, 'ai_avatar_pro', 'dashboard.user.ai-avatar-pro.index', NULL, 'AI Avatar Pro', 'tabler-camera-star', NULL, 20, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(27, NULL, 'ai_video_pro', 'dashboard.user.ai-video-pro.index', NULL, 'AI Video Pro', 'tabler-video', NULL, 20, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(28, NULL, 'ai_product_shot', 'dashboard.user.ai-product-shot.index', NULL, 'AI Product Photography', 'tabler-photo-star', NULL, 20, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(29, NULL, 'api_keys', 'dashboard.user.apikeys.index', NULL, 'API Keys', 'tabler-key', NULL, 21, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(30, NULL, 'affiliates', 'dashboard.user.affiliates.index', NULL, 'Affiliates', 'tabler-currency-dollar', NULL, 22, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(31, NULL, 'support', 'dashboard.support.list', NULL, 'Support', 'tabler-lifebuoy', NULL, 23, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(32, NULL, 'integration', 'dashboard.user.integration.index', NULL, 'Integration', 'tabler-webhook', NULL, 24, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(33, NULL, 'divider_one', NULL, NULL, NULL, NULL, NULL, 25, 1, '[]', 'divider', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(34, NULL, 'links', NULL, NULL, 'Links', NULL, NULL, 26, 1, '[]', 'label', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(35, NULL, 'favorites', 'dashboard.user.openai.list', 'filter=favorite', 'Favorites', NULL, NULL, 27, 1, '[]', 'item', NULL, 0, NULL, NULL, 1, 'bg-[#7A8193] text-white', '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(36, NULL, 'workbook', 'dashboard.user.openai.documents.all', '?filter=favorites', 'Workbook', NULL, NULL, 28, 1, '[]', 'item', NULL, 0, NULL, NULL, 1, 'bg-[#658C8E] text-white', '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(37, NULL, 'divider_two', NULL, NULL, NULL, NULL, NULL, 29, 1, '[]', 'divider', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(38, NULL, 'admin_label', NULL, NULL, 'Admin', NULL, NULL, 30, 1, '[]', 'label', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(39, NULL, 'admin_dashboard', 'dashboard.admin.index', NULL, 'Dashboard', 'tabler-layout-2', NULL, 31, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(40, NULL, 'marketplace', 'dashboard.admin.marketplace.index', NULL, 'Marketplace', 'tabler-building-store', NULL, 32, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(41, NULL, 'themes', 'dashboard.admin.themes.index', NULL, 'Themes', 'tabler-palette', NULL, 33, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(42, NULL, 'user_management', 'dashboard.admin.users.index', NULL, 'User Management', 'tabler-users', NULL, 34, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(43, 42, 'user_list', 'dashboard.admin.users.index', NULL, 'Users List', NULL, NULL, 34, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(44, 42, 'user_activity', 'dashboard.admin.users.activity', NULL, 'Users Activities', NULL, NULL, 34, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(45, 42, 'user_dashboard', 'dashboard.admin.users.dashboard', NULL, 'Users Dashboard', NULL, NULL, 34, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(46, 42, 'user_deletion', 'dashboard.admin.users.deletion.reqs', NULL, 'User Deletion Requests', NULL, NULL, 34, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(47, 42, 'user_permission', 'dashboard.admin.users.permissions', NULL, 'User Permissions', NULL, NULL, 34, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(48, NULL, 'announcements', 'dashboard.admin.announcements.index', NULL, 'Announcements', 'tabler-speakerphone', NULL, 35, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(49, NULL, 'site_promo', 'dashboard.admin.ads.index', NULL, 'Google adsense', 'tabler-ad-circle', NULL, 35, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(50, NULL, 'support_requests', 'dashboard.support.list', NULL, 'Support Requests', 'tabler-lifebuoy', NULL, 36, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(51, NULL, 'templates', 'dashboard.admin.openai.list', NULL, 'Templates', 'tabler-list-details', NULL, 37, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(52, 51, 'built_in_templates', 'dashboard.admin.openai.list', NULL, 'Built-in Templates', NULL, NULL, 38, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(53, 51, 'custom_templates', 'dashboard.admin.openai.custom.list', NULL, 'Custom Templates', NULL, NULL, 39, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(54, 51, 'ai_writer_categories', 'dashboard.admin.openai.categories.list', NULL, 'AI Writer Categories', NULL, NULL, 40, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(55, NULL, 'chat_settings', 'dashboard.admin.openai.chat.category', NULL, 'Chat Settings', 'tabler-message-circle', NULL, 41, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(56, 55, 'chat_categories', 'dashboard.admin.openai.chat.category', NULL, 'Chat Categories', NULL, NULL, 42, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(57, 55, 'chat_templates', 'dashboard.admin.openai.chat.list', NULL, 'Chat Templates', NULL, NULL, 43, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(58, 55, 'chatbot_training', 'dashboard.admin.chatbot.index', NULL, 'Chatbot Training', NULL, NULL, 44, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(59, 55, 'ai_assistant', 'dashboard.admin.ai-assistant.index', NULL, 'Assistant Training', NULL, NULL, 44, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(60, 109, 'ai_chat_models', 'dashboard.admin.ai-chat-model.index', NULL, 'AI Models', NULL, NULL, 3, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(61, 55, 'floating_chat_settings', 'dashboard.admin.chatbot.setting', NULL, 'Floating Chat Settings', NULL, NULL, 45, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(62, 55, 'external_chat_settings', 'dashboard.admin.chatbot.external_settings', NULL, 'External Chat Settings', NULL, NULL, 46, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(63, NULL, 'frontend', 'dashboard.admin.frontend.settings', NULL, 'Frontend', 'tabler-device-laptop', NULL, 47, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(64, 63, 'frontend_settings', 'dashboard.admin.frontend.settings', NULL, 'Frontend Settings', NULL, NULL, 48, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(65, 63, 'frontend_section_settings', 'dashboard.admin.frontend.sectionsettings', NULL, 'Frontend Section Settings', NULL, NULL, 49, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(66, 63, 'frontend_menu', 'dashboard.admin.frontend.menusettings', NULL, 'Menu', NULL, NULL, 50, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(67, 63, 'social_media_accounts', 'dashboard.admin.frontend.socialmedia', NULL, 'Social Media Accounts', NULL, NULL, 50, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(68, 63, 'auth_settings', 'dashboard.admin.frontend.authsettings', NULL, 'Auth Settings', NULL, NULL, 52, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(69, 63, 'f_a_q', 'dashboard.admin.frontend.faq.index', NULL, 'F.A.Q', NULL, NULL, 53, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(70, 63, 'tools_section', 'dashboard.admin.frontend.tools.index', NULL, 'Tools Section', NULL, NULL, 54, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(71, 63, 'features_section', 'dashboard.admin.frontend.future.index', NULL, 'Features Section', 'tabler-list-details', NULL, 55, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(72, 63, 'testimonials_section', 'dashboard.admin.testimonials.index', NULL, 'Testimonials Section', NULL, NULL, 56, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(73, 63, 'clients_section', 'dashboard.admin.clients.index', NULL, 'Clients Section', NULL, NULL, 57, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(74, 63, 'how_it_works_section', 'dashboard.admin.howitWorks.index', NULL, 'How it Works Section', NULL, NULL, 58, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(75, 63, 'who_can_use_section', 'dashboard.admin.frontend.whois.index', NULL, 'Who Can Use Section', NULL, NULL, 59, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(76, 63, 'generators_list_section', 'dashboard.admin.frontend.generatorlist.index', NULL, 'Generators List Section', NULL, NULL, 60, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(77, NULL, 'finance', 'dashboard.admin.finance.plans.index', NULL, 'Finance', 'tabler-wallet', NULL, 61, 1, '[]', 'item', NULL, 1, '#3569F5', '#fff', NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:28', 0),
(78, 77, 'bank_transactions', 'dashboard.admin.bank.transactions.list', NULL, 'Bank Transactions', NULL, NULL, 62, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(79, 77, 'membership_plans', 'dashboard.admin.finance.plans.index', NULL, 'Membership Plans (old version)', NULL, NULL, 63, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(80, 77, 'admin_finance_plan', 'dashboard.admin.finance.plan.index', NULL, 'Pricing Plans', NULL, NULL, 63, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(81, 77, 'payment_gateways', 'dashboard.admin.finance.paymentGateways.index', NULL, 'Payment Gateways', NULL, NULL, 64, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(82, 77, 'trial_features', 'dashboard.admin.finance.free.feature', NULL, 'Trial Features', NULL, NULL, 60, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(83, 77, 'api_cost_management', 'dashboard.admin.finance.api-cost-management.index', NULL, 'API Cost Management', NULL, NULL, 60, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(84, 77, 'mobile_payment', 'dashboard.admin.finance.mobile.index', NULL, 'Mobile Payment', NULL, NULL, 60, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(85, NULL, 'pages', 'dashboard.page.list', NULL, 'Pages', 'tabler-file-description', NULL, 61, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(86, NULL, 'blog', 'dashboard.blog.list', NULL, 'Blog', 'tabler-pencil', NULL, 62, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(87, NULL, 'affiliates_admin', 'dashboard.admin.affiliates.index', NULL, 'Affiliates', 'tabler-currency-dollar', NULL, 63, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(88, NULL, 'coupons_admin', 'dashboard.admin.coupons.index', NULL, 'Coupons', 'tabler-ticket', NULL, 64, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(89, NULL, 'email_templates', 'dashboard.email-templates.index', NULL, 'Email Templates', 'tabler-mail', NULL, 65, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(90, NULL, 'introductions', 'dashboard.introductions.index', NULL, 'User Onboarding', 'tabler-directions', NULL, 65, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(91, NULL, 'mailchimp_newsletter', 'dashboard.admin.mailchimp-newsletter.index', NULL, 'Mailchimp Newsletter', 'tabler-mailbox', NULL, 65, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(92, NULL, 'hubspot', 'dashboard.admin.hubspot.index', NULL, 'Hubspot', 'tabler-affiliate', NULL, 65, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(93, NULL, 'api_integration', 'default', NULL, 'API Integration', 'tabler-api', NULL, 66, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(94, 93, 'api_integration_searchapi', 'dashboard.admin.settings.searchapi', NULL, 'Search Api', NULL, NULL, 74, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(95, 93, 'api_integration_openai', 'dashboard.admin.settings.openai', NULL, 'OpenAI', NULL, NULL, 67, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(96, 93, 'api_integration_gemini', 'dashboard.admin.settings.gemini', NULL, 'Gemini', NULL, NULL, 67, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(97, 93, 'api_integration_anthropic', 'dashboard.admin.settings.anthropic', NULL, 'Anthropic', NULL, NULL, 68, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(98, 93, 'api_integration_fal_ai', 'dashboard.admin.settings.fal-ai', NULL, 'Fal AI', NULL, NULL, 68, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(99, 93, 'api_integration_stablediffusion', 'dashboard.admin.settings.stablediffusion', NULL, 'StableDiffusion', NULL, NULL, 69, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(100, 93, 'api_integration_unsplashapi', 'dashboard.admin.settings.unsplashapi', NULL, 'Unsplash', NULL, NULL, 70, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(101, 93, 'api_integration_pexelsapi', 'dashboard.admin.settings.pexelsapi', NULL, 'Pexels', NULL, NULL, 71, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(102, 93, 'api_integration_pixabayapi', 'dashboard.admin.settings.pixabayapi', NULL, 'Pixabay', NULL, NULL, 72, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(103, 93, 'api_integration_serperapi', 'dashboard.admin.settings.serperapi', NULL, 'Serper', NULL, NULL, 73, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(104, 93, 'api_integration_tts', 'dashboard.admin.settings.tts', NULL, 'TTS', NULL, NULL, 74, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(105, 93, 'api_integration_synthesia', 'dashboard.admin.settings.synthesia', NULL, 'Synthesia', NULL, NULL, 74, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(106, 93, 'api_integration_heygen', 'dashboard.admin.settings.heygen', NULL, 'Heygen', NULL, NULL, 74, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(107, 93, 'api_integration_pebblely', 'dashboard.admin.settings.pebblely', NULL, 'Pebblely', NULL, NULL, 74, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(108, 93, 'plagiarism_extension', 'dashboard.admin.settings.plagiarism', NULL, 'Plagiarism API', NULL, NULL, 77, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(109, NULL, 'settings', 'dashboard.admin.settings.general', NULL, 'Settings', 'tabler-device-laptop', NULL, 75, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(110, 109, 'config', 'dashboard.admin.config.index', NULL, 'General Settings', NULL, NULL, 0, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(111, 109, 'thumbnail_system', 'dashboard.admin.settings.thumbnail', NULL, 'Thumbnail System', NULL, NULL, 79, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(112, 109, 'privacy', 'dashboard.admin.settings.privacy', NULL, 'Privacy Policy and Terms', NULL, NULL, 82, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(113, NULL, 'site_health', 'dashboard.admin.health.index', NULL, 'Site Health', 'tabler-activity-heartbeat', NULL, 85, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(114, NULL, 'license', 'dashboard.admin.license.index', NULL, 'License', 'tabler-checklist', NULL, 86, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(115, NULL, 'update', 'dashboard.admin.update.index', NULL, 'Update', 'tabler-refresh', NULL, 87, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(116, NULL, 'menu_setting', 'dashboard.admin.menu.index', NULL, 'Menu', 'tabler-menu', NULL, 88, 1, '[]', 'item', NULL, 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(117, NULL, 'openai_generator_extension', 'default', NULL, 'Ai Template', 'tabler-list-details', NULL, 5, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(118, 117, 'custom_templates_extension', 'dashboard.user.ai-template.openai-generator.index', NULL, 'Custom Templates', NULL, NULL, 5, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(119, 117, 'ai_writer_categories_extension', 'dashboard.user.ai-template.openai-generator-filter.index', NULL, 'AI Writer Categories', NULL, NULL, 5, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(120, NULL, 'ai_plagiarism_extension', 'dashboard.user.openai.plagiarism.index', NULL, 'AI Plagiarism', 'tabler-progress-check', NULL, 6, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(121, NULL, 'ai_detector_extension', 'dashboard.user.openai.detectaicontent.index', NULL, 'AI Detector', 'tabler-text-scan-2', NULL, 6, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(122, NULL, 'ai_social_media_extension', 'dashboard.user.automation.index', NULL, 'AI Social Media', 'tabler-share', NULL, 6, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(123, NULL, 'scheduled_posts_extension', 'dashboard.user.automation.list', NULL, 'Scheduled Posts', 'tabler-report', NULL, 6, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(124, 109, 'ai_social_media_settings_extension', 'dashboard.admin.automation.settings', NULL, 'AI Social Media Settings', NULL, NULL, 77, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(125, NULL, 'chat_settings_extension', 'default', NULL, 'Chat Settings', 'tabler-message-circle', NULL, 7, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(126, 125, 'chat_categories_extension', 'dashboard.user.chat-setting.chat-category.index', NULL, 'Chat Categories', NULL, NULL, 1, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(127, 125, 'chat_template_extension', 'dashboard.user.chat-setting.chat-template.index', NULL, 'Chat Templates', NULL, NULL, 2, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(128, 125, 'chat_training_extension', 'dashboard.user.chat-setting.chatbot.index', NULL, 'Chatbot Training', NULL, NULL, 3, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(129, 109, 'cloudflare_r2_extension', 'dashboard.admin.settings.cloudflare-r2', NULL, 'Cloudflare R2', NULL, NULL, 1, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(130, NULL, 'photo_studio_extension', 'dashboard.user.photo-studio.index', NULL, 'AI Photo Studio', 'tabler-device-laptop', NULL, 8, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(131, NULL, 'seo_tool_extension', 'dashboard.user.seo.index', NULL, 'SEO Tool', 'tabler-seo', NULL, 10, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(132, NULL, 'ai_web_chat_extension', 'dashboard.user.openai.webchat.workbook', NULL, 'AI Web Chat', 'tabler-world-www', NULL, 10, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(133, 93, 'photo_studio_setting', 'dashboard.admin.settings.clipdrop', NULL, 'Photo Studio', NULL, NULL, 10, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0),
(134, 109, 'maintenance_setting', 'dashboard.admin.settings.maintenance.index', NULL, 'Maintenance', NULL, NULL, 2, 1, '[]', 'item', '1', 0, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', 0);

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_01_01_000001_convert_db_tables_engines_from_myisam_to_innodb', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2017_08_24_000000_create_app_settings_table', 1),
(5, '2018_08_08_100000_create_telescope_entries_table', 1),
(6, '2019_05_02_122941_create_plans_table', 1),
(7, '2019_05_03_000001_create_customer_columns', 1),
(8, '2019_05_03_000002_create_subscriptions_table', 1),
(9, '2019_05_03_000003_create_subscription_items_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2023_03_01_113559_create_jobs_table', 1),
(13, '2023_03_01_113611_create_settings_table', 1),
(14, '2023_03_01_134013_create_user_orders_table', 1),
(15, '2023_03_01_134144_create_user_support_table', 1),
(16, '2023_03_01_134254_create_user_support_messages_table', 1),
(17, '2023_03_10_100433_create_openai_table', 1),
(18, '2023_03_14_073839_create_user_openai_table', 1),
(19, '2023_03_20_115202_add_user_id_to_user_orders_table', 1),
(20, '2023_03_20_134019_add_type_to_user_orders_table', 1),
(21, '2023_03_21_123416_add_additional_fields_to_user_support_table', 1),
(22, '2023_03_22_101116_add_paths_to_settings_table', 1),
(23, '2023_03_22_104952_add_openai_settings_to_settings_table', 1),
(24, '2023_03_30_000547_add_workbook_items_to_user_openai_table', 1),
(25, '2023_04_01_235507_add_custom_template_fields_to_openai_table', 1),
(26, '2023_04_12_223330_add_affiliate_to_users_table', 1),
(27, '2023_04_13_175439_create_user_affiliates_table', 1),
(28, '2023_04_13_175939_add_affiliate_to_settings_table', 1),
(29, '2023_04_13_180614_add_affiliate_to_user_orders_table', 1),
(30, '2023_04_24_115420_create_cache_table', 1),
(31, '2023_04_24_144953_create_activity_table', 1),
(32, '2023_04_28_110404_create_currencies_table', 1),
(33, '2023_05_01_205543_add_frontend_fields_to_settings_table', 1),
(34, '2023_05_03_103134_add_color_to_openai_table', 1),
(35, '2023_05_03_103903_add_additional_fields_to_activity_table', 1),
(36, '2023_05_03_105011_create_user_favorites_table', 1),
(37, '2023_05_04_190611_add_version_to_settings_table', 1),
(38, '2023_05_10_120704_create_openai_filters_table', 1),
(39, '2023_05_10_120716_add_filters_to_openai_table', 1),
(40, '2023_05_15_133018_create_openai_chat_category_table', 1),
(41, '2023_05_15_140015_create_user_openai_chat_table', 1),
(42, '2023_05_15_145853_create_user_openai_chat_messages_table', 1),
(43, '2023_05_24_134923_add_collapsed_logo_path_to_settings_table', 1),
(44, '2023_05_25_182410_add_email_confirmation_to_users_table', 1),
(45, '2023_05_26_134701_add_stripe_status_for_now_to_settings_table', 1),
(46, '2023_05_29_122817_create_faq_table', 1),
(47, '2023_05_29_130259_create_testimonials_table', 1),
(48, '2023_05_29_165555_create_frontend_tools_table', 1),
(49, '2023_05_30_110811_create_howitworks_table', 1),
(50, '2023_05_31_090418_create_customsettings_table', 1),
(51, '2023_05_31_151447_create_clients_table', 1),
(52, '2023_05_31_153647_add_new_logo_type_options', 1),
(53, '2023_06_01_124212_create_frontend_footer_settings_table', 1),
(54, '2023_06_01_140509_create_frontend_future_table', 1),
(55, '2023_06_01_145426_create_gateways_table', 1),
(56, '2023_06_02_124117_create_frontend_sections_statuses_titles_table', 1),
(57, '2023_06_02_124736_create_frontend_who_is_for_table', 1),
(58, '2023_06_02_124908_create_frontend_generators_table', 1),
(59, '2023_06_05_131107_add_settings_columns_to_settings_table', 1),
(60, '2023_06_06_094535_add_new_logo_options', 1),
(61, '2023_06_06_100350_add_paid_with_to_subscriptions', 1),
(62, '2023_06_06_133614_add_new_field_for_chat', 1),
(63, '2023_06_07_124125_create_gatewayproducts_table', 1),
(64, '2023_06_08_122900_add_hero_title_text_rotator_to_frontend_footer_settings_table', 1),
(65, '2023_06_09_091144_add_keywords_columns_to_settings_table', 1),
(66, '2023_06_09_102154_create_pages_table', 1),
(67, '2023_06_12_091546_add_gdpr_option_to_settings_table', 1),
(68, '2023_06_12_135232_add_menu_option_to_settings_table', 1),
(69, '2023_06_14_104251_add_token_field_to_users_table', 1),
(70, '2023_06_14_113746_add_google_refresh_token_to_users_table', 1),
(71, '2023_06_14_114054_add_trial_days_field_to_plans_table', 1),
(72, '2023_06_15_104503_create_oldgatewayproducts_table', 1),
(73, '2023_06_15_110436_add_privacy_and_terms_column_to_settings_table', 1),
(74, '2023_06_19_140133_add_login_without_confirmation_to_settings_table', 1),
(75, '2023_06_20_084825_add_old_product_id_to_oldgatewayproducts', 1),
(76, '2023_06_20_125836_add_header_buttons_to_frontend_footer_settings_table', 1),
(77, '2023_06_21_135415_add_additional_option_to_settings_table', 1),
(78, '2023_06_22_115805_add_customcode_to_settings_table', 1),
(79, '2023_06_22_124915_add_free_plan_to_settings_table', 1),
(80, '2023_06_22_133908_add_webhooks_to_gateways', 1),
(81, '2023_06_23_091003_create_email_templates_table', 1),
(82, '2023_06_23_141415_create_webhookhistory_table', 1),
(83, '2023_06_26_140101_create_bad_words_table', 1),
(84, '2023_07_01_080909_create_advertis_table', 1),
(85, '2023_07_03_082326_add_column_to_frontend_sections_statuses_titles_table', 1),
(86, '2023_07_07_103442_create_blogs_table', 1),
(87, '2023_07_08_205833_create_settings_two_table', 1),
(88, '2023_07_11_200235_add_license_type_to_settings_two', 1),
(89, '2023_07_11_200310_add_liquid_license_domain_key_to_settings_two', 1),
(90, '2023_07_13_133729_add_stream_server_option_to_settings_two_table', 1),
(91, '2023_07_13_143413_add_blog_options_to_frontend_sections_statuses_titles', 1),
(92, '2023_07_18_222043_add_image_storage_field_to_settings_two_table', 1),
(93, '2023_07_19_105519_add_package_column_to_openai_table', 1),
(94, '2023_07_21_121324_options_to_settingstwo_table', 1),
(95, '2023_07_24_103747_create_subscriptions_yokassa_table', 1),
(96, '2023_08_11_125732_create_paystack_payment_infos_table', 1),
(97, '2023_08_14_073857_add_storage_to_user_openai_table', 1),
(98, '2023_08_22_143604_add_iyzico_id_column_to_users', 1),
(99, '2023_08_30_162502_create_ads_table', 1),
(100, '2023_08_31_135312_change_facebook_token_type', 1),
(101, '2023_09_11_130128_change_github_and_google_token_type', 1),
(102, '2023_09_13_075321_add_stablediffusion_default_model_to_settings_two_table', 1),
(103, '2023_09_19_064148_create_article_wizard_table', 1),
(104, '2023_09_19_151726_create_coupons_table', 1),
(105, '2023_09_20_140329_add_feature_ai_article_wizard_to_settings_table', 1),
(106, '2023_09_20_174744_create_coupon_users_table', 1),
(107, '2023_09_26_134837_create_privacy_terms_table', 1),
(108, '2023_09_28_173820_add_hero_button_type_column_to_frontend_footer_settings', 1),
(109, '2023_09_29_075552_add_floating_button_to_frontend_footer_settings', 1),
(110, '2023_10_03_080002_add_unsplash_api_key_to_settings_two', 1),
(111, '2023_11_17_051523_add_dalle_setting_to_settings_two', 1),
(112, '2023_11_17_155039_create_folders_table', 1),
(113, '2023_11_17_155940_add_folder_id_to_user_openai', 1),
(114, '2023_11_27_052529_create_prompt_library_table', 1),
(115, '2023_11_28_130925_add_favorite_plan_to_openai_chat_category_table', 1),
(116, '2023_11_28_141010_create_chat_category_table', 1),
(117, '2023_11_28_160244_add_category_to_openai_chat_category_table', 1),
(118, '2023_11_29_060800_create_favourite_list_table', 1),
(119, '2023_11_29_122715_create_rate_limits_table', 1),
(120, '2023_11_30_084646_add_user_id_to_prompt_library', 1),
(121, '2023_12_07_093902_add_display_to_plans', 1),
(122, '2023_12_12_063333_add_feature_ai_vision_to_settings_table', 1),
(123, '2023_12_13_071818_add_allowed_images_count_to_settings_two', 1),
(124, '2023_12_13_124801_add_image_field_to_chat_messages', 1),
(125, '2023_12_14_075424_change_content_column_in_pages_table', 1),
(126, '2023_12_14_093837_create_pdf_data_table', 1),
(127, '2023_12_15_003956_update_users_change_avatar_length', 1),
(128, '2023_12_18_142047_add_pdf_info_to_chat_messages', 1),
(129, '2023_12_18_145013_add_ai_pdf_to_chat_to_settings_table', 1),
(130, '2023_12_19_085351_add_tax_to_gateways_table', 1),
(131, '2023_12_21_080109_add_type_column_to_rate_limits_table', 1),
(132, '2023_12_21_080333_add_allowed_voice_count_to_settings_two', 1),
(133, '2023_12_22_085010_add_bot_output_image', 1),
(134, '2023_12_25_212630_add_bank_details_to_gateways_table', 1),
(135, '2023_12_28_021338_add_new_fields_to_subscriptions_table', 1),
(136, '2023_12_28_040900_add_new_fields_to_user_orders_table', 1),
(137, '2023_12_28_143354_add_ai_chat_image_field_to_settings_table', 1),
(138, '2024_01_02_071044_add_auto_renewal_colmn_to_plans_table', 1),
(139, '2024_01_04_073526_add_mobile_payment_active_column_to_settings_table', 1),
(140, '2024_01_06_123827_add_revenuecat_id_column_to_users', 1),
(141, '2024_01_11_091958_create_table_revenuecatproducts', 1),
(142, '2024_01_15_152651_add_serperapi_colmn_to_settings_two_table', 1),
(143, '2024_01_16_053948_add_tts_settings_to_settings_two_table', 1),
(144, '2024_01_16_063552_add_realtime_colmn_to_user_openai_chat_messages_table', 1),
(145, '2024_01_17_072456_create_extensions_table', 1),
(146, '2024_01_17_075234_add_image_url_to_extensions', 1),
(147, '2024_01_18_001456_add_detail_to_extensions', 1),
(148, '2024_01_18_001457_add_licensed_to_extensions', 1),
(149, '2024_01_22_074920_add_prize_to_table', 1),
(150, '2024_01_22_134905_add_columns_to_subscriptions_yokassa_table', 1),
(151, '2024_01_23_052857_add_ai_rewriter_to_table', 1),
(152, '2024_01_23_143224_feature_ai_youtube_option', 1),
(153, '2024_01_24_105005_feature_ai_rss_option', 1),
(154, '2024_01_25_113135_fine_tune_list_data', 1),
(155, '2024_01_25_120049_update_helps_with_column_in_openai_chat_category_table', 1),
(156, '2024_01_26_110443_add_chatbot_table', 1),
(157, '2024_01_29_081000_chatbot_settings', 1),
(158, '2024_01_29_110158_add_apple_columns_to_user_table', 1),
(159, '2024_01_29_143656_create_teams_table', 1),
(160, '2024_01_29_143721_create_team_members_table', 1),
(161, '2024_01_29_150757_chatbot_message_data', 1),
(162, '2024_01_30_063632_add_team_id_to_users_table', 1),
(163, '2024_01_30_064148_add_is_team_plan_and_plan_allow_seat_to_plans_table', 1),
(164, '2024_01_30_081601_chatbot_chat_data', 1),
(165, '2024_01_30_084904_chatbot_history', 1),
(166, '2024_01_30_130737_add_team_function_add_settings_to_table', 1),
(167, '2024_01_30_134710_add_team_id_to_user_openai_table', 1),
(168, '2024_01_30_134807_add_team_id_to_user_openai_chat_table', 1),
(169, '2024_01_30_135358_add_team_id_to_user_folders_table', 1),
(170, '2024_02_01_130945_add_user_count_to_settings_table', 1),
(171, '2024_02_06_095920_create_payment_proofs_table', 1),
(172, '2024_02_06_172558_add_system_to_email_templates_table', 1),
(173, '2024_02_08_192853_create_custom_biling_plans_table', 1),
(174, '2024_02_09_064724_add_ai_advanced_editor_to_settings_table', 1),
(175, '2024_02_14_085457_add_razorpay_id_column_to_users_table', 1),
(176, '2024_02_14_124404_add_titlebar_status_to_pages_table', 1),
(177, '2024_02_15_085457_add_url_to_user_openai_chat', 1),
(178, '2024_02_15_100430_add_payload_to_gatewayproducts_table', 1),
(179, '2024_02_15_111859_add_coingate_subscriber_id_to_users_table', 1),
(180, '2024_02_15_132142_add_payload_to_user_orders_table', 1),
(181, '2024_02_16_163955_create_elevenlab_voices_table', 1),
(182, '2024_02_19_074856_add_payload_to_table_user_openai', 1),
(183, '2024_02_19_172005_add_voice_clone_settings_table', 1),
(184, '2024_02_19_175115_add_user_id_to_elevenlab_voices_table', 1),
(185, '2024_02_20_101928_add_open_ai_items_to_plans_table', 1),
(186, '2024_02_21_051626_add_free_open_ai_items_to_settings_table', 1),
(187, '2024_02_21_064451_update_apple_token_column_from_user_table', 1),
(188, '2024_02_21_100405_add_theme_column_to_settings_table', 1),
(189, '2024_02_21_163100_add_chatbot_interests_to_chatbot_table', 1),
(190, '2024_02_21_180426_add_status_to_chatbot_table', 1),
(191, '2024_02_22_065844_create_chatbot_data_table', 1),
(192, '2024_02_22_120600_create_chatbot_data_vectors_table', 1),
(193, '2024_02_22_150925_add_chatbot_id_to_openai_chat_category_table', 1),
(194, '2024_02_23_061429_add_chatbot_id_to_user_openai_chat_table', 1),
(195, '2024_02_23_111745_add_user_api_option_to_settings_table', 1),
(196, '2024_02_23_111834_add_api_keys_to_users_table', 1),
(197, '2024_02_26_013354_add_ai_video_to_settings_two', 1),
(198, '2024_02_26_184945_create_companies_table', 1),
(199, '2024_02_26_185155_create_products_table', 1),
(200, '2024_02_27_080913_add_reference_url_to_user_openai_chat', 1),
(201, '2024_02_27_120732_add_is_custom_column_to_pages_table', 1),
(202, '2024_02_27_134353_add_tone_of_voice_to_companies_table', 1),
(203, '2024_02_28_084232_add_target_audience_column_to_companies_table', 1),
(204, '2024_02_28_130323_add_user_id_to_chatbot_table', 1),
(205, '2024_02_29_074747_chatbot_timestamp', 1),
(206, '2024_03_04_070314_create_usage_table', 1),
(207, '2024_03_05_085748_add_version_to_extensions_table', 1),
(208, '2024_03_07_152339_create_intagrations_table', 1),
(209, '2024_03_08_082441_create_user_integrations_table', 1),
(210, '2024_03_08_112315_add_face_price_to_extensions_table', 1),
(211, '2024_03_12_143138_add_auth_view_options_column_to_settings_table', 1),
(212, '2024_03_14_061720_add_user_id_to_openai_filters_table', 1),
(213, '2024_03_14_062605_add_user_id_to_openai_table', 1),
(214, '2024_03_19_142411_add_instructions_to_openai_chat_category_table', 1),
(215, '2024_03_19_151400_add_first_message_to_openai_chat_category_table', 1),
(216, '2024_03_25_085453_add_theme_columns_to_extension_table', 1),
(217, '2024_03_28_002018_create_user_docs_favorite_table', 1),
(218, '2024_03_28_134851_add_to_token_to_users_table', 1),
(219, '2024_03_29_212039_delete_column_from_extensions_table', 1),
(220, '2024_04_02_063345_add_anthropic_api_keys_to_users_table', 1),
(221, '2024_04_06_014025_change_columns_in_privacy_terms_table', 1),
(222, '2024_04_09_191525_add_affiliate_status_to_users_table', 1),
(223, '2024_04_18_121537_add_defi_setting_to_users_table', 1),
(224, '2024_05_01_082729_add_gemini_api_keys_colmn_to_users_table', 1),
(225, '2024_05_01_111455_add_google2fa_secret_to_users_table', 1),
(226, '2024_05_03_094207_add_show_page_on_footer_to_pages_table', 1),
(227, '2024_05_08_163635_create_photo_studios_table', 1),
(228, '2024_05_15_100541_create_users_activity_table', 1),
(229, '2024_05_16_092520_create_menus_table', 1),
(230, '2024_05_21_091041_create_ai_models_table', 1),
(231, '2024_05_21_091043_create_tokens_table', 1),
(232, '2024_05_22_154814_change_integer_to_float_in_team_members', 1),
(233, '2024_05_22_154827_change_integer_to_float_in_users', 1),
(234, '2024_06_03_145735_create_gateway_taxes_table', 1),
(235, '2024_06_04_032206_add_country_tax_enabled_to_gateways_table', 1),
(236, '2024_06_07_064433_add_state_and_city_columns_to_users_table', 1),
(237, '2024_06_13_132553_create_social_media_accounts_table', 1),
(238, '2024_06_13_162318_add_hero_image_column_to_frontend_settings_table', 1),
(239, '2024_06_14_124938_add_plan_description_column_to_plans_table', 1),
(240, '2024_06_14_145824_create_account_deletion_reqs_table', 1),
(241, '2024_06_18_062706_add_tool_subtitle_to_frontend_sections_statuses_titles_table', 1),
(242, '2024_06_18_080246_add_some_fields_to_frontend_tools_table', 1),
(243, '2024_06_18_082526_add_some_fields_to_howitworks_table', 1),
(244, '2024_06_18_090439_add_icon_column_to_frontend_generators_table', 1),
(245, '2024_06_24_074201_add_footer_text_color_to_frontend_footer_settings_table', 1),
(246, '2024_06_24_141627_create_introductions_table', 1),
(247, '2024_06_25_112300_create_notifications_table', 1),
(248, '2024_06_25_131414_add_tour_seen_to_users_table', 1),
(249, '2024_06_26_074715_add_custom_menu_to_menus_table', 1),
(250, '2024_06_26_123911_add_tour_seen_to_settings_table', 1),
(251, '2024_06_27_135525_add_recaptcha_to_settings_table', 1),
(252, '2024_07_01_103008_add_otp_to_users_table', 1),
(253, '2024_07_01_103139_add_otp_to_settings_table', 1),
(254, '2024_07_04_120705_create_domains_table', 1),
(255, '2024_07_05_112203_add_synthesia_secret_key_to_settings_table', 1),
(256, '2024_07_05_122831_add_is_selected_to_ai_models_table', 1),
(257, '2024_07_09_045618_create_ai_chat_model_plans_table', 1),
(258, '2024_07_09_150801_add_dash_notify_seen_to_users_table', 1),
(259, '2024_07_18_121143_add_stablediffusion_bedrock_model_to_settings_two_table', 1),
(260, '2024_07_19_184746_add_cols_to_frontend_sections_statuses_titles_table', 1),
(261, '2024_07_19_212020_create_advanced_features_sectoion_table', 1),
(262, '2024_07_23_231136_create_comparison_section_items_table', 1),
(263, '2024_07_24_111812_create_features_marquees_table', 1),
(264, '2024_07_24_115747_create_footer_items_table', 1),
(265, '2024_07_25_081052_create_banner_bottom_texts_table', 1),
(266, '2024_07_25_084337_add_generator_text_to_frontend_sections_statuses_titles_table', 1),
(267, '2024_07_25_100909_add_plan_footer_text_to_frontend_sections_statuses_titles', 1),
(268, '2024_07_25_114952_add_advanced_features_title_to_frontend_sections_statuses_titles_table', 1),
(269, '2024_07_25_120715_add_description_to_howitworks_table', 1),
(270, '2024_07_25_131428_add_pebblely_key_to_settings_table', 1),
(271, '2024_07_29_121039_create_pebblely_table', 1),
(272, '2024_07_31_051243_add_plan_columns_to_plans_table', 1),
(273, '2024_08_06_050052_add_default_ai_model_to_plans_table', 1),
(274, '2024_08_06_115604_update_admin_to_super_admin_in_users_table', 1),
(275, '2024_08_09_103631_add_ai_models_to_plans_table', 1),
(276, '2024_08_12_050354_create_user_credits_table', 1),
(277, '2024_08_12_141902_add_assistant_to_openai_chat_category_table', 1),
(278, '2024_08_12_225618_add_thread_id_to_user_openai_chat_table', 1),
(279, '2024_08_13_095658_remove_is_free_column_in_plans_table', 1),
(280, '2024_08_14_050339_add_request_id_to_user_openai_table', 1),
(281, '2024_08_16_105255_rollback_permission_table', 1),
(282, '2024_09_02_120410_create_share_links_table', 1),
(283, '2024_09_12_185443_add_default_mrrobot_words_to_settings', 1),
(284, '2024_09_19_070942_add_bolt_menu_to_menus_table', 1),
(285, '2024_09_19_110114_create_engines_table', 1),
(286, '2024_09_19_211829_make_sure_to_remove_deprecated_entities_before_migration', 1),
(287, '2024_09_19_245426_add_entity_credits_to_users_table', 1),
(288, '2024_09_24_095546_update_ai_models_table', 1),
(289, '2024_09_24_213419_rename_ai_models_to_entities_table', 1),
(290, '2024_09_24_213999_remove_deprecated_stable_diff_models_from_db', 1),
(291, '2024_09_24_214000_update_plan_credits_temporary_migration', 1),
(292, '2024_09_24_220949_rename_ai_engine_column_in_entities_table', 1),
(293, '2024_09_24_221029_rename_ai_model_id_column_in_ai_chat_model_plans_table', 1),
(294, '2024_09_24_221030_make_ai_chat_model_plans_entity_id_foreign_key', 1),
(295, '2024_09_25_125009_update_sd_values_in_app_settings_table', 1),
(296, '2024_09_30_113752_rename_ai_model_id_column_in_token_table', 1),
(297, '2024_10_17_124512_remove_free_plan_column_from_settings_table', 1),
(298, '2024_10_22_154324_remove_plan_total_words_and_images_columns', 1),
(299, '2024_10_25_095152_add_logo_to_settings_table', 1),
(300, '2024_11_04_100122_create_permission_tables', 1),
(301, '2024_11_04_101015_update_permission_table', 1),
(302, '2024_11_18_102726_change_amount_col_in_user_affiliates_table', 1),
(303, '2024_11_25_101434_create_health_check_result_history_items_table', 1),
(304, '2024_11_26_094758_add_heygen_secret_key_to_settings_table', 1),
(305, '2024_12_10_080148_delete_menu_icon_one_time_migration', 1),
(306, '2024_12_16_080709_add_hidden_to_plans_table', 1),
(307, '2024_12_17_081626_add_index_to_user_openai', 1),
(308, '2024_12_17_113420_remove_deprecated_runway_models_from_db', 1),
(309, '2024_12_19_180117_change_prompt_column_to_user_fall_table', 1);

INSERT INTO `openai` (`id`, `user_id`, `title`, `description`, `slug`, `active`, `questions`, `image`, `premium`, `type`, `created_at`, `updated_at`, `prompt`, `custom_template`, `tone_of_voice`, `color`, `filters`, `package`) VALUES
(1, NULL, 'Post Title Generator', 'Get captivating post titles instantly with our title generator. Boost engagement and save time.', 'post_title_generator', 1, '[{\"name\":\"your_description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M430 896V356H200V256h560v100H530v540H430Z\"/></svg>', 0, 'text', '2023-03-11 08:26:49', '2023-03-11 08:26:49', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(2, NULL, 'Summarize Text', 'Effortlessly condense large text into shorter summaries. Save time and increase productivity.', 'summarize_text', 1, '[{\"name\":\"text_to_summary\",\"type\":\"textarea\",\"question\":\"Text to summary\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M120 816v-60h480v60H120Zm0-210v-60h720v60H120Zm0-210v-60h720v60H120Z\"/></svg>', 0, 'text', '2023-03-11 10:25:43', '2023-03-11 10:25:43', NULL, 0, 0, '#CCD9B8', 'blog', NULL),
(3, NULL, 'Product Description', 'Easily create compelling product descriptions that sell. Increase conversions and boost sales.', 'product_description', 1, '[{\"name\":\"product_name\",\"type\":\"text\",\"question\":\"Product Name\",\"select\":\"\"},{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Short Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M319 806h322v-60H319v60Zm0-170h322v-60H319v60Zm-99 340q-24 0-42-18t-18-42V236q0-24 18-42t42-18h361l219 219v521q0 24-18 42t-42 18H220Zm331-554h189L551 236v186Z\"/></svg>', 0, 'text', '2023-03-11 10:30:40', '2023-03-11 10:30:40', NULL, 0, 0, '#C2DEDD', 'ecommerce', NULL),
(4, NULL, 'Article Generator', 'Instantly create unique articles on any topic. Boost engagement, improve SEO, and save time.', 'article_generator', 1, '[{\"name\":\"article_title\",\"type\":\"text\",\"question\":\"Article Title\",\"select\":\"\"},{\"name\":\"focus_keywords\",\"type\":\"text\",\"question\":\"Focus Keywords (Seperate with Comma)\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M140 936q-24.75 0-42.375-17.625T80 876V216l67 67 66-67 67 67 67-67 66 67 67-67 67 67 66-67 67 67 67-67 66 67 67-67v660q0 24.75-17.625 42.375T820 936H140Zm0-60h310V596H140v280Zm370 0h310V766H510v110Zm0-170h310V596H510v110ZM140 536h680V416H140v120Z\"/></svg>', 0, 'text', '2023-03-11 10:36:10', '2023-03-11 10:36:10', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(5, NULL, 'Product Name Generator', 'Create catchy product names with ease. Attract customers and boost sales effortlessly.', 'product_name', 1, '[{\"name\":\"seed_words\",\"type\":\"text\",\"question\":\"Seed Words (Seperate With Comma)\",\"select\":\"\"},{\"name\":\"product_description\",\"type\":\"textarea\",\"question\":\"Product Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M290 896V356H80V256h520v100H390v540H290Zm360 0V556H520V456h360v100H750v340H650Z\"/></svg>', 0, 'text', '2023-03-11 10:37:56', '2023-03-11 10:37:56', NULL, 0, 0, '#C2DEDD', 'ecommerce', NULL),
(6, NULL, 'Testimonial Review', 'Instantly generate authentic testimonials. Build trust and credibility with genuine reviews.', 'testimonial_review', 1, '[{\"name\":\"subject\",\"type\":\"textarea\",\"question\":\"Subject\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"40\" viewBox=\"0 96 960 960\" width=\"40\"><path d=\"m233 976 65-281L80 506l288-25 112-265 112 265 288 25-218 189 65 281-247-149-247 149Z\"/></svg>', 0, 'text', '2023-03-11 10:39:00', '2023-03-11 10:39:00', NULL, 0, 0, '#A3A7D6', 'ecommerce', NULL),
(7, NULL, 'Problem Agitate Solution', 'Identify and solve problems efficiently. Streamline solutions and increase productivity.', 'problem_agitate_solution', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"m772 421-43-100-104-46 104-45 43-95 43 95 104 45-104 46-43 100Zm0 595-43-96-104-45 104-45 43-101 43 101 104 45-104 45-43 96ZM333 862l-92-197-201-90 201-90 92-196 93 196 200 90-200 90-93 197Zm0-148 48-96 98-43-98-43-48-96-47 96-99 43 99 43 47 96Zm0-139Z\"/></svg>', 0, 'text', '2023-03-11 10:39:56', '2023-03-11 10:39:56', NULL, 0, 0, '#E0BFC9', 'development', NULL),
(8, NULL, 'Blog Section', 'Effortlessly create blog sections with AI. Get unique, engaging content and save time.', 'blog_section', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M180 936q-24.75 0-42.375-17.625T120 876V276q0-24.75 17.625-42.375T180 216h600q24.75 0 42.375 17.625T840 276v600q0 24.75-17.625 42.375T780 936H180Zm0-60h600V356H180v520Zm100-310v-60h390v60H280Zm0 160v-60h230v60H280Z\"/></svg>', 0, 'text', '2023-03-11 10:40:50', '2023-03-11 10:40:50', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(9, NULL, 'Blog Post Ideas', 'Unlock your creativity with unique blog post ideas. Generate endless inspiration and take your content to the next level.', 'blog_post_ideas', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M360 896q-134 0-227-93T40 576q0-134 93-227t227-93q134 0 227 93t93 227q0 134-93 227t-227 93Zm-.235-60Q468 836 544 760.235q76-75.764 76-184Q620 468 544.235 392q-75.764-76-184-76Q252 316 176 391.765q-76 75.764-76 184Q100 684 175.765 760q75.764 76 184 76ZM330 706h60V506h80v-40H250v40h80v200Zm454-298-42-94-94-42 94-42 42-94 42 94 94 42-94 42-42 94Zm0 608-42-94-94-42 94-42 42-94 42 94 94 42-94 42-42 94ZM360 576Z\"/></svg>', 0, 'text', '2023-03-11 10:41:31', '2023-03-11 10:41:31', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(10, NULL, 'Blog Intros', 'Set the tone for your blog post with captivating intros. Grab readers\' attention and keep them engaged.', 'blog_intros', 1, '[{\"name\":\"title\",\"type\":\"text\",\"question\":\"Title of blog text\",\"select\":\"\"},{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description of your need\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M80 976v-60h800v60H80Zm210-450V426h380v100H290Zm0 240V666h380v100H290Z\"/></svg>', 0, 'text', '2023-03-14 11:43:57', '2023-03-14 11:43:57', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(11, NULL, 'Blog Conclusion', 'End your blog posts on a high note. Craft memorable conclusions that leave a lasting impact.', 'blog_conclusion', 1, '[{\"name\":\"title\",\"type\":\"text\",\"question\":\"Title of the blog text\",\"select\":\"\"},{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M80 236v-60h800v60H80Zm210 250V386h380v100H290Zm0 240V626h380v100H290Z\"/></svg>', 0, 'text', '2023-03-14 11:44:49', '2023-03-14 11:44:49', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(12, NULL, 'Facebook Ads', 'Create high-converting Facebook ads that grab attention. Drive sales and grow your business.', 'facebook_ads', 1, '[{\"name\":\"title\",\"type\":\"text\",\"question\":\"Title\",\"select\":\"\"},{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg width=\"9\" height=\"16\" viewBox=\"0 0 9 16\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n<path d=\"M5.66016 15.2383H2.88281V8.41797H0.5625V5.74609H2.88281V3.77734C2.88281 2.65234 3.19922 1.78516 3.83203 1.17578C4.46484 0.566406 5.30859 0.261719 6.36328 0.261719C7.20703 0.261719 7.89844 0.296875 8.4375 0.367188V2.72266L6.99609 2.75781C6.48047 2.75781 6.12891 2.86328 5.94141 3.07422C5.75391 3.28516 5.66016 3.60156 5.66016 4.02344V5.74609H8.33203L7.98047 8.41797H5.66016V15.2383Z\" fill=\"#23344D\"/>\n</svg>', 0, 'text', '2023-03-14 11:46:23', '2023-03-14 11:46:23', NULL, 0, 0, '#E8CEC3', 'advertisement', NULL),
(13, NULL, 'Youtube Video Description', 'Elevate your YouTube content with compelling video descriptions. Generate engaging descriptions effortlessly and increase views.', 'youtube_video_description', 1, '[{\"name\":\"title\",\"type\":\"text\",\"question\":\"Title\",\"select\":\"\"}]', '<svg width=\"17\" height=\"11\" viewBox=\"0 0 17 11\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n<path d=\"M15.8301 2.76172C15.9473 3.58203 16.0059 4.39062 16.0059 5.1875V6.3125L15.8301 8.73828C15.7363 9.41797 15.5371 9.91016 15.2324 10.2148C14.9043 10.543 14.4121 10.7539 13.7559 10.8477C13.123 10.8945 12.3613 10.9297 11.4707 10.9531C10.6035 10.9766 9.88867 10.9883 9.32617 10.9883H8.48242C5.88086 10.9648 4.18164 10.918 3.38477 10.8477C3.38477 10.8477 3.29102 10.8359 3.10352 10.8125C2.91602 10.7891 2.76367 10.7656 2.64648 10.7422C2.5293 10.7188 2.37695 10.6602 2.18945 10.5664C2.02539 10.4727 1.87305 10.3555 1.73242 10.2148C1.61523 10.0742 1.49805 9.88672 1.38086 9.65234C1.28711 9.39453 1.22852 9.17188 1.20508 8.98438L1.13477 8.73828C1.04102 7.91797 0.994141 7.10938 0.994141 6.3125V5.1875L1.13477 2.76172C1.22852 2.08203 1.42773 1.58984 1.73242 1.28516C2.06055 0.933594 2.56445 0.722656 3.24414 0.652344C3.87695 0.605469 4.62695 0.570313 5.49414 0.546875C6.36133 0.523437 7.07617 0.511719 7.63867 0.511719H8.48242C10.5918 0.511719 12.3496 0.558594 13.7559 0.652344C14.4121 0.722656 14.9043 0.933594 15.2324 1.28516C15.3262 1.37891 15.4082 1.49609 15.4785 1.63672C15.5488 1.75391 15.6074 1.88281 15.6543 2.02344C15.7012 2.14062 15.7363 2.25781 15.7598 2.375C15.7832 2.49219 15.8066 2.58594 15.8301 2.65625V2.76172ZM10.5215 5.85547L11.0137 5.60938L6.9707 3.5V7.71875L10.5215 5.85547Z\" fill=\"#23344D\"/>\n</svg>', 0, 'text', '2023-03-14 11:47:17', '2023-03-14 11:47:17', NULL, 0, 0, '#E4CD9F', 'social media', NULL),
(14, NULL, 'Youtube Video Title', 'Get more views with attention-grabbing video titles. Create unique, catchy titles that entice viewers.', 'youtube_video_title', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg width=\"17\" height=\"11\" viewBox=\"0 0 17 11\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n<path d=\"M15.8301 2.76172C15.9473 3.58203 16.0059 4.39062 16.0059 5.1875V6.3125L15.8301 8.73828C15.7363 9.41797 15.5371 9.91016 15.2324 10.2148C14.9043 10.543 14.4121 10.7539 13.7559 10.8477C13.123 10.8945 12.3613 10.9297 11.4707 10.9531C10.6035 10.9766 9.88867 10.9883 9.32617 10.9883H8.48242C5.88086 10.9648 4.18164 10.918 3.38477 10.8477C3.38477 10.8477 3.29102 10.8359 3.10352 10.8125C2.91602 10.7891 2.76367 10.7656 2.64648 10.7422C2.5293 10.7188 2.37695 10.6602 2.18945 10.5664C2.02539 10.4727 1.87305 10.3555 1.73242 10.2148C1.61523 10.0742 1.49805 9.88672 1.38086 9.65234C1.28711 9.39453 1.22852 9.17188 1.20508 8.98438L1.13477 8.73828C1.04102 7.91797 0.994141 7.10938 0.994141 6.3125V5.1875L1.13477 2.76172C1.22852 2.08203 1.42773 1.58984 1.73242 1.28516C2.06055 0.933594 2.56445 0.722656 3.24414 0.652344C3.87695 0.605469 4.62695 0.570313 5.49414 0.546875C6.36133 0.523437 7.07617 0.511719 7.63867 0.511719H8.48242C10.5918 0.511719 12.3496 0.558594 13.7559 0.652344C14.4121 0.722656 14.9043 0.933594 15.2324 1.28516C15.3262 1.37891 15.4082 1.49609 15.4785 1.63672C15.5488 1.75391 15.6074 1.88281 15.6543 2.02344C15.7012 2.14062 15.7363 2.25781 15.7598 2.375C15.7832 2.49219 15.8066 2.58594 15.8301 2.65625V2.76172ZM10.5215 5.85547L11.0137 5.60938L6.9707 3.5V7.71875L10.5215 5.85547Z\" fill=\"#23344D\"/>\n</svg>', 0, 'text', '2023-03-14 11:49:10', '2023-03-14 11:49:10', NULL, 0, 0, '#E4CD9F', 'social media', NULL),
(15, NULL, 'Youtube Video Tag', 'Improve your YouTube video\'s discoverability with relevant video tags. Boost views and engagement.', 'youtube_video_tag', 1, '[{\"name\":\"title\",\"type\":\"textarea\",\"question\":\"Title\",\"select\":\"\"}]', '<svg width=\"17\" height=\"11\" viewBox=\"0 0 17 11\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n<path d=\"M15.8301 2.76172C15.9473 3.58203 16.0059 4.39062 16.0059 5.1875V6.3125L15.8301 8.73828C15.7363 9.41797 15.5371 9.91016 15.2324 10.2148C14.9043 10.543 14.4121 10.7539 13.7559 10.8477C13.123 10.8945 12.3613 10.9297 11.4707 10.9531C10.6035 10.9766 9.88867 10.9883 9.32617 10.9883H8.48242C5.88086 10.9648 4.18164 10.918 3.38477 10.8477C3.38477 10.8477 3.29102 10.8359 3.10352 10.8125C2.91602 10.7891 2.76367 10.7656 2.64648 10.7422C2.5293 10.7188 2.37695 10.6602 2.18945 10.5664C2.02539 10.4727 1.87305 10.3555 1.73242 10.2148C1.61523 10.0742 1.49805 9.88672 1.38086 9.65234C1.28711 9.39453 1.22852 9.17188 1.20508 8.98438L1.13477 8.73828C1.04102 7.91797 0.994141 7.10938 0.994141 6.3125V5.1875L1.13477 2.76172C1.22852 2.08203 1.42773 1.58984 1.73242 1.28516C2.06055 0.933594 2.56445 0.722656 3.24414 0.652344C3.87695 0.605469 4.62695 0.570313 5.49414 0.546875C6.36133 0.523437 7.07617 0.511719 7.63867 0.511719H8.48242C10.5918 0.511719 12.3496 0.558594 13.7559 0.652344C14.4121 0.722656 14.9043 0.933594 15.2324 1.28516C15.3262 1.37891 15.4082 1.49609 15.4785 1.63672C15.5488 1.75391 15.6074 1.88281 15.6543 2.02344C15.7012 2.14062 15.7363 2.25781 15.7598 2.375C15.7832 2.49219 15.8066 2.58594 15.8301 2.65625V2.76172ZM10.5215 5.85547L11.0137 5.60938L6.9707 3.5V7.71875L10.5215 5.85547Z\" fill=\"#23344D\"/>\n</svg>', 0, 'text', '2023-03-14 11:50:15', '2023-03-14 11:50:15', NULL, 0, 0, '#E4CD9F', 'social media', NULL),
(16, NULL, 'Instagram Captions', 'Elevate your Instagram game with captivating captions. Generate unique captions that engage followers and increase your reach.', 'instagram_captions', 1, '[{\"name\":\"title\",\"type\":\"textarea\",\"question\":\"Title\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" data-name=\"Layer 1\" viewBox=\"0 0 24 24\" id=\"instagram\"><path d=\"M17.34,5.46h0a1.2,1.2,0,1,0,1.2,1.2A1.2,1.2,0,0,0,17.34,5.46Zm4.6,2.42a7.59,7.59,0,0,0-.46-2.43,4.94,4.94,0,0,0-1.16-1.77,4.7,4.7,0,0,0-1.77-1.15,7.3,7.3,0,0,0-2.43-.47C15.06,2,14.72,2,12,2s-3.06,0-4.12.06a7.3,7.3,0,0,0-2.43.47A4.78,4.78,0,0,0,3.68,3.68,4.7,4.7,0,0,0,2.53,5.45a7.3,7.3,0,0,0-.47,2.43C2,8.94,2,9.28,2,12s0,3.06.06,4.12a7.3,7.3,0,0,0,.47,2.43,4.7,4.7,0,0,0,1.15,1.77,4.78,4.78,0,0,0,1.77,1.15,7.3,7.3,0,0,0,2.43.47C8.94,22,9.28,22,12,22s3.06,0,4.12-.06a7.3,7.3,0,0,0,2.43-.47,4.7,4.7,0,0,0,1.77-1.15,4.85,4.85,0,0,0,1.16-1.77,7.59,7.59,0,0,0,.46-2.43c0-1.06.06-1.4.06-4.12S22,8.94,21.94,7.88ZM20.14,16a5.61,5.61,0,0,1-.34,1.86,3.06,3.06,0,0,1-.75,1.15,3.19,3.19,0,0,1-1.15.75,5.61,5.61,0,0,1-1.86.34c-1,.05-1.37.06-4,.06s-3,0-4-.06A5.73,5.73,0,0,1,6.1,19.8,3.27,3.27,0,0,1,5,19.05a3,3,0,0,1-.74-1.15A5.54,5.54,0,0,1,3.86,16c0-1-.06-1.37-.06-4s0-3,.06-4A5.54,5.54,0,0,1,4.21,6.1,3,3,0,0,1,5,5,3.14,3.14,0,0,1,6.1,4.2,5.73,5.73,0,0,1,8,3.86c1,0,1.37-.06,4-.06s3,0,4,.06a5.61,5.61,0,0,1,1.86.34A3.06,3.06,0,0,1,19.05,5,3.06,3.06,0,0,1,19.8,6.1,5.61,5.61,0,0,1,20.14,8c.05,1,.06,1.37.06,4S20.19,15,20.14,16ZM12,6.87A5.13,5.13,0,1,0,17.14,12,5.12,5.12,0,0,0,12,6.87Zm0,8.46A3.33,3.33,0,1,1,15.33,12,3.33,3.33,0,0,1,12,15.33Z\"></path></svg>', 0, 'text', '2023-03-14 11:50:52', '2023-03-14 11:50:52', NULL, 0, 0, '#E49FE1', 'social media', NULL),
(17, NULL, 'Instagram Hashtags', 'Boost your Instagram reach with relevant hashtags. Generate optimal, trending hashtags and increase your visibility.', 'instagram_hashtag', 1, '[{\"name\":\"keywords\",\"type\":\"textarea\",\"question\":\"Keywords (Separate with comma.)\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" data-name=\"Layer 1\" viewBox=\"0 0 24 24\" id=\"instagram\"><path d=\"M17.34,5.46h0a1.2,1.2,0,1,0,1.2,1.2A1.2,1.2,0,0,0,17.34,5.46Zm4.6,2.42a7.59,7.59,0,0,0-.46-2.43,4.94,4.94,0,0,0-1.16-1.77,4.7,4.7,0,0,0-1.77-1.15,7.3,7.3,0,0,0-2.43-.47C15.06,2,14.72,2,12,2s-3.06,0-4.12.06a7.3,7.3,0,0,0-2.43.47A4.78,4.78,0,0,0,3.68,3.68,4.7,4.7,0,0,0,2.53,5.45a7.3,7.3,0,0,0-.47,2.43C2,8.94,2,9.28,2,12s0,3.06.06,4.12a7.3,7.3,0,0,0,.47,2.43,4.7,4.7,0,0,0,1.15,1.77,4.78,4.78,0,0,0,1.77,1.15,7.3,7.3,0,0,0,2.43.47C8.94,22,9.28,22,12,22s3.06,0,4.12-.06a7.3,7.3,0,0,0,2.43-.47,4.7,4.7,0,0,0,1.77-1.15,4.85,4.85,0,0,0,1.16-1.77,7.59,7.59,0,0,0,.46-2.43c0-1.06.06-1.4.06-4.12S22,8.94,21.94,7.88ZM20.14,16a5.61,5.61,0,0,1-.34,1.86,3.06,3.06,0,0,1-.75,1.15,3.19,3.19,0,0,1-1.15.75,5.61,5.61,0,0,1-1.86.34c-1,.05-1.37.06-4,.06s-3,0-4-.06A5.73,5.73,0,0,1,6.1,19.8,3.27,3.27,0,0,1,5,19.05a3,3,0,0,1-.74-1.15A5.54,5.54,0,0,1,3.86,16c0-1-.06-1.37-.06-4s0-3,.06-4A5.54,5.54,0,0,1,4.21,6.1,3,3,0,0,1,5,5,3.14,3.14,0,0,1,6.1,4.2,5.73,5.73,0,0,1,8,3.86c1,0,1.37-.06,4-.06s3,0,4,.06a5.61,5.61,0,0,1,1.86.34A3.06,3.06,0,0,1,19.05,5,3.06,3.06,0,0,1,19.8,6.1,5.61,5.61,0,0,1,20.14,8c.05,1,.06,1.37.06,4S20.19,15,20.14,16ZM12,6.87A5.13,5.13,0,1,0,17.14,12,5.12,5.12,0,0,0,12,6.87Zm0,8.46A3.33,3.33,0,1,1,15.33,12,3.33,3.33,0,0,1,12,15.33Z\"></path></svg>', 0, 'text', '2023-03-14 11:52:48', '2023-03-14 11:52:48', NULL, 0, 0, '#E49FE1', 'social media', NULL),
(18, NULL, 'Social Media Post Tweet', 'Make an impact with every tweet. Generate attention-grabbing social media posts and increase engagement.', 'social_media_post_tweet', 1, '[{\"name\":\"title\",\"type\":\"textarea\",\"question\":\"Title\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" data-name=\"Layer 1\" viewBox=\"0 0 24 24\" id=\"twitter\"><path d=\"M22,5.8a8.49,8.49,0,0,1-2.36.64,4.13,4.13,0,0,0,1.81-2.27,8.21,8.21,0,0,1-2.61,1,4.1,4.1,0,0,0-7,3.74A11.64,11.64,0,0,1,3.39,4.62a4.16,4.16,0,0,0-.55,2.07A4.09,4.09,0,0,0,4.66,10.1,4.05,4.05,0,0,1,2.8,9.59v.05a4.1,4.1,0,0,0,3.3,4A3.93,3.93,0,0,1,5,13.81a4.9,4.9,0,0,1-.77-.07,4.11,4.11,0,0,0,3.83,2.84A8.22,8.22,0,0,1,3,18.34a7.93,7.93,0,0,1-1-.06,11.57,11.57,0,0,0,6.29,1.85A11.59,11.59,0,0,0,20,8.45c0-.17,0-.35,0-.53A8.43,8.43,0,0,0,22,5.8Z\"></path></svg>', 0, 'text', '2023-03-14 11:55:37', '2023-03-14 11:55:37', NULL, 0, 0, '#C2DEDE', 'social media', NULL),
(19, NULL, 'Social Media Post Business', 'Generate a text for your business social media networks. Maximize your social media presence with impactful business posts.', 'social_media_post_business', 1, '[{\"name\":\"company_name\",\"type\":\"text\",\"question\":\"Company Name\",\"select\":\"\"},{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Company Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M180 936q-24 0-42-18t-18-42V276q0-24 18-42t42-18h600q24 0 42 18t18 42v600q0 24-18 42t-42 18H180Zm100-160h200v-80H280v80Zm40-171 160-80 160 80V276H320v329Z\"/></svg>', 0, 'text', '2023-03-14 12:04:56', '2023-03-14 12:04:56', NULL, 0, 0, '#E3E49F', 'social media', NULL),
(20, NULL, 'Facebook Headlines', 'Get noticed with attention-grabbing Facebook headlines. Generate unique, clickable headlines that increase engagement and drive traffic.', 'facebook_headlines', 1, '[{\"name\":\"title\",\"type\":\"text\",\"question\":\"Title\",\"select\":\"\"},{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg width=\"9\" height=\"16\" viewBox=\"0 0 9 16\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n<path d=\"M5.66016 15.2383H2.88281V8.41797H0.5625V5.74609H2.88281V3.77734C2.88281 2.65234 3.19922 1.78516 3.83203 1.17578C4.46484 0.566406 5.30859 0.261719 6.36328 0.261719C7.20703 0.261719 7.89844 0.296875 8.4375 0.367188V2.72266L6.99609 2.75781C6.48047 2.75781 6.12891 2.86328 5.94141 3.07422C5.75391 3.28516 5.66016 3.60156 5.66016 4.02344V5.74609H8.33203L7.98047 8.41797H5.66016V15.2383Z\" fill=\"#23344D\"/>\n</svg>', 0, 'text', '2023-03-14 12:06:05', '2023-03-14 12:06:05', NULL, 0, 0, '#E8CEC3', 'social media', NULL),
(21, NULL, 'Google Ads Headlines', 'Create high-converting Google ads with captivating headlines. Generate unique, clickable ads that drive traffic and boost sales.', 'google_ads_headlines', 1, '[{\"name\":\"product_name\",\"type\":\"text\",\"question\":\"Product Name\",\"select\":\"\"},{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"},{\"name\":\"audience\",\"type\":\"select\",\"question\":\"Audience\",\"select\":\"\\n        <option value=\'everyone\'> Everyone </option>\\n        <option value=\'man\'> Man </option>\\n        <option value=\'woman\'> Woman </option>\\n        <option value=\'children\'> Children </option>\\n        <option value=\'teenager\'> Teenager </option>\\n        \"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"32\" height=\"32\" enable-background=\"new 0 0 32 32\" viewBox=\"0 0 32 32\" id=\"adwords\"><path fill=\"#263238\" d=\"M2.066 23.314c-.082 0-.166-.021-.242-.063-.242-.135-.329-.438-.194-.681L9.278 8.803c.134-.24.439-.326.68-.194.242.135.329.438.194.681L2.503 23.058C2.412 23.222 2.242 23.314 2.066 23.314zM9.933 27.686c-.082 0-.166-.021-.242-.063-.242-.135-.329-.438-.194-.681l4.796-8.634c.133-.24.438-.326.68-.194.242.135.329.438.194.681l-4.796 8.634C10.279 27.593 10.109 27.686 9.933 27.686z\"></path><path fill=\"#263238\" d=\"M15.709,15.761L9.497,26.942c-0.705,1.27-2.046,2.059-3.5,2.059c-0.674,0-1.345-0.175-1.939-0.505 c-1.928-1.07-2.625-3.511-1.554-5.438l7.578-13.639c0.134-0.241,0.047-0.546-0.194-0.681c-0.24-0.133-0.545-0.046-0.68,0.194 L1.629,22.571c-1.339,2.41-0.468,5.46,1.942,6.8c0.742,0.412,1.58,0.63,2.424,0.63c1.817,0,3.493-0.985,4.375-2.572 l5.921-10.658L15.709,15.761z\"></path><path fill=\"#263238\" d=\"M6 30c-2.757 0-5-2.243-5-5s2.243-5 5-5 5 2.243 5 5S8.757 30 6 30zM6 21c-2.206 0-4 1.794-4 4s1.794 4 4 4 4-1.794 4-4S8.206 21 6 21zM26.004 30.001c-1.817 0-3.493-.985-4.375-2.572l-10-18c-1.339-2.41-.468-5.46 1.942-6.8.742-.412 1.581-.631 2.425-.631 1.816 0 3.492.986 4.374 2.573l10 18c1.339 2.41.468 5.46-1.942 6.8C27.687 29.783 26.848 30.001 26.004 30.001zM15.997 2.998c-.675 0-1.345.175-1.94.506-1.928 1.07-2.625 3.511-1.554 5.438l10 18c.705 1.27 2.046 2.059 3.5 2.059.674 0 1.345-.175 1.939-.505 1.928-1.07 2.625-3.511 1.554-5.438l-10-18C18.792 3.787 17.451 2.998 15.997 2.998z\"></path></svg>', 0, 'text', '2023-03-14 12:10:42', '2023-03-14 12:10:42', NULL, 0, 0, '#D6C0A3', 'advertisement', NULL),
(22, NULL, 'Google Ads Description', 'Step up your Google ad game, Craft high-converting ad copy that grabs attention and drives sales.', 'google_ads_description', 1, '[{\"name\":\"product_name\",\"type\":\"text\",\"question\":\"Product Name\",\"select\":\"\"},{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"},{\"name\":\"audience\",\"type\":\"select\",\"question\":\"Audience\",\"select\":\"\\n        <option value=\'everyone\'> Everyone </option>\\n        <option value=\'man\'> Man </option>\\n        <option value=\'woman\'> Woman </option>\\n        <option value=\'children\'> Children </option>\\n        <option value=\'teenager\'> Teenager </option>\\n        \"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"32\" height=\"32\" enable-background=\"new 0 0 32 32\" viewBox=\"0 0 32 32\" id=\"adwords\"><path fill=\"#263238\" d=\"M2.066 23.314c-.082 0-.166-.021-.242-.063-.242-.135-.329-.438-.194-.681L9.278 8.803c.134-.24.439-.326.68-.194.242.135.329.438.194.681L2.503 23.058C2.412 23.222 2.242 23.314 2.066 23.314zM9.933 27.686c-.082 0-.166-.021-.242-.063-.242-.135-.329-.438-.194-.681l4.796-8.634c.133-.24.438-.326.68-.194.242.135.329.438.194.681l-4.796 8.634C10.279 27.593 10.109 27.686 9.933 27.686z\"></path><path fill=\"#263238\" d=\"M15.709,15.761L9.497,26.942c-0.705,1.27-2.046,2.059-3.5,2.059c-0.674,0-1.345-0.175-1.939-0.505 c-1.928-1.07-2.625-3.511-1.554-5.438l7.578-13.639c0.134-0.241,0.047-0.546-0.194-0.681c-0.24-0.133-0.545-0.046-0.68,0.194 L1.629,22.571c-1.339,2.41-0.468,5.46,1.942,6.8c0.742,0.412,1.58,0.63,2.424,0.63c1.817,0,3.493-0.985,4.375-2.572 l5.921-10.658L15.709,15.761z\"></path><path fill=\"#263238\" d=\"M6 30c-2.757 0-5-2.243-5-5s2.243-5 5-5 5 2.243 5 5S8.757 30 6 30zM6 21c-2.206 0-4 1.794-4 4s1.794 4 4 4 4-1.794 4-4S8.206 21 6 21zM26.004 30.001c-1.817 0-3.493-.985-4.375-2.572l-10-18c-1.339-2.41-.468-5.46 1.942-6.8.742-.412 1.581-.631 2.425-.631 1.816 0 3.492.986 4.374 2.573l10 18c1.339 2.41.468 5.46-1.942 6.8C27.687 29.783 26.848 30.001 26.004 30.001zM15.997 2.998c-.675 0-1.345.175-1.94.506-1.928 1.07-2.625 3.511-1.554 5.438l10 18c.705 1.27 2.046 2.059 3.5 2.059.674 0 1.345-.175 1.939-.505 1.928-1.07 2.625-3.511 1.554-5.438l-10-18C18.792 3.787 17.451 2.998 15.997 2.998z\"></path></svg>', 0, 'text', '2023-03-14 12:11:58', '2023-03-14 12:11:58', NULL, 0, 0, '#D6C0A3', 'advertisement', NULL),
(23, NULL, 'Paragraph Generator', 'Generate a paragraph with keywords and description. Never struggle with writer\'s block again. Generate flawless paragraphs that captivate readers.', 'paragraph_generator', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"},{\"name\":\"keywords\",\"type\":\"textarea\",\"question\":\"Keywords (Separate with comma.)\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M160 684v-60h640v60H160Zm0 160v-60h640v60H160Zm0-316v-60h640v60H160Zm0-160v-60h640v60H160Z\"/></svg>', 0, 'text', '2023-03-14 12:17:21', '2023-03-14 12:17:21', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(24, NULL, 'Pros & Cons', 'Make informed decisions with ease. Generate unbiased pros and cons lists that help you weigh options and make better choices.', 'pros_cons', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"},{\"name\":\"title\",\"type\":\"text\",\"question\":\"Title\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M443 936q-17 0-32-6.5T385 912L203 719l32-33q11-11 25-13.5t29 .5l114 25V276q0-26 17-43t43-17q26 0 43 17t17 43v240h36q11 0 19 1.5t17 6.5l163 82q24 12 36 35t8 49l-26 180q-5 29-28 47.5T696 936H443Zm-26-60h281l43-249-183-91h-55V316q0-18-11-29t-29-11q-18 0-29 11t-11 29v399l-154-33-23 23 171 171Zm0 0L246 705l23-23 154 33V316q0-18 11-29t29-11q18 0 29 11t11 29v220h55l183 91-43 249H417Z\"/></svg>', 0, 'text', '2023-03-14 12:21:00', '2023-03-14 12:21:00', NULL, 0, 0, '#E0BFC9', 'development', NULL),
(25, NULL, 'Meta Description', 'Get more clicks with compelling meta descriptions. Generate unique, SEO-friendly meta descriptions that attract customers and boost traffic.', 'meta_description', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"},{\"name\":\"title\",\"type\":\"text\",\"question\":\"Title\",\"select\":\"\"},{\"name\":\"keywords\",\"type\":\"text\",\"question\":\"Keywords (Separate with comma)\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M319 806h322v-60H319v60Zm0-170h322v-60H319v60Zm-99 340q-24 0-42-18t-18-42V236q0-24 18-42t42-18h361l219 219v521q0 24-18 42t-42 18H220Zm331-554V236H220v680h520V422H551ZM220 236v186-186 680-680Z\"/></svg>', 0, 'text', '2023-03-14 13:17:43', '2023-03-14 13:17:43', NULL, 0, 0, '#A3D6C2', 'development', NULL),
(26, NULL, 'FAQ Generator (All Datas)', 'Quickly create helpful FAQs. Our AI-powered generator provides custom responses to common questions in seconds.', 'faq_generator', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"},{\"name\":\"title\",\"type\":\"text\",\"question\":\"Title (Faq Question)\",\"select\":\"\"}]', '<svg width=\"13\" height=\"13\" viewBox=\"0 0 13 13\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n<path d=\"M8.62695 5.87109C8.04102 6.45703 7.32617 6.75 6.48242 6.75C5.66211 6.75 4.95898 6.45703 4.37305 5.87109C3.78711 5.28516 3.49414 4.58203 3.49414 3.76172C3.49414 2.91797 3.78711 2.20313 4.37305 1.61719C4.95898 1.03125 5.66211 0.738281 6.48242 0.738281C7.32617 0.738281 8.04102 1.03125 8.62695 1.61719C9.21289 2.20313 9.50586 2.91797 9.50586 3.76172C9.50586 4.58203 9.21289 5.28516 8.62695 5.87109ZM4.05664 8.57812C4.94727 8.36719 5.75586 8.26172 6.48242 8.26172C7.23242 8.26172 8.05273 8.36719 8.94336 8.57812C9.83398 8.78906 10.6426 9.14062 11.3691 9.63281C12.1191 10.1016 12.4941 10.6406 12.4941 11.25V12.7617H0.505859V11.25C0.505859 10.6406 0.869141 10.1016 1.5957 9.63281C2.3457 9.14062 3.16602 8.78906 4.05664 8.57812Z\" fill=\"#23344D\"/>\n</svg>', 0, 'text', '2023-03-14 13:19:40', '2023-03-14 13:19:40', NULL, 0, 0, '#D6D2A3', 'development', NULL),
(27, NULL, 'Email Generator', 'Generate an email with your subject and description. Streamline your inbox and save time.', 'email_generator', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"},{\"name\":\"subject\",\"type\":\"text\",\"question\":\"Subject of Email\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M140 896q-24 0-42-18t-18-42V316q0-24 18-42t42-18h680q24 0 42 18t18 42v520q0 24-18 42t-42 18H140Zm340-302 340-223v-55L480 534 140 316v55l340 223Z\"/></svg>', 0, 'text', '2023-03-14 13:22:21', '2023-03-14 13:22:21', NULL, 0, 0, '#D1C5DE', 'email', NULL),
(28, NULL, 'Email Answer Generator', 'Effortlessly tackle your overflowing inbox with custom, accurate responses to common queries, freeing you up to focus on what matters most.', 'email_answer_generator', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description (Receieved Email)\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M140 896q-24 0-42-18t-18-42V316q0-24 18-42t42-18h680q24 0 42 18t18 42v520q0 24-18 42t-42 18H140Zm340-302 340-223v-55L480 534 140 316v55l340 223Z\"/></svg>', 0, 'text', '2023-03-14 13:24:20', '2023-03-14 13:24:20', NULL, 0, 0, '#D1C5DE', 'email', NULL),
(29, NULL, 'Newsletter Generator', 'Generate engaging newsletters easily with personalized content that resonates with your audience, driving growth and engagement.', 'newsletter_generator', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"},{\"name\":\"title\",\"type\":\"text\",\"question\":\"Title\",\"select\":\"\"},{\"name\":\"subject\",\"type\":\"text\",\"question\":\"Subject\",\"select\":\"\"}]', '<svg width=\"17\" height=\"14\" viewBox=\"0 0 17 14\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n<path d=\"M0.625 13.5V8.26172L11.875 6.75L0.625 5.23828V0L16.375 6.75L0.625 13.5Z\" fill=\"#23344D\"/>\n</svg>', 0, 'text', '2023-03-14 13:26:49', '2023-03-14 13:26:49', NULL, 0, 0, '#E1D5F4', 'email', NULL),
(30, NULL, 'Grammar Correction', 'Eliminate grammar errors and enhance your writing with ease. Our tool offers seamless grammar correction for flawless content.', 'grammar_correction', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg width=\"17\" height=\"18\" viewBox=\"0 0 17 18\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n<path d=\"M4.75586 8.01172V9.48828H0.255859V8.01172H4.75586ZM6.37305 5.58594L5.31836 6.64062L3.73633 5.02344L4.79102 3.96875L6.37305 5.58594ZM9.25586 0.488281V4.98828H7.74414V0.488281H9.25586ZM13.2637 5.02344L11.6816 6.64062L10.627 5.58594L12.209 3.96875L13.2637 5.02344ZM12.2441 8.01172H16.7441V9.48828H12.2441V8.01172ZM6.90039 7.16797C7.3457 6.72266 7.87305 6.5 8.48242 6.5C9.11523 6.5 9.6543 6.72266 10.0996 7.16797C10.5449 7.58984 10.7676 8.11719 10.7676 8.75C10.7676 9.38281 10.5449 9.92188 10.0996 10.3672C9.6543 10.7891 9.11523 11 8.48242 11C7.87305 11 7.3457 10.7891 6.90039 10.3672C6.47852 9.92188 6.26758 9.38281 6.26758 8.75C6.26758 8.11719 6.47852 7.58984 6.90039 7.16797ZM10.627 11.9141L11.6816 10.8594L13.2637 12.4766L12.209 13.5312L10.627 11.9141ZM3.73633 12.4766L5.31836 10.8594L6.37305 11.9141L4.79102 13.5312L3.73633 12.4766ZM7.74414 17.0117V12.5117H9.25586V17.0117H7.74414Z\" fill=\"#23344D\"/>\n</svg>', 0, 'text', '2023-03-14 13:29:15', '2023-03-14 13:29:15', NULL, 0, 0, '#D6C0A3', 'blog', NULL),
(31, NULL, 'TL;DR Summarization', 'Automatically summarize long texts into bite-sized summaries with this TL;DR generator.', 'tldr_summarization', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M160 666v-60h389v60H160Zm0-120v-60h640v60H160Z\"/></svg>', 0, 'text', '2023-03-14 13:30:44', '2023-03-14 13:30:44', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(32, NULL, 'AI Image Generator', 'Create stunning images in seconds.', 'ai_image_generator', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Describe the Image\",\"select\":\"\"},{\"name\":\"size\",\"type\":\"select\",\"question\":\"Image Resolution\",\"select\":\"<option value=\'256x256\'>256x256</option><option value=\'512x512\'>512x512</option><option value=\'1024x1024\'>1024x1024</option>\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M180 936q-24 0-42-18t-18-42V276q0-24 18-42t42-18h600q24 0 42 18t18 42v600q0 24-18 42t-42 18H180Zm56-157h489L578 583 446 754l-93-127-117 152Z\"/></svg>', 0, 'image', '2023-03-20 13:22:02', '2023-03-20 13:22:02', NULL, 0, 0, '#D1C5DE', 'development', NULL),
(33, NULL, 'Custom Generation', 'Create your own custom generator with AI! Our app allows you to quickly and easily generate unique content in any language.', 'custom-generation-eQao5n', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Description\",\"description\":\"Description for prompt\"},{\"name\":\"description-second\",\"type\":\"textarea\",\"question\":\"Description Second\",\"description\":\"Description Second for prompt\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"40\" viewBox=\"0 96 960 960\" width=\"40\"><path d=\"M424 962.333V705h93.666v83H860v93.666H517.666v80.667H424ZM99.667 881.666V788H372v93.666H99.667Zm178.667-178.333V622H99.667v-92.666h178.667v-82H372v255.999h-93.666ZM424 622v-92.666h436V622H424Zm163.667-175.667V189h93.666v81.334H860V364H681.333v82.333h-93.666ZM99.667 364v-93.666h436V364h-436Z\"/></svg>', 0, 'text', '2023-04-04 21:49:28', '2023-05-12 14:49:22', 'write a text about   **description**  and  **description-second**', 1, 0, '#F4E8A4', 'Custom', NULL),
(34, NULL, 'AI Speech to Text', 'The AI app that turns audio speech into text with ease.', 'ai_speech_to_text', 1, '[{\"name\":\"file\",\"type\":\"file\",\"question\":\"Upload an Audio File (mp3, mp4, mpeg, mpga, m4a, wav, and webm)(Max: 25Mb)\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M140 976q-24.75 0-42.375-17.625T80 916V236q0-24.75 17.625-42.375T140 176h380l-60 60H140v680h480V776h60v140q0 24.75-17.625 42.375T620 976H140Zm100-170v-60h280v60H240Zm0-120v-60h200v60H240Zm380 10L460 536H320V336h140l160-160v520Zm60-92V258q56 21 88 74t32 104q0 51-35 101t-85 67Zm0 142v-62q70-25 125-90t55-158q0-93-55-158t-125-90v-62q102 27 171 112.5T920 436q0 112-69 197.5T680 746Z\"/></svg>', 0, 'audio', '2023-04-08 19:30:04', '2023-05-09 15:38:40', NULL, 0, 0, '#DEFF81', 'blog', NULL),
(35, NULL, 'AI Code Generator', 'Create custom code in seconds! Leverage our state-of-the-art AI technology to quickly and easily generate code in any language.', 'ai_code_generator', 1, '[{\"name\":\"description\",\"type\":\"textarea\",\"question\":\"Describe What Kind of Code You Need\",\"select\":\"\"},{\"name\":\"code_language\",\"type\":\"text\",\"question\":\"Coding Language (Java, PHP etc.)\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"40\" viewBox=\"0 96 960 960\" width=\"40\"><path d=\"M196.666 965.333q-43.824 0-74.912-31.087-31.087-31.088-31.087-74.912V701.667h105.999v157.667h157.667v105.999H196.666Zm409.001 0V859.334h157.667V701.667H870v157.667q0 43.824-31.284 74.912-31.283 31.087-75.382 31.087H605.667ZM344 739.333 180.667 576 344 412.667 418.333 489l-86 87 86 87L344 739.333Zm272 0L541.667 663l86-87-86-87L616 412.667 779.333 576 616 739.333Zm-525.333-289V292.666q0-44.099 31.087-75.382Q152.842 186 196.666 186h157.667v106.666H196.666v157.667H90.667Zm672.667 0V292.666H605.667V186h157.667q44.099 0 75.382 31.284Q870 248.567 870 292.666v157.667H763.334Z\"/></svg>', 0, 'code', '2023-04-12 19:58:19', '2023-05-06 21:43:02', NULL, 0, 0, '#81FFC2', 'development', NULL),
(36, NULL, 'AI Article Wizard Generator', 'Create custom article instantly with our article wizard generator. Boost engagement and save time.', 'ai_article_wizard_generator', 1, '[{\"name\":\"your_description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M430 896V356H200V256h560v100H530v540H430Z\"/></svg>', 0, 'text', '2023-09-20 08:26:49', '2023-09-20 08:26:49', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(37, NULL, 'AI Vision', 'Elevate your visual analytics with our AI Vision platform. Harness the power of machine learning for real-time image recognition and data insights. Enhance efficiency and decision-making.', 'ai_vision', 1, '[{\"name\":\"your_description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" \n width=\"48\" height=\"48\" stroke-width=\"2\" stroke=\"black\" fill=\"none\" viewBox=\"0 0 24 24\"><path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"/><path d=\"M6 4l6 16l6 -16\" /></svg>', 0, 'text', '2023-09-20 08:26:49', '2023-09-20 08:26:49', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(38, NULL, 'File Analyzer', 'Simply upload a file (PDF, CSV, .doc or .docx) and extract key insights or summarize the entire document.', 'ai_pdf', 1, '[{\"name\":\"your_description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" \n width=\"48\" height=\"48\" stroke-width=\"2\" stroke=\"black\" fill=\"none\" viewBox=\"0 0 24 24\"><path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"/><path d=\"M6 4l6 16l6 -16\" /></svg>', 0, 'text', '2023-09-20 08:26:49', '2023-09-20 08:26:49', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(39, NULL, 'Chat Image', 'Generate Image by user input', 'ai_chat_image', 1, '[{\"name\":\"your_description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" \n width=\"48\" height=\"48\" stroke-width=\"2\" stroke=\"black\" fill=\"none\" viewBox=\"0 0 24 24\"><path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"/><path d=\"M6 4l6 16l6 -16\" /></svg>', 0, 'text', '2023-09-20 08:26:49', '2023-09-20 08:26:49', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(40, NULL, 'AI ReWriter', 'Rewrite more professional and detailed content instantly with our ai rewriter. Boost engagement and save time.', 'ai_rewriter', 1, '[{\"name\":\"your_description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M430 896V356H200V256h560v100H530v540H430Z\"/></svg>', 0, 'text', '2023-09-20 08:26:49', '2023-09-20 08:26:49', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(41, NULL, 'AI Web Chat', 'Analyze web page content with url', 'ai_webchat', 1, '[{\"name\":\"your_description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" \n width=\"48\" height=\"48\" stroke-width=\"2\" stroke=\"black\" fill=\"none\" viewBox=\"0 0 24 24\"><path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"/><path d=\"M6 4l6 16l6 -16\" /></svg>', 0, 'text', '2023-09-20 08:26:49', '2023-09-20 08:26:49', NULL, 0, 0, '#A3D6C2', 'blog', NULL),
(42, NULL, 'AI Video', 'Bring your static images to life and create visually compelling videos effortlessly.', 'ai_video', 1, '[{\"name\":\"your_description\",\"type\":\"textarea\",\"question\":\"Description\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" \n width=\"48\" height=\"48\" stroke-width=\"2\" stroke=\"black\" fill=\"none\" viewBox=\"0 0 24 24\"><path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"/><path d=\"M6 4l6 16l6 -16\" /></svg>', 0, 'video', '2023-09-20 08:26:49', '2023-09-20 08:26:49', NULL, 0, 0, '#A3D6C2', 'video', NULL),
(43, NULL, 'AI Voiceover', 'The AI app that turns text into audio speech with ease. Get ready to generate custom audios from texts quickly and accurately.', 'ai_voiceover', 1, '[{\"name\":\"file\",\"type\":\"file\",\"question\":\"Upload an Audio File (mp3, mp4, mpeg, mpga, m4a, wav, and webm)(Max: 25Mb)\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M140 976q-24.75 0-42.375-17.625T80 916V236q0-24.75 17.625-42.375T140 176h380l-60 60H140v680h480V776h60v140q0 24.75-17.625 42.375T620 976H140Zm100-170v-60h280v60H240Zm0-120v-60h200v60H240Zm380 10L460 536H320V336h140l160-160v520Zm60-92V258q56 21 88 74t32 104q0 51-35 101t-85 67Zm0 142v-62q70-25 125-90t55-158q0-93-55-158t-125-90v-62q102 27 171 112.5T920 436q0 112-69 197.5T680 746Z\"/></svg>', 0, 'voiceover', '2024-03-01 11:35:52', '2024-03-01 11:35:52', '', 0, 0, '#DEFF81', 'voiceover', NULL),
(44, NULL, 'AI YouTube', 'Simply turn your Youtube videos into Blog post.', 'ai_youtube', 1, '[{\"name\":\"url\",\"type\":\"url\",\"question\":\"YouTube Video URL\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"44\" height=\"44\" viewBox=\"0 0 24 24\" stroke-width=\"1.5\" stroke=\"#2c3e50\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"/><path d=\"M2 8a4 4 0 0 1 4 -4h12a4 4 0 0 1 4 4v8a4 4 0 0 1 -4 4h-12a4 4 0 0 1 -4 -4v-8z\" /><path d=\"M10 9l5 3l-5 3z\" /></svg>', 0, 'youtube', '2024-03-01 11:59:52', '2024-03-01 11:59:52', '', 0, 0, '#FFB0B0', 'youtube', NULL),
(45, NULL, 'AI RSS', 'Generate unique content with RSS Feed.', 'ai_rss', 1, '[{\"name\":\"rss_feed\",\"type\":\"rss_feed\",\"question\":\"URL\",\"select\":\"\"},{\"name\":\"title\",\"type\":\"select\",\"question\":\"Fetched Post Title\",\"select\":\"<option value=\\\"\\\">Enter the Feed URL, please!</option>\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"44\" height=\"44\" viewBox=\"0 0 24 24\" stroke-width=\"1.5\" stroke=\"#2c3e50\" fill=\"none\" stroke-linecap=\"round\" stroke-linejoin=\"round\"><path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"/><path d=\"M5 19m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0\" /><path d=\"M4 4a16 16 0 0 1 16 16\" /><path d=\"M4 11a9 9 0 0 1 9 9\" /></svg>', 0, 'rss', '2024-02-22 19:43:17', '2024-04-01 11:17:54', NULL, 0, 0, '#FF9E4D', 'rss', NULL),
(46, NULL, 'AI Voice Isolator', 'Separate voices from background noise in audio recordings.', 'ai_voice_isolator', 1, '[{\"name\":\"file\",\"type\":\"file\",\"question\":\"Upload an Audio File (mp3, mp4, mpeg, mpga, m4a, wav, and webm)(Max: 500Mb)\",\"select\":\"\"}]', '<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"48\" viewBox=\"0 96 960 960\" width=\"48\"><path d=\"M140 976q-24.75 0-42.375-17.625T80 916V236q0-24.75 17.625-42.375T140 176h380l-60 60H140v680h480V776h60v140q0 24.75-17.625 42.375T620 976H140Zm100-170v-60h280v60H240Zm0-120v-60h200v60H240Zm380 10L460 536H320V336h140l160-160v520Zm60-92V258q56 21 88 74t32 104q0 51-35 101t-85 67Zm0 142v-62q70-25 125-90t55-158q0-93-55-158t-125-90v-62q102 27 171 112.5T920 436q0 112-69 197.5T680 746Z\"/></svg>', 0, 'isolator', '2024-12-24 17:25:28', '2024-12-24 17:25:28', '', 0, 0, '#DEFF81', 'voice', NULL);

INSERT INTO `openai_chat_category` (`id`, `user_id`, `chatbot_id`, `name`, `short_name`, `slug`, `description`, `instructions`, `first_message`, `role`, `human_name`, `helps_with`, `prompt_prefix`, `image`, `color`, `created_at`, `updated_at`, `chat_completions`, `plan`, `category`, `assistant`) VALUES
(1, NULL, NULL, 'Default AI Chat Bot', 'ACB', 'ai-chat-bot', 'Default', NULL, NULL, 'default', '', '', '', '', '#A3D6C2', '2023-05-16 03:34:57', '2023-05-16 03:39:11', NULL, NULL, NULL, NULL),
(2, NULL, NULL, 'Finance Expert', 'FE', 'finance-expert', 'Personal Finance Expert', NULL, NULL, 'Finance Expert', 'Allison Burgers', 'I can help you with managing your finance', 'As a personal finance expert,', NULL, '#DBD5F5', '2023-05-16 03:34:57', '2023-05-16 03:39:11', NULL, NULL, NULL, NULL),
(3, NULL, NULL, 'Nutritionist', 'N', 'nutritionist', 'Personal Nutritionist', NULL, NULL, 'Nutritionist', 'Employes Mustwashhands', 'I can assist you with nutrition-related information or questions', 'As a nutritionist,', NULL, '#EDBBBE', '2023-05-16 03:34:57', '2023-05-16 03:39:11', NULL, NULL, NULL, NULL),
(4, NULL, NULL, 'Career Counselor', 'CC', 'career-counselor', 'Personal Career Counselor', NULL, NULL, 'Career Counselor', 'Neil Feetstrong', 'I can assist you with your career-related inquiries or concerns', 'As a career counselor,', NULL, '#D4D4E2', '2023-05-16 03:34:57', '2023-05-16 03:39:11', NULL, NULL, NULL, NULL),
(5, NULL, NULL, 'Time Management Consultant', 'TMC', 'time-management-consultant', 'Personal Time Management Consultant', NULL, NULL, 'Time Management Consultant', 'Sarman Yellow', 'I can assist you with improving your time management skills or addressing any time management challenges you may be facing', 'As a time management consultant,', NULL, '#D6CBA3', '2023-05-16 03:34:57', '2023-05-16 03:39:11', NULL, NULL, NULL, NULL),
(6, NULL, NULL, 'Language Tutor', 'LT', 'language-tutor', 'Personal Language Tutor', NULL, NULL, 'Language Tutor', 'Sherlock Jonas', 'I can assist you with your language learning goals or provide guidance on language-related topics', 'As a language tutor,', NULL, '#EACCEB', '2023-05-16 03:34:57', '2023-05-16 03:39:11', NULL, NULL, NULL, NULL),
(7, NULL, NULL, 'Cybersecurity Expert', 'CE', 'cybersecurity-expert', 'Cybersecurity Expert', NULL, NULL, 'Cybersecurity Expert', 'Mr. Robot', 'I can assist you with your cybersecurity concerns or provide information and guidance related to cybersecurity', 'As a cybersecurity expert, ', NULL, '#BDE3E3', '2023-05-16 03:34:57', '2023-05-16 03:39:11', NULL, NULL, NULL, NULL),
(8, NULL, NULL, 'Interior Designer', 'ID', 'interior-designer', 'Personal Interior Designer', NULL, NULL, 'Interior Designer', 'Olivia Sinclair', 'I can assist you with your interior design needs or provide guidance on creating beautiful and functional spaces', 'As an interior designer, ', NULL, '#F0D1CD', '2023-05-16 03:34:57', '2023-05-16 03:39:11', NULL, NULL, NULL, NULL),
(9, NULL, NULL, 'Parenting Coach', 'PC', 'parenting-coach', 'Personal Parenting Coach', NULL, NULL, 'Parenting Coach', 'Alexandra Stevens', 'I can assist you with your parenting questions or provide guidance and support in raising children', 'As a parenting coach, ', NULL, '#A3D6C2', '2023-05-16 03:34:57', '2023-05-16 03:39:11', NULL, NULL, NULL, NULL),
(10, NULL, NULL, 'Fitness Trainer', 'FT', 'fitness-trainer', 'Personal Fitness Trainer', NULL, NULL, 'Fitness Trainer', 'Mert Karapinar', 'I can assist you with your fitness goals or provide guidance and advice on exercise, nutrition, and overall wellness', 'As a fitness trainer, ', NULL, '#D2D6DF', '2023-05-16 03:34:57', '2023-05-16 03:39:11', NULL, NULL, NULL, NULL),
(11, NULL, NULL, 'Travel Advisor', 'TA', 'travel-advisor', 'Personal Travel Advisor', NULL, NULL, 'Travel Advisor', 'Bilbo Harries', 'I can assist you with your travel plans, provide destination recommendations, or offer guidance on travel-related inquiries', 'As a travel advisor,', NULL, '#BFE3EB', '2023-05-16 03:34:57', '2023-05-16 03:34:57', NULL, NULL, NULL, NULL),
(12, NULL, NULL, 'Sustainability Expert', 'SE', 'sustainability-expert', 'Sustainability Expert', NULL, NULL, 'Sustainability Expert', 'Viabil Ity', 'I can assist you with your sustainability goals, provide information on sustainable practices, or offer guidance on living a more environmentally friendly lifestyle', 'As a sustainability expert', NULL, '#ECDBC1', '2023-05-16 03:34:57', '2023-05-16 03:34:57', NULL, NULL, NULL, NULL),
(13, NULL, NULL, 'Event Planner', 'EP', 'event planner', 'Event Planner', NULL, NULL, 'Event Planner', 'Jack Groomer', 'I can assist you with planning and organizing your upcoming event, providing advice on event management, or offering guidance on creating memorable and successful events', 'As an event planner,', NULL, '#E3E3BD', '2023-05-16 03:34:57', '2023-05-16 03:34:57', NULL, NULL, NULL, NULL),
(14, NULL, NULL, 'VisionAI', 'VI', 'ai_vision', 'Image PDF Expert', NULL, NULL, 'Image Expert', 'VisionAI', 'I can assist you with PDF or Images-related information or questions', 'As a VisionAI,', 'assets/img/vision.png', '#EDBBBE', '2023-05-16 03:34:57', '2023-05-16 03:39:11', '[{\"role\": \"system\", \"content\": \"You are a Vision AI assistant.\"}, {\"role\": \"user\", \"content\": \"What objects are present in this image?\"}, {\"role\": \"assistant\", \"content\": \"The image contains various objects, including a person, a car, and a building.\"}, {\"role\": \"user\", \"content\": \"Can you describe the color of the car?\"}, {\"role\": \"assistant\", \"content\": \"The car in the image appears to be red.\"}]', NULL, NULL, NULL),
(15, NULL, NULL, 'File Analyzer', 'FA', 'ai_pdf', 'I can assist you with PDF, DOC, DOCX or CSV information or questions', NULL, NULL, 'File Analyzer', 'File Analyzer', 'I can assist you with PDF, DOC, DOCX or CSV information or questions', 'As a File Analyzer', 'assets/img/vision.png', '#EDBBBE', '2023-05-16 03:34:57', '2023-05-16 03:39:11', '[{\"role\": \"system\", \"content\": \"You are a PDF AI assistant.\"}]', NULL, NULL, NULL),
(16, NULL, NULL, 'Chat Image', 'CI', 'ai_chat_image', 'Image Generator', NULL, NULL, 'Image Generator', 'Image Generator', 'I can assist to generate image by user input', 'As a Pdf AI,', 'assets/img/vision.png', '#EDBBBE', '2023-05-16 03:34:57', '2023-05-16 03:39:11', '[{\"role\": \"system\", \"content\": \"You are a Chat Image assistant.\"}]', '', '', NULL),
(17, NULL, NULL, 'WebChat', 'WC', 'ai_webchat', 'AI Web Chat', NULL, NULL, 'Web Analyzer', 'AI Web Chat', 'I can assist you with web page content analyzation', 'As a WebPage analyzer,', 'assets/img/vision.png', '#EDBBBE', '2023-05-16 03:34:57', '2023-05-16 03:39:11', '[{\"role\": \"system\", \"content\": \"You are a Web Page Analyzer assistant.\"}]', '', '', NULL);

INSERT INTO `openai_filters` (`id`, `user_id`, `name`) VALUES
(1, NULL, 'blog'),
(2, NULL, 'ecommerce'),
(3, NULL, 'development'),
(4, NULL, 'advertisement'),
(5, NULL, 'Custom'),
(6, NULL, 'social media'),
(7, NULL, 'voiceover'),
(8, NULL, 'youtube'),
(9, NULL, 'rss');

INSERT INTO `pages` (`id`, `title`, `content`, `slug`, `status`, `created_at`, `updated_at`, `titlebar_status`, `is_custom`, `show_on_footer`) VALUES
(1, 'About', '<p><img style=\"display: block; border-radius: 25px; margin-left: auto; margin-right: auto;\" src=\"https://aidefault.liquid-themes.com/wp-content/uploads/2023/08/img-1.jpg\" alt=\"\" width=\"1450\" height=\"761\"></p>\r\n<p style=\"text-align: center;\"><span class=\"highlight\">About Us</span></p>\r\n<h1 style=\"text-align: center;\">Shaping the future 🏔️</h1>\r\n<p class=\"leading\" style=\"max-width: 80%; margin-left: auto; margin-right: auto; text-align: center;\">Whether&nbsp;you&rsquo;re&nbsp;a&nbsp;content&nbsp;creator,&nbsp;business&nbsp;owner,&nbsp;or&nbsp;student, <span style=\"color: rgb(89, 89, 89);\">our&nbsp;text&nbsp;generator&nbsp;is&nbsp;an&nbsp;essential&nbsp;tool&nbsp;for&nbsp;boosting&nbsp;your&nbsp;productivity.</span></p>\r\n<hr>\r\n<p>&nbsp;</p>\r\n<p><span class=\"highlight\">Who Are We<br></span></p>\r\n<p class=\"leading\">At MagicAI, we are passionate about harnessing the power of artificial intelligence to unlock limitless creativity and efficiency.<span style=\"color: rgb(89, 89, 89);\"> Our cutting-edge AI Generators are designed to revolutionize the way you create, streamline your workflows, and supercharge your productivity.</span></p>\r\n<p>Our mission is to empower individuals and businesses to unleash their creative potential and achieve extraordinary results.</p>\r\n<p>We believe that AI has the ability to augment human capabilities, enhance decision-making processes, and accelerate innovation.</p>\r\n<p>By developing state-of-the-art AI Generators, we aim to democratize access to advanced AI technologies, enabling users from all backgrounds to excel in their creative endeavors.</p>\r\n<p>&nbsp;</p>\r\n<hr>\r\n<p>&nbsp;</p>\r\n<p><span class=\"highlight\">Invite a Friend</span></p>\r\n<h3>Our Mission</h3>\r\n<p class=\"leading\">We pride ourselves on offering AI Generators that are unmatched in their quality, <span style=\"color: rgb(89, 89, 89);\">versatility, and ease of use. Here&rsquo;s what sets us apart from the competition:</span></p>\r\n<p>With our AI Generators, the possibilities are endless. From generating compelling marketing copy and designing stunning visuals to automating data analysis and creating personalized user experiences, our tools will transform the way you work and help you achieve remarkable outcomes.</p>\r\n<p>Join our community of innovators, creators, and forward-thinkers who are leveraging the power of AI to revolutionize their industries. Start your journey with MagicAI today and unlock the full potential of AI Generators.</p>\r\n<p>Ready to experience the future of creativity? Sign up now and embark on an exciting adventure of limitless possibilities.</p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\"><span class=\"info-box\">Still have a question? <span style=\"color: rgb(8, 53, 248);\"><a style=\"color: rgb(8, 53, 248);\" href=\"#\">Browse documentation</a></span> or <span style=\"color: rgb(8, 53, 248);\"><a style=\"color: rgb(8, 53, 248);\" href=\"#\">submit a ticket</a></span>.</span></p>\r\n<p>&nbsp;</p>\r\n<hr>\r\n<p>&nbsp;</p>\r\n<table style=\"border-collapse: collapse; width: 100%; border-width: 0px; border-style: none;\" border=\"1\"><colgroup><col style=\"width: 20%;\"><col style=\"width: 20%;\"><col style=\"width: 20%;\"><col style=\"width: 20%;\"><col style=\"width: 20%;\"></colgroup>\r\n<tbody>\r\n<tr style=\"text-align: center;\">\r\n<td style=\"border-width: 0px; text-align: center;\"><img src=\"https://aidefault.liquid-themes.com/wp-content/uploads/2023/08/Path-143406.svg\" alt=\"\" width=\"79\" height=\"28\"></td>\r\n<td style=\"border-width: 0px; text-align: center;\"><img src=\"https://aidefault.liquid-themes.com/wp-content/uploads/2023/08/Path-159906.svg\" alt=\"\" width=\"48\" height=\"48\"></td>\r\n<td style=\"border-width: 0px; text-align: center;\"><img src=\"https://aidefault.liquid-themes.com/wp-content/uploads/2023/08/Path-159907.svg\" alt=\"\" width=\"55\" height=\"34\"></td>\r\n<td style=\"border-width: 0px; text-align: center;\"><img src=\"https://aidefault.liquid-themes.com/wp-content/uploads/2023/08/Path-159908.svg\" alt=\"\" width=\"47\" height=\"48\"></td>\r\n<td style=\"border-width: 0px; text-align: center;\"><img src=\"https://aidefault.liquid-themes.com/wp-content/uploads/2023/08/Path-159909.svg\" alt=\"\" width=\"80\" height=\"20\"></td>\r\n</tr>\r\n</tbody>\r\n</table>', 'custom-about', 0, '2024-02-13 03:46:38', '2024-02-14 14:11:26', 0, 1, 0),
(2, 'Privacy and Policy', '<p style=\"text-align: center;\"><span class=\"highlight\">Privacy Policy</span></p>\r\n<h1 style=\"text-align: center;\">Privacy and Policy</h1>\r\n<p class=\"leading\" style=\"max-width: 80%; margin-left: auto; margin-right: auto; text-align: center;\">With our tool, you can generate text in seconds, freeing up your <span style=\"color: rgb(89, 89, 89);\">time to focus on other important tasks that matter the most.</span></p>\r\n<p><img style=\"display: block; border-radius: 25px; margin-left: auto; margin-right: auto;\" src=\"https://gcdnb.pbrd.co/images/D92RJsyqJdHy.png?o=1\" alt=\"\" width=\"1450\" height=\"761\"></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><span class=\"highlight\">Privacy Policy</span></p>\r\n<p class=\"leading\">Our newest theme update brings modern and clean design templates to Hub Collection which is already one of the biggest template collections ever built. <span style=\"color: rgb(89, 89, 89);\">These layouts are designed in a simple and unique style that can improve your daily workflow and save you an enormous amount of time.</span></p>\r\n<p>Test built the Liquid app as a Commercial app. This Service is provided by Test and is intended for use as is.</p>\r\n<p>If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.</p>\r\n<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Liquid unless otherwise defined in this Privacy Policy.</p>\r\n<p>&nbsp;</p>\r\n<hr>\r\n<h5>&nbsp;</h5>\r\n<h5>Fair Use</h5>\r\n<p>For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to Test. The information that we request will be retained by us and used as described in this privacy policy.</p>\r\n<p>The app does use third-party services that may collect information used to identify you.</p>\r\n<p>Link to the privacy policy of third-party service providers used by the app</p>\r\n<p>We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (&ldquo;IP&rdquo;) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.</p>\r\n<p>&nbsp;</p>\r\n<h5 class=\"lqd-text-el m-0 p-0\"><span class=\"lqd-text-item relative elementor-repeater-item-c3d0556\">Cookies</span></h5>\r\n<p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device&rsquo;s internal memory.</p>\r\n<p>This Service does not use these &ldquo;cookies&rdquo; explicitly. However, the app may use third-party code and libraries that use &ldquo;cookies&rdquo; to collect information and improve their services. You have the option to either accept or refuse</p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\"><span class=\"info-box\">Still have a question? <span style=\"color: rgb(8, 53, 248);\"><a style=\"color: rgb(8, 53, 248);\" href=\"#\">Browse documentation</a></span> or <span style=\"color: rgb(8, 53, 248);\"><a style=\"color: rgb(8, 53, 248);\" href=\"#\">submit a ticket</a>.</span></span></p>', 'custom-privacy-and-policy', 0, '2024-02-13 03:48:09', '2024-02-14 14:15:29', 0, 1, 0),
(3, 'How It Works', '<p style=\"text-align: center;\">Trusted by these amazing companies</p>\r\n<table style=\"border-collapse: collapse; width: 100.068%; border-width: 0px;\" border=\"1\"><colgroup><col style=\"width: 25.0342%;\"><col style=\"width: 25.0342%;\"><col style=\"width: 25.0342%;\"><col style=\"width: 25.0342%;\"></colgroup>\r\n<tbody>\r\n<tr>\r\n<td style=\"border-width: 0px;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://aidefault.liquid-themes.com/wp-content/uploads/2023/08/nike.svg\" alt=\"\" width=\"88\" height=\"32\"></td>\r\n<td style=\"border-width: 0px;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://aidefault.liquid-themes.com/wp-content/uploads/2023/08/Path-133531.svg\" alt=\"\" width=\"86\" height=\"37\"></td>\r\n<td style=\"border-width: 0px;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://aidefault.liquid-themes.com/wp-content/uploads/2023/08/Path-46878.svg\" alt=\"\" width=\"49\" height=\"35\"></td>\r\n<td style=\"border-width: 0px;\"><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"https://aidefault.liquid-themes.com/wp-content/uploads/2023/08/volkswagen-1.svg\" alt=\"\" width=\"53\" height=\"53\"></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p class=\"leading\" style=\"text-align: center;\">&nbsp;</p>\r\n<p class=\"leading\" style=\"text-align: center;\">At MagicAI, we are passionate about harnessing the power of artificial intelligence to unlock limitless creativity and efficiency.&nbsp;<span style=\"color: rgb(89, 89, 89);\">Our cutting-edge AI Generators are designed to revolutionize the way you create, streamline your workflows, and supercharge your productivity.</span></p>\r\n<p class=\"leading\" style=\"text-align: center;\">&nbsp;</p>\r\n<p><span class=\"num-block\">1</span></p>\r\n<h4>Select a Template</h4>\r\n<p>Our mission is to empower individuals and businesses to unleash their creative potential and achieve extraordinary results. We believe that AI has the ability to augment human capabilities, enhance decision-making processes, and accelerate innovation.</p>\r\n<p>&nbsp;</p>\r\n<p><span class=\"num-block\">2</span></p>\r\n<h4>Explain your idea</h4>\r\n<p>AI generators are sophisticated systems trained on vast amounts of data to learn patterns, understand context, and generate original content. They are designed to mimic human creativity by analyzing existing examples.</p>\r\n<p>&nbsp;</p>\r\n<p><span class=\"num-block\">3</span></p>\r\n<h4>Done!</h4>\r\n<p>By developing state-of-the-art AI Generators, we aim to democratize access to advanced AI technologies, enabling users from all backgrounds to excel in their creative endeavors.</p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\"><span class=\"info-box\">Still have a question? <span style=\"color: rgb(8, 53, 248);\"><a style=\"color: rgb(8, 53, 248);\" href=\"#\">Browse documentation</a></span> or <span style=\"color: rgb(8, 53, 248);\"><a style=\"color: rgb(8, 53, 248);\" href=\"#\">submit a ticket</a>.</span></span></p>\r\n<p>&nbsp;</p>\r\n<p><img style=\"border-radius: 25px;\" src=\"https://gcdnb.pbrd.co/images/OZmBXkQ5MQyH.png?o=1\" alt=\"How it works\" width=\"1620\" height=\"870\"></p>\r\n<p>&nbsp;</p>\r\n<p><span class=\"highlight\">Invite a Friend</span></p>\r\n<h4>Affiliate System.</h4>\r\n<p class=\"leading\">We pride ourselves on offering AI Generators that are unmatched in their quality, <span style=\"color: rgb(89, 89, 89);\">versatility, and ease of use. Here&rsquo;s what sets us apart from the competition:</span></p>\r\n<h5>Done!</h5>\r\n<p>Join our community of innovators, creators, and forward-thinkers who are leveraging the power of AI to revolutionize their industries. Start your journey with MagicAI today and unlock the full potential of AI Generators.</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"https://aidefault.liquid-themes.com/wp-content/uploads/2023/08/icon-2.jpg\" alt=\"\" width=\"48\" height=\"48\"></p>\r\n<h5>Invite your Friend</h5>\r\n<p>With our AI Generators, the possibilities are endless. From generating compelling marketing copy and designing stunning visuals to automating data analysis and creating personalized user experiences.</p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"https://aidefault.liquid-themes.com/wp-content/uploads/2023/08/icon-3.jpg\" alt=\"\" width=\"48\" height=\"48\"></p>\r\n<h5>Make Money</h5>\r\n<p>Ready to experience the future of creativity? Sign up now and embark on an exciting adventure of limitless possibilities.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p style=\"text-align: center;\"><span class=\"info-box\">Still have a question? <span style=\"color: rgb(8, 53, 248);\"><a style=\"color: rgb(8, 53, 248);\" href=\"#\">Browse documentation</a></span> or <span style=\"color: rgb(8, 53, 248);\"><a style=\"color: rgb(8, 53, 248);\" href=\"#\">submit a ticket</a>.</span></span></p>', 'custom-how-it-works', 0, '2024-02-13 03:49:08', '2024-02-14 13:37:35', 1, 1, 0),
(4, 'Features', '<p><img style=\"border-radius: 25px;\" src=\"https://gcdnb.pbrd.co/images/iTA0Xv7SHrVp.png?o=1\" alt=\"About us\" width=\"1526 &times;\" height=\"866\"></p>\r\n<p>&nbsp;</p>\r\n<p><span class=\"highlight\">Introducing</span></p>\r\n<h3 class=\"lqd-text-el m-0 p-0\"><span class=\"lqd-text-item relative elementor-repeater-item-eaff06a\">Custom Chatbots.</span></h3>\r\n<p class=\"leading\">We pride ourselves on offering AI Generators that are unmatched in their quality, <span style=\"color: rgb(89, 89, 89);\">versatility, and ease of use. Here&rsquo;s what sets us apart from the competition:</span></p>\r\n<p>With our AI Generators, the possibilities are endless. From generating compelling marketing copy and designing stunning visuals to automating data analysis and creating personalized user experiences, our tools will transform the way you work and help you achieve remarkable outcomes.</p>\r\n<p>Join our community of innovators, creators, and forward-thinkers who are leveraging the power of AI to revolutionize their industries. Start your journey with MagicAI today and unlock the full potential of AI Generators.</p>\r\n<p>Ready to experience the future of creativity? Sign up now and embark on an exciting adventure of limitless possibilities.</p>\r\n<ul style=\"list-style: disc; list-style-position: inside;\">\r\n<li><strong>New &mdash;</strong>&nbsp;AI Voiceover in 30 Languages</li>\r\n<li><strong>New &mdash;</strong>&nbsp;Custom Avatar for Chatbot</li>\r\n<li><strong>Improved &mdash;</strong>&nbsp;Auto Translate</li>\r\n</ul>', 'custom-features', 0, '2024-02-14 12:27:38', '2024-02-14 13:25:50', 1, 1, 0);

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'marketplace', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(2, 'themes', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(3, 'user_management', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(4, 'announcements', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(5, 'google_adsense', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(6, 'support_requests', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(7, 'templates', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(8, 'chat_settings', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(9, 'frontend', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(10, 'finance', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(11, 'pages', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(12, 'blog', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(13, 'affiliates_admin', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(14, 'coupons_admin', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(15, 'email_templates', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(16, 'introductions', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(17, 'mailchimp_newsletter', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(18, 'hubspot', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(19, 'api_integration', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(20, 'settings', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(21, 'site_health', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(22, 'license', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(23, 'update', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(24, 'menu_setting', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28');

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2);

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(2, 'admin', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28'),
(3, 'super_admin', 'web', '2024-12-24 17:25:28', '2024-12-24 17:25:28');

INSERT INTO `settings` (`id`, `invoice_currency`, `invoice_name`, `invoice_website`, `invoice_address`, `invoice_city`, `invoice_state`, `invoice_postal`, `invoice_country`, `invoice_phone`, `invoice_vat`, `default_currency`, `tax_rate`, `stripe_active`, `stripe_key`, `stripe_secret`, `stripe_base_url`, `bank_transfer_active`, `bank_transfer_instructions`, `bank_transfer_informations`, `site_name`, `site_url`, `site_email`, `google_analytics_active`, `google_analytics_code`, `logo`, `favicon`, `meta_title`, `meta_description`, `facebook_active`, `facebook_api_key`, `facebook_api_secret`, `facebook_redirect_url`, `github_active`, `github_api_key`, `github_api_secret`, `github_redirect_url`, `google_active`, `google_api_key`, `google_api_secret`, `google_redirect_url`, `twitter_active`, `twitter_api_key`, `twitter_api_secret`, `twitter_redirect_url`, `register_active`, `default_country`, `smtp_host`, `smtp_port`, `smtp_username`, `smtp_password`, `smtp_email`, `smtp_sender_name`, `smtp_encryption`, `openai_api_secret`, `created_at`, `updated_at`, `logo_path`, `favicon_path`, `openai_default_model`, `openai_default_language`, `openai_default_tone_of_voice`, `openai_default_creativity`, `openai_max_input_length`, `openai_max_output_length`, `affiliate_minimum_withdrawal`, `affiliate_commission_percentage`, `frontend_pricing_section`, `frontend_custom_templates_section`, `frontend_business_partners_section`, `frontend_additional_url`, `frontend_custom_js`, `frontend_custom_css`, `frontend_footer_facebook`, `frontend_footer_twitter`, `frontend_footer_instagram`, `script_version`, `logo_collapsed`, `logo_collapsed_path`, `stripe_status_for_now`, `logo_dark`, `logo_dashboard`, `logo_dashboard_dark`, `logo_collapsed_dark`, `logo_2x`, `logo_dark_2x`, `logo_dashboard_2x`, `logo_dashboard_dark_2x`, `logo_collapsed_2x`, `logo_collapsed_dark_2x`, `logo_dark_path`, `logo_dashboard_path`, `logo_dashboard_dark_path`, `logo_collapsed_dark_path`, `logo_2x_path`, `logo_dark_2x_path`, `logo_dashboard_2x_path`, `logo_dashboard_dark_2x_path`, `logo_collapsed_2x_path`, `logo_collapsed_dark_2x_path`, `feature_ai_writer`, `feature_ai_image`, `feature_ai_chat`, `feature_ai_code`, `feature_ai_voice_clone`, `feature_ai_speech_to_text`, `feature_affilates`, `logo_sticky`, `logo_sticky_path`, `logo_sticky_2x`, `logo_sticky_2x_path`, `meta_keywords`, `gdpr_status`, `gdpr_button`, `gdpr_content`, `menu_options`, `privacy_enable`, `privacy_enable_login`, `privacy_content`, `terms_content`, `login_without_confirmation`, `feature_ai_voiceover`, `gcs_file`, `gcs_name`, `frontend_code_before_head`, `frontend_code_before_body`, `dashboard_code_before_head`, `dashboard_code_before_body`, `feature_ai_article_wizard`, `feature_ai_vision`, `feature_ai_pdf`, `feature_ai_chat_image`, `mobile_payment_active`, `feature_ai_rewriter`, `feature_ai_youtube`, `feature_ai_rss`, `team_functionality`, `feature_ai_advanced_editor`, `user_count`, `free_open_ai_items`, `user_api_option`, `auth_view_options`, `tour_seen`, `recaptcha_login`, `recaptcha_register`, `recaptcha_sitekey`, `recaptcha_secretkey`, `login_with_otp`, `synthesia_secret_key`, `pebblely_key`, `mrrobot_name`, `mrrobot_search_words`, `x_logo`, `xx_logo`, `heygen_secret_key`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, '0', NULL, NULL, 'https://api.stripe.com', '0', NULL, NULL, 'MagicAI', 'https://liquid-themes.com', NULL, '0', NULL, 'magicAI-logo.svg', NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 'United States', NULL, NULL, NULL, NULL, NULL, NULL, 'TLS', NULL, NULL, '2024-12-24 17:25:27', 'assets/img/logo/magicAI-logo.svg', NULL, 'gpt-3.5-turbo', 'en-US', 'professional', '0.75', '300', '200', '10', '10', 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 7.4, 'magicAI-logo-Collapsed.png', 'assets/img/logo/magicAI-logo-Collapsed.png', 'disabled', 'magicAI-logo-dark.svg', NULL, NULL, 'magicAI-logo-collapsed-dark.svg', NULL, NULL, NULL, NULL, NULL, NULL, 'assets/img/logo/magicAI-logo-dark.svg', NULL, NULL, 'assets/img/logo/magicAI-logo-collapsed-dark.svg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, 0, 'Accept', 'This website uses cookies to improve your web experience.', NULL, 0, 0, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, '[\"post_title_generator\", \"summarize_text\", \"product_description\", \"article_generator\", \"product_name\", \"testimonial_review\", \"problem_agitate_solution\", \"blog_section\", \"blog_post_ideas\", \"blog_intros\", \"blog_conclusion\", \"facebook_ads\", \"youtube_video_description\", \"youtube_video_title\", \"youtube_video_tag\", \"instagram_captions\", \"instagram_hashtag\", \"social_media_post_tweet\", \"social_media_post_business\", \"facebook_headlines\", \"google_ads_headlines\", \"google_ads_description\", \"paragraph_generator\", \"pros_cons\", \"meta_description\", \"faq_generator\", \"email_generator\", \"email_answer_generator\", \"newsletter_generator\", \"grammar_correction\", \"tldr_summarization\", \"ai_image_generator\", \"custom-generation-eQao5n\", \"ai_speech_to_text\", \"ai_code_generator\", \"ai_article_wizard_generator\", \"ai_vision\", \"ai_pdf\", \"ai_chat_image\", \"ai_rewriter\", \"ai_webchat\", \"ai_video\"]', 0, NULL, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `settings_two` (`id`, `theme`, `stable_diffusion_api_key`, `stable_diffusion_default_model`, `google_recaptcha_status`, `google_recaptcha_site_key`, `google_recaptcha_secret_key`, `languages`, `languages_default`, `liquid_license_type`, `liquid_license_domain_key`, `openai_default_stream_server`, `ai_image_storage`, `stablediffusion_default_language`, `stablediffusion_default_model`, `unsplash_api_key`, `dalle`, `daily_limit_enabled`, `allowed_images_count`, `daily_voice_limit_enabled`, `allowed_voice_count`, `serper_api_key`, `elevenlabs_api_key`, `feature_tts_google`, `feature_tts_openai`, `feature_tts_elevenlabs`, `fine_tune_list`, `chatbot_status`, `chatbot_template`, `chatbot_position`, `chatbot_login_require`, `chatbot_rate_limit`, `feature_ai_video`, `chatbot_show_timestamp`, `stablediffusion_bedrock_model`) VALUES
(1, 'default', NULL, NULL, 0, NULL, NULL, 'en', 'en', NULL, NULL, 'backend', 'public', 'en-US', 'stable-diffusion-xl-1024-v1-0', NULL, 'dall-e-3', 0, 2, 0, 1, NULL, NULL, 0, 1, 0, NULL, 'disabled', NULL, 'bottom-left', 1, 10, 1, 0, 'stability.stable-diffusion-xl-v1');

INSERT INTO `social_media_accounts` (`id`, `title`, `subtitle`, `key`, `link`, `icon`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Linkedin', 'Developments in the sector', 'linkedin', '#', '<svg width=\"50\" height=\"52\" viewBox=\"0 0 50 52\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\"> <path d=\"M42.4358 43.9153H35.1192V32.1428C35.1192 29.3353 35.0705 25.7228 31.3137 25.7228C27.5033 25.7228 26.9193 28.7803 26.9193 31.9403V43.9153H19.6051V19.7053H26.6297V23.0128H26.7271C28.1602 20.4978 30.8221 18.9953 33.6568 19.1028C41.0732 19.1028 42.4383 24.1153 42.4383 30.6328L42.4358 43.9153ZM11.3492 16.3953C9.00359 16.3953 7.10326 14.4428 7.10326 12.0328C7.10326 9.62284 9.00359 7.67034 11.3492 7.67034C13.6948 7.67034 15.5951 9.62284 15.5951 12.0328C15.5951 14.4428 13.6948 16.3953 11.3492 16.3953ZM15.0063 43.9153H7.68236V19.7053H15.0063V43.9153ZM46.0832 0.690341H4.00579C2.01786 0.667841 0.387613 2.30534 0.363281 4.34784V47.7578C0.387613 49.8028 2.01786 51.4403 4.00579 51.4178H46.0832C48.076 51.4428 49.7136 49.8053 49.7403 47.7578V4.34534C49.7111 2.29784 48.0736 0.660341 46.0832 0.687841\" /> </svg>', 1, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(2, 'Telegram', 'Fast instant communication', 'telegram', '#', '<svg width=\"54\" height=\"44\" viewBox=\"0 0 54 44\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\"> <path d=\"M1.90766 21.6842L13.9835 25.7855L42.6529 8.25838C43.0684 8.0042 43.4942 8.56864 43.1358 8.89856L21.431 28.8769L20.6238 40.0616C20.5623 40.9125 21.5873 41.3862 22.1955 40.7881L28.8784 34.2166L41.0954 43.4649C42.4122 44.4619 44.319 43.7592 44.6743 42.1462L53.181 3.52121C53.6662 1.31777 51.5072 -0.541559 49.4001 0.265366L1.84622 18.475C0.35447 19.0463 0.395102 21.1706 1.90766 21.6842Z\" /> </svg>', 1, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(3, 'Behance', 'A wide visibility', 'behance', '#', '<svg width=\"54\" height=\"34\" viewBox=\"0 0 54 34\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\"> <path d=\"M27.5018 23.0206V20.9609C27.5018 17.6598 24.8344 15.019 21.5598 15.019L22.8538 14.121C24.9665 12.695 26.234 10.2918 26.234 7.75669C26.234 5.69675 25.4155 3.84808 24.0686 2.52765C22.7481 1.18091 20.8996 0.362305 18.8397 0.362305H0.75V32.8446H17.6778C23.0914 32.8447 27.5018 28.4343 27.5018 23.0206ZM7.64256 5.74963H16.014C18.074 5.74963 19.7377 7.41337 19.7377 9.47308C19.7377 11.533 18.074 13.1968 16.014 13.1968H7.64256V5.74963ZM7.64256 27.6422V18.3201H16.3574C18.9454 18.3201 21.0317 20.4062 21.0317 22.968C21.0317 25.5559 18.9454 27.6422 16.3574 27.6422H7.64256Z\" /> <path d=\"M41.2872 8.5752C34.6851 8.5752 29.3242 14.1738 29.3242 21.0928C29.3242 28.0117 34.6851 33.6369 41.2872 33.6369C46.4368 33.6369 50.847 30.2038 52.5107 25.3973H46.7273C45.3278 28.8833 41.2872 28.3023 41.2872 28.3023C35.6886 27.8798 35.8999 22.5188 35.8999 22.5188H53.171C53.2238 22.0434 53.2503 21.5681 53.2503 21.0927C53.2503 14.1738 47.8893 8.5752 41.2872 8.5752ZM36.4017 18.3199C36.4017 15.4942 38.6992 13.1967 41.5249 13.1967C44.3769 13.1967 46.6746 15.4942 46.6746 18.3199H36.4017Z\" /> <path d=\"M34.7812 2.5625H48.2213V5.74625H34.7812V2.5625Z\" /> </svg>', 1, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(4, 'X', 'Latest news and updates', 'twitter', '#', '<svg xmlns=\"http://www.w3.org/2000/svg\" shape-rendering=\"geometricPrecision\" text-rendering=\"geometricPrecision\" image-rendering=\"optimizeQuality\" fill-rule=\"evenodd\" clip-rule=\"evenodd\" viewBox=\"0 0 512 462.799\"><path fill=\"#fff\" fill-rule=\"nonzero\" d=\"M403.229 0h78.506L310.219 196.04 512 462.799H354.002L230.261 301.007 88.669 462.799h-78.56l183.455-209.683L0 0h161.999l111.856 147.88L403.229 0zm-27.556 415.805h43.505L138.363 44.527h-46.68l283.99 371.278z\"/></svg>', 1, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(5, 'Instagram', 'Share your photos', 'instagram', '#', '<svg width=\"54\" height=\"54\" viewBox=\"0 0 54 54\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\"> <path d=\"M27 0C12.087 0 0 12.087 0 27C0 41.913 12.087 54 27 54C41.913 54 54 41.913 54 27C54 12.087 41.913 0 27 0ZM27 50.625C13.5 50.625 2.625 39.75 2.625 26.25C2.625 12.75 13.5 1.875 27 1.875C40.5 1.875 51.375 12.75 51.375 26.25C51.375 39.75 40.5 50.625 27 50.625ZM40.5 15.75C40.5 14.175 39.225 12.9 37.65 12.9C36.075 12.9 34.8 14.175 34.8 15.75C34.8 17.325 36.075 18.6 37.65 18.6C39.225 18.6 40.5 17.325 40.5 15.75ZM27 18.9C23.025 18.9 19.8 22.125 19.8 26.1C19.8 30.075 23.025 33.3 27 33.3C30.975 33.3 34.2 30.075 34.2 26.1C34.2 22.125 30.975 18.9 27 18.9ZM40.5 43.35C40.5 41.775 39.225 40.5 37.65 40.5C36.075 40.5 34.8 41.775 34.8 43.35C34.8 44.925 36.075 46.2 37.65 46.2C39.225 46.2 40.5 44.925 40.5 43.35ZM40.5 43.35\" /> </svg>', 1, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(6, 'Facebook', 'The most popular social media', 'facebook', '#', '<svg width=\"54\" height=\"54\" viewBox=\"0 0 54 54\" fill=\"currentColor\" xmlns=\"http://www.w3.org/2000/svg\"> <path d=\"M27 0C12.087 0 0 12.087 0 27C0 40.5 10.5 51 24 54V35.1H17.1V27H24V21.6C24 16.2 27.9 13.5 32.4 13.5C34.2 13.5 36 13.8 36 13.8V20.7H33.3C30.6 20.7 30 22.5 30 24V27H36L35.1 35.1H30V54C43.5 51 54 40.5 54 27C54 12.087 41.913 0 27 0Z\" /> </svg>', 1, '2024-12-24 17:25:27', '2024-12-24 17:25:27');

INSERT INTO `testimonials` (`id`, `avatar`, `full_name`, `job_title`, `words`, `created_at`, `updated_at`) VALUES
(1, '202306020840avatar-1.jpg', 'Peline Jan', 'Entrepreneur', '“Not only did it save me time, but it also helped me \nproduce content that was more engaging and \neffective than what I had been creating on my own.”', '2023-05-29 19:30:53', '2023-06-02 08:40:35'),
(2, '202306020840avatar-3.jpg', 'Tom Daniel', 'Writer', 'As a freelance writer, I was looking for a tool that could help me generate ideas and write faster. This AI Text website has done that and more.', '2023-05-30 07:52:22', '2023-06-02 08:40:47'),
(3, '202306020840avatar-2.jpg', 'Eric Sanchez', 'UX Designer', 'The customer support team has been incredibly helpful whenever I’ve had any questions. I can’t imagine going back to my old content-creation methods!', '2023-05-30 07:53:14', '2023-06-02 08:40:58');

INSERT INTO `tokens` (`id`, `type`, `entity_id`, `cost_per_token`, `created_at`, `updated_at`) VALUES
(1, 'word', 1, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(2, 'word', 2, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(3, 'word', 3, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(4, 'word', 4, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(5, 'word', 5, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(6, 'word', 6, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(7, 'word', 7, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(8, 'word', 8, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(9, 'word', 9, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(10, 'word', 10, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(11, 'word', 11, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(12, 'word', 12, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(13, 'word', 13, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(14, 'word', 14, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(15, 'word', 15, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(16, 'word', 16, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(17, 'word', 17, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(18, 'word', 18, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(19, 'word', 19, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(20, 'vision', 20, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(21, 'word', 21, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(22, 'word', 22, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(23, 'word', 23, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(24, 'word', 24, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(25, 'word', 25, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(26, 'word', 26, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(27, 'word', 27, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(28, 'image_to_video', 28, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(29, 'image', 29, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(30, 'image', 30, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(31, 'image', 31, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(32, 'image', 32, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(33, 'image', 33, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(34, 'image', 34, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(35, 'image', 35, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(36, 'image', 36, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(37, 'image', 37, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(38, 'image', 38, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(39, 'image', 39, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(40, 'image', 40, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(41, 'image', 41, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(42, 'image', 42, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(43, 'plagiarism', 43, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(44, 'text_to_video', 44, 20.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(45, 'text_to_video', 45, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(46, 'image', 46, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(47, 'word', 47, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(48, 'word', 48, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(49, 'word', 49, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(50, 'word', 50, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(51, 'word', 51, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(52, 'image', 52, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(53, 'image', 53, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(54, 'image', 54, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(55, 'text_to_speech', 55, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(56, 'character', 56, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(57, 'text_to_speech', 57, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(58, 'text_to_speech', 58, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(59, 'word', 59, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(60, 'speech_to_text', 60, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(61, 'image', 61, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(62, 'image', 62, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(63, 'text_to_speech', 63, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(64, 'text_to_speech', 64, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(65, 'image', 65, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(66, 'image', 66, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(67, 'image', 67, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(68, 'image', 68, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(69, 'text_to_video', 69, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(70, 'text_to_video', 70, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(71, 'text_to_video', 71, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27'),
(72, 'text_to_video', 72, 1.00, '2024-12-24 17:25:27', '2024-12-24 17:25:27');

INSERT INTO `usage` (`id`, `total_user_count`, `this_week_user_count`, `last_week_user_count`, `total_word_count`, `this_week_word_count`, `last_week_word_count`, `total_image_count`, `this_week_image_count`, `last_week_image_count`, `total_sales`, `this_week_sales`, `last_week_sales`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2024-12-24 17:25:26', '2024-12-24 17:25:27');

INSERT INTO `users` (`id`, `entity_credits`, `coingate_subscriber_id`, `team_id`, `team_manager_id`, `name`, `surname`, `email`, `phone`, `type`, `password`, `avatar`, `company_name`, `company_website`, `country`, `address`, `city`, `state`, `postal`, `status`, `remaining_words`, `remaining_images`, `last_seen`, `github_id`, `github_token`, `google_id`, `google_token`, `facebook_id`, `facebook_token`, `twitter_id`, `twitter_token`, `google2fa_secret`, `created_at`, `updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`, `affiliate_code`, `affiliate_earnings`, `affiliate_bank_account`, `affiliate_id`, `email_confirmation_code`, `email_confirmed`, `password_reset_code`, `github_refresh_token`, `google_refresh_token`, `iyzico_id`, `revenuecat_id`, `apple_id`, `apple_token`, `apple_refresh_token`, `razorpay_id`, `api_keys`, `gemini_api_keys`, `anthropic_api_keys`, `remember_token`, `defi_setting`, `affiliate_status`, `tour_seen`, `otp`, `dash_notify_seen`) VALUES
(1, '{\"azure\": {\"azure\": {\"credit\": 100, \"isUnlimited\": true}}, \"fal_ai\": {\"kling\": {\"credit\": 100, \"isUnlimited\": true}, \"haiper\": {\"credit\": 100, \"isUnlimited\": true}, \"minimax\": {\"credit\": 100, \"isUnlimited\": true}, \"flux-pro\": {\"credit\": 200, \"isUnlimited\": true}, \"flux-realism\": {\"credit\": 200, \"isUnlimited\": true}, \"flux/schnell\": {\"credit\": 200, \"isUnlimited\": true}, \"flux-pro/v1__1\": {\"credit\": 200, \"isUnlimited\": true}, \"luma-dream-machine\": {\"credit\": 100, \"isUnlimited\": true}}, \"gemini\": {\"gemini-pro\": {\"credit\": 5000, \"isUnlimited\": true}, \"gemini-1__5-flash\": {\"credit\": 5000, \"isUnlimited\": true}, \"gemini-pro-vision\": {\"credit\": 5000, \"isUnlimited\": true}, \"text-embedding-004\": {\"credit\": 5000, \"isUnlimited\": true}, \"gemini-1__5-pro-latest\": {\"credit\": 5000, \"isUnlimited\": true}}, \"google\": {\"google\": {\"credit\": 100, \"isUnlimited\": true}}, \"heygen\": {\"heygen\": {\"credit\": 100, \"isUnlimited\": true}}, \"openai\": {\"gpt-4\": {\"credit\": 5000, \"isUnlimited\": true}, \"tts-1\": {\"credit\": 100, \"isUnlimited\": true}, \"gpt-4o\": {\"credit\": 5000, \"isUnlimited\": true}, \"o1-mini\": {\"credit\": 5000, \"isUnlimited\": true}, \"dall-e-2\": {\"credit\": 200, \"isUnlimited\": true}, \"dall-e-3\": {\"credit\": 200, \"isUnlimited\": true}, \"tts-1-hd\": {\"credit\": 100, \"isUnlimited\": true}, \"whisper-1\": {\"credit\": 100, \"isUnlimited\": true}, \"o1-preview\": {\"credit\": 5000, \"isUnlimited\": true}, \"davinci-002\": {\"credit\": 5000, \"isUnlimited\": true}, \"gpt-4-turbo\": {\"credit\": 5000, \"isUnlimited\": true}, \"gpt-4o-mini\": {\"credit\": 5000, \"isUnlimited\": true}, \"gpt-3__5-turbo\": {\"credit\": 5000, \"isUnlimited\": true}, \"text-davinci-003\": {\"credit\": 5000, \"isUnlimited\": true}, \"gpt-3__5-turbo-16k\": {\"credit\": 5000, \"isUnlimited\": true}, \"gpt-4-0125-preview\": {\"credit\": 5000, \"isUnlimited\": true}, \"gpt-4-1106-preview\": {\"credit\": 5000, \"isUnlimited\": true}, \"gpt-3__5-turbo-0125\": {\"credit\": 5000, \"isUnlimited\": true}, \"gpt-3__5-turbo-1106\": {\"credit\": 5000, \"isUnlimited\": true}, \"gpt-4-vision-preview\": {\"credit\": 100, \"isUnlimited\": true}, \"text-embedding-3-large\": {\"credit\": 5000, \"isUnlimited\": true}, \"text-embedding-3-small\": {\"credit\": 5000, \"isUnlimited\": true}, \"text-embedding-ada-002\": {\"credit\": 5000, \"isUnlimited\": true}}, \"pexels\": {\"pexels\": {\"credit\": 200, \"isUnlimited\": true}}, \"serper\": {\"serper\": {\"credit\": 5000, \"isUnlimited\": true}}, \"pixabay\": {\"pixabay\": {\"credit\": 200, \"isUnlimited\": true}}, \"clipdrop\": {\"clipdrop\": {\"credit\": 200, \"isUnlimited\": true}}, \"pebblely\": {\"pebblely\": {\"credit\": 200, \"isUnlimited\": true}}, \"unsplash\": {\"unsplash\": {\"credit\": 200, \"isUnlimited\": true}}, \"anthropic\": {\"voyage-2\": {\"credit\": 5000, \"isUnlimited\": true}, \"claude-2__0\": {\"credit\": 5000, \"isUnlimited\": true}, \"claude-2__1\": {\"credit\": 5000, \"isUnlimited\": true}, \"voyage-code-2\": {\"credit\": 5000, \"isUnlimited\": true}, \"voyage-large-2\": {\"credit\": 5000, \"isUnlimited\": true}, \"claude-3-opus-20240229\": {\"credit\": 5000, \"isUnlimited\": true}, \"claude-3-haiku-20240307\": {\"credit\": 5000, \"isUnlimited\": true}, \"claude-3-sonnet-20240229\": {\"credit\": 5000, \"isUnlimited\": true}, \"claude-3-5-sonnet-20240620\": {\"credit\": 5000, \"isUnlimited\": true}}, \"synthesia\": {\"synthesia\": {\"credit\": 100, \"isUnlimited\": true}}, \"elevenlabs\": {\"isolator\": {\"credit\": 5000, \"isUnlimited\": true}, \"elevenlabs\": {\"credit\": 100, \"isUnlimited\": true}}, \"plagiarism_check\": {\"plagiarismcheck\": {\"credit\": 100, \"isUnlimited\": true}}, \"stable_diffusion\": {\"sd3\": {\"credit\": 200, \"isUnlimited\": true}, \"core\": {\"credit\": 200, \"isUnlimited\": true}, \"ultra\": {\"credit\": 200, \"isUnlimited\": true}, \"sd3-large\": {\"credit\": 200, \"isUnlimited\": true}, \"sd3-turbo\": {\"credit\": 200, \"isUnlimited\": true}, \"sd3-medium\": {\"credit\": 200, \"isUnlimited\": true}, \"aws_bedrock\": {\"credit\": 200, \"isUnlimited\": true}, \"sd3__5-large\": {\"credit\": 200, \"isUnlimited\": true}, \"sd3__5-medium\": {\"credit\": 200, \"isUnlimited\": true}, \"image-to-video\": {\"credit\": 100, \"isUnlimited\": true}, \"sd3-large-turbo\": {\"credit\": 200, \"isUnlimited\": true}, \"sd3__5-large-turbo\": {\"credit\": 200, \"isUnlimited\": true}, \"stable-diffusion-v1-6\": {\"credit\": 200, \"isUnlimited\": true}, \"stable-diffusion-xl-1024-v1-0\": {\"credit\": 200, \"isUnlimited\": true}}}', NULL, NULL, NULL, 'Admin', 'Admin', 'admin@admin.com', '5555555555', 'super_admin', '$2y$10$XptdAOeFTxl7Yx2KmyfEluWY9Im6wpMIHoJ9V5yB96DgQgTafzzs6', 'assets/img/auth/default-avatar.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-12-24 17:25:27', '2024-12-24 17:25:27', NULL, NULL, NULL, NULL, 'P60NPGHAAFGD', '0', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, 0, NULL, 0);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
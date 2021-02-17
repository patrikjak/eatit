-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: edudb-02.nameserver.sk
-- Generation Time: Oct 11, 2020 at 02:59 PM
-- Server version: 5.5.62
-- PHP Version: 5.5.9-1ubuntu4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eatit_studenthos`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ingredient` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `in_fridge` bit(1) DEFAULT b'0',
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `ingredient`, `quantity`, `in_fridge`, `recipe_id`, `user_id`, `created_at`, `updated_at`) VALUES
(425, 'paprika', '5-6ks', b'0', 90, 8, '2020-04-10 16:29:38', '2020-04-10 16:29:38'),
(426, 'mleté mäso', '500g', b'1', 90, 8, '2020-04-10 16:29:38', '2020-04-11 19:49:51'),
(427, 'cesnak', 'strúčik', b'1', 90, 8, '2020-04-10 16:29:38', '2020-04-10 16:29:38'),
(428, 'korenie, soľ', 'kus', b'1', 90, 8, '2020-04-10 16:29:38', '2020-04-10 16:31:21'),
(417, 'vajcia', '400', b'1', 86, 10, '2020-04-08 19:12:42', '2020-04-08 19:31:15'),
(418, 'cibula', '4ks', b'1', 87, 10, '2020-04-08 19:17:04', '2020-04-08 19:31:13'),
(429, 'paradajkový pretlak', '1 veľky', b'1', 90, 8, '2020-04-10 16:29:38', '2020-04-10 16:31:18'),
(431, 'paradajky', '4ks', b'0', 92, 8, '2020-04-11 12:50:35', '2020-04-11 12:50:35'),
(432, 'lúpané paradajky', '1 bal.', b'1', 92, 8, '2020-04-11 12:50:35', '2020-04-26 20:13:27'),
(433, 'cesnak', '4 strúčiky', b'1', 92, 8, '2020-04-11 12:50:35', '2020-04-11 12:50:35'),
(434, 'tymián', 'trocha', b'1', 92, 8, '2020-04-11 12:50:35', '2020-04-11 19:49:32'),
(435, 'bazalka', 'trocha', b'0', 92, 8, '2020-04-11 12:50:35', '2020-04-11 12:50:35'),
(436, 'oregano', 'trocha', b'1', 92, 8, '2020-04-11 12:50:35', '2020-04-11 19:49:26'),
(437, 'bobkový list', '3ks', b'0', 92, 8, '2020-04-11 12:50:35', '2020-04-11 12:50:35'),
(438, 'smotana na varenie (12%)', '1dl', b'0', 92, 8, '2020-04-11 12:50:35', '2020-04-11 12:50:35'),
(439, 'zeleninový vývar alebo bujón', 'trocha', b'1', 92, 8, '2020-04-11 12:50:35', '2020-04-11 19:49:55'),
(440, 'olivový olej', 'trocha', b'0', 92, 8, '2020-04-11 12:50:35', '2020-04-11 12:50:35'),
(441, 'maslo', '1/3 balenia', b'0', 92, 8, '2020-04-11 12:50:35', '2020-04-11 12:50:35'),
(442, 'syr', 'trocha', b'1', 92, 8, '2020-04-11 12:50:35', '2020-04-11 12:50:35'),
(443, 'soľ', 'trocha', b'1', 92, 8, '2020-04-11 12:50:35', '2020-04-11 12:50:35'),
(444, 'mleté čierne korenie', 'trocha', b'0', 92, 8, '2020-04-11 12:50:35', '2020-04-11 12:50:35'),
(410, 'prášok do pečiva', '1 bal.', b'1', 80, 8, '2020-04-01 18:59:15', '2020-04-04 21:57:07'),
(408, 'vanilkový cukor', '1 ks', b'1', 80, 8, '2020-04-01 18:59:15', '2020-04-01 19:11:30'),
(409, 'polohrubá múka', '1 hrnček', b'1', 80, 8, '2020-04-01 18:59:15', '2020-04-04 21:57:08'),
(407, 'kryštálový cukor', '1 hrnček', b'1', 80, 8, '2020-04-01 18:59:15', '2020-04-01 19:11:28'),
(406, 'mleté orechy', '1 hrnček', b'0', 80, 8, '2020-04-01 18:59:15', '2020-04-01 18:59:15'),
(405, 'kakao', '1/2 hrnčeka', b'0', 80, 8, '2020-04-01 18:59:15', '2020-04-03 17:12:30'),
(404, 'rum', '2 PL', b'1', 80, 8, '2020-04-01 18:59:15', '2020-04-11 19:49:23'),
(400, 'olej', '1/2 hrnčeka', b'1', 80, 8, '2020-04-01 18:59:15', '2020-04-10 16:17:02'),
(401, 'biely jogurt', '1 hrnček', b'1', 80, 8, '2020-04-01 18:59:15', '2020-04-11 19:49:29'),
(402, 'mletá škorica', '1 PL', b'0', 80, 8, '2020-04-01 18:59:15', '2020-04-01 18:59:15'),
(403, 'vajcia', '4 ks', b'1', 80, 8, '2020-04-01 18:59:15', '2020-04-01 18:59:15'),
(447, 'cibuľa - väčšia', '2ks', b'1', 94, 8, '2020-04-11 13:13:10', '2020-04-11 15:04:58'),
(448, 'mozzarella', '100g', b'1', 94, 8, '2020-04-11 13:13:10', '2020-04-11 19:49:27'),
(449, 'hladká múka', 'podľa potreby', b'1', 94, 8, '2020-04-11 13:13:10', '2020-04-11 19:49:36'),
(450, 'vajcia', 'podľa potreby', b'1', 94, 8, '2020-04-11 13:13:10', '2020-04-11 13:13:10'),
(451, 'strúhanka', 'podľa potreby', b'1', 94, 8, '2020-04-11 13:13:10', '2020-04-26 20:13:08'),
(452, 'soľ', NULL, b'1', 94, 8, '2020-04-11 13:13:10', '2020-04-11 13:13:10'),
(453, 'olej', 'podľa potreby', b'0', 94, 8, '2020-04-11 13:13:10', '2020-04-11 13:13:10'),
(557, 'hovädzie mäso', '500g - mleté', b'1', 95, 8, '2020-04-14 20:59:36', '2020-04-26 20:12:41'),
(556, 'cibuľa', '2ks - stredná', b'0', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(553, 'rímska rasca', '1KL', b'1', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(555, 'červená paprika', '1ks', b'1', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(554, 'cesnak', '2 strúčiky', b'1', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(552, 'drvené paradajky', '400g', b'1', 95, 8, '2020-04-14 20:59:36', '2020-05-03 17:38:49'),
(551, 'hovädzí vývar', '400ml', b'0', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(547, 'horká čokoláda - kvalitná', '2 kúsky', b'0', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(548, 'sušené oregáno', '1KL', b'1', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(549, 'červená paprika údená mletá', '1,5KL', b'0', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(550, 'červená fazuľa', '400g - v konzerve', b'1', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(546, 'soľ', '1KL', b'1', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(545, 'paradajkový pretlak', '2PL', b'0', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(544, 'chilli papričky', '2ks', b'1', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(543, 'rastlinný olej', NULL, b'1', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(542, 'pažítka', NULL, b'0', 95, 8, '2020-04-14 20:59:36', '2020-04-14 20:59:36'),
(558, 'cesnak', '2 hlavičky', b'1', 96, 8, '2020-04-26 11:01:09', '2020-04-26 11:01:09'),
(559, 'zemiaky', '6ks', b'1', 96, 8, '2020-04-26 11:01:09', '2020-04-26 11:01:09'),
(560, 'maslo', '4pl', b'0', 96, 8, '2020-04-26 11:01:09', '2020-04-26 11:01:09'),
(561, 'bobkový list', '1ks', b'0', 96, 8, '2020-04-26 11:01:09', '2020-04-26 11:01:09'),
(562, 'soľ', NULL, b'0', 96, 8, '2020-04-26 11:01:09', '2020-04-26 11:01:09'),
(563, 'čierne mleté korenie', NULL, b'0', 96, 8, '2020-04-26 11:01:09', '2020-04-26 11:01:09'),
(564, 'syr', NULL, b'1', 96, 8, '2020-04-26 11:01:09', '2020-04-26 20:13:11'),
(577, 'kryštálový cukor', 'trocha', b'0', 98, 8, '2020-04-26 11:22:50', '2020-04-26 11:22:50'),
(576, 'droždie', '42g', b'0', 98, 8, '2020-04-26 11:22:50', '2020-04-26 11:22:50'),
(575, 'soľ', '1čl', b'0', 98, 8, '2020-04-26 11:22:50', '2020-04-26 11:22:50'),
(574, 'hladká múka', '800g', b'1', 98, 8, '2020-04-26 11:22:50', '2020-04-26 11:22:50'),
(573, 'voda - vlažná', '250ml', b'1', 98, 8, '2020-04-26 11:22:50', '2020-04-26 20:12:54'),
(572, 'kyslá smotana', '250ml', b'0', 98, 8, '2020-04-26 11:22:50', '2020-04-26 11:22:50'),
(578, 'olej - na vyprážanie', NULL, b'1', 98, 8, '2020-04-26 11:22:50', '2020-04-26 20:12:48'),
(579, 'piškotový korpus', 'odrezky', b'0', 108, 8, '2020-04-26 12:09:41', '2020-04-26 12:09:41'),
(580, 'džem', 'podľa potreby', b'0', 108, 8, '2020-04-26 12:09:41', '2020-04-26 12:09:41'),
(581, 'kakao', 'podľa chuti', b'0', 108, 8, '2020-04-26 12:09:41', '2020-04-26 12:09:41'),
(582, 'hrozienka', NULL, b'0', 108, 8, '2020-04-26 12:09:41', '2020-04-26 12:09:41'),
(583, 'rum', 'podľa chuti', b'1', 108, 8, '2020-04-26 12:09:41', '2020-04-26 12:09:41'),
(584, 'strúhaný kokos - jemný', NULL, b'0', 108, 8, '2020-04-26 12:09:41', '2020-04-26 12:09:41'),
(585, 'hladká múka', '320g', b'1', 109, 8, '2020-04-26 12:13:17', '2020-04-26 12:13:17'),
(586, 'droždie', '10g', b'0', 109, 8, '2020-04-26 12:13:17', '2020-04-26 12:13:17'),
(587, 'soľ', '1čl', b'0', 109, 8, '2020-04-26 12:13:17', '2020-04-26 12:13:17'),
(588, 'olivový olej', '1pl', b'0', 109, 8, '2020-04-26 12:13:17', '2020-04-26 12:13:17'),
(589, 'vlažná voda', '150ml', b'0', 109, 8, '2020-04-26 12:13:17', '2020-04-26 12:13:17'),
(590, 'vlažné mlieko', '25ml', b'1', 109, 8, '2020-04-26 12:13:17', '2020-04-26 12:13:17'),
(591, 'hladká múka', '500g', b'1', 110, 8, '2020-04-26 12:35:25', '2020-04-26 12:35:25'),
(592, 'vlažné mlieko', '300ml', b'1', 110, 8, '2020-04-26 12:35:25', '2020-04-26 20:12:55'),
(593, 'droždie', '1 kocka', b'0', 110, 8, '2020-04-26 12:35:25', '2020-04-26 12:35:25'),
(594, 'soľ', NULL, b'0', 110, 8, '2020-04-26 12:35:25', '2020-04-26 12:35:25'),
(595, 'kryštálový cukor', '2-3 pl', b'0', 110, 8, '2020-04-26 12:35:25', '2020-04-26 12:35:25'),
(596, 'maslo - čerstvé, rozpustené', '100g', b'0', 110, 8, '2020-04-26 12:35:25', '2020-04-26 12:35:25'),
(597, 'žľtky', '2ks', b'0', 110, 8, '2020-04-26 12:35:25', '2020-04-26 12:35:25'),
(598, 'mlieko', '350ml', b'0', 110, 8, '2020-04-26 12:35:25', '2020-04-26 12:35:25'),
(599, 'vanilínový cukor', '1 bal. + 3 pl kryštálového cukru', b'0', 110, 8, '2020-04-26 12:35:25', '2020-04-26 12:35:25'),
(600, 'vanilkový puding', '1 bal.', b'1', 110, 8, '2020-04-26 12:35:25', '2020-04-26 20:13:02'),
(601, 'hrozienka', NULL, b'0', 110, 8, '2020-04-26 12:35:26', '2020-04-26 12:35:26'),
(602, 'jemný tvaroh', '250g', b'0', 110, 8, '2020-04-26 12:35:26', '2020-04-26 12:35:26'),
(603, 'žĺtok', '1ks', b'1', 110, 8, '2020-04-26 12:35:26', '2020-04-26 20:12:58'),
(604, 'mlieko', '2pl', b'0', 110, 8, '2020-04-26 12:35:26', '2020-04-26 12:35:26'),
(605, 'med', '1čl', b'0', 110, 8, '2020-04-26 12:35:26', '2020-04-26 12:35:26'),
(606, 'zadné bravčové koleno', '1,5kg', b'0', 111, 8, '2020-04-26 13:03:58', '2020-04-26 13:03:58'),
(607, 'zemiaky', '1,2kg', b'1', 111, 8, '2020-04-26 13:03:58', '2020-04-26 13:03:58'),
(608, 'cibuľa', '400g', b'0', 111, 8, '2020-04-26 13:03:58', '2020-04-26 13:03:58'),
(609, 'cesnak', '80g', b'1', 111, 8, '2020-04-26 13:03:58', '2020-04-26 13:03:58'),
(610, 'čierne mleté korenie', NULL, b'0', 111, 8, '2020-04-26 13:03:58', '2020-04-26 13:03:58'),
(611, 'soľ', NULL, b'0', 111, 8, '2020-04-26 13:03:58', '2020-04-26 13:03:58'),
(654, 'teľacie pliecko', '800g', b'0', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(653, 'soľ', 'trocha', b'0', 113, 8, '2020-04-26 14:09:20', '2020-04-26 14:09:20'),
(652, 'olej', 'na vyprážanie', b'0', 113, 8, '2020-04-26 14:09:20', '2020-04-26 14:09:20'),
(651, 'zemiaky', '1,2kg', b'1', 113, 8, '2020-04-26 14:09:20', '2020-04-26 14:09:20'),
(647, 'med', '2pl', b'0', 113, 8, '2020-04-26 14:09:20', '2020-04-26 14:09:20'),
(648, 'bravčové rebierka', '1,6kg', b'0', 113, 8, '2020-04-26 14:09:20', '2020-04-26 14:09:20'),
(649, 'cesnak', '8 strúčikov', b'1', 113, 8, '2020-04-26 14:09:20', '2020-04-26 14:09:20'),
(650, 'soľ', 'trocha', b'0', 113, 8, '2020-04-26 14:09:20', '2020-04-26 14:09:20'),
(646, 'kečup', '200g', b'0', 113, 8, '2020-04-26 14:09:20', '2020-04-26 14:09:20'),
(645, 'olej', '100ml', b'0', 113, 8, '2020-04-26 14:09:20', '2020-04-26 14:09:20'),
(644, 'čierne mleté korenie', 'trocha', b'0', 113, 8, '2020-04-26 14:09:20', '2020-04-26 14:09:20'),
(655, 'cibuľa', '300g', b'0', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(656, 'bravčová masť', '120g', b'0', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(657, 'paradajkový pretlak', '150g', b'0', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(658, 'kyslá smotana', '200g', b'0', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(659, 'vývar', '1,2l', b'0', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(660, 'bobkový list', '3-4ks', b'0', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(661, 'korenie nové celé', '4-5 zrniek', b'0', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(662, 'červená mletá paprika', 'trocha', b'1', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(663, 'čierne mleté korenie', 'trocha', b'0', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(664, 'soľ', 'trocha', b'0', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(665, 'hrubá múka', '400g', b'1', 114, 8, '2020-04-26 19:18:05', '2020-04-26 20:12:38'),
(666, 'vajcia', '2ks', b'1', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(667, 'voda', '200-300ml', b'1', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(668, 'olej', 'trocha', b'0', 114, 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(669, 'kuracie krídla', '1kg', b'1', 115, 8, '2020-04-26 19:23:01', '2020-04-26 20:12:42'),
(670, 'kečup', '200g', b'0', 115, 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(671, 'olej', '100ml', b'0', 115, 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(672, 'med', '2pl', b'0', 115, 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(673, 'čierne mleté korenie', 'trocha', b'0', 115, 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(674, 'soľ', 'trocha', b'0', 115, 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(675, 'grilovacie korenie', 'trocha', b'1', 115, 8, '2020-04-26 19:23:01', '2020-04-26 20:13:24'),
(676, 'ľadový šalát', '300g', b'0', 115, 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(677, 'paradajky', '200g', b'0', 115, 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(678, 'reďkovky', '100g', b'0', 115, 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(679, 'fialová cibuľa', '200g', b'0', 115, 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(680, 'šalátová uhorka', '200g', b'0', 115, 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(681, 'kapia', '100g', b'0', 115, 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(682, 'olivový olej', 'trocha', b'0', 115, 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(683, 'balzamikový ocot', 'trocha', b'1', 115, 8, '2020-04-26 19:23:01', '2020-04-26 20:12:44'),
(684, 'vinný ocot', 'trocha', b'0', 115, 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(685, 'farebná fazuľa', '200g', b'0', 116, 8, '2020-04-26 19:26:47', '2020-04-26 19:26:47'),
(686, 'biela fazuľa', '200g', b'0', 116, 8, '2020-04-26 19:26:47', '2020-04-26 19:26:47'),
(687, 'bravčové údené koleno', '200g', b'0', 116, 8, '2020-04-26 19:26:47', '2020-09-03 05:53:55'),
(688, 'hovädzí údený jazyk', '200g', b'0', 116, 8, '2020-04-26 19:26:47', '2020-04-26 19:26:47'),
(689, 'bravčové údené rebrá', '200g', b'0', 116, 8, '2020-04-26 19:26:47', '2020-05-03 17:38:46'),
(690, 'údená klobása', '200g', b'0', 116, 8, '2020-04-26 19:26:47', '2020-04-26 19:26:47'),
(691, 'cibuľa', '300g', b'0', 116, 8, '2020-04-26 19:26:47', '2020-04-26 19:26:47'),
(692, 'cesnak', '80g', b'1', 116, 8, '2020-04-26 19:26:47', '2020-04-26 19:26:47'),
(693, 'bravčová masť', '120g', b'0', 116, 8, '2020-04-26 19:26:47', '2020-04-26 19:26:47'),
(694, 'červená mletá paprika', 'trocha', b'1', 116, 8, '2020-04-26 19:26:47', '2020-04-26 20:13:45'),
(695, 'červená paprika', '1kg', b'1', 117, 8, '2020-04-26 19:33:04', '2020-04-26 20:12:43'),
(696, 'mascarpone', '100g', b'0', 117, 8, '2020-04-26 19:33:04', '2020-04-26 19:33:04'),
(697, 'voda', '500-600ml', b'1', 117, 8, '2020-04-26 19:33:04', '2020-04-26 20:12:56'),
(698, 'soľ', 'trocha', b'0', 117, 8, '2020-04-26 19:33:04', '2020-04-26 19:33:04'),
(699, 'korenie', 'trocha', b'0', 117, 8, '2020-04-26 19:33:04', '2020-04-26 19:33:04'),
(700, 'vegeta', 'trocha', b'0', 117, 8, '2020-04-26 19:33:04', '2020-04-26 19:33:04'),
(701, 'sušené bylinky', 'trocha', b'0', 117, 8, '2020-04-26 19:33:04', '2020-04-26 19:33:04'),
(702, 'šampiňóny', '300g', b'1', 118, 8, '2020-04-26 19:37:01', '2020-04-26 20:13:05'),
(703, 'cibuľa', '1ks', b'0', 118, 8, '2020-04-26 19:37:01', '2020-04-26 19:37:01'),
(704, 'cesnak', '2 strúčiky', b'1', 118, 8, '2020-04-26 19:37:01', '2020-04-26 20:12:40'),
(705, 'soľ', 'trocha', b'0', 118, 8, '2020-04-26 19:37:01', '2020-04-26 19:37:01'),
(706, 'čierne mleté korenie', 'trocha', b'0', 118, 8, '2020-04-26 19:37:01', '2020-04-26 19:37:01'),
(707, 'mlieko', '500ml', b'0', 118, 8, '2020-04-26 19:37:01', '2020-04-26 19:37:01'),
(708, 'smotana na varenie', '200g', b'0', 118, 8, '2020-04-26 19:37:01', '2020-04-26 19:37:01'),
(709, 'bravčová masť', 'trocha', b'0', 118, 8, '2020-04-26 19:37:01', '2020-04-26 19:37:01'),
(710, 'petržlenová vňať', 'trocha', b'0', 118, 8, '2020-04-26 19:37:01', '2020-04-26 19:37:01'),
(804, 'dijonská horčica', 'trocha', b'1', 119, 8, '2020-07-22 20:01:35', '2020-07-22 20:01:35'),
(803, 'lístkové cesto', '1 plát', b'0', 119, 8, '2020-07-22 20:01:35', '2020-07-22 20:01:35'),
(802, 'smotana (33%)', '250ml', b'0', 119, 8, '2020-07-22 20:01:35', '2020-07-22 20:01:35'),
(801, 'vývar', 'podľa potreby', b'0', 119, 8, '2020-07-22 20:01:35', '2020-07-22 20:01:35'),
(800, 'čierne mleté korenie', 'trocha', b'0', 119, 8, '2020-07-22 20:01:35', '2020-07-22 20:01:35'),
(799, 'soľ', 'trocha', b'0', 119, 8, '2020-07-22 20:01:35', '2020-07-22 20:01:35'),
(798, 'zemiaky', '5ks', b'1', 119, 8, '2020-07-22 20:01:35', '2020-07-22 20:01:35'),
(797, 'hrášok - mrazený', '400g', b'1', 119, 8, '2020-07-22 20:01:35', '2020-09-03 05:53:58'),
(722, 'vajcia', '4ks', b'1', 120, 8, '2020-04-26 19:47:34', '2020-04-26 20:13:12'),
(723, 'trstinový cukor', '120g', b'0', 120, 8, '2020-04-26 19:47:34', '2020-04-26 19:47:34'),
(724, 'maslo', '130g', b'0', 120, 8, '2020-04-26 19:47:34', '2020-04-26 19:47:34'),
(725, 'špaldová múka', '150g', b'1', 120, 8, '2020-04-26 19:47:34', '2020-04-26 20:13:51'),
(726, 'kakao', '50g', b'0', 120, 8, '2020-04-26 19:47:34', '2020-04-26 19:47:34'),
(727, 'kypriaci prášok do pečiva', '1 bal.', b'1', 120, 8, '2020-04-26 19:47:34', '2020-04-26 19:47:34'),
(728, 'mlieko', '120ml', b'0', 120, 8, '2020-04-26 19:47:34', '2020-04-26 19:47:34'),
(729, 'horká čokoláda', '60g', b'1', 120, 8, '2020-04-26 19:47:34', '2020-04-26 20:13:25'),
(730, 'tvaroh', '250g', b'0', 120, 8, '2020-04-26 19:47:34', '2020-04-26 19:47:34'),
(731, 'šľahačka v prášku', '1 bal.', b'1', 120, 8, '2020-04-26 19:47:34', '2020-04-26 20:13:08'),
(732, 'mlieko', '150ml', b'0', 120, 8, '2020-04-26 19:47:34', '2020-04-26 19:47:34'),
(733, 'vanilínový cukor', '1 bal.', b'0', 120, 8, '2020-04-26 19:47:34', '2020-04-26 19:47:34'),
(734, 'banány', '3ks', b'0', 120, 8, '2020-04-26 19:47:34', '2020-04-26 19:47:34'),
(735, 'maslové sušienky (BeBe)', '1 bal.', b'0', 121, 8, '2020-04-26 19:54:18', '2020-04-26 19:54:18'),
(736, 'kakaové sušienky (BeBe)', '1 bal.', b'1', 121, 8, '2020-04-26 19:54:18', '2020-07-10 06:54:25'),
(737, 'mlieko', '250ml', b'0', 121, 8, '2020-04-26 19:54:18', '2020-04-26 19:54:18'),
(738, 'hladká múka', '2pl', b'1', 121, 8, '2020-04-26 19:54:18', '2020-04-26 19:54:18'),
(739, 'vanilkový cukor', '1 bal.', b'0', 121, 8, '2020-04-26 19:54:18', '2020-04-26 19:54:18'),
(740, 'práškový cukor', '180g', b'0', 121, 8, '2020-04-26 19:54:18', '2020-04-26 19:54:18'),
(741, 'maslo (82%)', '250g', b'0', 121, 8, '2020-04-26 19:54:18', '2020-04-26 19:54:18'),
(742, 'mleté mandle', '1 pl', b'0', 121, 8, '2020-04-26 19:54:18', '2020-04-26 19:54:18'),
(743, 'práškový cukor', '120g', b'0', 122, 8, '2020-04-26 19:59:29', '2020-04-26 19:59:29'),
(744, 'strúhaný kokos', '200g', b'0', 122, 8, '2020-04-26 19:59:29', '2020-04-26 19:59:29'),
(745, 'mlieko', '200ml', b'0', 122, 8, '2020-04-26 19:59:29', '2020-04-26 19:59:29'),
(746, 'maslo', '300g', b'0', 122, 8, '2020-04-26 19:59:29', '2020-04-26 19:59:29'),
(747, 'piškóty', '350g', b'1', 122, 8, '2020-04-26 19:59:29', '2020-04-26 20:13:48'),
(748, 'džem z čiernych ríbelzí', '300g', b'1', 122, 8, '2020-04-26 19:59:29', '2020-09-03 05:53:57'),
(749, 'rum', '300ml', b'1', 122, 8, '2020-04-26 19:59:29', '2020-04-26 20:13:06'),
(750, 'citrónová šťava', 'trocha', b'0', 122, 8, '2020-04-26 19:59:29', '2020-04-26 19:59:29'),
(751, 'punčová aróma', 'trocha', b'0', 122, 8, '2020-04-26 19:59:29', '2020-04-26 19:59:29'),
(752, 'punčová poleva', '4 bal.', b'1', 122, 8, '2020-04-26 19:59:29', '2020-04-26 20:13:50'),
(753, 'vajce', '5ks', b'1', 122, 8, '2020-04-26 19:59:29', '2020-04-26 19:59:29'),
(754, 'kryštálový cukor', '150g', b'0', 122, 8, '2020-04-26 19:59:29', '2020-04-26 19:59:29'),
(755, 'hladká múka', '150g', b'1', 122, 8, '2020-04-26 19:59:29', '2020-04-26 19:59:29'),
(756, 'olej', '3pl', b'0', 122, 8, '2020-04-26 19:59:29', '2020-04-26 19:59:29'),
(757, 'krabie tyčinky', '1 bal.', b'0', 123, 8, '2020-04-26 20:02:42', '2020-04-26 20:02:42'),
(758, 'cibuľa', '1ks', b'0', 123, 8, '2020-04-26 20:02:42', '2020-04-26 20:02:42'),
(759, 'tatárska omáčka', '1 + 1/2 malej fľašky', b'0', 123, 8, '2020-04-26 20:02:42', '2020-04-26 20:02:42'),
(760, 'tvrdý syr', '200g', b'0', 123, 8, '2020-04-26 20:02:42', '2020-04-26 20:02:42'),
(761, 'šunka', '200g', b'1', 123, 8, '2020-04-26 20:02:42', '2020-04-26 20:13:03'),
(762, 'sterilizovaná kukurica', '1 stredná plechovka', b'0', 123, 8, '2020-04-26 20:02:42', '2020-04-26 20:02:42'),
(763, 'hladká múka', '200g', b'1', 124, 8, '2020-04-26 20:07:16', '2020-05-03 17:38:51'),
(764, 'kryštálový cukor', '50g', b'0', 124, 8, '2020-04-26 20:07:16', '2020-04-26 20:07:16'),
(765, 'vajce', '2ks', b'1', 124, 8, '2020-04-26 20:07:16', '2020-04-26 20:13:15'),
(766, 'mlieko', '250ml', b'0', 124, 8, '2020-04-26 20:07:16', '2020-04-26 20:07:16'),
(767, 'olej', '2pl', b'0', 124, 8, '2020-04-26 20:07:16', '2020-04-26 20:07:16'),
(768, 'kypriaci prášok do pečiva', '1 bal.', b'1', 124, 8, '2020-04-26 20:07:16', '2020-04-26 20:12:47'),
(769, 'vanilkový cukor', '1 bal.', b'0', 124, 8, '2020-04-26 20:07:16', '2020-04-26 20:07:16'),
(770, 'soľ', 'štipka', b'0', 124, 8, '2020-04-26 20:07:16', '2020-04-26 20:07:16'),
(771, 'olej', 'na potretie', b'0', 124, 8, '2020-04-26 20:07:16', '2020-04-26 20:07:16'),
(779, 'cdjc', 'df', b'0', 132, 24, '2020-05-01 11:46:57', '2020-05-01 11:46:57'),
(780, 'Hjkl', '5g', b'0', 133, 25, '2020-05-01 11:57:50', '2020-05-01 11:57:50'),
(781, 'Bum', 'Sum', b'0', 134, 26, '2020-05-01 12:04:21', '2020-05-01 12:04:21'),
(789, 'Vajcia', '2ks', b'0', 135, 29, '2020-05-02 13:38:02', '2020-05-02 13:38:02'),
(790, 'Sóda bikarbóna', 'Štipka', b'0', 135, 29, '2020-05-02 13:38:02', '2020-05-02 13:38:02'),
(788, 'Mlieko', '500ml', b'0', 135, 29, '2020-05-02 13:38:02', '2020-05-02 13:38:02'),
(787, 'Špaldová múka', '220', b'0', 135, 29, '2020-05-02 13:38:02', '2020-05-02 13:38:02'),
(791, 'Soľ', 'Štipka', b'0', 135, 29, '2020-05-02 13:38:02', '2020-05-02 13:38:02'),
(792, 'Brokolica', '100g', b'0', 136, 30, '2020-05-03 17:24:42', '2020-05-03 17:24:42'),
(793, 'kapusta', '100g', b'0', 137, 22, '2020-05-03 17:40:40', '2020-05-03 17:45:09'),
(794, 'Sušienky', '10 ks', b'0', 138, 9, '2020-05-03 19:09:41', '2020-05-03 19:09:41'),
(795, 'Jablko', 'Hruska', b'0', 139, 31, '2020-05-03 19:26:28', '2020-05-03 19:26:28'),
(805, 'gorgonzola', 'trocha', b'0', 119, 8, '2020-07-22 20:01:35', '2020-07-22 20:01:35'),
(806, 'schwarzwaldská šunka', 'trocha', b'0', 119, 8, '2020-07-22 20:01:35', '2020-07-22 20:01:35'),
(807, 'vajce', 'na potretie', b'1', 119, 8, '2020-07-22 20:01:35', '2020-07-22 20:01:35');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_07_07_212644_create_recipes_table', 2),
(6, '2019_07_07_215625_create_ingredients_table', 4),
(5, '2019_07_14_185212_add_category_to_recipes', 3),
(7, '2019_09_03_201609_create_process_table', 5),
(8, '2020_01_01_211708_add_portions_to_recipes_table', 6),
(9, '2020_01_01_212244_add_completed_to_recipes_table', 6),
(10, '2020_01_01_212526_add_time_to_recipes_table', 6),
(11, '2020_01_01_215642_add_portions_to_recipes_table', 7),
(12, '2020_01_01_215736_add_completed_to_recipes_table', 8),
(13, '2020_01_06_173200_add_process_to_recipes_table', 9),
(14, '2020_01_09_094531_create_recipe_photos_table', 10),
(15, '2020_01_09_102409_add_photo_id_to_recipes_table', 11),
(16, '2020_01_09_221513_add_photo_to_recipes_table', 12),
(17, '2020_01_09_221619_add_photo_extension_to_recipes_table', 12),
(18, '2020_02_22_173150_add_photo-cropped_to_recipes_table', 13),
(19, '2020_02_22_173745_add_photo_cropped_to_recipes_table', 14),
(20, '2020_02_26_213249_add_in_fridge_to_ingredients_table', 15),
(21, '2020_02_29_231619_add_profile_photo_to_users_table', 16),
(22, '2020_02_29_231749_add_profile_photo_to_users_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('patrikjak@gmail.com', '$2y$10$04jUCny.vFr9w605LnGKRuYdK5kGgTP3pEfWP/XdOmAE5Cef0gCDW', '2020-04-30 13:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `difficulty` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` smallint(5) UNSIGNED DEFAULT NULL,
  `portions` tinyint(3) UNSIGNED DEFAULT NULL,
  `process` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_cropped` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_extension` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `description`, `category`, `difficulty`, `time`, `portions`, `process`, `photo`, `photo_cropped`, `photo_extension`, `user_id`, `created_at`, `updated_at`) VALUES
(114, 'Teľací paprikáš s domácimi haluškami', NULL, 'hlavné jedlo', 'mierne náročná', 0, 4, 'Cibuľu nakrájame na malé kocky, opražíme na masti dozlatista, odstavíme z ohňa a pridáme mletú papriku, paradajkový pretlak a na kocky nakrájané teľacie mäso. Dáme späť na oheň, orestujeme, pridáme všetky koreniny a podlejeme vývarom. Dusíme na miernom ohni do zmäknutia.\r\nKeď je mäso už skoro mäkké, vymiešame v jednej miske smotanu s vybratou horúcou šťavou z paprikáša, vrátime späť do hrnca, dochutíme soľou a mletým korením. Podávame s kyslou smotanou.\r\nHalušky: Múku, soľ a vajcia vymiešame v miske. Pridávame vodu tak, aby sme dostali dobré haluškové cesto, a cez haluškár ho hádžeme do osolenej vriacej vody. Varíme, kým halušky nevyplávajú navrch, precedíme cez sitko, ochladíme a vmiešame trochu oleja, aby sa nezlepili. Podávame k paprikášu.', '20200426211805-telaci-paprikas-s-domacimi-haluskami.jpg', '20200426211805-telaci-paprikas-s-domacimi-haluskami-fitted.jpg', 'jpg', 8, '2020-04-26 19:18:05', '2020-04-26 19:18:05'),
(113, 'Medové rebierka', NULL, 'hlavné jedlo', 'ťažká', 0, 0, 'V miske zmiešame kečup, nastrúhaný cesnak, med, mleté čierne korenie a olej. Rebierka osolíme a pomocou štetca natrieme marinádou z oboch strán. Rebierka dáme do pekáča a necháme marinovať 2 hodiny, alebo aj celú noc.\r\nPred pečením prikryjeme alobalom, pečieme pri 160 °C približne 1,5 hodiny a potom bez alobalu 30 minút na 200 °C.\r\nČipsy: Zemiaky umyjeme, nakrájame na 2 mm hrubé plátky a dáme do studenej vody na 30 minút, aby sa škrob vymočil. Potom scedíme, zemiaky osušíme pomocou čistej utierky a fritujeme v horúcom oleji. Podľa chuti osolíme.', '20200426160920-medove-rebierka.jpg', '20200426160920-medove-rebierka-fitted.jpg', 'jpg', 8, '2020-04-26 13:30:53', '2020-04-26 14:09:20'),
(111, 'Zapekané koleno so zemiakmi', 'https://varecha.pravda.sk/recepty/zapekane-koleno-so-zemiakmi/76868-recept.html', 'hlavné jedlo', 'ťažká', 0, 0, 'Koleno vykostíme, osolíme, okoreníme a potrieme nastrúhaným cesnakom. Potom ho predpečieme 1,5 hodiny v rúre skoro domäkka, počas pečenia polievame vlastnou šťavou. Koleno po vychladnutí nakrájame na plátky.\r\nVo výpeku z pečenia kolena orestujeme na polmesiačiky nakrájanú cibuľu a na plátky nakrájaný cesnak. Zemiaky uvaríme v šupke v osolenej vode, po vychladnutí očistíme a nakrájame na hrubšie plátky.\r\nDo pekáča vložíme polovicu zemiakov, osolíme, okoreníme a navrch dáme na plátky pokrájané koleno, restovanú cibuľu s cesnakom aj so šťavou. Zvyšok zemiakov dáme navrch, okoreníme, osolíme a dáme piecť do rúry zohriatej na 220 °C. Pečieme dozlatista 20–25 minút.', '20200426150358-zapekane-koleno-so-zemiakmi.jpg', '20200426150358-zapekane-koleno-so-zemiakmi-fitted.jpg', 'jpg', 8, '2020-04-26 13:03:58', '2020-04-26 13:03:58'),
(110, 'Pudingovo-tvarohové slimáky', 'Vynikajúca pochúťka na raňajky, olovrant alebo ľahkú večeru, ku káve. Výborná chuť a vôňa, mäkké aj na druhý deň, ak vydržia.', 'dezert', 'mierne náročná', 75, 18, 'Do polovice vlažného mlieka pridáme 1 PL cukru, trocha múky, rozdrobíme droždie a necháme nakysnúť kvások. Múku preosejeme do väčšej misy, pridáme soľ podľa chuti, rozpustené maslo, zbytok mlieka a cukru, žĺtky, nakysnutý kvások a vypracujeme hladké cesto, ktoré zakryjeme utierkou a dáme na teplé miesto vykysnúť.\r\nMedzitým z mlieka, cukru a vanilkového pudingu uvaríme hustý puding, ktorý zakryjeme potravinovou fóliou a necháme vychladnúť. Po vychladnutí vmiešame tvaroh. Cesto dáme na pomúčenú pracovnú dosku.\r\nCesto rozvaľkáme do obdĺžnika na hrúbku 0,5 cm a rovnomerne rozotrieme plnku. Posypeme hrozienkami.\r\nZrolujeme.\r\nPlech vyložíme papierom na pečenie a potrieme maslom. Zrolované naplnené cesto nakrájame na 1 cm hrubé kolieska, ktoré poukladáme na pripravený plech. Žĺtok, mlieko a med vidličkou vymiešame a potrieme prípravené slimáky. Rúru predhrejeme na 180 stupňov, pečieme 25 minút do zlatista.\r\nPo upečení necháme vychladnúť. Dobrú chuť všetkým.', '20200426143525-pudingovo-tvarohove-slimaky.jpg', '20200426143525-pudingovo-tvarohove-slimaky-fitted.jpg', 'jpg', 8, '2020-04-26 12:35:25', '2020-04-26 12:35:25'),
(108, 'Jednoduché nepečené guľky', 'Tieto guľky poznáme, ako svadobné, vtedy je veľa piškótovych korpusov, z ktorých sa robia. Výborné guľky z odrezkov hotové za pár minút.', 'dezert', 'mierne náročná', 20, 0, 'Do misy dáme všetky ingrediencie a poriadne premiešame. Rukami robíme guľky, ktoré obaľujeme v strúhanom kokose alebo mletých orechoch. Dúfam, že tento jednoduchý recept poteší.', '20200426140941-jednoduche-nepecene-gulky.jpg', '20200426140941-jednoduche-nepecene-gulky-fitted.jpg', 'jpg', 8, '2020-04-26 12:09:41', '2020-04-26 12:09:41'),
(109, 'Pizza štangle', 'Na posedenie so známymi, večer k telke, k poháru vína alebo piva...', 'predjedlo', 'ľahká', 20, 8, 'Do hrnčeka s vlažným mliekom a trochou vlažnej vody dáme napučať droždie. Potom zmiešame s ostatnými surovinami. Cesto necháme vykysnúť na teplom mieste minimálne hodinu.\r\nVykysnuté cesto položíme na pracovnú dosku, ak treba podsypeme múkou. Rozdelíme ho na osem častí a rukami “vyšúľame” dlhé štangle. Štangle dáme na plech vystlaný papierom na pečenie. Vložíme do vopred vyhriatej rúry. Pečieme na 200 stupňov asi 10 minút. Zvolíme, ak sa nám rúra dovoľuje, program “pizza” , spodný ohrev.\r\nVäčšinou používam obyčajnú hladkú múku, ale už som robila aj s chlebovou, aj s 00 a vždy to bolo dobré. Dúfam, že ak skúsite, bude chutiť.\r\nPodávame s obľúbeným dipom. U nás je to z kyslej smotany, so soľou, čiernym korením, červenou mletou paprikou a rozpučeným cesnakom.', '20200426141317-pizza-stangle.jpg', '20200426141317-pizza-stangle-fitted.jpg', 'jpg', 8, '2020-04-26 12:13:17', '2020-04-26 12:13:17'),
(90, 'Plnená paprika', NULL, 'hlavné jedlo', 'mierne náročná', 60, 5, 'Mäso si pomelieme, ochutíme a plníme do papriky. Dáme variť. Uvarené vyberieme a zahustíme pretlakom s múkou.', 'none', NULL, NULL, 8, '2020-04-10 16:29:38', '2020-04-10 16:29:38'),
(92, 'Krémová polievka z čerstvých paradajok s bylinkami', 'https://varecha.pravda.sk/recepty/kremova-polievka-z-cerstvych-paradajok-s-bylin/76005-recept.html', 'polievka', 'mierne náročná', 30, 4, 'Umyté čerstvé paradajky nakrájame a uložíme na plech na papier na pečenie. Medzitým si predhrejeme rúru. Pridáme cesnak aj so šupkou, posypeme bylinkami a polejeme olivovým olejem. Vložíme do rúry a na cca 10 minút. Kým sa paradajky pečú, v hrnci roztopíme maslo. Predpečené paradajky vložíme do hrnca s roztopeným maslom. Pridáme aj cesnak tentoraz bez šupky. Pridáme 1 konzervu lúpaných paradajok a zalejeme studenou vodou. Pridáme vývar/bujón a bobkové listy. Privedieme k varu a na miernom ohni varíme 20 min. Vyberieme bobkové listy a polievku rozmixujeme. Popri mixovaní vlejeme 1 dcl smotany na varenie a znova zamixujeme. Podávame s nastrúhaným syrom. Môžeme pridať aj čerstvú bazalku. Dobrú chuť.', '20200411145035-kremova-polievka-z-cerstvych-paradajok-s-bylinkami.jpg', '20200411145035-kremova-polievka-z-cerstvych-paradajok-s-bylinkami-fitted.jpg', 'jpg', 8, '2020-04-11 12:50:35', '2020-04-11 12:50:35'),
(86, 'vajcia', NULL, 'polievka', 'ťažká', 0, 0, 'adsjk', '20200408211240-vajcia.jpg', '20200408211240-vajcia-fitted.jpg', 'jpg', 10, '2020-04-08 19:12:42', '2020-04-08 19:12:42'),
(87, 'cibula', NULL, 'dezert', 'ľahká', 10, 0, 'cibule', '20200408211702-cibula.jpg', '20200408211702-cibula-fitted.jpg', 'jpg', 10, '2020-04-08 19:17:04', '2020-04-08 19:17:04'),
(94, 'Vyprážané cibuľové krúžky s mozzarellou', 'https://varecha.pravda.sk/recepty/vyprazane-cibulove-kruzky-s-mozzarellou-/76410-recept.html', 'predjedlo', 'mierne náročná', 20, 2, 'Ošúpanú cibuľu nakrájame na kolieska, ktoré rozoberieme na jednotlivé krúžky. Medzi dva krúžky rozdielnej veľkosti natlačíme na rezance nakrájanú mozzarellu. Naplnené cibuľové krúžky obalíme v trojobale (hladká múka, rozšľahané osolené vajíčko, strúhanka) a vypražíme v oleji.', '20200411151310-vyprazane-cibulove-kruzky-s-mozzarellou.jpg', '20200411151310-vyprazane-cibulove-kruzky-s-mozzarellou-fitted.jpg', 'jpg', 8, '2020-04-11 13:13:10', '2020-04-11 13:13:10'),
(95, 'Chilli con carne na britský spôsob', 'https://varecha.pravda.sk/recepty/chilli-con-carne-na-britsky-sposob-fotorecept/76720-recept.html', 'hlavné jedlo', 'ťažká', 90, 4, 'Na rozpálenom oleji orestujeme mleté mäso do zlatohnedej farby, aby sa prebytočná tekutina a šťava odparila. Potom mäso preložíme do inej misky. Papriku nakrájame na drobno, taktiež cibuľu, chilli a cesnak a všetko zmiešame. Do panvice kde sa robilo mäso, pridáme trocha oleja a túto zmes orestujeme, asi 5 minút. Pridáme 2PL rajčinového pretlaku, oregano, rímsku rascu, údenú papriku a krátko orestujeme. Pridáme mleté mäso čo sme odložili. Zalejeme drvenými rajčinami. Ja som použil konzervu 400 g. Pridáme vývar, osolíme a dusíme asi 45-60 minút až do zhustnutia. Pripravíme si horkú čokoládu, mala by byť kvalitnejšia, ja som použil túto čo mi syn priniesol z pobytu na Islande. Ale dá sa kúpiť dobrá aj u nás. Nakoniec pridáme fazuľu a čokoládu... Nakoniec ešte dochutíme soľou, prípadne chilli... tú nezvyčajnú a zaujímavú chuť tam robí práve rímska rasca, presne sa hodí do tohoto receptu. Podávame s ryžou, pečivom, alebo chlebom. Na tanieri posypeme vňaťou, v pôvodnom recepte bol uvedený koriander, ale keďže mne nechutí, použil som čerstvú pažítku.', '20200411212950-chilli-con-carne-na-britsky-sposob.jpg', '20200411212950-chilli-con-carne-na-britsky-sposob-fitted.jpg', 'jpg', 8, '2020-04-11 19:29:50', '2020-04-11 19:29:50'),
(80, 'Hrnčekový koláč', 'Jednoduchý, rýchly, dlho vláčny koláčik.', 'dezert', 'mierne náročná', 20, 5, '1 hrnček = 250 ml. Všetky sypké suroviny na cesto dáme do misky a premiešame. V druhej miske zmiešame všetky tekuté suroviny. Do tekutej zmesi postupne pridávame sypké suroviny. Miešame vareškou, nie mixérom. Cesto vylejeme na plech (30x25 cm) vystlaný papierom na pečenie. Vložíme do vyhriatej rúry a pečieme na 175 °C 20 minút. Pozor, aby ste cesto nepiekli príliš dlho, malo by ostať vláčne. Pripravíme si čokoládovú polevu. Smotanu vlejeme do kastrólika a necháme zohriať, nesmie vrieť. Vložíme mliečnu čokoládu a miešame, kým sa nerozpustí. Samozrejme, môžte použiť aj horkú čokoládu, nám chutí viac s mliečnou. Polevu nalejeme na upečený koláčik a necháme stuhnúť. Môžte ozdobiť mletými orechmi, kúskami vlašských orechov či mandlí.', '20200401205915-hrncekovy-kolac.jpg', '20200401205915-hrncekovy-kolac-fitted.jpg', 'jpg', 8, '2020-04-01 18:44:55', '2020-04-01 18:59:15'),
(96, 'Cesnaková polievka', 'https://varecha.pravda.sk/recepty/cesnakova-polievka/76906-recept.html', 'polievka', 'ľahká', 35, 4, 'V hrnci si rozpustíme maslo, pridáme na kocky nakrájané očistené zemiaky a osmažíme asi 5 minút. Pridáme celé strúčiky cesnaku, bobkový list, štipku soli a mleté čierne korenie. Celé to zalejeme 1 litrom vriacej vody.\r\nPolievku varíme približne 15 minút, kým zemiaky nezmäknú.\r\nKeď sú zemiaky mäkké, vyberieme bobkový list a polievku rozmixujeme.\r\nAk chceme polievku výrazne cesnakovú, tak do nej môžeme ešte pretlačiť 5-6 strúčikov cesnaku.\r\nPosypeme nastrúhaným syrom.', 'none', NULL, NULL, 8, '2020-04-26 11:01:09', '2020-04-26 11:01:09'),
(98, 'Langoše do chladničky', 'Tento recept na langoše je super v tom, že vždy si môžete pripraviť čerstvé. Cesto vydrží v chladničke pár dní. V pôvodnom recepte od maminky je kyslá smotana, ale vyšli výborné aj z bieleho jogurtu.', 'hlavné jedlo', 'mierne náročná', 60, 10, 'Ako prvé si zarobíme kvások. Do misky rozdrobíme droždie, pridáme trošku kryštálového cukru, vlažnú vodu a zmes zasypeme troškou hladkej múky. Prikryjeme utierkou a necháme chvíľu odpočívať, kým vzíde kvások.\r\nDo väčšej misky dáme múku a soľ. Pridáme kvások a kyslú smotanu. Zamiesime vláčne cesto. Misku s cestom zakryjeme fóliou a necháme kysnúť v chladničke minimálne 1 hodinu.\r\nKeď je cesto vykysnuté, môžeme sa pustiť do vyprážania. Do panvice dáme olej, približne centimeter vysokú vrstvu a rozohrejeme. Ruky si poriadne naolejujeme a odštipneme z cesta menší bochníček, z ktorého olejovými rukami ľahko vytvarujeme langoš. Vypražíme v oleji z oboch strán.\r\nVrch langoša môžeme potrieť roztlačeným cesnakom zmiešaným s olejom a dať prílohy podľa chuti.', '20200426132249-langose-do-chladnicky.jpg', '20200426132249-langose-do-chladnicky-fitted.jpg', 'jpg', 8, '2020-04-26 11:21:16', '2020-04-26 11:22:50'),
(115, 'Grilované kuracie krídelká s jarným šalátom', NULL, 'hlavné jedlo', 'mierne náročná', 0, 0, 'V miske vymiešame marinádu (soľ, mleté korenie, med, kečup, olej a grilovacie korenie). Do marinády vložíme kuracie krídelká, premiešame a necháme 2 hodiny marinovať, môžeme aj celú noc. Ugrilujeme na rozpálenom grile z oboch strán.\r\nJarný šalát: Ľadový šalát potrháme na väčšie kusy, paradajky, uhorky, cibuľu nakrájame na polmesiačiky, reďkovku na kolieska, kapiu na kocky a dochutíme ostatnými surovinami.', '20200426212301-grilovane-kuracie-kridelka-s-jarnym-salatom.jpg', '20200426212301-grilovane-kuracie-kridelka-s-jarnym-salatom-fitted.jpg', 'jpg', 8, '2020-04-26 19:23:01', '2020-04-26 19:23:01'),
(116, 'Fazuľovica s údeným mäsom', NULL, 'polievka', 'ťažká', 0, 0, 'Fazuľu vopred na noc namočíme do vody. Cibuľu nakrájame na malé kocky a opražíme dozlatista na masti, odstavíme z ohňa a pridáme mletú papriku. Do hrnca pridáme namočenú fazuľu a údené mäso, zalejeme vodou a varíme do zmäknutia fazule.\r\nPotom z polievky vyberieme rebrá, jazyk a koleno. Z rebier oberieme mäso, jazyk očistíme a nakrájame na plátky, z kolena vyberieme kosť a mäso nakrájame na kocky. Pripravené mäso dáme späť do polievky.\r\nKlobásu nakrájame na tenké kolieska a s nastrúhaným cesnakom opražíme na panvici. Dáme do polievky a spolu 5 minút povaríme.', '20200426212646-fazulovica-s-udenym-masom.jpg', '20200426212646-fazulovica-s-udenym-masom-fitted.jpg', 'jpg', 8, '2020-04-26 19:26:47', '2020-04-26 19:26:47'),
(117, 'Polievka z pečených paprík', 'Jedna z mojich obľúbených polievok. Príprava trvá trochu dlhšie, ale je úplna jednoduchá. Polievka je totiž len z dvoch základných ingrediencií - papriky a mascarpone.', 'polievka', 'ľahká', 70, 4, 'Papriky poumývame a uložíme na plech, pečieme cca 50 minút na 200°C, kým papriky jemne nesčernajú na povrchu. Po upečení ich vyberieme a ešte horúce dáme do nádoby, ktorú prikryjeme potravinárskou fóliou, aby sa papriky zaparili.\r\nPo zaparení a miernom vychladnutí papriky olúpeme od tenkej vrchnej šupky a opatrne vybrieme jadrovníky. Je to trochu špinavá piplačka...\r\nV tejto fáze zvyčajne nasleduje nakrájanie cibule a jej opraženie na troške oleja alebo masti ako základ polievky. Ja som naposledy bohapusto na toto zabudla a zistila som, že aj tak bola polievka veľmi chutná a asi intenzívnejšie papriková. Takže kto chce, nech si cibuľu, príp. aj cesnak pridá, ale nie je to nevyhnutné.\r\nOlúpané papriky zalejeme primeraným množstvom vody a necháme prevrieť. Zmixujeme ponorným mixérom a dáme späť na sporák. V horúcej polievke rozpustíme 100 g mascarpone, ochutíme soľou, korením, zmeskou bylín a štipkou vegety. Myslela som, že bude treba pridať aj za malú lyžičku cukru, ale papriky boli také sladké, že sa mi nežiadalo. Po rýchlom zovretí odstavíme zo sporáku.\r\nPolievku podávame s pridaním kyslej smotany.', '20200426213304-polievka-z-pecenych-paprik.jpg', '20200426213304-polievka-z-pecenych-paprik-fitted.jpg', 'jpg', 8, '2020-04-26 19:33:04', '2020-04-26 19:33:04'),
(118, 'Krémová šampiňónová polievka', NULL, 'polievka', 'mierne náročná', 40, 5, 'Na rozohriatej bravčovej masti osmahneme najemno pokrájanú cibuľu s nadrobno pokrájanými strúčikmi cesnaku.\r\nKeď je cibuľa do sklovita, pridáme pokrájané šampiňóny a pod pokrievkou dusíme, kým nepustia šťavu.\r\nPridáme mlieko a rozmixujeme, okoreníme aj osolíme, pridáme smotanu na varenie a necháme prejsť varom.\r\nZopár odložených šampiňónov na ozdobu pokrájame na plátky a dozlatista osmahneme na bravčovej masti, dáme na vrch polievky a dozdobíme posekanou petržlenovou vňaťou.\r\nA máme hotovo... DOBRÚ CHUŤ.', '20200426213701-kremova-sampinonova-polievka.jpg', '20200426213701-kremova-sampinonova-polievka-fitted.jpg', 'jpg', 8, '2020-04-26 19:37:01', '2020-04-26 19:37:01'),
(119, 'Hráškový krém a domácí pikantní pečivo', NULL, 'polievka', 'mierne náročná', 55, 0, 'Brambory oloupeme a nakrájíme, přidáme hrášek, zalijeme vývarem, osolíme a opepříme a uvaříme doměkka. Rozmixujeme dohladka a přidáme smetanu.\r\nPlát těsta rozválíme a potřeme dijonskou hořčicí, posypeme rozdrobenou gorgonzolou, polovinu poklademe plátky šunky a těsto přehneme přes sebe, dlaněmi stlačíme a nakrájíme na širší pruhy. Každý pruh 3x zatočíme. Poklademe na plech s pečícím papírem a potřeme rozšlehaným vajíčkem. Vložíme do předem vyhřáté trouby a pečeme na 200 st. asi 15-20 minut.', '20200426214104-hraskovy-krem-a-domaci-pikantni-pecivo.jpg', '20200426214104-hraskovy-krem-a-domaci-pikantni-pecivo-fitted.jpg', 'jpg', 8, '2020-04-26 19:41:04', '2020-04-26 19:41:04'),
(120, 'Krtkova torta', 'Fajná tortička aj pre tých najmenších.', 'dezert', 'mierne náročná', 80, 5, 'V mise zmiešame múku, cukor, prášok do pečiva, mlieko, kakao, maslo a žĺtky.\r\nZ bielkov vyšľaháme tuhý sneh a opatrne vmiešame do cesta.\r\nCesto dáme do vymastenej okrúhlej tortovej formy a pečieme na 200 stupňov cca 30 minút.\r\nŠľahačku v prášku pripravíme s mliekom podľa návodu. Zmiešame s tvarohom alebo ricottou, vanilínovým cukrom a najemno nastrúhanou horkou čokoládou.\r\nUpečený korpus necháme vychladnúť. Z korpusu vydlabeme stred. Na vydlabaný korpus poukladáme banány pozdĺžne prerezané na polku. Na banány navrstvíme tvarohový krém a posypeme nadrobeným vydlabaným korpusom. Dáme vychladiť. Dobrú chuť!', '20200426214734-krtkova-torta.jpg', '20200426214734-krtkova-torta-fitted.jpg', 'jpg', 8, '2020-04-26 19:47:34', '2020-04-26 19:47:34'),
(121, 'Nepečený metrový koláč s mandľami', NULL, 'dezert', 'mierne náročná', 0, 0, 'Z mlieka, hladkej múky a vanilkového cukru uvaríme hustú kašu a necháme vychladiť.\r\nMaslo vymiešame s práškovým cukrom dohladka, pridáme mleté mandle a ešte raz vymiešame. Potom maslo spojíme s vychladnutou kašou a znova všetko spolu vymiešame.\r\nBB keksy striedavo natierame krémom, lepíme a ukladáme na alobal.\r\nHotový koláč celý potrieme krémom a posypeme mletými mandlami. Zabalíme do alobalu a necháme v chladničke stuhnúť do druhého dňa.\r\nNakoniec nakrájame do šikma a servírujeme. DOBRÚ CHUŤ ;-)', '20200426215418-nepeceny-metrovy-kolac-s-mandlami.jpg', '20200426215418-nepeceny-metrovy-kolac-s-mandlami-fitted.jpg', 'jpg', 8, '2020-04-26 19:54:18', '2020-04-26 19:54:18'),
(122, 'Kokosovo-punčový rez', NULL, 'dezert', 'mierne náročná', 75, 0, 'Cesto: Vajcia vyšľaháme s cukrom do peny. Postupne pridáme ostatné suroviny. Cesto vylejeme na kokosom vysypaný plech a pečieme na 180 stupňov, približne 15 minút.\r\nKokosový krém: Do vriaceho mlieka pridáme cukor a kokos. Odstavíme od sporáka a necháme vychladnúť. Medzitým, vyšľaháme maslo do peny a postupne primiešavame kokosovú zmes. Hotový krém odložíme do chladničky.\r\nPunčová plnka: Najskôr zomelieme piškóty a postupne pridáme ostatné suroviny. Rum (alebo šťavu z druhého citrónu) prilievame dovtedy, kým hmota nebude roztierateľná. Môžeme pridať aj punčovú arómu.\r\nNa upečený korpus natrieme punčovú plnku a na ňu kokosový krém. Podľa návodu na obale pripravíme punčovú polevu a ňou polejeme celý koláč.', '20200426215929-kokosovo-puncovy-rez.jpg', '20200426215929-kokosovo-puncovy-rez-fitted.jpg', 'jpg', 8, '2020-04-26 19:59:29', '2020-04-26 19:59:29'),
(123, 'Šalát z krabích tyčiniek', 'Prišla návšteva, vyhnala ma z kuchyne, lebo išla babke robiť šalát z krabích tyčiniek. Tak som zobral foťák a fotil...', 'predjedlo', 'ľahká', 40, 0, 'Krabie tyčinky pozdĺžne rozrežeme a pokrájame ich na kocky.\r\nCibulu, šunku, tvrdý syr pokrájame na drobno a všetko dáme do misky.\r\nPridáme jeden a pol malej sklenice tatárskej omáčky - tatarku dávame podľa potreby.\r\nVšetko premiešame a necháme v chladničke uležať. Po hodine je to jedlé, no ráno je to vynikajúce.\r\nDOBRÚ CHUŤ.', '20200426220242-salat-z-krabich-tyciniek.jpg', '20200426220242-salat-z-krabich-tyciniek-fitted.jpg', 'jpg', 8, '2020-04-26 20:02:42', '2020-04-26 20:02:42'),
(124, 'Lievance', 'Tento recept na lievance je naozaj jednoduchý. Lievance sú jemné, vláčne a nadýchané!', 'predjedlo', 'ľahká', 30, 30, 'Hladkú múku preosejeme. Pridáme polovicu kryštáloveho cukru, vanilkový cukor, prášok do pečiva, štipku soli a premiešame túto suchú zmes.\r\nNásledne do nej pridáme 2 lyžice oleja, mlieko a žĺtky z 2 vajec. Mixérom vymiešame.\r\nZ bielkov a zvyšnej polovice cukru vyšľaháme sneh. Opatrne ho metličkou alebo varechou vmiešame do cesta, cesto bude nadýchané. Necháme odpočívať 10 minút.\r\nLievance opekáme na panvici, ktorú si na začiatok potrieme olejom. Pečieme na miernom ohni, aby sa nepripiekli. Keď sa na vrchu začnú tvoriť bublinky, je čas ich otočiť.\r\nNapokon lievance môžeme servírovať. Je milión spôsobov, ako ich môžeme ozdobiť. Či už si vyberiete džem, Nutellu, orieškový krém alebo tvaroh je na vás.', '20200426220716-lievance.jpg', '20200426220716-lievance-fitted.jpg', 'jpg', 8, '2020-04-26 20:07:16', '2020-04-26 20:07:16'),
(132, 'ksfdn', NULL, 'predjedlo', 'ľahká', 0, 0, 'kdhf', '20200501134655-ksfdn.jpg', '20200501134655-ksfdn-fitted.jpg', 'jpg', 24, '2020-05-01 11:46:57', '2020-05-01 11:46:57'),
(133, 'Dffg', 'J', 'predjedlo', 'ľahká', 0, 0, 'Hjkli', '20200501135749-dffg.jpg', '20200501135749-dffg-fitted.jpg', 'jpg', 25, '2020-05-01 11:57:50', '2020-05-01 11:57:50'),
(134, 'Bang', NULL, 'hlavné jedlo', 'ťažká', 0, 0, 'Hdhdhfk', '20200501140419-bang.jpg', '20200501140419-bang-fitted.jpg', 'jpg', 26, '2020-05-01 12:04:21', '2020-05-01 12:04:21'),
(135, 'Špaldové palacinky', 'Bol som hladny jak kokot', 'dezert', 'ľahká', 25, 3, 'Všetky suroviny spolu dôkladne zamiešame v mise mixérom alebo metličkou.\r\nMedzi tým si zapálime plameň na sporáku,', '20200502153641-spaldove-palacinky.jpeg', '20200502153641-spaldove-palacinky-fitted.jpeg', 'jpeg', 29, '2020-05-02 13:36:42', '2020-05-02 13:36:42'),
(136, 'Brokolicová polievka', NULL, 'polievka', 'ľahká', 35, 1, 'Nalejem vodu', 'none', NULL, NULL, 30, '2020-05-03 17:24:42', '2020-05-03 17:24:42'),
(137, 'Receptik', NULL, 'polievka', 'ťažká', 0, 0, 'Testik', 'none', NULL, NULL, 22, '2020-05-03 17:40:40', '2020-05-03 17:40:40'),
(138, 'Čiskejk', NULL, 'dezert', 'mierne náročná', 0, 0, 'Hdhdhdhdhdh', 'none', NULL, NULL, 9, '2020-05-03 19:09:41', '2020-05-03 19:09:41'),
(139, 'Neviem', 'Neviem neviem Neviem', 'predjedlo', 'ľahká', 15, 0, 'Hj', 'none', NULL, NULL, 31, '2020-05-03 19:26:28', '2020-05-03 19:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'none',
  `role` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `profile_photo`, `role`, `created_at`, `updated_at`) VALUES
(8, 'Patrik Jakab', 'patrikjak@gmail.com', NULL, '$2y$10$HpDyy9/BRcfKgCTgc25zeuvUM5olto3VaFt1lSmKBpoH8xhMc//n.', 'u9lJphTRP2jLwKykz6fgWyQLC6yjPwqDdP47ORNEdi7QGfFgIFwpw9p0PJEH', '20200710085818-8.jpg', 'admin', '2019-06-24 14:57:12', '2020-04-13 20:17:43'),
(9, 'Peter Partila', 'partila@spse-po.sk', NULL, '$2y$10$hVLGL9.znMDzX3BLuYi4UeJ8IwSLwcHr9Zqsah.D11W12vJwdsBQ6', NULL, '20200503210206-9.jpg', 'user', '2019-06-25 18:46:01', '2020-04-08 19:49:15'),
(10, 'Esteban Hamilton Brown', 'hubert@pivo.sk', NULL, '$2y$10$U3dbq3RY5/LweB7qFuWTxeRZIMXcBm59ALPLmPRja8mi8hs1QxHFK', NULL, 'none', '', '2020-03-02 17:34:46', '2020-04-08 18:29:15'),
(11, 'Igi Polutar', 'polutar_igi@gmail.com', NULL, '$2y$10$YK1OsAYcTW/fXZsmBLU/guQ8eRVw51PiQyWAwctZKcKi7UGpPo2rW', NULL, 'none', 'user', '2020-04-22 19:32:29', '2020-04-22 19:32:29'),
(12, 'Feri Ušatý', 'usaty_feri@gmail.com', NULL, '$2y$10$umRAOCjgRFV4o9ThQ7XhgOPowzUimwuRCYlO/UqEMq3DWC6s.nvdG', NULL, 'none', 'user', '2020-04-22 20:09:29', '2020-04-22 20:09:29'),
(13, 'Frederik Jadun', 'fredo123@gmail.com', NULL, '$2y$10$3UqQq9dT7n7vKBAHYQnoD.RdvvP3Pjh0vSm4HoJLmeBVLxsx/rJwm', NULL, 'none', 'user', '2020-04-22 20:14:36', '2020-04-22 20:14:36'),
(14, 'Richard Gustur', 'gustur@gmail.com', NULL, '$2y$10$6SCVQRM35QaLGT/jcgk71OTc9JBHV6zCnZFYDaAz1wSlvgEz79I5K', NULL, 'none', 'user', '2020-04-22 20:19:14', '2020-04-22 20:19:14'),
(15, 'Michal Vusta', 'vusta@gmail.com', NULL, '$2y$10$xaWv91yQa4o0CTRlVZOFEeALWQDLWH5IzKY1Yli.jazCpXa0ETeyS', NULL, 'none', 'user', '2020-04-22 20:23:47', '2020-04-22 20:23:47'),
(16, 'William Tuvoso', 'will_tuvoso@gmail.com', NULL, '$2y$10$2xQ6wGbZ.zJk6eL7zMGiC.A1VkAWhdnnZviu7ojhEeekLBLQ7KWX2', NULL, 'none', 'user', '2020-04-22 20:36:10', '2020-04-22 20:36:10'),
(17, 'Adam Jura', 'juraa@gmail.com', NULL, '$2y$10$1cEGRyTfyk6UmHm3d/YP9u./D6hU8UYx0XdWf4gWHAXkYgNrXL4YK', NULL, 'none', 'user', '2020-04-22 20:42:37', '2020-04-22 20:42:37'),
(18, 'Chris Nabus', 'chrisnabus@gmail.com', NULL, '$2y$10$s65NY3TT4Rnf7nz10cupRuZsLLFsEQcH4AxHPCY.Z2JEvuUS2jQD2', NULL, 'none', 'user', '2020-04-22 20:48:57', '2020-04-22 20:48:57'),
(19, 'Milan Dukop', 'dukop@gmail.com', NULL, '$2y$10$RRZrlCVI8JNxbACmLt3DkO1MAgztsWxSxteIKEiempttnpycw.Mzu', NULL, 'none', 'user', '2020-04-22 20:49:57', '2020-04-22 20:49:57'),
(25, 'Peter', 'peterjakab76@gmail.com', NULL, '$2y$10$k127Pi3VwdCHxxNcucWBo.RcsdJGZs0ev3j7xUusVJYjJqEcQigVy', NULL, '20200501135905-25.jpg', 'user', '2020-05-01 11:52:20', '2020-05-01 11:52:20'),
(21, 'Test Testovic', 'test@test.sk', NULL, '$2y$10$ufG7LbMsG6Z2ko.A4zd8COVjAu4yKwrfuBZ1uTTq5KRVScjiEzFf6', NULL, '20200501122035-21.jpeg', 'user', '2020-04-30 17:57:13', '2020-04-30 17:57:13'),
(22, 'Tester', 'tester@test.sk', NULL, '$2y$10$3TgCjnvjoE4uVtuvQYVK7ew3NuXj9wLv.7UppR6ZPaAujC5NOQi.y', NULL, '20200503193925-22.jpg', 'user', '2020-05-01 10:31:32', '2020-05-01 10:31:32'),
(23, 'Skuska', 'skuska@test.sk', NULL, '$2y$10$vfsCZIAVwzBJlfeCJ8k9dOAGtxEbIxfTULLmebuCothCsQPC7jqSq', NULL, '20200501134351-23.jpeg', 'user', '2020-05-01 11:20:58', '2020-05-01 11:20:58'),
(24, 'Good Man', 'man@good.com', NULL, '$2y$10$FB2N7iR9JlL3NrsnA5LQHOjLrc7qQqBeNflZYUG6qGe9oZcx7ROlu', NULL, '20200501134554-24.jpeg', 'user', '2020-05-01 11:44:59', '2020-05-01 11:44:59'),
(26, 'Bang', 'bang@bangbang.sk', NULL, '$2y$10$.nRu3/ixmh6jK4zErkoLf.ldMIQ2nENbPSl.OOt9QTqMsdEsFBjT2', NULL, 'none', 'user', '2020-05-01 12:03:33', '2020-05-01 12:03:33'),
(27, 'Natália', 'nmartinkova123@gmail.com', NULL, '$2y$10$.szN6YN1BHtMAKDCZ0PHh.EAzTTK7jDsDkPJmbQV9BD1e9qhSP2va', NULL, 'none', 'user', '2020-05-01 18:22:19', '2020-05-01 18:22:19'),
(28, 'Peťa', 'petapetrovska423q@gmail.com', NULL, '$2y$10$JZVRWe753jy2cdykGP7cvuNEbL/PBF/UBwbmJlwCzw4hxGv3vLh.2', NULL, 'none', 'user', '2020-05-01 18:32:01', '2020-05-01 18:32:01'),
(29, 'Debilko', 'dbrosztl@gmail.com', NULL, '$2y$10$q1B/OQJyPqYw2TbyTQ6G5e2z3OLWFtWfCenHhl16FPGvdUkaWyazq', NULL, '20200502153835-29.jpeg', 'user', '2020-05-02 13:29:38', '2020-05-02 13:29:38'),
(30, 'Zuzi', 'pitonakova.zuzka@gmail.com', NULL, '$2y$10$aOFQfwIOpzPTC6wwDbRMpO0Bo9IIMa/yITgY0zDTgVrpZShrQ5lqC', NULL, 'none', 'user', '2020-05-03 17:22:21', '2020-05-03 17:22:21'),
(31, 'Sara', 'juraskovasara60@gmail.com', NULL, '$2y$10$16UHmLJtAzutkaALGCCf0u9lIBY8DH7rnvJNPQo1PH37u7MZQmOxm', NULL, 'none', 'user', '2020-05-03 19:20:06', '2020-05-03 19:20:06'),
(32, 'Anna', 'anikajakab@gmail.com', NULL, '$2y$10$66Nrt8lAv4lbeU3Q7JK1yeGir8kJ85ie6zdWEU5SbdhqN9JXsLXHC', NULL, 'none', 'user', '2020-05-06 13:50:32', '2020-05-06 13:50:32'),
(33, 'Michal Bačinský', 'michalbacinsky14@gmail.com', NULL, '$2y$10$Cv35icZWludenQTLpJ3o4ukRwFQ5tOLoW8uB4D6gn/I5LVRZtMi..', NULL, 'none', 'user', '2020-05-21 05:52:02', '2020-05-21 05:52:02'),
(34, 'Radovan', 'rado3211@gmail.com', NULL, '$2y$10$dcx5Q./3C3Qfp1l4/qE5SuxUON8TIp3cWjYdoCGM1pdXqz4DleqPC', NULL, 'none', 'user', '2020-05-21 05:53:29', '2020-05-21 05:53:29'),
(35, 'Ml', 'dwd@dwd.sk', NULL, '$2y$10$w9ZcxJ/Hm1gD6.2A4Ftfg.6Wfi7vUsQmDMBvM1PPulRzN7wM/PuKW', NULL, 'none', 'user', '2020-05-22 15:16:30', '2020-05-22 15:16:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ingredients_fk1` (`recipe_id`),
  ADD KEY `ingredients_fk2` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipes_fk` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=808;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

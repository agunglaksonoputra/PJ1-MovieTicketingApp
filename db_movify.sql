-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 20, 2025 at 04:10 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_movify`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked_seats`
--

CREATE TABLE `booked_seats` (
  `id` int NOT NULL,
  `booking_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `seat_id` int NOT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `booked_seats`
--

INSERT INTO `booked_seats` (`id`, `booking_id`, `schedule_id`, `seat_id`, `createdAt`) VALUES
(1, 1, 1, 151, '2025-05-13 07:51:21'),
(2, 1, 1, 152, '2025-05-13 07:51:21');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int NOT NULL,
  `booking_reference` varchar(20) NOT NULL,
  `user_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_status` enum('pending','paid','failed','refunded') DEFAULT 'pending',
  `booking_status` enum('active','used','cancelled','expired') DEFAULT 'active',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `booking_reference`, `user_id`, `schedule_id`, `total_amount`, `payment_method`, `payment_status`, `booking_status`, `createdAt`, `updatedAt`) VALUES
(1, '20250513134110', 1, 1, '80000.00', 'QRIS', 'pending', 'active', '2025-05-13 06:39:03', '2025-05-13 06:39:03');

-- --------------------------------------------------------

--
-- Table structure for table `cinemas`
--

CREATE TABLE `cinemas` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cinemas`
--

INSERT INTO `cinemas` (`id`, `name`, `address`, `city`, `phone`, `email`, `createdAt`, `updatedAt`) VALUES
(1, 'CGV Paris Van Java', 'Paris Van Java Mall Lt. 1, Jl. Sukajadi No. 137-139', 'Bandung', '(022) 82063608', 'cs@cgv.id', '2025-05-09 19:56:34', '2025-05-09 19:56:34'),
(2, 'CGV Bandung Electronic Center', 'Bandung Electronic Center Lt. 3A, Jl. Purnawarman No. 13-15', 'Bandung', '(022) 4267408', 'cs@cgv.id', '2025-05-09 19:56:34', '2025-05-09 19:56:34'),
(3, 'CGV Miko Mall', 'Miko Mall Lt. 2, Jl. Kopo Cirangrang No. 599', 'Bandung', '(022) 86012427', 'cs@cgv.id', '2025-05-09 19:56:34', '2025-05-09 19:56:34'),
(4, 'CGV 23 Paskal Shopping Center', '23 Paskal Shopping Center Lt. 3, Jl. Pasirkaliki No. 25-27', 'Bandung', '(022) 86064129', 'cs@cgv.id', '2025-05-09 19:56:34', '2025-05-09 19:56:34'),
(5, 'XXI Ciwalk', 'Cihampelas Walk Lt. 2, Jl. Cihampelas No. 160', 'Bandung', '(022) 2061856', 'customercare@21cineplex.com', '2025-05-09 19:56:34', '2025-05-09 19:56:34'),
(6, 'XXI Bandung Trade Center', 'Bandung Trade Center Lt. 3A, Jl. Dr. Djunjunan No. 143-149', 'Bandung', '(022) 6128686', 'customercare@21cineplex.com', '2025-05-09 19:56:34', '2025-05-09 19:56:34'),
(7, 'XXI Trans Studio Mall', 'Trans Studio Mall Lt. 2, Jl. Gatot Subroto No. 289', 'Bandung', '(022) 91280021', 'customercare@21cineplex.com', '2025-05-09 19:56:34', '2025-05-09 19:56:34'),
(8, 'XXI Braga City Walk', 'Braga City Walk Lt. 3, Jl. Braga No. 99-101', 'Bandung', '(022) 4260505', 'customercare@21cineplex.com', '2025-05-09 19:56:34', '2025-05-09 19:56:34'),
(9, 'XXI Jatos', 'Jatinangor Town Square Lt. 2, Jl. Raya Jatinangor KM 20.5', 'Bandung', '(022) 7781780', 'customercare@21cineplex.com', '2025-05-09 19:56:34', '2025-05-09 19:56:34'),
(10, 'Cinemaxx Istana Plaza', 'Istana Plaza Lt. 3, Jl. Pasirkaliki No. 121-123', 'Bandung', '(022) 6006117', 'info@cinemaxxtheater.com', '2025-05-09 19:56:34', '2025-05-09 19:56:34');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(12, 'Adventure'),
(14, 'Fantasy'),
(16, 'Animation'),
(18, 'Drama'),
(27, 'Horror'),
(28, 'Action'),
(35, 'Comedy'),
(36, 'History'),
(37, 'Western'),
(53, 'Thriller'),
(80, 'Crime'),
(99, 'Documentary'),
(878, 'Science Fiction'),
(9648, 'Mystery'),
(10402, 'Music'),
(10749, 'Romance'),
(10751, 'Family'),
(10752, 'War'),
(10770, 'TV Movie');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `original_title` varchar(255) DEFAULT NULL,
  `poster_path` varchar(255) DEFAULT NULL,
  `backdrop_path` varchar(255) DEFAULT NULL,
  `overview` text,
  `release_date` date DEFAULT NULL,
  `runtime` int DEFAULT NULL,
  `vote_average` decimal(3,1) DEFAULT NULL,
  `vote_count` int DEFAULT NULL,
  `tmdb_popularity` decimal(10,3) DEFAULT NULL,
  `original_language` varchar(10) DEFAULT NULL,
  `adult` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `original_title`, `poster_path`, `backdrop_path`, `overview`, `release_date`, `runtime`, `vote_average`, `vote_count`, `tmdb_popularity`, `original_language`, `adult`) VALUES
(574475, 'Final Destination Bloodlines', 'Final Destination Bloodlines', '/cAoktVUBhGyULRoxV6mZ2LB3x7I.jpg', '/7wKnf6ILtRmKXV8eJWk0P6ZXnQ.jpg', 'Plagued by a violent recurring nightmare, college student Stefanie heads home to track down the one person who might be able to break the cycle and save her family from the grisly demise that inevitably awaits them all.', '2025-05-09', 110, '7.2', 10, '63.339', 'en', 0),
(757725, 'Shadow Force', 'Shadow Force', '/uX6FaNE86a4Xnf1mFFEryvjqB1D.jpg', '/oUQyf2k3R1P4PdAyFY9QmjcEOBc.jpg', 'Kyrah and Isaac were once the leaders of a multinational special forces group called Shadow Force. They broke the rules by falling in love, and in order to protect their son, they go underground. With a large bounty on their heads, and the vengeful Shadow Force hot on their trail, one family\'s fight becomes all-out war.', '2025-05-01', 104, '0.0', 0, '8.144', 'en', 0),
(793387, 'Holy Night: Demon Hunters', '거룩한 밤: 데몬 헌터스', '/v3Mo77Qjp6pctpD4eJaNT6kFRSB.jpg', '/hRn5oyuhrVFjLwDpe73UvqgvPht.jpg', 'When a devil-worshipping criminal network plunges Seoul into chaos, the police turn to Holy Night—a trio of supernatural demon hunters—to restore order and defeat the rising evil.', '2025-04-30', 92, '4.5', 1, '19.186', 'ko', 0),
(986056, 'Thunderbolts*', 'Thunderbolts*', '/m9EtP1Yrzv6v7dMaC9mRaGhd1um.jpg', '/rthMuZfFv4fqEU4JVbgSW9wQ8rs.jpg', 'After finding themselves ensnared in a death trap, seven disillusioned castoffs must embark on a dangerous mission that will force them to confront the darkest corners of their pasts.', '2025-04-30', 127, '7.6', 633, '417.259', 'en', 0),
(1049082, 'Jumbo', 'Jumbo', '/uIfNrqp08IUH2JHifGLBQI0gOIt.png', '/8MCBwKgWYaFjedlDHzKTPzl3HTy.jpg', 'Desperate to prove to his peers that he’s more than a chubby kid that never wins at anything, little Don wishes to win his local talent show by performing a stageplay inspired from a storybook written by his late parents. When unfortunately a bully stole that book, at the same time a little ghost appeared from the spirit world asking for Don’s help to reunite her with her parents’ spirits. The two new friends then embark on an exciting adventure to help each other and learn the true meaning of friendship.', '2025-03-31', 102, '7.9', 6, '4.068', 'id', 0),
(1138888, 'Penjagal Iblis: Dosa Turunan', 'Penjagal Iblis: Dosa Turunan', '/wPxNdqsJ0JKhd3thBjJgFmbNc3M.jpg', '/jGYl0pKcMTqAKXf43VIxUnz7sGn.jpg', 'Ningrum, a 19-year-old girl, was accused of being the perpetrator of the murder of a family while performing ruqiah. But she swore that she was not a murderer - but a devil\'s slaughterer. When a reporter tried to dig up the truth, he was caught in a battle between Ningrum the devil\'s slaughterer and the devil worshiper.', '2025-04-30', 99, '6.5', 2, '1.064', 'id', 0),
(1232546, 'Until Dawn', 'Until Dawn', '/6O9nkcmZBymDXtxOGJmulqcxJdv.jpg', '/3xKJ0nyUTlySmMBCpOcsuSnFPI1.jpg', 'One year after her sister Melanie mysteriously disappeared, Clover and her friends head into the remote valley where she vanished in search of answers. Exploring an abandoned visitor center, they find themselves stalked by a masked killer and horrifically murdered one by one...only to wake up and find themselves back at the beginning of the same evening.', '2025-04-23', 103, '6.5', 138, '48.964', 'en', 0),
(1241436, 'Warfare', 'Warfare', '/j8tqBXwH2PxBPzbtO19BTF9Ukbf.jpg', '/cJvUJEEQ86LSjl4gFLkYpdCJC96.jpg', 'A platoon of Navy SEALs embarks on a dangerous mission in Ramadi, Iraq, with the chaos and brotherhood of war retold through their memories of the event.', '2025-04-09', 96, '7.2', 147, '436.202', 'en', 0),
(1280089, 'The Siege at Thorn High', 'Pengepungan di Bukit Duri', '/wvAuXoOLd5fVOnCa30tnq044RbB.jpg', '/wGnEdvcA8qo85ZetPwJXKPJDn3C.jpg', 'Edwin promised to his sister on her death bed to find her son she gave up long time ago. Edwin\'s quest brought him to become a substitute teacher in Duri High School, Jakarta, a school for juvenile delinquents. There he must face the most violent students to find his nephew. When he eventually finds the boy, a city-wide riot erupts and Edwin is trapped im the school with the cruel kids out for his blood.', '2025-04-17', 118, '8.6', 11, '1.544', 'id', 0),
(1304517, 'Pembantaian Dukun Santet', 'Pembantaian Dukun Santet', '/x1mSlLW4pkfPGcya9xXYGLFhrXZ.jpg', '/eT9MOIfAhvZR9qJYOFznFoFa63Y.jpg', 'As violence erupts over accusations of black magic, a pesantren becomes the center of terror. As teachers and students are killed one by one, Satrio fights to survive and protect his parents—while uncovering the dark force behind the chaos.', '2025-05-08', 92, '5.0', 1, '1.681', 'id', 0),
(1308042, 'Mendadak Dangdut', 'Mendadak Dangdut', '/m84z2NvvHj9IU2yCPBmbYcx1aCm.jpg', '/xLcpWJmISXaayvXnpAqnRh1l4dC.jpg', 'After a deadly incident involving her producer, rising pop star Naya flees with her sister and ailing father to a remote village. There, she’s forced to hide her identity and perform as a dangdut singer—while struggling to escape her past and the law closing in.', '2025-04-30', 109, '6.7', 3, '0.853', 'id', 0),
(1336738, 'Tabayyun', 'Tabayyun', '/jM3GDA1ULTujSkbMVShVpL0rYLP.jpg', '/8E2DmUOFCmvk2ymPHCmgnRpQdi1.jpg', 'Zalina and Arlo, two individuals from different worlds who meet in the midst of a storm of prejudice. The conflict begins to heat up when their love must face challenges from Zalina\'s mysterious past and pressure from Arlo\'s family, especially his mother, Samira, who is strongly against the relationship.', '2025-05-08', 112, '7.0', 1, '0.555', 'id', 0),
(1337819, 'Broken Wings 2: Olivia', 'Sayap Sayap Patah 2: Olivia', '/AvT3GUVHbdf5ai3ZPLV6L4r7Rzg.jpg', '/tKy4gh1wJX7RjqGyHTAetTcZjCW.jpg', 'A bomb explodes in a cafe, at the same time as Leong is released from prison. Sadikin orders Pandu to investigate Leong\'s trail. Pandu\'s time is increasingly taken up with Olivia, his daughter who needs the presence of a father after her mother died of illness. Luckily there is Suri, Olivia\'s teacher, who tries to fill the void by approaching Olivia. Because of Olivia, Pandu and Suri\'s relationship becomes closer. But the situation becomes more dangerous for Pandu because his face is seen when the ambush and revenge action are about to be carried out.', '2025-05-08', 114, '5.0', 1, '0.807', 'id', 0),
(1367952, 'Cocote Tonggo', 'Cocote Tonggo', '/p1yi4DAqsZx9A9qCCD9bbNl64pk.jpg', NULL, 'To preserve the reputation of their family\'s traditional fertility herbal shop from neighbors\' ridicule, a married couple who have been childless for years pretend to be pregnant so they can claim a found baby as their own.', '2025-05-15', 117, '0.0', 0, '0.314', 'jv', 0),
(1375135, 'Dasim', 'Dasim', '/ulKWRfIn4okrZTNgFFLaayAYcEX.jpg', '/A5HZKrMHXWaCRIYXMkqtFzD748u.jpg', 'Salma, who has just married Arman, begins to feel mystical disturbances. When Salma is pregnant and Arman receives a big project that often makes him work overtime, they move to Arman\'s mother\'s house. Salma faces increasingly scary terror, conflict with her in-laws, plus her suspicion that Arman is cheating, until Salma relies on her mysterious neighbor.', '2025-05-15', 99, '0.0', 0, '0.753', 'id', 0),
(1389137, 'Komang', 'Komang', '/2RWweAPdSSFzsCtxvjydldneUM6.jpg', '/o7kF3veRvsHB61WmD6BGj21P1UC.jpg', 'Fate brought together Ode, a young man from Buton with big dreams, and Ade, a wanderer from Bali. Like two souls in love, they believed that fate would one day unite them. However, their journey was hindered by the presence of another man who shared the same faith as Ade, and Ode had to go to Jakarta to pursue his dreams. Will fate ultimately bring Ode and Ade together?', '2025-03-31', 107, '7.3', 3, '2.144', 'id', 0);

-- --------------------------------------------------------

--
-- Table structure for table `movie_genres`
--

CREATE TABLE `movie_genres` (
  `movie_id` int NOT NULL,
  `genre_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `movie_genres`
--

INSERT INTO `movie_genres` (`movie_id`, `genre_id`) VALUES
(986056, 12),
(793387, 14),
(1049082, 14),
(1138888, 14),
(1049082, 16),
(1049082, 18),
(1280089, 18),
(1308042, 18),
(1336738, 18),
(1337819, 18),
(1367952, 18),
(1389137, 18),
(574475, 27),
(793387, 27),
(1138888, 27),
(1232546, 27),
(1304517, 27),
(1375135, 27),
(757725, 28),
(793387, 28),
(986056, 28),
(1138888, 28),
(1241436, 28),
(1280089, 28),
(1337819, 28),
(1049082, 35),
(1308042, 35),
(1367952, 35),
(757725, 53),
(1138888, 53),
(1280089, 53),
(1304517, 53),
(1337819, 53),
(1138888, 80),
(1280089, 80),
(986056, 878),
(574475, 9648),
(1138888, 9648),
(1232546, 9648),
(1308042, 10402),
(1389137, 10749),
(1049082, 10751),
(1241436, 10752);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int NOT NULL,
  `film_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `theater_id` int NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `film_id`, `title`, `theater_id`, `date`, `start_time`, `price`, `createdAt`, `updatedAt`) VALUES
(1, 1049082, 'Jumbo', 4, '2025-06-09', '10:00:00', '40000.00', '2025-05-11 22:07:32', '2025-05-11 22:07:32');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `id` int NOT NULL,
  `theater_id` int NOT NULL,
  `seat_label` varchar(10) DEFAULT NULL,
  `row` varchar(1) DEFAULT NULL,
  `col` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`id`, `theater_id`, `seat_label`, `row`, `col`) VALUES
(1, 1, 'A1', 'A', 1),
(2, 1, 'A2', 'A', 2),
(3, 1, 'A3', 'A', 3),
(4, 1, 'A4', 'A', 4),
(5, 1, 'A5', 'A', 5),
(6, 1, 'A6', 'A', 6),
(7, 1, 'A7', 'A', 7),
(8, 1, 'A8', 'A', 8),
(9, 1, 'A9', 'A', 9),
(10, 1, 'A10', 'A', 10),
(11, 1, 'B1', 'B', 1),
(12, 1, 'B2', 'B', 2),
(13, 1, 'B3', 'B', 3),
(14, 1, 'B4', 'B', 4),
(15, 1, 'B5', 'B', 5),
(16, 1, 'B6', 'B', 6),
(17, 1, 'B7', 'B', 7),
(18, 1, 'B8', 'B', 8),
(19, 1, 'B9', 'B', 9),
(20, 1, 'B10', 'B', 10),
(21, 1, 'C1', 'C', 1),
(22, 1, 'C2', 'C', 2),
(23, 1, 'C3', 'C', 3),
(24, 1, 'C4', 'C', 4),
(25, 1, 'C5', 'C', 5),
(26, 1, 'C6', 'C', 6),
(27, 1, 'C7', 'C', 7),
(28, 1, 'C8', 'C', 8),
(29, 1, 'C9', 'C', 9),
(30, 1, 'C10', 'C', 10),
(31, 1, 'D1', 'D', 1),
(32, 1, 'D2', 'D', 2),
(33, 1, 'D3', 'D', 3),
(34, 1, 'D4', 'D', 4),
(35, 1, 'D5', 'D', 5),
(36, 1, 'D6', 'D', 6),
(37, 1, 'D7', 'D', 7),
(38, 1, 'D8', 'D', 8),
(39, 1, 'D9', 'D', 9),
(40, 1, 'D10', 'D', 10),
(41, 1, 'E1', 'E', 1),
(42, 1, 'E2', 'E', 2),
(43, 1, 'E3', 'E', 3),
(44, 1, 'E4', 'E', 4),
(45, 1, 'E5', 'E', 5),
(46, 1, 'E6', 'E', 6),
(47, 1, 'E7', 'E', 7),
(48, 1, 'E8', 'E', 8),
(49, 1, 'E9', 'E', 9),
(50, 1, 'E10', 'E', 10),
(51, 2, 'A1', 'A', 1),
(52, 2, 'A2', 'A', 2),
(53, 2, 'A3', 'A', 3),
(54, 2, 'A4', 'A', 4),
(55, 2, 'A5', 'A', 5),
(56, 2, 'A6', 'A', 6),
(57, 2, 'A7', 'A', 7),
(58, 2, 'A8', 'A', 8),
(59, 2, 'A9', 'A', 9),
(60, 2, 'A10', 'A', 10),
(61, 2, 'B1', 'B', 1),
(62, 2, 'B2', 'B', 2),
(63, 2, 'B3', 'B', 3),
(64, 2, 'B4', 'B', 4),
(65, 2, 'B5', 'B', 5),
(66, 2, 'B6', 'B', 6),
(67, 2, 'B7', 'B', 7),
(68, 2, 'B8', 'B', 8),
(69, 2, 'B9', 'B', 9),
(70, 2, 'B10', 'B', 10),
(71, 2, 'C1', 'C', 1),
(72, 2, 'C2', 'C', 2),
(73, 2, 'C3', 'C', 3),
(74, 2, 'C4', 'C', 4),
(75, 2, 'C5', 'C', 5),
(76, 2, 'C6', 'C', 6),
(77, 2, 'C7', 'C', 7),
(78, 2, 'C8', 'C', 8),
(79, 2, 'C9', 'C', 9),
(80, 2, 'C10', 'C', 10),
(81, 2, 'D1', 'D', 1),
(82, 2, 'D2', 'D', 2),
(83, 2, 'D3', 'D', 3),
(84, 2, 'D4', 'D', 4),
(85, 2, 'D5', 'D', 5),
(86, 2, 'D6', 'D', 6),
(87, 2, 'D7', 'D', 7),
(88, 2, 'D8', 'D', 8),
(89, 2, 'D9', 'D', 9),
(90, 2, 'D10', 'D', 10),
(91, 2, 'E1', 'E', 1),
(92, 2, 'E2', 'E', 2),
(93, 2, 'E3', 'E', 3),
(94, 2, 'E4', 'E', 4),
(95, 2, 'E5', 'E', 5),
(96, 2, 'E6', 'E', 6),
(97, 2, 'E7', 'E', 7),
(98, 2, 'E8', 'E', 8),
(99, 2, 'E9', 'E', 9),
(100, 2, 'E10', 'E', 10),
(101, 3, 'A1', 'A', 1),
(102, 3, 'A2', 'A', 2),
(103, 3, 'A3', 'A', 3),
(104, 3, 'A4', 'A', 4),
(105, 3, 'A5', 'A', 5),
(106, 3, 'A6', 'A', 6),
(107, 3, 'A7', 'A', 7),
(108, 3, 'A8', 'A', 8),
(109, 3, 'A9', 'A', 9),
(110, 3, 'A10', 'A', 10),
(111, 3, 'B1', 'B', 1),
(112, 3, 'B2', 'B', 2),
(113, 3, 'B3', 'B', 3),
(114, 3, 'B4', 'B', 4),
(115, 3, 'B5', 'B', 5),
(116, 3, 'B6', 'B', 6),
(117, 3, 'B7', 'B', 7),
(118, 3, 'B8', 'B', 8),
(119, 3, 'B9', 'B', 9),
(120, 3, 'B10', 'B', 10),
(121, 3, 'C1', 'C', 1),
(122, 3, 'C2', 'C', 2),
(123, 3, 'C3', 'C', 3),
(124, 3, 'C4', 'C', 4),
(125, 3, 'C5', 'C', 5),
(126, 3, 'C6', 'C', 6),
(127, 3, 'C7', 'C', 7),
(128, 3, 'C8', 'C', 8),
(129, 3, 'C9', 'C', 9),
(130, 3, 'C10', 'C', 10),
(131, 3, 'D1', 'D', 1),
(132, 3, 'D2', 'D', 2),
(133, 3, 'D3', 'D', 3),
(134, 3, 'D4', 'D', 4),
(135, 3, 'D5', 'D', 5),
(136, 3, 'D6', 'D', 6),
(137, 3, 'D7', 'D', 7),
(138, 3, 'D8', 'D', 8),
(139, 3, 'D9', 'D', 9),
(140, 3, 'D10', 'D', 10),
(141, 3, 'E1', 'E', 1),
(142, 3, 'E2', 'E', 2),
(143, 3, 'E3', 'E', 3),
(144, 3, 'E4', 'E', 4),
(145, 3, 'E5', 'E', 5),
(146, 3, 'E6', 'E', 6),
(147, 3, 'E7', 'E', 7),
(148, 3, 'E8', 'E', 8),
(149, 3, 'E9', 'E', 9),
(150, 3, 'E10', 'E', 10),
(151, 4, 'A1', 'A', 1),
(152, 4, 'A2', 'A', 2),
(153, 4, 'A3', 'A', 3),
(154, 4, 'A4', 'A', 4),
(155, 4, 'A5', 'A', 5),
(156, 4, 'A6', 'A', 6),
(157, 4, 'A7', 'A', 7),
(158, 4, 'A8', 'A', 8),
(159, 4, 'A9', 'A', 9),
(160, 4, 'A10', 'A', 10),
(161, 4, 'B1', 'B', 1),
(162, 4, 'B2', 'B', 2),
(163, 4, 'B3', 'B', 3),
(164, 4, 'B4', 'B', 4),
(165, 4, 'B5', 'B', 5),
(166, 4, 'B6', 'B', 6),
(167, 4, 'B7', 'B', 7),
(168, 4, 'B8', 'B', 8),
(169, 4, 'B9', 'B', 9),
(170, 4, 'B10', 'B', 10),
(171, 4, 'C1', 'C', 1),
(172, 4, 'C2', 'C', 2),
(173, 4, 'C3', 'C', 3),
(174, 4, 'C4', 'C', 4),
(175, 4, 'C5', 'C', 5),
(176, 4, 'C6', 'C', 6),
(177, 4, 'C7', 'C', 7),
(178, 4, 'C8', 'C', 8),
(179, 4, 'C9', 'C', 9),
(180, 4, 'C10', 'C', 10),
(181, 4, 'D1', 'D', 1),
(182, 4, 'D2', 'D', 2),
(183, 4, 'D3', 'D', 3),
(184, 4, 'D4', 'D', 4),
(185, 4, 'D5', 'D', 5),
(186, 4, 'D6', 'D', 6),
(187, 4, 'D7', 'D', 7),
(188, 4, 'D8', 'D', 8),
(189, 4, 'D9', 'D', 9),
(190, 4, 'D10', 'D', 10),
(191, 4, 'E1', 'E', 1),
(192, 4, 'E2', 'E', 2),
(193, 4, 'E3', 'E', 3),
(194, 4, 'E4', 'E', 4),
(195, 4, 'E5', 'E', 5),
(196, 4, 'E6', 'E', 6),
(197, 4, 'E7', 'E', 7),
(198, 4, 'E8', 'E', 8),
(199, 4, 'E9', 'E', 9),
(200, 4, 'E10', 'E', 10),
(201, 5, 'A1', 'A', 1),
(202, 5, 'A2', 'A', 2),
(203, 5, 'A3', 'A', 3),
(204, 5, 'A4', 'A', 4),
(205, 5, 'A5', 'A', 5),
(206, 5, 'A6', 'A', 6),
(207, 5, 'A7', 'A', 7),
(208, 5, 'A8', 'A', 8),
(209, 5, 'A9', 'A', 9),
(210, 5, 'A10', 'A', 10),
(211, 5, 'B1', 'B', 1),
(212, 5, 'B2', 'B', 2),
(213, 5, 'B3', 'B', 3),
(214, 5, 'B4', 'B', 4),
(215, 5, 'B5', 'B', 5),
(216, 5, 'B6', 'B', 6),
(217, 5, 'B7', 'B', 7),
(218, 5, 'B8', 'B', 8),
(219, 5, 'B9', 'B', 9),
(220, 5, 'B10', 'B', 10),
(221, 5, 'C1', 'C', 1),
(222, 5, 'C2', 'C', 2),
(223, 5, 'C3', 'C', 3),
(224, 5, 'C4', 'C', 4),
(225, 5, 'C5', 'C', 5),
(226, 5, 'C6', 'C', 6),
(227, 5, 'C7', 'C', 7),
(228, 5, 'C8', 'C', 8),
(229, 5, 'C9', 'C', 9),
(230, 5, 'C10', 'C', 10),
(231, 5, 'D1', 'D', 1),
(232, 5, 'D2', 'D', 2),
(233, 5, 'D3', 'D', 3),
(234, 5, 'D4', 'D', 4),
(235, 5, 'D5', 'D', 5),
(236, 5, 'D6', 'D', 6),
(237, 5, 'D7', 'D', 7),
(238, 5, 'D8', 'D', 8),
(239, 5, 'D9', 'D', 9),
(240, 5, 'D10', 'D', 10),
(241, 5, 'E1', 'E', 1),
(242, 5, 'E2', 'E', 2),
(243, 5, 'E3', 'E', 3),
(244, 5, 'E4', 'E', 4),
(245, 5, 'E5', 'E', 5),
(246, 5, 'E6', 'E', 6),
(247, 5, 'E7', 'E', 7),
(248, 5, 'E8', 'E', 8),
(249, 5, 'E9', 'E', 9),
(250, 5, 'E10', 'E', 10),
(251, 6, 'A1', 'A', 1),
(252, 6, 'A2', 'A', 2),
(253, 6, 'A3', 'A', 3),
(254, 6, 'A4', 'A', 4),
(255, 6, 'A5', 'A', 5),
(256, 6, 'A6', 'A', 6),
(257, 6, 'A7', 'A', 7),
(258, 6, 'A8', 'A', 8),
(259, 6, 'A9', 'A', 9),
(260, 6, 'A10', 'A', 10),
(261, 6, 'B1', 'B', 1),
(262, 6, 'B2', 'B', 2),
(263, 6, 'B3', 'B', 3),
(264, 6, 'B4', 'B', 4),
(265, 6, 'B5', 'B', 5),
(266, 6, 'B6', 'B', 6),
(267, 6, 'B7', 'B', 7),
(268, 6, 'B8', 'B', 8),
(269, 6, 'B9', 'B', 9),
(270, 6, 'B10', 'B', 10),
(271, 6, 'C1', 'C', 1),
(272, 6, 'C2', 'C', 2),
(273, 6, 'C3', 'C', 3),
(274, 6, 'C4', 'C', 4),
(275, 6, 'C5', 'C', 5),
(276, 6, 'C6', 'C', 6),
(277, 6, 'C7', 'C', 7),
(278, 6, 'C8', 'C', 8),
(279, 6, 'C9', 'C', 9),
(280, 6, 'C10', 'C', 10),
(281, 6, 'D1', 'D', 1),
(282, 6, 'D2', 'D', 2),
(283, 6, 'D3', 'D', 3),
(284, 6, 'D4', 'D', 4),
(285, 6, 'D5', 'D', 5),
(286, 6, 'D6', 'D', 6),
(287, 6, 'D7', 'D', 7),
(288, 6, 'D8', 'D', 8),
(289, 6, 'D9', 'D', 9),
(290, 6, 'D10', 'D', 10),
(291, 6, 'E1', 'E', 1),
(292, 6, 'E2', 'E', 2),
(293, 6, 'E3', 'E', 3),
(294, 6, 'E4', 'E', 4),
(295, 6, 'E5', 'E', 5),
(296, 6, 'E6', 'E', 6),
(297, 6, 'E7', 'E', 7),
(298, 6, 'E8', 'E', 8),
(299, 6, 'E9', 'E', 9),
(300, 6, 'E10', 'E', 10),
(301, 7, 'A1', 'A', 1),
(302, 7, 'A2', 'A', 2),
(303, 7, 'A3', 'A', 3),
(304, 7, 'A4', 'A', 4),
(305, 7, 'A5', 'A', 5),
(306, 7, 'A6', 'A', 6),
(307, 7, 'A7', 'A', 7),
(308, 7, 'A8', 'A', 8),
(309, 7, 'A9', 'A', 9),
(310, 7, 'A10', 'A', 10),
(311, 7, 'B1', 'B', 1),
(312, 7, 'B2', 'B', 2),
(313, 7, 'B3', 'B', 3),
(314, 7, 'B4', 'B', 4),
(315, 7, 'B5', 'B', 5),
(316, 7, 'B6', 'B', 6),
(317, 7, 'B7', 'B', 7),
(318, 7, 'B8', 'B', 8),
(319, 7, 'B9', 'B', 9),
(320, 7, 'B10', 'B', 10),
(321, 7, 'C1', 'C', 1),
(322, 7, 'C2', 'C', 2),
(323, 7, 'C3', 'C', 3),
(324, 7, 'C4', 'C', 4),
(325, 7, 'C5', 'C', 5),
(326, 7, 'C6', 'C', 6),
(327, 7, 'C7', 'C', 7),
(328, 7, 'C8', 'C', 8),
(329, 7, 'C9', 'C', 9),
(330, 7, 'C10', 'C', 10),
(331, 7, 'D1', 'D', 1),
(332, 7, 'D2', 'D', 2),
(333, 7, 'D3', 'D', 3),
(334, 7, 'D4', 'D', 4),
(335, 7, 'D5', 'D', 5),
(336, 7, 'D6', 'D', 6),
(337, 7, 'D7', 'D', 7),
(338, 7, 'D8', 'D', 8),
(339, 7, 'D9', 'D', 9),
(340, 7, 'D10', 'D', 10),
(341, 7, 'E1', 'E', 1),
(342, 7, 'E2', 'E', 2),
(343, 7, 'E3', 'E', 3),
(344, 7, 'E4', 'E', 4),
(345, 7, 'E5', 'E', 5),
(346, 7, 'E6', 'E', 6),
(347, 7, 'E7', 'E', 7),
(348, 7, 'E8', 'E', 8),
(349, 7, 'E9', 'E', 9),
(350, 7, 'E10', 'E', 10),
(351, 8, 'A1', 'A', 1),
(352, 8, 'A2', 'A', 2),
(353, 8, 'A3', 'A', 3),
(354, 8, 'A4', 'A', 4),
(355, 8, 'A5', 'A', 5),
(356, 8, 'A6', 'A', 6),
(357, 8, 'A7', 'A', 7),
(358, 8, 'A8', 'A', 8),
(359, 8, 'A9', 'A', 9),
(360, 8, 'A10', 'A', 10),
(361, 8, 'B1', 'B', 1),
(362, 8, 'B2', 'B', 2),
(363, 8, 'B3', 'B', 3),
(364, 8, 'B4', 'B', 4),
(365, 8, 'B5', 'B', 5),
(366, 8, 'B6', 'B', 6),
(367, 8, 'B7', 'B', 7),
(368, 8, 'B8', 'B', 8),
(369, 8, 'B9', 'B', 9),
(370, 8, 'B10', 'B', 10),
(371, 8, 'C1', 'C', 1),
(372, 8, 'C2', 'C', 2),
(373, 8, 'C3', 'C', 3),
(374, 8, 'C4', 'C', 4),
(375, 8, 'C5', 'C', 5),
(376, 8, 'C6', 'C', 6),
(377, 8, 'C7', 'C', 7),
(378, 8, 'C8', 'C', 8),
(379, 8, 'C9', 'C', 9),
(380, 8, 'C10', 'C', 10),
(381, 8, 'D1', 'D', 1),
(382, 8, 'D2', 'D', 2),
(383, 8, 'D3', 'D', 3),
(384, 8, 'D4', 'D', 4),
(385, 8, 'D5', 'D', 5),
(386, 8, 'D6', 'D', 6),
(387, 8, 'D7', 'D', 7),
(388, 8, 'D8', 'D', 8),
(389, 8, 'D9', 'D', 9),
(390, 8, 'D10', 'D', 10),
(391, 8, 'E1', 'E', 1),
(392, 8, 'E2', 'E', 2),
(393, 8, 'E3', 'E', 3),
(394, 8, 'E4', 'E', 4),
(395, 8, 'E5', 'E', 5),
(396, 8, 'E6', 'E', 6),
(397, 8, 'E7', 'E', 7),
(398, 8, 'E8', 'E', 8),
(399, 8, 'E9', 'E', 9),
(400, 8, 'E10', 'E', 10),
(401, 9, 'A1', 'A', 1),
(402, 9, 'A2', 'A', 2),
(403, 9, 'A3', 'A', 3),
(404, 9, 'A4', 'A', 4),
(405, 9, 'A5', 'A', 5),
(406, 9, 'A6', 'A', 6),
(407, 9, 'A7', 'A', 7),
(408, 9, 'A8', 'A', 8),
(409, 9, 'A9', 'A', 9),
(410, 9, 'A10', 'A', 10),
(411, 9, 'B1', 'B', 1),
(412, 9, 'B2', 'B', 2),
(413, 9, 'B3', 'B', 3),
(414, 9, 'B4', 'B', 4),
(415, 9, 'B5', 'B', 5),
(416, 9, 'B6', 'B', 6),
(417, 9, 'B7', 'B', 7),
(418, 9, 'B8', 'B', 8),
(419, 9, 'B9', 'B', 9),
(420, 9, 'B10', 'B', 10),
(421, 9, 'C1', 'C', 1),
(422, 9, 'C2', 'C', 2),
(423, 9, 'C3', 'C', 3),
(424, 9, 'C4', 'C', 4),
(425, 9, 'C5', 'C', 5),
(426, 9, 'C6', 'C', 6),
(427, 9, 'C7', 'C', 7),
(428, 9, 'C8', 'C', 8),
(429, 9, 'C9', 'C', 9),
(430, 9, 'C10', 'C', 10),
(431, 9, 'D1', 'D', 1),
(432, 9, 'D2', 'D', 2),
(433, 9, 'D3', 'D', 3),
(434, 9, 'D4', 'D', 4),
(435, 9, 'D5', 'D', 5),
(436, 9, 'D6', 'D', 6),
(437, 9, 'D7', 'D', 7),
(438, 9, 'D8', 'D', 8),
(439, 9, 'D9', 'D', 9),
(440, 9, 'D10', 'D', 10),
(441, 9, 'E1', 'E', 1),
(442, 9, 'E2', 'E', 2),
(443, 9, 'E3', 'E', 3),
(444, 9, 'E4', 'E', 4),
(445, 9, 'E5', 'E', 5),
(446, 9, 'E6', 'E', 6),
(447, 9, 'E7', 'E', 7),
(448, 9, 'E8', 'E', 8),
(449, 9, 'E9', 'E', 9),
(450, 9, 'E10', 'E', 10),
(451, 10, 'A1', 'A', 1),
(452, 10, 'A2', 'A', 2),
(453, 10, 'A3', 'A', 3),
(454, 10, 'A4', 'A', 4),
(455, 10, 'A5', 'A', 5),
(456, 10, 'A6', 'A', 6),
(457, 10, 'A7', 'A', 7),
(458, 10, 'A8', 'A', 8),
(459, 10, 'A9', 'A', 9),
(460, 10, 'A10', 'A', 10),
(461, 10, 'B1', 'B', 1),
(462, 10, 'B2', 'B', 2),
(463, 10, 'B3', 'B', 3),
(464, 10, 'B4', 'B', 4),
(465, 10, 'B5', 'B', 5),
(466, 10, 'B6', 'B', 6),
(467, 10, 'B7', 'B', 7),
(468, 10, 'B8', 'B', 8),
(469, 10, 'B9', 'B', 9),
(470, 10, 'B10', 'B', 10),
(471, 10, 'C1', 'C', 1),
(472, 10, 'C2', 'C', 2),
(473, 10, 'C3', 'C', 3),
(474, 10, 'C4', 'C', 4),
(475, 10, 'C5', 'C', 5),
(476, 10, 'C6', 'C', 6),
(477, 10, 'C7', 'C', 7),
(478, 10, 'C8', 'C', 8),
(479, 10, 'C9', 'C', 9),
(480, 10, 'C10', 'C', 10),
(481, 10, 'D1', 'D', 1),
(482, 10, 'D2', 'D', 2),
(483, 10, 'D3', 'D', 3),
(484, 10, 'D4', 'D', 4),
(485, 10, 'D5', 'D', 5),
(486, 10, 'D6', 'D', 6),
(487, 10, 'D7', 'D', 7),
(488, 10, 'D8', 'D', 8),
(489, 10, 'D9', 'D', 9),
(490, 10, 'D10', 'D', 10),
(491, 10, 'E1', 'E', 1),
(492, 10, 'E2', 'E', 2),
(493, 10, 'E3', 'E', 3),
(494, 10, 'E4', 'E', 4),
(495, 10, 'E5', 'E', 5),
(496, 10, 'E6', 'E', 6),
(497, 10, 'E7', 'E', 7),
(498, 10, 'E8', 'E', 8),
(499, 10, 'E9', 'E', 9),
(500, 10, 'E10', 'E', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20250507212412-create-table-movies.js'),
('20250507213049-create-table-cinemas.js'),
('20250507213435-create-table-genres.js'),
('20250507213602-create-table-movie-genres.js'),
('20250509192522-create-table-theaters.js'),
('20250511124006-create-table-seats.js'),
('20250511131805-create-table-users.js'),
('20250511131940-create-table-schedules.js'),
('20250511204731-create-table-bookings.js'),
('20250511205625-create-table-booked-seats.js');

-- --------------------------------------------------------

--
-- Table structure for table `theaters`
--

CREATE TABLE `theaters` (
  `id` int NOT NULL,
  `cinema_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `capacity` int NOT NULL,
  `theater_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `theaters`
--

INSERT INTO `theaters` (`id`, `cinema_id`, `name`, `capacity`, `theater_type`) VALUES
(1, 1, 'Studio 1', 200, 'Regular'),
(2, 2, 'Studio 1', 150, 'Regular'),
(3, 3, 'Studio 1', 180, 'Regular'),
(4, 4, 'Studio 1', 220, 'Regular'),
(5, 5, 'Studio 1', 250, 'Regular'),
(6, 6, 'Studio 1', 200, 'Regular'),
(7, 7, 'Studio 1', 180, 'Regular'),
(8, 8, 'Studio 1', 160, 'Regular'),
(9, 9, 'Studio 1', 200, 'Regular'),
(10, 10, 'Studio 1', 220, 'Regular');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'user', '0123456789123', 'user@gmail.com', 'user', '2025-05-13 06:38:38', '2025-05-13 06:38:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked_seats`
--
ALTER TABLE `booked_seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_id` (`booking_id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `seat_id` (`seat_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_reference` (`booking_reference`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `bookings_ibfk_2` (`schedule_id`);

--
-- Indexes for table `cinemas`
--
ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD PRIMARY KEY (`movie_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `theater_id` (`theater_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theater_id` (`theater_id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `theaters`
--
ALTER TABLE `theaters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cinema_id` (`cinema_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked_seats`
--
ALTER TABLE `booked_seats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cinemas`
--
ALTER TABLE `cinemas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT for table `theaters`
--
ALTER TABLE `theaters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booked_seats`
--
ALTER TABLE `booked_seats`
  ADD CONSTRAINT `booked_seats_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  ADD CONSTRAINT `booked_seats_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`),
  ADD CONSTRAINT `booked_seats_ibfk_3` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD CONSTRAINT `movie_genres_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `movie_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`id`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`id`);

--
-- Constraints for table `theaters`
--
ALTER TABLE `theaters`
  ADD CONSTRAINT `theaters_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

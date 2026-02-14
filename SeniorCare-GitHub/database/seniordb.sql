-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2025 at 12:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seniordb`
--

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `id` int(3) NOT NULL,
  `seniorId` int(3) NOT NULL,
  `alertType` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alerts`
--

INSERT INTO `alerts` (`id`, `seniorId`, `alertType`, `description`, `date`) VALUES
(1, 0, 'medical emergency', 'fg', '2025-07-16'),
(2, 1, 'medical emergency', 'high bp', '2025-07-16'),
(3, 1, 'medical emergency', 'high bp\r\n', '2025-07-16'),
(4, 7, 'not feel well', 'Body pain', '2025-07-16'),
(5, 10, 'Food Poisining', 'Food poisining', '2025-07-16'),
(6, 1, 'Food Poisining', 'aas', '2025-07-17'),
(7, 12, 'Heavy Headache', 'Not feeling well', '2025-07-23'),
(8, 11, 'Food Poisining', 'Not Feel well', '2025-07-28'),
(9, 15, 'medical emergency', 'bhbj', '2025-12-27');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(3) NOT NULL,
  `seniorId` int(3) NOT NULL,
  `caretakerId` int(3) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `seniorId`, `caretakerId`, `date`, `time`) VALUES
(1, 0, 0, '2025-03-15', '08:52:00'),
(2, 1, 0, '2025-07-16', '10:00:00'),
(3, 1, 0, '2025-07-17', '10:02:00'),
(4, 1, 4, '2025-07-16', '10:04:00'),
(5, 6, 9, '2025-07-19', '10:00:00'),
(6, 7, 9, '2025-07-30', '12:19:00'),
(7, 10, 12, '2025-08-09', '19:00:00'),
(8, 1, 4, '2025-07-17', '15:48:00'),
(9, 12, 4, '2025-07-25', '19:00:00'),
(10, 11, 4, '2025-07-28', '20:00:00'),
(11, 15, 20, '2025-12-28', '20:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `caretaker`
--

CREATE TABLE `caretaker` (
  `id` int(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `caretaker`
--

INSERT INTO `caretaker` (`id`, `name`, `contact`, `email`, `password`) VALUES
(3, 'Jagruti', '1478520369', 'jags@gmail.com', '2808'),
(4, 'Lokesh', '1230456987', 'loki@gmail.com', '1907'),
(7, 'sejal', '7894561230', 'sej@gmail.com', '1305'),
(9, 'Ronak Mali', '963258', 'ronak@gmail.com', '1908'),
(10, 'Purva', '1023654789', 'purva@gmail.com', '2603'),
(11, 'Swamini', '1023654789', 'swamini@gmail.com', '0607'),
(12, 'Vaishnavi', '1023654789', 'vaish@gmail.com', '151105'),
(14, 'Sanjana', '9885632114', 'sanjana@gmail.com', '0711'),
(15, 'Khushal', '9403257886', 'khush@gmail.com', '0211'),
(16, 'Rituja', '7410258963', 'rituja@gmail.com', '2410'),
(17, 'Dipali Mali', '9421901686', 'dipalimali@gmail.com', '2103'),
(20, 'Dipali Mali', '9421901686', 'dipalimali@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `healthlogs`
--

CREATE TABLE `healthlogs` (
  `id` int(3) NOT NULL,
  `seniorId` int(3) NOT NULL,
  `date` date NOT NULL,
  `bloodPressure` int(3) NOT NULL,
  `heartRate` int(3) NOT NULL,
  `notes` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `healthlogs`
--

INSERT INTO `healthlogs` (`id`, `seniorId`, `date`, `bloodPressure`, `heartRate`, `notes`) VALUES
(1, 1, '2025-07-16', 110, 88, 'fine'),
(2, 1, '2025-07-16', 110, 88, 'fine'),
(3, 1, '2025-07-16', 110, 88, 'fine'),
(4, 1, '2025-07-25', 108, 78, 'Improvement in health'),
(5, 1, '2025-07-23', 108, 78, 'defr'),
(6, 1, '2025-07-24', 108, 78, 'fine'),
(7, 10, '2025-07-31', 100, 78, 'Everything is fine'),
(8, 12, '2025-07-26', 100, 78, 'Everything is ok'),
(9, 15, '2025-07-28', 110, 89, 'Everything is Ok');

-- --------------------------------------------------------

--
-- Table structure for table `senior`
--

CREATE TABLE `senior` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `age` int(3) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `senior`
--

INSERT INTO `senior` (`id`, `name`, `age`, `contact`, `address`, `email`, `password`) VALUES
(1, 'Asaram', 68, '7588314329', 'Nutan Colony, at post Kapadne D.T. Dhule,424307', 'asaram@gmail.com', '010658'),
(2, 'Sakubai', 63, '9421901686', 'Nutan Colony, at post Kapadne D.T. Dhule,424307', 'saku@gmail.com', '0106'),
(3, 'Bhivasan Patil', 65, '9632587410', 'Jalaram Temple, at post Chikhali, D. Navasari T.Chikhali - 521490', 'bhivsan@gmail.com', '0210'),
(4, 'Rajendra Baviskar', 55, '8520147963', 'Surat', 'rajendra@gmail.com', '0101'),
(5, 'Kailas Mali', 50, '9003214569', 'Dombivli , Maharashtra', 'kailas@gmail.com', '0106'),
(6, 'Kalpna', 45, '8475963210', 'Dombivli , Maharashtra', 'kalpana@gmail.com', '1402'),
(7, 'Vilas', 45, '8600392095', 'Nutan Colony, at post Kapadne D.T. Dhule,424307', 'vilas@gmail.com', '0106'),
(10, 'Sunita', 40, '8520147963', 'Nutan Colony, at post Kapadne D.T. Dhule,424307', 'sunita@gmail.com', '1912'),
(11, 'Dipali', 35, '7410369852', 'Nutan Colony, at post Kapadne D.T. Dhule,424307', 'dipa@gmail.com', '1702'),
(12, 'Prakash', 45, '9403257886', 'Nutan Colony, at post Kapadne D.T. Dhule,424307', 'prakash@gmail.com', '0106'),
(14, 'Dipali', 45, '7410369852', 'Nutan Colony, at post Kapadne D.T. Dhule,424307', 'dipa@gmail.com', '1702'),
(15, 'xyz', 97, '7412589630', 'Nutan Colony, at post Kapadne D.T. Dhule,424307', 'xyz@gmail.com', 'xyz');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `caretaker`
--
ALTER TABLE `caretaker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `healthlogs`
--
ALTER TABLE `healthlogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `senior`
--
ALTER TABLE `senior`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `caretaker`
--
ALTER TABLE `caretaker`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `healthlogs`
--
ALTER TABLE `healthlogs`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `senior`
--
ALTER TABLE `senior`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

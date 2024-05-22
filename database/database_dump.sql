-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2024 at 07:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `psych_hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`) VALUES
(1, 'Apollo Hospitals'),
(2, 'Jawaharlal Nehru Medical College and Hospital'),
(3, 'Indira Gandhi Institute of Medical Sciences (IGIMS)'),
(4, 'AIIMS - All India Institute Of Medical Science');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `psychiatrist_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `address`, `email`, `phone`, `password`, `photo`, `psychiatrist_id`) VALUES
(1, 'Patient 1', '123 Street, City', 'patient1@example.com', '+1234567890', 'Password123', '1716314821301.jpg', 1),
(2, 'Patient 2', '456 Avenue, City', 'patient2@example.com', '+1234567890', 'Password123', '1716314821301.jpg', 1),
(3, 'Patient 3', '789 Boulevard, City', 'patient3@example.com', '+1234567890', 'Password123', '1716314821301.jpg', 2),
(4, 'Patient 4', '101 Road, City', 'patient4@example.com', '+1234567890', 'Password123', '1716314821301.jpg', 2),
(5, 'Patient 5', '112 Street, City', 'patient5@example.com', '+1234567890', 'Password123', '1716314821301.jpg', 3),
(6, 'patient88', 'patient88rfdgfgdgdgfg', 'patient88@user.com', '+12345678901', 'Password1', '1716314821301.jpg', 1),
(7, 'John Doe', '123 Main St, Springfield, USA', 'john.doe1@example.com', '+11234567891', 'Password456', '1716314821301.jpg', 1),
(8, 'Jane Doe', '234 Elm St, Springfield, USA', 'jane.doe1@example.com', '+11234567892', 'Password456', '1716314821301.jpg', 1),
(9, 'Jim Beam', '345 Oak St, Springfield, USA', 'jim.beam1@example.com', '+11234567893', 'Password456', '1716314821301.jpg', 2),
(10, 'Jack Daniels', '456 Pine St, Springfield, USA', 'jack.daniels1@example.com', '+11234567894', 'Password456', '1716314821301.jpg', 2),
(11, 'Johnny Walker', '567 Maple St, Springfield, USA', 'johnny.walker1@example.com', '+11234567895', 'Password456', '1716314821301.jpg', 3),
(12, 'Jameson Irish', '678 Birch St, Springfield, USA', 'jameson.irish1@example.com', '+11234567896', 'Password456', '1716314821301.jpg', 3),
(13, 'Jim Morrison', '789 Cedar St, Springfield, USA', 'jim.morrison1@example.com', '+11234567897', 'Password456', '1716314821301.jpg', 4),
(14, 'Kurt Cobain', '890 Walnut St, Springfield, USA', 'kurt.cobain1@example.com', '+11234567898', 'Password456', '1716314821301.jpg', 4),
(15, 'Freddie Mercury', '901 Chestnut St, Springfield, USA', 'freddie.mercury1@example.com', '+11234567899', 'Password456', '1716314821301.jpg', 5),
(16, 'Elvis Presley', '102 Spruce St, Springfield, USA', 'elvis.presley1@example.com', '+11234567890', 'Password456', '1716314821301.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `psychiatrists`
--

CREATE TABLE `psychiatrists` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hospital_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `psychiatrists`
--

INSERT INTO `psychiatrists` (`id`, `name`, `hospital_id`) VALUES
(1, 'Dr. A', 1),
(2, 'Dr. B', 1),
(3, 'Dr. C', 1),
(4, 'Dr. D', 1),
(5, 'Dr. E', 1),
(6, 'Dr. F', 2),
(7, 'Dr. G', 2),
(8, 'Dr. H', 2),
(9, 'Dr. I', 2),
(10, 'Dr. J', 2),
(11, 'Dr. Alice Smith', 1),
(12, 'Dr. Bob Johnson', 1),
(13, 'Dr. Carol Williams', 1),
(14, 'Dr. David Brown', 1),
(15, 'Dr. Eva Davis', 1),
(16, 'Dr. Frank Miller', 2),
(17, 'Dr. Grace Wilson', 2),
(18, 'Dr. Henry Moore', 2),
(19, 'Dr. Ivy Taylor', 2),
(20, 'Dr. Jack Anderson', 2),
(21, 'Dr. Kelly Thomas', 3),
(22, 'Dr. Liam Jackson', 3),
(23, 'Dr. Mia White', 3),
(24, 'Dr. Noah Harris', 3),
(25, 'Dr. Olivia Martin', 3),
(26, 'Dr. Paul Lewis', 4),
(27, 'Dr. Quinn Walker', 4),
(28, 'Dr. Rose Hall', 4),
(29, 'Dr. Sam Young', 4),
(30, 'Dr. Tina Allen', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `psychiatrist_id` (`psychiatrist_id`);

--
-- Indexes for table `psychiatrists`
--
ALTER TABLE `psychiatrists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `psychiatrists`
--
ALTER TABLE `psychiatrists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`psychiatrist_id`) REFERENCES `psychiatrists` (`id`);

--
-- Constraints for table `psychiatrists`
--
ALTER TABLE `psychiatrists`
  ADD CONSTRAINT `psychiatrists_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

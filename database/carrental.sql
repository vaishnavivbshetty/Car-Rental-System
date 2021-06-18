

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";




--
-- Database: `carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(20) NOT NULL,
  `car_name` varchar(50) NOT NULL,
  `car_nameplate` varchar(50) NOT NULL,
  `car_img` varchar(50) DEFAULT 'NA',
  `ac_price` float NOT NULL,
  `non_ac_price` float NOT NULL,
  `ac_price_per_day` float NOT NULL,
  `non_ac_price_per_day` float NOT NULL,
  `car_availability` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `car_name`, `car_nameplate`, `car_img`, `ac_price`, `non_ac_price`, `ac_price_per_day`, `non_ac_price_per_day`, `car_availability`) VALUES
(1, 'Wagon R', 'KA19MG9910', 'assets/img/cars/wagon-r.png', 10, 8, 2000, 1600, 'yes'),
(2, 'Alto 800', 'MH20GH9452', 'assets/img/cars/alto-800.png', 9, 7, 1800, 1400, 'yes'),
(3, 'Innova', 'GA16NM9125', 'assets/img/cars/Innova.png', 13, 11, 2600, 2200, 'yes'),
(4, 'Ford Figo', 'GJ17HZ4001', 'assets/img/cars/figo.png', 11, 9, 2200, 1800, 'yes'),
(6, 'Mahindra Bolero', 'KL18MJ8472', 'assets/img/cars/bolero.jpg', 15, 13, 3000, 2600, 'yes'),
(7, 'Honda Amaze', 'PJ16YX8820', 'assets/img/cars/amaze.png', 14, 12, 2800, 2400, 'no'),
(8, 'Tata Nexon', 'WB15EX5005', 'assets/img/cars/nexon.jpg', 12, 10, 2400, 2000, 'yes'),
(9, 'Swift Dzire', 'BR01HX8001', 'assets/img/cars/dzire.png', 10, 8, 2000, 1600, 'yes'),
(10, 'Suzuki Ciaz', 'TN17MS1997', 'assets/img/cars/Suzuki_Ciaz_2017.jpg', 12, 10, 2400, 2000, 'yes'),
(11, 'Mahindra XUV 500', 'KA12EX1883', 'assets/img/cars/Mahindra XUV.jpg', 15, 13, 3000, 2600, 'yes'),
(12, 'Toyota Fortuner', 'GA08MX1997', 'assets/img/cars/Fortuner.png', 16, 14, 3200, 2800, 'yes'),
(13, 'Suzuki Ertiga', 'MH02DC1997', 'assets/img/cars/maruti-suzuki-ertiga.jpg', 14, 12, 2800, 2400, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `clientcars`
--

CREATE TABLE `ownercars` (
  `car_id` int(20) NOT NULL,
  `owner_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clientcars`
--

INSERT INTO `ownercars` (`car_id`, `owner_username`) VALUES
(1, 'vaishnavi'),
(2, 'vaishnavi'),
(3, 'vaishnavi'),
(4, 'vaishnavi'),
(10, 'vaishnavi'),
(11, 'vaishnavi'),
(6, 'raksha'),
(7, 'raksha'),
(8, 'raksha'),
(9, 'raksha'),
(12, 'raksha'),
(13, 'raksha');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `owners` (
  `owner_username` varchar(50) NOT NULL,
  `owner_name` varchar(50) NOT NULL,
  `owner_phone` varchar(15) NOT NULL,
  `owner_email` varchar(25) NOT NULL,
  `owner_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `owner_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`owner_username`, `owner_name`, `owner_phone`, `owner_email`, `owner_address`, `owner_password`) VALUES
('vaishnavi', 'Vaishnavi Shetty', '8547869542', 'vaishnavivbshetty2000@gmail@gmail.com', 'Mangalore', 'password'),
('raksha', 'Raksha Shetty', '8569874125', 'raksha@gmail.com', '	Puttur', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_username` varchar(50) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_phone` varchar(15) NOT NULL,
  `customer_email` varchar(25) NOT NULL,
  `customer_address` varchar(50) NOT NULL,
  `customer_password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_username`, `customer_name`, `customer_phone`, `customer_email`, `customer_address`, `customer_password`) VALUES
('vishwa', 'Vishwanath Rai', '9412578632', 'vishwa@gmail.com', 'Savanoor', 'password'),
('meenakshi', 'Meenakshi V', '9541257862', 'meena@gmail.com', 'Mangalore', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(20) NOT NULL,
  `driver_name` varchar(50) NOT NULL,
  `dl_number` varchar(50) NOT NULL,
  `driver_phone` varchar(15) NOT NULL,
  `driver_address` varchar(50) NOT NULL,
  `driver_gender` varchar(10) NOT NULL,
  `owner_username` varchar(50) NOT NULL,
  `driver_availability` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `driver_name`, `dl_number`, `driver_phone`, `driver_address`, `driver_gender`, `owner_username`, `driver_availability`) VALUES
(1, 'Nishmitha', 'DL_TEH5974', '9547863157', 'Kottara', 'Female', 'vaishnavi', 'yes'),
(2, 'Nikitha Melanta', 'DL_NDC7584', '9147523684', 'Muger', 'Female', 'vaishnavi', 'yes'),
(3, 'Lavanya', 'DL_LSC8451', '9147523682', 'Padil', 'Female', 'vaishnavi', 'yes'),
(4, 'Charan', 'DL_MND8415', '9187563240', 'Kannur', 'Male', 'raksha', 'no'),
(5, 'Anusha', 'DL_GAX9452', '7584960123', 'Mangalore', 'Female', 'raksha', 'yes'),
(6, 'Pavan Shetty', 'DL_YSH9542', '8421025476', 'Kavur', 'Male', 'raksha', 'yes');


-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `name` varchar(20) NOT NULL,
  `e_mail` varchar(30) NOT NULL,
  `message` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`name`, `e_mail`, `message`) VALUES
('Vaishnavi Shetty', 'vaishnavivbshetty2000@gmail@gmail@gmail.com', 'Hope this works.');

-- --------------------------------------------------------

--
-- Table structure for table `rentedcars`
--

CREATE TABLE `rentedcars` (
  `id` int(100) NOT NULL,
  `customer_username` varchar(50) NOT NULL,
  `car_id` int(20) NOT NULL,
  `driver_id` int(20) NOT NULL,
  `booking_date` date NOT NULL,
  `rent_start_date` date NOT NULL,
  `rent_end_date` date NOT NULL,
  `car_return_date` date DEFAULT NULL,
  `fare` double NOT NULL,
  `charge_type` varchar(25) NOT NULL DEFAULT 'days',
  `distance` double DEFAULT NULL,
  `no_of_days` int(50) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `return_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rentedcars`
--

INSERT INTO `rentedcars` (`id`, `customer_username`, `car_id`, `driver_id`, `booking_date`, `rent_start_date`, `rent_end_date`, `car_return_date`, `fare`, `charge_type`, `distance`, `no_of_days`, `total_amount`, `return_status`) VALUES

(574681252, 'meenakshi', 11, 2, '2021-04-23', '2021-04-23', '2021-04-23', '2021-04-23', 13, 'km', 200, 0, 2600, 'R'),
(574681253, 'vishwa', 6, 7, '2021-05-23', '2021-05-23', '2021-06-03', '2021-05-23', 2600, 'days', NULL, 11, 28600, 'R'),
(574681254, 'vishwa', 12, 5, '2021-05-23', '2021-05-23', '2021-05-26', '2021-05-23', 3200, 'days', NULL, 3, 9600, 'R'),
(574681255, 'meenakshi', 8, 5, '2021-05-23', '2021-05-23', '2021-06-08', '2021-05-23', 2400, 'days', NULL, 16, 38400, 'R'),
(574681257, 'meenakshi', 7, 4, '2021-06-11', '2021-06-13', '2021-06-17', NULL, 14, 'km', NULL, NULL, NULL, 'NR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD UNIQUE KEY `car_nameplate` (`car_nameplate`);

--
-- Indexes for table `clientcars`
--
ALTER TABLE `ownercars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `owner_username` (`owner_username`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`owner_username`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_username`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD UNIQUE KEY `dl_number` (`dl_number`),
  ADD KEY `owner_username` (`owner_username`);

--
-- Indexes for table `rentedcars`
--
ALTER TABLE `rentedcars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_username` (`customer_username`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `rentedcars`
--
ALTER TABLE `rentedcars`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=574681258;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientcars`
--
ALTER TABLE `ownercars`
  ADD CONSTRAINT `ownercars_ibfk_1` FOREIGN KEY (`owner_username`) REFERENCES `owners` (`owner_username`),
  ADD CONSTRAINT `ownercars_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`);

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`owner_username`) REFERENCES `owners` (`owner_username`);

--
-- Constraints for table `rentedcars`
--
ALTER TABLE `rentedcars`
  ADD CONSTRAINT `rentedcars_ibfk_1` FOREIGN KEY (`customer_username`) REFERENCES `customers` (`customer_username`),
  ADD CONSTRAINT `rentedcars_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  ADD CONSTRAINT `rentedcars_ibfk_3` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`);
COMMIT;


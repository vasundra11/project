-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 28, 2022 at 10:42 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insurance`
--

-- --------------------------------------------------------

--
-- Table structure for table `accident_claim`
--

CREATE TABLE `accident_claim` (
  `id` int(11) NOT NULL,
  `vehicle_type` varchar(25) NOT NULL,
  `accident_date` varchar(25) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `accident_place` varchar(50) NOT NULL,
  `status` varchar(25) NOT NULL,
  `cliam_amount` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accident_claim`
--

INSERT INTO `accident_claim` (`id`, `vehicle_type`, `accident_date`, `customer_name`, `accident_place`, `status`, `cliam_amount`) VALUES
(1, 'TwoWheeler', '2022/10/05', 'Akash', 'Coimbatore', 'Approved', '15000'),
(2, 'FourWheeler', '2022/09/25', 'Viknesh', 'Tripur', 'Rejected', '0');

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin@1234');

-- --------------------------------------------------------

--
-- Table structure for table `Customer_details`
--

CREATE TABLE `Customer_details` (
  `cus_id` int(11) NOT NULL,
  `Customer_Name` text NOT NULL,
  `Customer_mobile` varchar(15) NOT NULL,
  `Customer_email` varchar(50) NOT NULL,
  `Address` text NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `marital_status` varchar(10) NOT NULL,
  `DOB` varchar(15) NOT NULL,
  `aadhaar_no` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Customer_details`
--

INSERT INTO `Customer_details` (`cus_id`, `Customer_Name`, `Customer_mobile`, `Customer_email`, `Address`, `Gender`, `marital_status`, `DOB`, `aadhaar_no`) VALUES
(1, 'test', '1234567898', '1234567898', '41,test\r\ncbe', 'male', 'Single', '2022-10-23', '478444785447854');

-- --------------------------------------------------------

--
-- Table structure for table `customer_policy_renewal`
--

CREATE TABLE `customer_policy_renewal` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(10) NOT NULL,
  `fullname` varchar(80) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `mailid` varchar(45) NOT NULL,
  `address` text NOT NULL,
  `policyname` varchar(50) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `cardnumber` varchar(25) NOT NULL,
  `expirymonth` varchar(10) NOT NULL,
  `expiryyear` varchar(10) NOT NULL,
  `cvv` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_policy_renewal`
--

INSERT INTO `customer_policy_renewal` (`id`, `customer_id`, `fullname`, `mobileno`, `mailid`, `address`, `policyname`, `amount`, `cardnumber`, `expirymonth`, `expiryyear`, `cvv`) VALUES
(1, '2', 'testingT', '1235544', 'TEST@gmail.com', 'test', 'Jeevanthara', '40000', '1254785478', '3', '2023', '232');

-- --------------------------------------------------------

--
-- Table structure for table `customer_signup`
--

CREATE TABLE `customer_signup` (
  `id` int(11) NOT NULL,
  `customer_name` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_signup`
--

INSERT INTO `customer_signup` (`id`, `customer_name`, `username`, `password`) VALUES
(1, 'test', 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `policy_details`
--

CREATE TABLE `policy_details` (
  `id` int(11) NOT NULL,
  `policy_no` varchar(20) NOT NULL,
  `policy_name` varchar(50) NOT NULL,
  `vehicle_type` varchar(25) NOT NULL,
  `status` varchar(15) NOT NULL,
  `insured_amt` varchar(10) NOT NULL,
  `Renewal_plans` varchar(15) NOT NULL,
  `accident_cover` varchar(10) NOT NULL,
  `total_amt` varchar(30) NOT NULL,
  `accident_amt` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policy_details`
--

INSERT INTO `policy_details` (`id`, `policy_no`, `policy_name`, `vehicle_type`, `status`, `insured_amt`, `Renewal_plans`, `accident_cover`, `total_amt`, `accident_amt`) VALUES
(2, '123456789', 'Jeevanthara', '2-wheeler', 'active', '25000', 'damange', 'yes', '40000', '15000');

-- --------------------------------------------------------

--
-- Table structure for table `policy_renewal`
--

CREATE TABLE `policy_renewal` (
  `id` int(11) NOT NULL,
  `customername` varchar(50) NOT NULL,
  `mobileno` varchar(40) NOT NULL,
  `mailid` varchar(20) NOT NULL,
  `address` varchar(80) NOT NULL,
  `policyname` varchar(45) NOT NULL,
  `vehiicletype` varchar(15) NOT NULL,
  `renewalplans` varchar(30) NOT NULL,
  `accidentcover` varchar(20) NOT NULL,
  `insuredamount` varchar(30) NOT NULL,
  `totalamount` varchar(15) NOT NULL,
  `datefrom` varchar(15) NOT NULL,
  `dateto` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policy_renewal`
--

INSERT INTO `policy_renewal` (`id`, `customername`, `mobileno`, `mailid`, `address`, `policyname`, `vehiicletype`, `renewalplans`, `accidentcover`, `insuredamount`, `totalamount`, `datefrom`, `dateto`) VALUES
(1, 'test', '1234567898', '1234567898', '41,test\r\ncbe', 'Jeevanthara', '2-wheeler', 'damange', 'yes', '25000', '40000', '2022-10-01', '2022-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `signin`
--

CREATE TABLE `signin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `mobileno` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signin`
--

INSERT INTO `signin` (`id`, `username`, `password`, `Name`, `mobileno`) VALUES
(2, 'test', 'test@123', 'Pavi', '142545454');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accident_claim`
--
ALTER TABLE `accident_claim`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Customer_details`
--
ALTER TABLE `Customer_details`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `customer_policy_renewal`
--
ALTER TABLE `customer_policy_renewal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_signup`
--
ALTER TABLE `customer_signup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policy_details`
--
ALTER TABLE `policy_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policy_renewal`
--
ALTER TABLE `policy_renewal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `signin`
--
ALTER TABLE `signin`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accident_claim`
--
ALTER TABLE `accident_claim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `adminlogin`
--
ALTER TABLE `adminlogin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Customer_details`
--
ALTER TABLE `Customer_details`
  MODIFY `cus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_policy_renewal`
--
ALTER TABLE `customer_policy_renewal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_signup`
--
ALTER TABLE `customer_signup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `policy_details`
--
ALTER TABLE `policy_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `policy_renewal`
--
ALTER TABLE `policy_renewal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `signin`
--
ALTER TABLE `signin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

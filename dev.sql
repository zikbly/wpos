-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2020 at 07:51 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE `auth` (
  `id` int(11) NOT NULL,
  `username` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(66) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uuid` char(16) COLLATE utf8_unicode_ci NOT NULL,
  `admin` int(1) NOT NULL,
  `disabled` int(1) NOT NULL DEFAULT '0',
  `permissions` varchar(2048) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`id`, `username`, `name`, `password`, `token`, `uuid`, `admin`, `disabled`, `permissions`) VALUES
(1, 'admin', 'admin', '5c5ef12b2808608bec73a1ff04759f483640209378e435fb94c5e295725fd147', 'jhdbkiq1cIIxzNKlL7N6LwU0OZvLlqZz', '', 1, 0, ''),
(2, 'staff', 'staff', '1562206543da764123c21bd524674f0a8aaf49c8a89744c97352fe677f7e4006', 'LXlYszelWpiTFfDraswR4Ze0n7On8WQ6', '5346788d0a8ae', 0, 0, '{"sections":{"access":"no","dashboard":"none","reports":0,"graph":0,"sales":0,"invoices":0,"items":0,"stock":0,"categories":0,"suppliers":0,"customers":0},"apicalls":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `name` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `data` varchar(2048) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `name`, `data`) VALUES
(1, 'general', '{"version":"1.4.0","dateformat":"d\\/m\\/y","currencyformat":"\\u20b5~2~.~,~0","accntype":"cash","bizname":"Test Business","biznumber":"027 747 8321","bizemail":"","bizaddress":"Dansoman","bizsuburb":"","bizstate":"Accra","bizpostcode":"","bizcountry":"Ghana","bizlogo":"\\/assets\\/images\\/receipt-log","bizicon":"\\/icon.ic","gcontact":0,"gcontacttoken":"","altlabels":{"cash":"Cash","credit":"Credit","eftpos":"Eftpos","cheque":"Cheque","deposit":"Deposit","tendered":"Tendered","change":"Change","transaction-ref":"Transaction Ref","transaction-id":"","sale-time":"Sale Time","subtotal":"Subtotal","total":"Total","item":"Item","items":"Items","refund":"Refund","void-transaction":"Void Transaction"}}'),
(2, 'pos', '{"rectemplate":"receipt","recline2":"","recline3":"","reclogo":"\\/assets\\/images\\/receipt-logo-mon","recprintlogo":false,"reccurrency":"","reccurrency_codepage":"0","recemaillogo":"\\/assets\\/images\\/receipt-log","recfooter":"Thanks for shopping with Test Business!","recqrcode":"","salerange":"week","saledevice":"location","priceedit":"blank","cashrounding":"0","negative_items":false}'),
(3, 'invoice', '{"defaulttemplate":"invoice","defaultduedt":"+2 weeks","payinst":"Please contact us for payment instructions","emailmsg":"<div align=\\"left\\">Dear %name%,<br><\\/div><br>Please find the attached invoice.<br><br>Kind regards,<br>Administration"}'),
(4, 'accounting', '{"xeroenabled":0,"xerotoken":"","xeroaccnmap":""}'),
(5, 'templates', '{"invoice":{"name":"Default Invoice","type":"invoice","filename":"invoice.mustache"},"invoice_mixed":{"name":"Mixed Language","type":"invoice","filename":"invoice_mixed.mustache"},"invoice_alt":{"name":"Alternate Language","type":"invoice","filename":"invoice_alt.mustache"},"receipt":{"name":"Default Receipt","type":"receipt","filename":"receipt.mustache"},"receipt_mixed":{"name":"Mixed Language","type":"receipt","filename":"receipt_mixed.mustache"},"receipt_alt":{"name":"Alternate Language","type":"receipt","filename":"receipt_alt.mustache"}}');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(192) COLLATE utf8_unicode_ci NOT NULL,
  `suburb` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `postcode` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `notes` varchar(2048) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `googleid` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(512) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `activated` int(1) NOT NULL DEFAULT '0',
  `disabled` int(1) NOT NULL DEFAULT '0',
  `lastlogin` datetime DEFAULT NULL,
  `dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_contacts`
--

CREATE TABLE `customer_contacts` (
  `id` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `receivesinv` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(11) NOT NULL,
  `name` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `locationid` int(11) NOT NULL,
  `data` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `disabled` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `name`, `locationid`, `data`, `dt`, `disabled`) VALUES
(1, 'Test POS Terminal', 1, '{"name":"Test POS Terminal","locationid":"1","type":"general_register","ordertype":"printer","orderdisplay":1,"kitchenid":0,"barid":0}', '2020-05-26 12:19:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `device_map`
--

CREATE TABLE `device_map` (
  `id` int(11) NOT NULL,
  `deviceid` int(11) NOT NULL,
  `uuid` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `useragent` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `dt` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `device_map`
--

INSERT INTO `device_map` (`id`, `deviceid`, `uuid`, `ip`, `useragent`, `dt`) VALUES
(1, 1, 'e868279ddf9dfd6ce21166b56075e9d9f6b430c76771f15b1f6bf035fd106daf', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36', '2020-05-26 12:19:13');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `disabled` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `dt`, `disabled`) VALUES
(1, 'Dansoman', '2020-05-26 12:19:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `ref` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `channel` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `data` varchar(16384) COLLATE utf8_unicode_ci NOT NULL,
  `userid` int(11) NOT NULL,
  `deviceid` int(11) NOT NULL,
  `locationid` int(11) NOT NULL,
  `custid` int(11) NOT NULL,
  `discount` decimal(4,0) NOT NULL,
  `rounding` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cost` decimal(12,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` int(1) NOT NULL,
  `processdt` bigint(20) NOT NULL,
  `duedt` bigint(20) NOT NULL DEFAULT '0',
  `dt` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `ref`, `type`, `channel`, `data`, `userid`, `deviceid`, `locationid`, `custid`, `discount`, `rounding`, `cost`, `total`, `balance`, `status`, `processdt`, `duedt`, `dt`) VALUES
(2, '1590505681708-1-800', 'sale', 'pos', '{"ref":"1590505681708-1-800","userid":"2","devid":"1","locid":"1","custid":"0","custemail":"","notes":"","discount":"0","rounding":"0.00","cost":"1.00","subtotal":"1.90","total":"2.00","numitems":1,"processdt":1590505681708,"items":[{"ref":"7cfbe48d","sitemid":"1","qty":1,"name":"Bread","unit":"2.00","taxid":"2","tax":{"total":0.1,"values":{"1":0.06,"2":0.04},"inclusive":true},"price":"2.00","desc":"","cost":"1","unit_original":"2","alt_name":"","id":"2"}],"payments":[{"method":"cash","amount":"2.00","tender":"2.00","change":"0.00","id":"2","processdt":1590505681708}],"tax":"0.10","taxdata":{"1":"0.06","2":"0.04"},"id":"2","dt":"2020-05-27 01:08:01","balance":0,"status":1}', 2, 1, 1, 0, '0', '0.00', '1.00', '2.00', '0.00', 1, 1590505681708, 0, '2020-05-27 01:08:01');

-- --------------------------------------------------------

--
-- Table structure for table `sale_history`
--

CREATE TABLE `sale_history` (
  `id` int(11) NOT NULL,
  `saleid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `type` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sale_history`
--

INSERT INTO `sale_history` (`id`, `saleid`, `userid`, `type`, `description`, `dt`) VALUES
(0, 1, 2, 'Created', 'Sale created', '2020-05-27 00:17:08'),
(0, 2, 2, 'Created', 'Sale created', '2020-05-27 01:08:01'),
(0, 3, 2, 'Created', 'Sale created', '2020-05-27 01:13:19');

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` int(11) NOT NULL,
  `saleid` int(11) NOT NULL,
  `storeditemid` int(11) NOT NULL,
  `saleitemid` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `name` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `taxid` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `tax` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `tax_incl` int(1) NOT NULL DEFAULT '1',
  `tax_total` decimal(12,2) NOT NULL DEFAULT '0.00',
  `cost` decimal(12,2) NOT NULL DEFAULT '0.00',
  `unit_original` decimal(12,2) NOT NULL DEFAULT '0.00',
  `unit` decimal(12,2) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `refundqty` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `saleid`, `storeditemid`, `saleitemid`, `qty`, `name`, `description`, `taxid`, `tax`, `tax_incl`, `tax_total`, `cost`, `unit_original`, `unit`, `price`, `refundqty`) VALUES
(2, 2, 1, '7cfbe48d', 1, 'Bread', '', '2', '{"total":0.1,"values":{"1":0.06,"2":0.04},"inclusive":true}', 1, '0.10', '1.00', '2.00', '2.00', '2.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sale_payments`
--

CREATE TABLE `sale_payments` (
  `id` int(11) NOT NULL,
  `saleid` int(11) NOT NULL,
  `method` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `processdt` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sale_payments`
--

INSERT INTO `sale_payments` (`id`, `saleid`, `method`, `amount`, `processdt`) VALUES
(2, 2, 'cash', '2.00', 1590505681708);

-- --------------------------------------------------------

--
-- Table structure for table `sale_voids`
--

CREATE TABLE `sale_voids` (
  `id` int(11) NOT NULL,
  `saleid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `deviceid` int(11) NOT NULL,
  `locationid` int(11) NOT NULL,
  `reason` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `method` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `items` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `void` int(1) NOT NULL,
  `processdt` bigint(128) NOT NULL,
  `dt` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_history`
--

CREATE TABLE `stock_history` (
  `id` int(11) NOT NULL,
  `storeditemid` int(11) NOT NULL,
  `locationid` int(11) NOT NULL,
  `auxid` int(11) NOT NULL,
  `auxdir` int(1) NOT NULL,
  `type` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stock_history`
--

INSERT INTO `stock_history` (`id`, `storeditemid`, `locationid`, `auxid`, `auxdir`, `type`, `amount`, `dt`) VALUES
(1, 1, 1, -1, 0, 'Stock Added', 10, '2020-05-27 01:05:27'),
(2, 2, 1, -1, 0, 'Stock Added', 10, '2020-05-27 01:12:05'),
(3, 1, 1, -1, 0, 'Stock Added', 1, '2020-05-27 02:50:51'),
(4, 1, 0, -1, 0, 'Stock Added', 1, '2020-05-27 02:50:58'),
(5, 1, 0, -1, 0, 'Stock Added', 0, '2020-05-27 02:53:20');

-- --------------------------------------------------------

--
-- Table structure for table `stock_levels`
--

CREATE TABLE `stock_levels` (
  `id` int(11) NOT NULL,
  `storeditemid` int(11) NOT NULL,
  `locationid` int(11) NOT NULL,
  `stocklevel` int(11) NOT NULL,
  `dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stock_levels`
--

INSERT INTO `stock_levels` (`id`, `storeditemid`, `locationid`, `stocklevel`, `dt`) VALUES
(1, 1, 1, 10, '2020-05-26 15:05:27'),
(2, 2, 1, 7, '2020-05-26 15:12:05');

-- --------------------------------------------------------

--
-- Table structure for table `stored_categories`
--

CREATE TABLE `stored_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stored_categories`
--

INSERT INTO `stored_categories` (`id`, `name`, `dt`) VALUES
(1, 'Food', '2020-05-26 13:34:11'),
(2, 'Drinks', '2020-05-26 15:11:32');

-- --------------------------------------------------------

--
-- Table structure for table `stored_items`
--

CREATE TABLE `stored_items` (
  `id` int(11) NOT NULL,
  `data` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `supplierid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `code` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(66) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stored_items`
--

INSERT INTO `stored_items` (`id`, `data`, `supplierid`, `categoryid`, `code`, `name`, `price`) VALUES
(1, '{"id":"1","code":"001","qty":"0","name":"Bread","alt_name":"","description":"","taxid":"2","cost":"1","price":"2","supplierid":"1","categoryid":"1","type":"general","modifiers":[]}', 1, 1, '001', 'Bread', '2'),
(2, '{"id":"2","code":"002","qty":"0","name":"Coke","alt_name":"","description":"","taxid":"2","cost":"8","price":"10","supplierid":"1","categoryid":"2","type":"general","modifiers":[]}', 1, 2, '002', 'Coke', '10');

-- --------------------------------------------------------

--
-- Table structure for table `stored_suppliers`
--

CREATE TABLE `stored_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `dt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stored_suppliers`
--

INSERT INTO `stored_suppliers` (`id`, `name`, `dt`) VALUES
(1, 'Default Supplier', '2020-05-26 13:34:22');

-- --------------------------------------------------------

--
-- Table structure for table `tax_items`
--

CREATE TABLE `tax_items` (
  `id` int(11) NOT NULL,
  `name` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `altname` varchar(66) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `multiplier` varchar(8) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tax_items`
--

INSERT INTO `tax_items` (`id`, `name`, `altname`, `type`, `value`, `multiplier`) VALUES
(1, 'VAT', '', 'standard', '3', '0.03'),
(2, 'NHIL', '', 'standard', '2', '0.02');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rules`
--

CREATE TABLE `tax_rules` (
  `id` int(11) NOT NULL,
  `data` varchar(2048) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tax_rules`
--

INSERT INTO `tax_rules` (`id`, `data`) VALUES
(1, '{"name":"No Tax", "inclusive":true, "mode":"single", "base":[], "locations":{}, "id":"1"}'),
(2, '{"name":"Tax","inclusive":true,"mode":"multi","base":[1,2],"locations":{},"id":"2"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_map`
--
ALTER TABLE `device_map`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_payments`
--
ALTER TABLE `sale_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_voids`
--
ALTER TABLE `sale_voids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_history`
--
ALTER TABLE `stock_history`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `stock_levels`
--
ALTER TABLE `stock_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stored_categories`
--
ALTER TABLE `stored_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stored_items`
--
ALTER TABLE `stored_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplierid` (`supplierid`);

--
-- Indexes for table `stored_suppliers`
--
ALTER TABLE `stored_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_items`
--
ALTER TABLE `tax_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rules`
--
ALTER TABLE `tax_rules`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth`
--
ALTER TABLE `auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_contacts`
--
ALTER TABLE `customer_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `device_map`
--
ALTER TABLE `device_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sale_payments`
--
ALTER TABLE `sale_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sale_voids`
--
ALTER TABLE `sale_voids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_history`
--
ALTER TABLE `stock_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `stock_levels`
--
ALTER TABLE `stock_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `stored_categories`
--
ALTER TABLE `stored_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `stored_items`
--
ALTER TABLE `stored_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `stored_suppliers`
--
ALTER TABLE `stored_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tax_items`
--
ALTER TABLE `tax_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tax_rules`
--
ALTER TABLE `tax_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

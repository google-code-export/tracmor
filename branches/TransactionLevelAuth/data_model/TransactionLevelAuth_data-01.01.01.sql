SET FOREIGN_KEY_CHECKS = 0;

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `tracmor`
--

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `company_id`, `short_description`, `country_id`, `address_1`, `address_2`, `city`, `state_province_id`, `postal_code`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 1, 'Main Office', 228, '2700 Stevenson Dr', '', 'Springfield', 14, '62703', 1, '2006-10-25 16:02:19', 1, '2006-10-25 16:07:32'),
(2, 2, 'Headquarters', 228, '3420 SW Cedar Hills Blvd', '', 'Beaverton', 38, '97005', 1, '2006-10-25 16:09:43', NULL, NULL),
(3, 3, 'US Office', 228, '3010 Wake Forest Rd', '', 'Raleigh', 34, '27609', 1, '2006-10-25 16:28:08', NULL, NULL),
(4, 3, 'UK Office', 227, '139-142 Westbourne Grove', '', 'London', NULL, '020 7229 4734', 1, '2006-10-25 16:30:44', NULL, NULL),
(5, 4, 'Main Office', 228, '950 W El Camino Real', '', 'Mountain View', 5, '94040', 1, '2006-10-25 16:58:51', NULL, NULL),
(6, 5, 'Shipping & Receiving', 228, '939 W Northern Lights Blvd', '', 'Anchorage', 2, '99503', 1, '2006-10-25 17:04:32', NULL, NULL),
(7, 6, 'East Coast Offices', 228, '331 Avenue of the Americas', '', 'New York', 33, '10014', 1, '2006-10-25 17:08:58', NULL, NULL),
(8, 6, 'West Coast Offices', 228, '200 Duboce Ave', '', 'San Francisco', 5, '94103', 1, '2006-10-25 17:09:44', NULL, NULL),
(9, 7, 'Headquarters', 228, '3310 State St, Bismarck', '', 'Bismarck', 35, '58503', 1, '2006-10-25 17:16:04', NULL, NULL),
(10, 8, 'Main Office', 228, '2440 S Maryland Pkwy', '', 'Las Vegas', 29, '89104', 1, '2006-10-25 17:23:41', NULL, NULL),
(11, 9, 'Shipping Address', 228, '3802 S Dale Mabry Hwy', '', 'Tampa', 10, '33611', 1, '2006-10-25 17:27:17', NULL, NULL),
(12, 10, 'Shipping Address', 228, '822 Grand Ave', '', 'San Diego', 5, '92109', 1, '2006-10-25 17:31:00', NULL, NULL),
(13, 11, 'Austin Address', 228, '1503 W 35th St,', '', 'Austin', 44, '78703', 1, '2006-10-25 17:35:59', NULL, NULL),
(14, 12, 'Seattle Address', 228, '535 Broadway E', '', 'Seattle', 48, '98102', 1, '2006-10-25 17:38:04', NULL, NULL),
(15, 13, 'Chicago Address', 228, '2575 N Clybourn Ave', '', 'Chicago', 14, '60614', 1, '2006-10-25 17:51:08', NULL, NULL),
(16, 14, 'Boston Address', 228, '700 Commonwealth Ave', '', 'Boston', 22, '02215', 1, '2006-10-25 17:54:42', NULL, NULL),
(17, 15, 'Headquarters', 228, '5801 S Vermont Ave', '', 'Los Angeles', 5, '90044', 1, '2006-10-31 11:51:29', 1, '2006-10-31 11:53:44'),
(18, 15, 'East Coast Office', 228, '2631 Skidaway Rd', '', 'Savannah', 11, '31404', 1, '2006-10-31 11:52:36', NULL, NULL);

--
-- Dumping data for table `admin_setting`
--

INSERT INTO `admin_setting` (`setting_id`, `short_description`, `VALUE`) VALUES
(1, 'company_id', NULL),
(2, 'image_upload_prefix', NULL),
(3, 'fedex_gateway_URI', NULL),
(4, 'company_logo', 'empty.gif'),
(5, 'packing_list_terms', NULL),
(6, 'packing_list_logo', NULL),
(7, 'min_asset_code', NULL),
(8, 'fedex_account_id', NULL),
(9, 'autodetect_tracking_numbers', NULL),
(10, 'custom_shipment_numbers', NULL),
(11, 'custom_receipt_numbers', NULL),
(12, 'receive_to_last_location', NULL),
(13, 'portable_pin_required', '1');

--
-- Dumping data for table `asset`
--

INSERT INTO `asset` (`asset_id`, `asset_model_id`, `location_id`, `asset_code`, `image_path`, `checked_out_flag`, `reserved_flag`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 3, 18, '10005001', NULL, NULL, NULL, 1, '2006-10-31 15:01:43', 1, '2006-10-31 15:11:28'),
(2, 3, 21, '10005009', NULL, NULL, NULL, 1, '2006-10-31 15:06:40', NULL, NULL),
(3, 3, 55, '10005002', NULL, NULL, NULL, 1, '2006-10-31 15:07:42', 1, '2006-10-31 15:08:02'),
(4, 3, 12, '10005004', NULL, '\0', NULL, 1, '2006-10-31 15:08:35', 1, '2006-10-31 15:09:17'),
(5, 1, 23, '10004002', NULL, NULL, NULL, 1, '2006-10-31 15:10:40', NULL, NULL),
(6, 4, 59, '10005033', NULL, NULL, NULL, 1, '2006-11-01 12:34:48', NULL, NULL),
(7, 4, 63, '10005034', NULL, NULL, NULL, 1, '2006-11-01 12:35:19', NULL, NULL),
(8, 4, 61, '10005032', NULL, NULL, NULL, 1, '2006-11-01 12:36:12', NULL, NULL),
(9, 1, 19, '10005029', NULL, NULL, NULL, 1, '2006-11-01 12:36:38', NULL, NULL),
(10, 1, 53, '10005021', NULL, NULL, NULL, 1, '2006-11-01 12:37:06', NULL, NULL),
(11, 6, 16, '10005039', NULL, NULL, NULL, 1, '2006-11-01 12:37:33', NULL, NULL),
(12, 6, 17, '10005038', NULL, NULL, NULL, 1, '2006-11-01 12:37:47', NULL, NULL),
(13, 6, 22, '10005031', NULL, NULL, NULL, 1, '2006-11-01 12:38:00', 1, '2006-11-01 13:20:31'),
(14, 1, 50, '10005098', NULL, NULL, NULL, 1, '2006-11-01 13:15:15', NULL, NULL),
(15, 5, 56, '10005093', NULL, NULL, NULL, 1, '2006-11-01 13:15:58', NULL, NULL),
(16, 5, 57, '10005088', NULL, NULL, NULL, 1, '2006-11-01 13:16:11', 1, '2006-11-01 13:16:50'),
(17, 3, 47, '10004394', NULL, NULL, NULL, 1, '2006-11-01 13:17:27', NULL, NULL),
(18, 3, 48, '10005947', NULL, NULL, NULL, 1, '2006-11-01 13:17:49', NULL, NULL),
(19, 3, 24, '10005937', NULL, NULL, NULL, 1, '2006-11-01 13:18:16', NULL, NULL),
(20, 5, 58, '10009844', NULL, NULL, NULL, 1, '2006-11-01 13:19:40', NULL, NULL),
(21, 5, 60, '10005921', NULL, NULL, NULL, 1, '2006-11-01 13:21:48', 1, '2006-11-03 11:45:45'),
(22, 7, 46, '10002001', NULL, NULL, NULL, 1, '2006-11-01 13:48:49', NULL, NULL),
(23, 7, 46, '10008002', NULL, NULL, NULL, 1, '2006-11-01 13:50:07', NULL, NULL),
(24, 7, 46, '10005987', NULL, NULL, NULL, 1, '2006-11-03 10:18:54', NULL, NULL),
(25, 7, 46, '10005076', NULL, NULL, NULL, 1, '2006-11-03 10:19:23', NULL, NULL),
(26, 7, 46, '10005977', NULL, NULL, NULL, 1, '2006-11-03 10:20:13', NULL, NULL),
(27, 8, 40, '10005733', NULL, NULL, NULL, 1, '2006-11-03 11:41:25', NULL, NULL),
(28, 8, 40, '10005732', NULL, NULL, NULL, 1, '2006-11-03 11:41:52', NULL, NULL),
(29, 8, 40, '10005761', NULL, NULL, NULL, 1, '2006-11-03 11:42:00', NULL, NULL),
(30, 8, 40, '10005877', NULL, NULL, NULL, 1, '2006-11-03 11:42:09', NULL, NULL),
(31, 4, 62, '10005776', NULL, NULL, NULL, 1, '2006-11-03 11:47:02', 1, '2006-11-03 11:50:10'),
(32, 4, 64, '10005633', NULL, NULL, NULL, 1, '2006-11-03 11:49:07', 1, '2006-11-03 11:51:24'),
(33, 5, 65, '10005738', NULL, NULL, NULL, 1, '2006-11-03 11:52:02', NULL, NULL),
(34, 10, 6, '30020001', NULL, NULL, NULL, 1, '2006-11-09 16:26:07', NULL, NULL),
(35, 10, 6, '30020002', NULL, NULL, NULL, 1, '2006-11-09 16:27:25', NULL, NULL),
(36, 9, 7, '30020003', NULL, NULL, NULL, 1, '2006-11-09 16:28:14', NULL, NULL),
(37, 9, 8, '30020004', NULL, NULL, NULL, 1, '2006-11-09 16:29:06', 1, '2006-11-09 16:34:22'),
(38, 9, 8, '30020005', NULL, NULL, NULL, 1, '2006-11-09 16:33:40', NULL, NULL),
(39, 9, 8, '30020006', NULL, NULL, NULL, 1, '2006-11-09 16:40:03', 1, '2006-11-09 17:05:34'),
(40, 11, 9, '30020007', NULL, NULL, NULL, 1, '2006-11-09 16:46:34', 1, '2006-11-09 17:07:11'),
(41, 10, 2, '30020008', NULL, NULL, NULL, 1, '2006-11-09 16:52:13', 1, '2006-11-09 17:03:06'),
(42, 9, 8, '30020009', NULL, NULL, NULL, 1, '2006-11-09 16:53:16', 1, '2006-11-09 17:01:54'),
(43, 11, 2, '30020010', NULL, NULL, NULL, 1, '2006-11-09 16:54:24', 1, '2006-11-09 17:04:17');

--
-- Dumping data for table `asset_model`
--

INSERT INTO `asset_model` (`asset_model_id`, `category_id`, `manufacturer_id`, `asset_model_code`, `short_description`, `long_description`, `image_path`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 5, 2, 'DSR5000', 'Digital Survey Radar', 'Acme''s Flagship Digital Survey Radar Appliance.', NULL, 1, '2006-10-31 14:26:28', 1, '2006-10-31 14:55:18'),
(2, 7, 5, 'TPS01', 'TPS Report', 'TPS Report Documents are essential for maintaining a high level of productivity.', NULL, 1, '2006-10-31 14:28:20', 1, '2006-10-31 14:33:50'),
(3, 5, 3, 'CVG100', 'Cavitation Vortex Generator', 'Pegasus CVG-100', NULL, 1, '2006-10-31 14:32:57', 1, '2006-10-31 14:33:35'),
(4, 6, 4, 'STHC4400', 'Hydraulic Crane', '855 C Water-cooled 4-cycle, in-line 6-cylinder\r\nCylinder, direct fuel injection type diesel engine', NULL, 1, '2006-10-31 14:35:44', NULL, NULL),
(5, 6, 4, 'STWL9700', 'Wheel Loader', 'The SuperTech Wheel loader provides for a high breakout force and lower cycle time. It ensures a perfect combination of traction and breakout force for maximum use of rated capacity.', NULL, 1, '2006-10-31 14:37:47', NULL, NULL),
(6, 5, 3, 'PLR88', 'Laser Rangefinder', 'Measures distances using an eye-safe laser and precision electronics', NULL, 1, '2006-10-31 14:48:39', NULL, NULL),
(7, 7, 5, 'HR01', 'HR Employee Record', 'Employee Record Form.', NULL, 1, '2006-10-31 14:50:23', NULL, NULL),
(8, 5, 3, 'WRIRGT90', 'Wide Range Infrared Gun Thermometer', 'Wide range temperature measurements from -58 to 1000Â°F, 0.1Â° resolution\r\n\r\nBuilt-in laser pointer identifies target area\r\n\r\nBacklighting illuminates display for taking measurements at night or in areas with low background light levels', NULL, 1, '2006-10-31 14:54:23', NULL, NULL),
(9, 9, 6, '29029', 'L5', 'Linear array, 5.0/3.5mhz - 38mm - ART/Triplex - Vascular/Small Parts.', NULL, 1, '2006-11-09 16:17:43', 1, '2006-11-09 16:24:15'),
(10, 9, 6, '34642', 'C3', 'General Purpose Abdominal and Obstetric, high performance curved array, multihertz (3.5 & 2.5 Mhz) - CDE, TCR.', NULL, 1, '2006-11-09 16:20:18', 1, '2006-11-09 16:24:52'),
(11, 9, 6, '52103', '4V1 - aspen', 'DL connector type -\r\nAcuson Aspen\r\ntransducer,\r\napplications include:\r\nGeneral OB/GYN, fetal\r\nheart, abdominal\r\nvascular. For\r\ntechnically difficult\r\npatients.', NULL, 1, '2006-11-09 16:45:54', NULL, NULL);

--
-- Dumping data for table `asset_transaction`
--


--
-- Dumping data for table `attachment`
--


--
-- Dumping data for table `audit`
--


--
-- Dumping data for table `audit_scan`
--


--
-- Dumping data for table `authorization`
--

INSERT INTO `authorization` (`authorization_id`, `short_description`) VALUES
(1, 'view'),
(2, 'edit'),
(3, 'delete');

--
-- Dumping data for table `authorization_level`
--

INSERT INTO `authorization_level` (`authorization_level_id`, `short_description`) VALUES
(1, 'all'),
(2, 'owner'),
(3, 'none');

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `short_description`, `long_description`, `image_path`, `asset_flag`, `inventory_flag`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 'Widget', '', NULL, '\0', '', 1, '2006-10-31 11:01:23', 1, '2006-11-03 11:43:57'),
(2, 'Sprocket', '', NULL, '\0', '', 1, '2006-10-31 11:01:35', 1, '2006-11-03 11:43:45'),
(3, 'Circuit Board', '', NULL, '\0', '', 1, '2006-10-31 11:09:32', 1, '2006-11-03 11:43:38'),
(5, 'Tool', '', NULL, '', '\0', 1, '2006-10-31 11:11:17', 1, '2006-11-03 11:43:50'),
(6, 'Vehicle', '', NULL, '', '\0', 1, '2006-10-31 11:11:59', 1, '2006-11-03 11:43:54'),
(7, 'Document', '', NULL, '', '\0', 1, '2006-10-31 11:12:07', 1, '2006-11-03 11:43:42'),
(8, 'Ultrasound System', 'Ultrasound System', NULL, '', '\0', 1, '2006-11-09 15:55:02', NULL, NULL),
(9, 'Ultrasound Transducer', 'Ultrasound Transducer', NULL, '', '\0', 1, '2006-11-09 15:58:01', 1, '2006-11-09 15:58:54');

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `address_id`, `short_description`, `website`, `telephone`, `fax`, `email`, `long_description`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 1, 'UltraCo', 'http://www.ultraco.com', '(555)-522-9090', '(555)-522-9191', 'contact@ultraco.com', '', 1, '2006-10-25 16:02:19', 1, '2006-10-25 16:02:20'),
(2, 2, 'Acme Corporation', 'http://www.acme.com', '(555) 989-1102', '(555) 933-1023', 'contact@acme.com', '', 1, '2006-10-25 16:06:10', 1, '2006-10-25 16:09:59'),
(3, 3, 'SuperTech', 'http://www.supertech.com', '(555) 937-2847', '(555) 274-2874', 'admin@supertech.com', '', 1, '2006-10-25 16:28:08', 1, '2006-10-25 16:28:08'),
(4, 5, 'Binary Industries', 'http://www.binaryind.com', '(555) 448-2099', '(555) 288-2022', 'contact@binaryind.com', '', 1, '2006-10-25 16:58:51', 1, '2006-10-25 16:58:51'),
(5, 6, 'Computer Experts Inc.', 'http://computerexperts.com', '(555) 338-0991', '(555) 338-1100', 'contact@computerexperts.com', '', 1, '2006-10-25 17:04:32', 1, '2006-10-25 17:04:44'),
(6, 7, 'Pegasus Systems', 'http://www.pegasys.com', '(555) 477-0099', '(555) 327-0091', 'greetings@pegasys.com', '', 1, '2006-10-25 17:08:58', 1, '2006-10-25 17:08:58'),
(7, 9, 'Zenith Widget Manufacturing', 'http://www.zwm.com', '(555) 382-0282', '(555) 383-9988', 'contact@zwm.com', '', 1, '2006-10-25 17:16:04', 1, '2006-10-25 17:16:04'),
(8, 10, 'Digital Data Services', 'http://ddservices.com', '(555) 332-0199', '(555) 438-2984', 'contact@ddservices.com', '', 1, '2006-10-25 17:23:40', 1, '2006-10-25 17:23:41'),
(9, 11, 'Enterprise Associates', 'http://www.enterpriseassoc.com', '(555) 288-2084', '(555) 382-0385', 'http://contact@enterpriseassoc.com', '', 1, '2006-10-25 17:27:17', 1, '2006-10-25 17:27:17'),
(10, 12, 'Financial Freedom Foundation', 'http://fff.org', '(555) 383-0092', '(555) 383-0001', 'http://contact@fff.org', '', 1, '2006-10-25 17:31:00', 1, '2006-10-25 17:31:00'),
(11, 13, 'Gordon Industrial', 'http://www.gordanindustrial.com', '(555) 550-5055', '(555) 383-4049', 'contact@gordonindustrial.com', '', 1, '2006-10-25 17:35:59', 1, '2006-10-25 17:35:59'),
(12, 14, 'High Tech Productions', 'http://hitechproductions.com', '(555) 333-0404', '(555) 484-3039', 'contact@hitechproductions.com', '', 1, '2006-10-25 17:38:04', 1, '2006-10-25 17:38:04'),
(13, 15, 'Icarus Industries', 'http://icarusindustries.com', '(555) 333-3332', '(555) 444-5543', 'contact@icarusindustries.com', '', 1, '2006-10-25 17:51:07', 1, '2006-10-25 17:51:08'),
(14, 16, 'Journey Ventures', 'http://journeyventures.com', '(555) 323-0099', '(555) 332-2092', 'contact@journeyventures.com', '', 1, '2006-10-25 17:54:42', 1, '2006-10-25 17:54:42'),
(15, 17, 'Fictional Inc.', 'http://www.fictional.com', '(555) 228-3917', '(555) 344-3998', 'contact@fictional.com', '', 1, '2006-10-31 11:51:29', 1, '2006-10-31 11:51:29');

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `company_id`, `address_id`, `first_name`, `last_name`, `title`, `email`, `phone_office`, `phone_home`, `phone_mobile`, `fax`, `description`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 1, 1, 'Earl', 'Eberd', 'VP Engineering', 'earl.eberd@ultraco.com', '(555) 939-0099', '(555) 988-0211', '(555) 939-0999', '(555) 939-1112', '', 1, '2006-10-25 16:04:26', NULL, NULL),
(2, 2, 2, 'Charles', 'Vanderbilt', 'VP Sales', 'charles.enchew@acme.com', '(555) 338-2832', '(555) 323-2212', '(555) 443-2221', '(555) 857-2984', '', 1, '2006-10-25 16:11:02', 1, '2006-10-25 16:12:17'),
(3, 2, 2, 'Susan', 'Swanson', 'Director of Marketing', 'susan.swanson@acme.com', '(555) 448-3321', '(555) 323-6494', '(555) 487-2988', '(555) 487-5992', '', 1, '2006-10-25 16:11:56', NULL, NULL),
(4, 3, 3, 'Stanley', 'Finch', 'CEO', 'sfinch@supertech.com', '(555) 338-2212', '(555) 238-3985', '(555) 274-2870', '(555) 327-4987', '', 1, '2006-10-25 16:28:59', NULL, NULL),
(5, 3, 4, 'William', 'Walton', 'CFO', 'wwalton@supertech.com', '(555) 548-3094', '(555) 487-2098', '(555) 475-2990', '(555) 487-2998', '', 1, '2006-10-25 16:56:06', NULL, NULL),
(6, 5, 6, 'Victor', 'Albertson', 'Operations Manager', 'v.albertson@computerexperts.com', '(555) 229-0092', '(555) 348-3948', '(555) 827-3841', '(555) 232-1009', '', 1, '2006-10-25 17:05:54', NULL, NULL),
(7, 6, 7, 'Ellaine', 'Smithers', 'VP Operations', 'ellain.smithers@pegasys.com', '(555) 222-1009', '(555) 882-2088', '(555) 287-9987', '(555) 221-0998', '', 1, '2006-10-25 17:11:39', NULL, NULL),
(8, 6, 8, 'Janet', 'Jones', 'Director of Sales', 'janet.jones@pegasys.com', '(555) 221-0843', '(555) 283-9238', '(555) 437-2982', '(555) 282-4810', '', 1, '2006-10-25 17:12:30', NULL, NULL),
(9, 7, 9, 'Jennifer', 'Khan', 'Director of Marketing', 'jennifer.khan@zwm.com', '(555) 228-9438', '(555) 337-2874', '(555) 387-9882', '(555) 288-2998', '', 1, '2006-10-25 17:18:36', NULL, NULL),
(10, 9, 11, 'Amelia', 'Tabalbag', 'Sales Associate', 'atabalbag@enterpriseassoc.com', '(555) 383-0393', '(555) 383-3921', '(555) 383-1112', '(555) 293-3099', '', 1, '2006-10-25 17:28:33', NULL, NULL),
(11, 10, 12, 'Franklin', 'Benjamin', 'CFO', 'franklin@fff.org', '(555) 838-0091', '(555) 328-1021', '(555) 383-2922', '(555) 222-2211', '', 1, '2006-10-25 17:31:46', NULL, NULL),
(12, 12, 14, 'Hillary', 'Morgan', 'CEO', 'hmorgan@hitechproductions.com', '(555) 383-2009', '(555) 221-1101', '(555) 848-0999', '(555) 333-2223', '', 1, '2006-10-25 17:39:05', NULL, NULL),
(13, 13, 15, 'Barney', 'Clinkenbeard', 'Operations Manager', 'bclinkenbeard@icarusindustries.com', '(555) 222-2213', '(555) 488-3009', '(555) 343-3002', '(555) 443-2022', '', 1, '2006-10-25 17:52:55', NULL, NULL),
(14, 14, 16, 'Justice', 'London', 'CEO', 'justice@journeyventures.com', '(555) 222-2093', '(555) 282-9484', '(555) 383-2097', '(555) 275-3853', '', 1, '2006-10-25 17:55:45', NULL, NULL),
(15, 15, 17, 'Curt', 'Barnes', 'Sales Associate', 'cbarnes@fictional.com', '(555) 283-3084', '(555) 382-2947', '(555) 387-3999', '(555) 438-3988', '', 1, '2006-10-31 11:54:57', NULL, NULL),
(16, 15, 18, 'Damien', 'Thompson', 'Sales Associate', 'dthompson@fictional.com', '(555) 348-3332', '(555) 383-9399', '(555) 388-0022', '(555) 488-0977', '', 1, '2006-10-31 11:56:28', NULL, NULL),
(17, 15, 17, 'Frank', 'Zinn', 'Shipping & Receiving Manager', 'fzinn@fictional.com', '(555) 883-3009', '(555) 383-0098', '(555) 383-9988', '(555) 229-0990', '', 1, '2006-10-31 11:57:48', NULL, NULL),
(18, 15, 17, 'Nancy', 'Newton', 'Manager of Operations', 'nnewton@fictional.com', '(555) 833-0099', '(555) 833-0093', '(555) 887-0982', '(555) 383-0398', '', 1, '2006-10-31 11:59:30', NULL, NULL),
(19, 15, 17, 'Victoria', 'Stevens', 'Warehouse Manager', 'vstevens@fictional.com', '(555) 383-2009', '(555) 998-0998', '(555) 998-1112', '(555) 222-2233', '', 1, '2006-10-31 12:00:17', NULL, NULL);

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `short_description`, `abbreviation`, `state_flag`, `province_flag`) VALUES
(1, 'Afghanistan', 'AF', NULL, NULL),
(2, 'Albania', 'AL', NULL, NULL),
(3, 'Algeria', 'DZ', NULL, NULL),
(4, 'American Samoa', 'AS', NULL, NULL),
(5, 'Andorra', 'AD', NULL, NULL),
(6, 'Angola', 'AO', NULL, NULL),
(7, 'Anguilla', 'AI', NULL, NULL),
(8, 'Antigua', 'AG', NULL, NULL),
(9, 'Argentina', 'AR', NULL, NULL),
(10, 'Armenia', 'AM', NULL, NULL),
(11, 'Aruba', 'AW', NULL, NULL),
(12, 'Australia', 'AU', NULL, NULL),
(13, 'Austria', 'AT', NULL, NULL),
(14, 'Azerbaijan', 'AZ', NULL, NULL),
(15, 'Bahamas', 'BS', NULL, NULL),
(16, 'Bahrain', 'BH', NULL, NULL),
(17, 'Bangladesh', 'BD', NULL, NULL),
(18, 'Barbados', 'BB', NULL, NULL),
(19, 'Barbuda(Antigua)', 'AG', NULL, NULL),
(20, 'Belarus', 'BY', NULL, NULL),
(21, 'Belgium', 'BE', NULL, NULL),
(22, 'Benin', 'BJ', NULL, NULL),
(23, 'Bermuda', 'BM', NULL, NULL),
(24, 'Belize', 'BZ', NULL, NULL),
(25, 'Bolivia', 'BO', NULL, NULL),
(26, 'Bonaire(Netherlands Antilles)', 'AN', NULL, NULL),
(27, 'Bosnia-Herzegovina', 'BA', NULL, NULL),
(28, 'Botswana', 'BW', NULL, NULL),
(29, 'Bhutan', 'BT', NULL, NULL),
(30, 'Brazil', 'BR', NULL, NULL),
(31, 'British Virgin Islands', 'VG', NULL, NULL),
(32, 'Brunei', 'BN', NULL, NULL),
(33, 'Bulgaria', 'BG', NULL, NULL),
(34, 'Burkina Faso', 'BF', NULL, NULL),
(35, 'Burundi', 'BI', NULL, NULL),
(36, 'Cambodia', 'KH', NULL, NULL),
(37, 'Cameroon', 'CM', NULL, NULL),
(38, 'Canada', 'CA', NULL, ''),
(39, 'Canary Islands(Spain)', 'ES', NULL, NULL),
(40, 'Cape Verde', 'CV', NULL, NULL),
(41, 'Chad', 'TD', NULL, NULL),
(42, 'Channel Islands(United Kingdom)', 'GB', NULL, NULL),
(43, 'Cayman Islands', 'KY', NULL, NULL),
(44, 'Chile', 'CL', NULL, NULL),
(45, 'China', 'CN', NULL, NULL),
(46, 'Colombia', 'CO', NULL, NULL),
(47, 'Congo', 'CG', NULL, NULL),
(48, 'Congo, Democratic Republic of', 'CD', NULL, NULL),
(49, 'Cook Islands', 'CK', NULL, NULL),
(50, 'Croatia', 'HR', NULL, NULL),
(51, 'Curacao(Netherlands Antilles)', 'AN', NULL, NULL),
(52, 'Costa Rica', 'CR', NULL, NULL),
(53, 'Cyprus', 'CY', NULL, NULL),
(54, 'Czech Republic', 'CZ', NULL, NULL),
(55, 'Denmark', 'DK', NULL, NULL),
(56, 'Djibouti', 'DJ', NULL, NULL),
(57, 'Dominica', 'DM', NULL, NULL),
(58, 'Dominican Republic', 'DO', NULL, NULL),
(59, 'East Timor', 'TP', NULL, NULL),
(60, 'Ecuador', 'EC', NULL, NULL),
(61, 'Egypt', 'EG', NULL, NULL),
(62, 'El Salvador', 'SV', NULL, NULL),
(63, 'England(United Kingdom)', 'GB', NULL, NULL),
(64, 'Equatorial Guinea', 'GQ', NULL, NULL),
(65, 'Eritrea', 'ER', NULL, NULL),
(66, 'Estonia', 'EE', NULL, NULL),
(67, 'Ethiopia', 'ET', NULL, NULL),
(68, 'Faeroe Islands', 'FO', NULL, NULL),
(69, 'Fiji', 'FJ', NULL, NULL),
(70, 'Finland', 'FI', NULL, NULL),
(71, 'France', 'FR', NULL, NULL),
(72, 'French Guiana', 'GF', NULL, NULL),
(73, 'French Polynesia', 'PF', NULL, NULL),
(74, 'Gabon', 'GA', NULL, NULL),
(75, 'Gambia', 'GM', NULL, NULL),
(76, 'Georgia', 'GE', NULL, NULL),
(77, 'Germany', 'DE', NULL, NULL),
(78, 'Ghana', 'GH', NULL, NULL),
(79, 'Gibraltar', 'GI', NULL, NULL),
(80, 'Grand Cayman(Cayman Islands)', 'KY', NULL, NULL),
(81, 'Great Britain(United Kingdom)', 'GB', NULL, NULL),
(82, 'Great Thatch Islands(British Virgin Islands)', 'VG', NULL, NULL),
(83, 'Great Tobago Islands(British Virgin Islands)', 'VG', NULL, NULL),
(84, 'Greece', 'GR', NULL, NULL),
(85, 'Greenland', 'GL', NULL, NULL),
(86, 'Grenada', 'GD', NULL, NULL),
(87, 'Guadeloupe', 'GP', NULL, NULL),
(88, 'Guam', 'GU', NULL, NULL),
(89, 'Guatemala', 'GT', NULL, NULL),
(90, 'Guinea', 'GN', NULL, NULL),
(91, 'Guyana', 'GY', NULL, NULL),
(92, 'Haiti', 'HT', NULL, NULL),
(93, 'Holland(Netherlands)', 'NL', NULL, NULL),
(94, 'Honduras', 'HS', NULL, NULL),
(95, 'Hong Kong', 'HK', NULL, NULL),
(96, 'Hungary', 'HU', NULL, NULL),
(97, 'Iceland', 'IS', NULL, NULL),
(98, 'India', 'IN', NULL, NULL),
(99, 'Indonesia', 'ID', NULL, NULL),
(100, 'Iraq', 'IQ', NULL, NULL),
(101, 'Ireland', 'IE', NULL, NULL),
(102, 'Israel', 'IL', NULL, NULL),
(103, 'Italy', 'IT', NULL, NULL),
(104, 'Ivory Coast', 'CI', NULL, NULL),
(105, 'Jamaica', 'JM', NULL, NULL),
(106, 'Japan', 'JP', NULL, NULL),
(107, 'Jordan', 'JO', NULL, NULL),
(108, 'Jost Van Dyke Islands(British Virgin Islands)', 'VG', NULL, NULL),
(109, 'Kazakhstan', 'KZ', NULL, NULL),
(110, 'Kenya', 'KE', NULL, NULL),
(111, 'Kiribati', 'KI', NULL, NULL),
(112, 'Kuwait', 'KW', NULL, NULL),
(113, 'Kyrgyzstan', 'KG', NULL, NULL),
(114, 'Laos', 'LA', NULL, NULL),
(115, 'Latvia', 'LV', NULL, NULL),
(116, 'Lebanon', 'LB', NULL, NULL),
(117, 'Lesotho', 'LS', NULL, NULL),
(118, 'Liberia', 'LR', NULL, NULL),
(119, 'Libya', 'LY', NULL, NULL),
(120, 'Liechtenstein', 'LI', NULL, NULL),
(121, 'Lithuania', 'LT', NULL, NULL),
(122, 'Luxembourg', 'LU', NULL, NULL),
(123, 'Macau', 'MO', NULL, NULL),
(124, 'Macedonia', 'MK', NULL, NULL),
(125, 'Madagascar', 'MG', NULL, NULL),
(126, 'Malaysia', 'MY', NULL, NULL),
(127, 'Malawi', 'MW', NULL, NULL),
(128, 'Maldives', 'MV', NULL, NULL),
(129, 'Mali', 'ML', NULL, NULL),
(130, 'Malta', 'MT', NULL, NULL),
(131, 'Marshall Islands', 'MH', NULL, NULL),
(132, 'Martinique', 'MQ', NULL, NULL),
(133, 'Mauritania', 'MR', NULL, NULL),
(134, 'Mauritius', 'MU', NULL, NULL),
(135, 'Mexico', 'MX', '', NULL),
(136, 'Micronesia', 'FM', NULL, NULL),
(137, 'Moldova', 'MD', NULL, NULL),
(138, 'Monaco', 'MC', NULL, NULL),
(139, 'Mongolia', 'MN', NULL, NULL),
(140, 'Montserrat', 'MS', NULL, NULL),
(141, 'Morocco', 'MA', NULL, NULL),
(142, 'Mozambique', 'MZ', NULL, NULL),
(143, 'Nauru', 'NR', NULL, NULL),
(144, 'Namibia', 'NA', NULL, NULL),
(145, 'Nepal', 'NP', NULL, NULL),
(146, 'Netherlands', 'NL', NULL, NULL),
(147, 'Netherlands Antilles', 'AN', NULL, NULL),
(148, 'New Caledonia', 'NC', NULL, NULL),
(149, 'New Zealand', 'NZ', NULL, NULL),
(150, 'Nicaragua', 'NI', NULL, NULL),
(151, 'Niger', 'NE', NULL, NULL),
(152, 'Nigeria', 'NG', NULL, NULL),
(153, 'Niue', 'NU', NULL, NULL),
(154, 'Norman Island(British Virgin Islands)', 'VG', NULL, NULL),
(155, 'Northern Ireland(United Kingdom)', 'GB', NULL, NULL),
(156, 'Northern Mariana Islands', 'MP', NULL, NULL),
(157, 'Norway', 'NO', NULL, NULL),
(158, 'Oman', 'OM', NULL, NULL),
(159, 'Pakistan', 'PK', NULL, NULL),
(160, 'Paraguay', 'PY', NULL, NULL),
(161, 'Palau', 'PW', NULL, NULL),
(162, 'Palestine', 'PS', NULL, NULL),
(163, 'Panama', 'PA', NULL, NULL),
(164, 'Papua New Guinea', 'PG', NULL, NULL),
(165, 'Peru', 'PE', NULL, NULL),
(166, 'Philippines', 'PH', NULL, NULL),
(167, 'Poland', 'PL', NULL, NULL),
(168, 'Portugal', 'PT', NULL, NULL),
(169, 'Puerto Rico', 'PR', NULL, NULL),
(170, 'Qatar', 'QA', NULL, NULL),
(171, 'Reunion', 'RE', NULL, NULL),
(172, 'Romania', 'RO', NULL, NULL),
(173, 'Rota(Northern Mariana Islands)', 'MP', NULL, NULL),
(174, 'Russia', 'RU', NULL, NULL),
(175, 'Rwanda', 'RW', NULL, NULL),
(176, 'Saba(Netherlands Antilles)', 'AN', NULL, NULL),
(177, 'Saipan(Northern Mariana Islands)', 'MP', NULL, NULL),
(178, 'Samoa', 'WS', NULL, NULL),
(179, 'San Marino(Italy)', 'IT', NULL, NULL),
(180, 'Saudi Arabia', 'SA', NULL, NULL),
(181, 'Scotland(United Kingdom)', 'GB', NULL, NULL),
(182, 'Senegal', 'SN', NULL, NULL),
(183, 'Serbia and Montenegro', 'YU', NULL, NULL),
(184, 'Seychelles', 'SC', NULL, NULL),
(185, 'Singapore', 'SG', NULL, NULL),
(186, 'Slovak Republic', 'SK', NULL, NULL),
(187, 'Slovenia', 'SI', NULL, NULL),
(188, 'Solomon Islands', 'SB', NULL, NULL),
(189, 'South Africa', 'ZA', NULL, NULL),
(190, 'South Korea', 'KR', NULL, NULL),
(191, 'Spain', 'ES', NULL, NULL),
(192, 'Sri Lanka', 'LK', NULL, NULL),
(193, 'St. Barthelemy(Guadeloupe)', 'GP', NULL, NULL),
(194, 'St. Christopher(St. Kitts And Nevis)', 'KN', NULL, NULL),
(195, 'St. Croix Island(U S Virgin Islands)', 'VI', NULL, NULL),
(196, 'St. Eustatius(Netherlands Antilles)', 'AN', NULL, NULL),
(197, 'St. John(U S Virgin Islands)', 'VI', NULL, NULL),
(198, 'St. Kitts And Nevis', 'KN', NULL, NULL),
(199, 'St. Lucia', 'LC', NULL, NULL),
(200, 'St. Maarten(Netherlands Antilles)', 'AN', NULL, NULL),
(201, 'St. Thomas(U S Virgin Islands)', 'VI', NULL, NULL),
(202, 'St. Vincent', 'VC', NULL, NULL),
(203, 'Suriname', 'SR', NULL, NULL),
(204, 'Swaziland', 'SZ', NULL, NULL),
(205, 'Sweden', 'SE', NULL, NULL),
(206, 'Switzerland', 'CH', NULL, NULL),
(207, 'Syria', 'SY', NULL, NULL),
(208, 'Tahiti(French Polynesia)', 'PF', NULL, NULL),
(209, 'Taiwan', 'TW', NULL, NULL),
(210, 'Tanzania', 'TZ', NULL, NULL),
(211, 'Thailand', 'TH', NULL, NULL),
(212, 'Tinian(Northern Mariana Islands)', 'MP', NULL, NULL),
(213, 'Togo', 'TG', NULL, NULL),
(214, 'Tonga', 'TO', NULL, NULL),
(215, 'Tortola Island(British Virgin Islands)', 'VG', NULL, NULL),
(216, 'Trinidad + Tobago', 'TT', NULL, NULL),
(217, 'Tunisia', 'TN', NULL, NULL),
(218, 'Turkey', 'TR', NULL, NULL),
(219, 'Turkmenistan', 'TM', NULL, NULL),
(220, 'Turks And Caicos Islands', 'TC', NULL, NULL),
(221, 'Tuvalu', 'TV', NULL, NULL),
(222, 'United Arab Emirates', 'AE', NULL, NULL),
(223, 'U S Virgin Islands', 'VI', NULL, NULL),
(224, 'Uganda', 'UG', NULL, NULL),
(225, 'Ukraine', 'UA', NULL, NULL),
(226, 'Union Island(St. Vincent)', 'VC', NULL, NULL),
(227, 'United Kingdom', 'GB', NULL, NULL),
(228, 'United States', 'US', '', NULL),
(229, 'Uruguay', 'UY', NULL, NULL),
(230, 'Uzbekistan', 'UZ', NULL, NULL),
(231, 'Vanuatu', 'VU', NULL, NULL),
(232, 'Vatican City(Italy)', 'VA', NULL, NULL),
(233, 'Venezuela', 'VE', NULL, NULL),
(234, 'Vietnam', 'VN', NULL, NULL),
(235, 'Wales(United Kingdom)', 'GB', NULL, NULL),
(236, 'Wallis + Futuna Islands', 'WF', NULL, NULL),
(237, 'Yemen', 'YE', NULL, NULL),
(238, 'Zambia', 'ZM', NULL, NULL),
(239, 'Zimbabwe', 'ZW', NULL, NULL);

--
-- Dumping data for table `courier`
--

INSERT INTO `courier` (`courier_id`, `short_description`, `active_flag`) VALUES
(1, 'FedEx', '');

--
-- Dumping data for table `currency_unit`
--

INSERT INTO `currency_unit` (`currency_unit_id`, `short_description`, `symbol`) VALUES
(1, 'USD', '+#36;'),
(2, 'GBP', '+#163;'),
(3, 'EUR', '+#128;');

--
-- Dumping data for table `custom_field`
--


--
-- Dumping data for table `custom_field_qtype`
--

INSERT INTO `custom_field_qtype` (`custom_field_qtype_id`, `name`) VALUES
(2, 'select'),
(1, 'text'),
(3, 'textarea');

--
-- Dumping data for table `custom_field_selection`
--


--
-- Dumping data for table `custom_field_value`
--


--
-- Dumping data for table `datagrid`
--

INSERT INTO `datagrid` (`datagrid_id`, `short_description`) VALUES
(10, 'asset_audit_list'),
(1, 'asset_list'),
(2, 'asset_model_list'),
(6, 'category_list'),
(4, 'company_list'),
(5, 'contact_list'),
(11, 'inventory_audit_list'),
(3, 'inventory_model_list'),
(7, 'manufacturer_list'),
(8, 'receipt_list'),
(9, 'shipment_list');

--
-- Dumping data for table `datagrid_column_preference`
--


--
-- Dumping data for table `entity_qtype`
--

INSERT INTO `entity_qtype` (`entity_qtype_id`, `name`) VALUES
(9, 'Address'),
(1, 'Asset'),
(3, 'AssetInventory'),
(4, 'AssetModel'),
(6, 'Category'),
(7, 'Company'),
(8, 'Contact'),
(2, 'Inventory'),
(5, 'Manufacturer'),
(11, 'Receipt'),
(10, 'Shipment');

--
-- Dumping data for table `entity_qtype_custom_field`
--


--
-- Dumping data for table `fedex_service_type`
--

INSERT INTO `fedex_service_type` (`fedex_service_type_id`, `short_description`, `VALUE`) VALUES
(1, 'Express Priority Overnight', '01'),
(2, 'Express Economy Two Day', '03'),
(3, 'Express Standard Overnight', '05'),
(4, 'Express First Overnight', '06'),
(5, 'Express Saver', '20'),
(6, 'FedEx Ground Service', '92');

--
-- Dumping data for table `fedex_shipment`
--


--
-- Dumping data for table `inventory_location`
--

INSERT INTO `inventory_location` (`inventory_location_id`, `inventory_model_id`, `location_id`, `quantity`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 3, 50, 45, 1, '2006-12-18 14:59:13', 1, '2006-12-18 15:19:21'),
(2, 3, 16, 40, 1, '2006-12-18 15:19:21', NULL, NULL),
(3, 3, 10, 120, 1, '2006-12-18 15:20:07', NULL, NULL),
(4, 1, 5, 50, 1, '2006-12-18 15:22:59', 1, '2006-12-18 15:36:55'),
(5, 2, 5, 400, 1, '2006-12-18 15:24:18', 1, '2006-12-18 15:24:20'),
(6, 3, 5, 250, 1, '2006-12-18 15:35:17', 1, '2006-12-18 15:35:19'),
(7, 2, 20, 70, 1, '2006-12-18 15:40:17', NULL, NULL),
(8, 1, 24, 220, 1, '2006-12-18 15:40:47', NULL, NULL),
(9, 4, 49, 80, 1, '2006-12-18 15:46:16', NULL, NULL),
(10, 5, 36, 900, 1, '2006-12-18 15:48:28', NULL, NULL),
(11, 6, 12, 3000, 1, '2006-12-18 15:49:44', NULL, NULL);

--
-- Dumping data for table `inventory_model`
--

INSERT INTO `inventory_model` (`inventory_model_id`, `category_id`, `manufacturer_id`, `inventory_model_code`, `short_description`, `long_description`, `image_path`, `price`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 1, 1, '99501005', 'Generic Widget', 'Generic widgets', NULL, NULL, 1, '2006-12-18 14:47:31', NULL, NULL),
(2, 2, 4, '90054887', 'Generic Sprocket', 'Generic Sprocket', NULL, NULL, 1, '2006-12-18 14:51:31', NULL, NULL),
(3, 1, 1, '95003398', 'Advanced High-End Widget', 'Advanced High-End Widget', NULL, NULL, 1, '2006-12-18 14:52:43', NULL, NULL),
(4, 3, 4, '98890099', 'Generic Circuit Board', 'Generic circuit board for general purpose testing.', NULL, NULL, 1, '2006-12-18 15:45:50', NULL, NULL),
(5, 3, 4, '98897667', 'D11-K', 'D11-K general purpose circuit board.', NULL, NULL, 1, '2006-12-18 15:47:58', NULL, NULL),
(6, 2, 3, '98220112', 'PS-1000', 'Powered Sprocket from Pegasus', NULL, NULL, 1, '2006-12-18 15:49:15', NULL, NULL);

--
-- Dumping data for table `inventory_transaction`
--


--
-- Dumping data for table `length_unit`
--

INSERT INTO `length_unit` (`length_unit_id`, `short_description`) VALUES
(1, 'in'),
(2, 'cm');

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `short_description`, `long_description`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 'Checked Out', NULL, NULL, NULL, NULL, NULL),
(2, 'Shipped', NULL, NULL, NULL, NULL, NULL),
(3, 'Taken Out', NULL, NULL, NULL, NULL, NULL),
(4, 'New Inventory', NULL, NULL, NULL, NULL, NULL),
(5, 'To Be Received', NULL, NULL, NULL, NULL, NULL),
(6, 'R1B01', 'Room 1, Bin 1', 1, '2006-10-31 09:14:48', 1, '2006-10-31 09:17:11'),
(7, 'R1B02', 'Room 1, Bin 2', 1, '2006-10-31 09:15:04', 1, '2006-10-31 09:17:18'),
(8, 'R1B03', 'Room 1, Bin 3', 1, '2006-10-31 09:15:14', 1, '2006-10-31 09:17:23'),
(9, 'R1B04', 'Room 1, Bin 4', 1, '2006-10-31 09:15:26', 1, '2006-10-31 09:17:28'),
(10, 'R1B05', 'Room 1, Bin 5', 1, '2006-10-31 09:15:46', 1, '2006-10-31 09:17:36'),
(11, 'R1B06', 'Room 1, Bin 6', 1, '2006-10-31 09:16:05', 1, '2006-10-31 09:17:40'),
(12, 'R1B07', 'Room 1, Bin 7', 1, '2006-10-31 09:16:22', 1, '2006-10-31 09:17:50'),
(13, 'R1B08', 'Room 1, Bin 8', 1, '2006-10-31 09:16:33', 1, '2006-10-31 09:17:54'),
(14, 'R1B09', 'Room 1, Bin 9', 1, '2006-10-31 09:16:43', 1, '2006-10-31 09:18:01'),
(15, 'R1B10', 'Room 1, Bin 10', 1, '2006-10-31 09:16:55', NULL, NULL),
(16, 'R1B11', 'Room 1, Bin 11', 1, '2006-10-31 09:18:21', NULL, NULL),
(17, 'R1B12', 'Room 1, Bin 12', 1, '2006-10-31 09:18:36', NULL, NULL),
(18, 'R1B13', 'Room 1, Bin 13', 1, '2006-10-31 09:18:50', NULL, NULL),
(19, 'R1B14', 'Room 1, Bin 14', 1, '2006-10-31 09:19:01', NULL, NULL),
(20, 'R1B15', 'Room 1, Bin 15', 1, '2006-10-31 09:19:11', NULL, NULL),
(21, 'R1B16', 'Room 1, Bin 16', 1, '2006-10-31 09:19:29', NULL, NULL),
(22, 'R1B17', 'Room 1, Bin 17', 1, '2006-10-31 09:19:39', NULL, NULL),
(23, 'R1B18', 'Room 1, Bin 18', 1, '2006-10-31 09:20:03', NULL, NULL),
(24, 'R1B19', 'Room 1, Bin 19', 1, '2006-10-31 09:20:15', NULL, NULL),
(25, 'R1B20', 'Room 1, Bin 20', 1, '2006-10-31 09:20:35', NULL, NULL),
(26, 'R2B01', 'Room 2, Bin 1', 1, '2006-10-31 09:20:49', NULL, NULL),
(27, 'R2B02', 'Room 2, Bin 2', 1, '2006-10-31 09:22:29', NULL, NULL),
(28, 'R2B03', 'Room 2, Bin 3', 1, '2006-10-31 09:22:38', NULL, NULL),
(29, 'R2B04', 'Room 2, Bin 4', 1, '2006-10-31 09:22:51', NULL, NULL),
(30, 'R2B05', 'Room 2, Bin 5', 1, '2006-10-31 09:22:59', NULL, NULL),
(31, 'R2B06', 'Room 2, Bin 6', 1, '2006-10-31 09:23:08', NULL, NULL),
(32, 'R2B07', 'Room 2, Bin 7', 1, '2006-10-31 09:23:30', NULL, NULL),
(33, 'R2B08', 'Room 2, Bin 8', 1, '2006-10-31 09:23:37', NULL, NULL),
(34, 'R2B09', 'Room 2, Bin 9', 1, '2006-10-31 09:23:45', NULL, NULL),
(35, 'R2B10', 'Room 2, Bin 10', 1, '2006-10-31 09:23:57', NULL, NULL),
(36, 'R3B01', 'Room 3, Bin 1', 1, '2006-10-31 09:24:18', NULL, NULL),
(37, 'R3B02', 'Room 3, Bin 2', 1, '2006-10-31 09:24:41', NULL, NULL),
(38, 'R3B03', 'Room 3, Bin 3', 1, '2006-10-31 09:24:56', NULL, NULL),
(39, 'R3B04', 'Room 3, Bin 4', 1, '2006-10-31 09:25:05', NULL, NULL),
(40, 'R3B05', 'Room 3, Bin 5', 1, '2006-10-31 09:25:15', 1, '2006-10-31 09:25:23'),
(41, 'R3B06', 'Room 3, Bin 6', 1, '2006-10-31 09:25:32', NULL, NULL),
(42, 'R3B07', 'Room 3, Bin 7', 1, '2006-10-31 09:25:52', NULL, NULL),
(43, 'R3B08', 'Room 3, Bin 8', 1, '2006-10-31 09:25:59', NULL, NULL),
(44, 'R3B09', 'Room 3, Bin 9', 1, '2006-10-31 09:26:18', NULL, NULL),
(45, 'R3B10', 'Room 3, Bin 10', 1, '2006-10-31 09:26:25', NULL, NULL),
(46, 'R4B01', 'Room 4, Bin 1', 1, '2006-10-31 09:26:47', NULL, NULL),
(47, 'R4B02', 'Room 4, Bin 2', 1, '2006-10-31 09:26:56', NULL, NULL),
(48, 'R4B03', 'Room 4, Bin 3', 1, '2006-10-31 09:27:27', NULL, NULL),
(49, 'R4B04', 'Room 4, Bin 4', 1, '2006-10-31 09:27:35', NULL, NULL),
(50, 'R4B05', 'Room 4, Bin 5', 1, '2006-10-31 09:27:50', NULL, NULL),
(51, 'R4B06', 'Room 4, Bin 6', 1, '2006-10-31 09:28:07', NULL, NULL),
(52, 'R4B07', 'Room 4, Bin 7', 1, '2006-10-31 09:28:14', NULL, NULL),
(53, 'R4B08', 'Room 4, Bin 8', 1, '2006-10-31 09:28:22', NULL, NULL),
(54, 'R4B09', 'Room 4, Bin 9', 1, '2006-10-31 09:28:30', NULL, NULL),
(55, 'R4B10', 'Room 4, Bin 10', 1, '2006-10-31 09:28:38', NULL, NULL),
(56, 'WPS01', 'Warehouse, parking space 1', 1, '2006-10-31 14:57:01', 1, '2006-10-31 14:57:52'),
(57, 'WPS02', 'Warehouse, parking space 2', 1, '2006-10-31 14:58:12', NULL, NULL),
(58, 'WPS03', 'Warehouse, parking space 3', 1, '2006-10-31 14:58:27', NULL, NULL),
(59, 'WPS04', 'Warehouse, parking space 4', 1, '2006-10-31 14:58:37', NULL, NULL),
(60, 'WPS05', 'Warehouse, parking space 5', 1, '2006-10-31 14:58:50', NULL, NULL),
(61, 'WPS06', 'Warehouse, parking space 6', 1, '2006-10-31 14:59:16', NULL, NULL),
(62, 'WPS07', 'Warehouse, parking space 7', 1, '2006-10-31 14:59:25', NULL, NULL),
(63, 'WPS08', 'Warehouse, parking space 8', 1, '2006-10-31 14:59:44', NULL, NULL),
(64, 'WPS09', 'Warehouse, parking space 9', 1, '2006-10-31 14:59:55', NULL, NULL),
(65, 'WPS10', 'Warehouse, parking space 10', 1, '2006-10-31 15:00:06', NULL, NULL);

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `short_description`, `long_description`, `image_path`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 'ZWM', 'Zenith Widget Manufacturing', NULL, 1, '2006-10-31 10:52:06', NULL, NULL),
(2, 'Acme', '', NULL, 1, '2006-10-31 10:52:25', NULL, NULL),
(3, 'Pegasus', 'Pegasus Systems', NULL, 1, '2006-10-31 10:52:52', NULL, NULL),
(4, 'SuperTech', '', NULL, 1, '2006-10-31 10:53:34', NULL, NULL),
(5, 'Fictional Inc.', '', NULL, 1, '2006-10-31 11:15:30', NULL, NULL),
(6, 'Acuson', 'Acuson Corporation', NULL, 1, '2006-11-09 16:00:05', NULL, NULL),
(7, 'GE', 'General Electric', NULL, 1, '2006-11-09 16:01:02', NULL, NULL),
(8, 'Philips', 'Philips Ultrasound', NULL, 1, '2006-11-09 16:01:33', NULL, NULL);

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`module_id`, `short_description`) VALUES
(1, 'home'),
(2, 'assets'),
(3, 'inventory'),
(4, 'contacts'),
(5, 'shipping'),
(6, 'receiving'),
(7, 'reports');

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `short_description`, `long_description`, `criteria`, `frequency`, `enabled_flag`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 'Overdue Receipt', 'Send notification when a receipt is overdue', '10', 'once', '\0', NULL, NULL, NULL, NULL);

--
-- Dumping data for table `notification_user_account`
--


--
-- Dumping data for table `package_type`
--

INSERT INTO `package_type` (`package_type_id`, `short_description`, `courier_id`, `VALUE`) VALUES
(1, 'Other packaging', 1, '01'),
(2, 'FedEx Pak', 1, '02'),
(3, 'FedEx Box', 1, '03'),
(4, 'FedEx Tube', 1, '04'),
(5, 'FedEx Envelope', 1, '06'),
(6, 'FedEx 10kg Box', 1, '15'),
(7, 'FedEx 25kg Box', 1, '25');

--
-- Dumping data for table `receipt`
--


--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `short_description`, `long_description`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 'Administrator', 'Administrator account will access to everything', 1, '2008-07-21 15:04:35', 1, '2008-07-21 15:16:29');

--
-- Dumping data for table `role_entity_qtype_built_in_authorization`
--

INSERT INTO `role_entity_qtype_built_in_authorization` (`role_entity_built_in_id`, `role_id`, `entity_qtype_id`, `authorization_id`, `authorized_flag`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 1, 1, 1, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(2, 1, 1, 2, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(3, 1, 4, 1, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(4, 1, 4, 2, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(5, 1, 2, 1, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(6, 1, 2, 2, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(7, 1, 7, 1, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(8, 1, 7, 2, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(9, 1, 8, 1, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(10, 1, 8, 2, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(11, 1, 9, 1, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(12, 1, 9, 2, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(13, 1, 10, 1, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(14, 1, 10, 2, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(15, 1, 11, 1, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:29'),
(16, 1, 11, 2, '', 1, '2008-07-11 22:14:47', 1, '2008-07-21 15:16:30');

--
-- Dumping data for table `role_entity_qtype_custom_field_authorization`
--


--
-- Dumping data for table `role_module`
--

INSERT INTO `role_module` (`role_module_id`, `role_id`, `module_id`, `access_flag`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 1, 1, '', NULL, NULL, NULL, NULL),
(2, 1, 2, '', NULL, NULL, 1, '2008-07-21 15:16:29'),
(3, 1, 3, '', NULL, NULL, 1, '2008-07-21 15:16:29'),
(4, 1, 4, '', NULL, NULL, 1, '2008-07-21 15:16:29'),
(5, 1, 5, '', NULL, NULL, 1, '2008-07-21 15:16:29'),
(6, 1, 6, '', NULL, NULL, 1, '2008-07-21 15:16:29'),
(7, 1, 7, '', NULL, NULL, 1, '2008-07-21 15:16:29');

--
-- Dumping data for table `role_module_authorization`
--

INSERT INTO `role_module_authorization` (`role_module_authorization_id`, `role_module_id`, `authorization_id`, `authorization_level_id`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 1, 1, 1, NULL, NULL, NULL, NULL),
(2, 1, 2, 1, NULL, NULL, NULL, NULL),
(3, 1, 3, 1, NULL, NULL, NULL, NULL),
(4, 2, 1, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(5, 2, 2, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(6, 2, 3, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(7, 3, 1, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(8, 3, 2, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(9, 3, 3, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(10, 4, 1, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(11, 4, 2, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(12, 4, 3, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(13, 5, 1, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(14, 5, 2, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(15, 5, 3, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(16, 6, 1, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(17, 6, 2, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(18, 6, 3, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(19, 7, 1, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(20, 7, 2, 1, NULL, NULL, 1, '2008-07-21 15:16:29'),
(21, 7, 3, 1, NULL, NULL, 1, '2008-07-21 15:16:29');

--
-- Dumping data for table `role_transaction_type_authorization`
--

INSERT INTO `role_transaction_type_authorization` (`role_transaction_type_authorization_id`, `role_id`, `transaction_type_id`, `authorization_level_id`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 1, 1, 1, 1, '2008-07-21 05:16:29', NULL, NULL),
(2, 1, 2, 1, 1, '2008-07-21 05:16:29', NULL, NULL),
(3, 1, 3, 1, 1, '2008-07-21 05:16:29', NULL, NULL),
(4, 1, 8, 1, 1, '2008-07-21 05:16:29', NULL, NULL),
(5, 1, 9, 1, 1, '2008-07-21 05:16:29', NULL, NULL),
(6, 1, 5, 1, 1, '2008-07-21 05:16:29', NULL, NULL),
(7, 1, 4, 1, 1, '2008-07-21 05:16:29', NULL, NULL);

--
-- Dumping data for table `shipment`
--


--
-- Dumping data for table `shipping_account`
--


--
-- Dumping data for table `shortcut`
--

INSERT INTO `shortcut` (`shortcut_id`, `module_id`, `authorization_id`, `short_description`, `link`, `image_path`, `entity_qtype_id`, `create_flag`, `transaction_type_id`) VALUES
(1, 2, 2, 'Create Asset Model', '../assets/asset_model_edit.php', 'asset_model_create.png', 4, 1, NULL),
(2, 2, 1, 'Asset Models', '../assets/asset_model_list.php', 'asset_model.png', 4, 0, NULL),
(3, 2, 2, 'Create Asset', '../assets/asset_edit.php', 'asset_create.png', 1, 1, NULL),
(4, 2, 1, 'Assets', '../assets/asset_list.php', 'asset.png', 1, 0, NULL),
(5, 2, 2, 'Move Assets', '../assets/asset_edit.php?intTransactionTypeId=1', 'asset_move.png', 1, 0, 1),
(6, 2, 2, 'Check Out Assets', '../assets/asset_edit.php?intTransactionTypeId=3', 'asset_checkout.png', 1, 0, 3),
(7, 2, 2, 'Check In Assets', '../assets/asset_edit.php?intTransactionTypeId=2', 'asset_checkin.png', 1, 0, 2),
(8, 2, 2, 'Reserve Assets', '../assets/asset_edit.php?intTransactionTypeId=8', 'asset_reserve.png', 1, 0, 8),
(9, 3, 2, 'Create Inventory', '../inventory/inventory_edit.php', 'inventory_create.png', 2, 1, NULL),
(10, 3, 1, 'Inventory', '../inventory/inventory_model_list.php', 'inventory.png', 2, 0, NULL),
(11, 3, 2, 'Move Inventory', '../inventory/inventory_edit.php?intTransactionTypeId=1', 'inventory_move.png', 2, 0, 1),
(12, 3, 2, 'Take Out Inventory', '../inventory/inventory_edit.php?intTransactionTypeId=5', 'inventory_takeout.png', 2, 0, 5),
(13, 3, 2, 'Restock Inventory', '../inventory/inventory_edit.php?intTransactionTypeId=4', 'inventory_restock.png', 2, 0, 4),
(14, 4, 2, 'Create Company', '../contacts/company_edit.php', 'company_create.png', 7, 1, NULL),
(15, 4, 1, 'Companies', '../contacts/company_list.php', 'company.png', 7, 0, NULL),
(16, 4, 2, 'Create Contact', '../contacts/contact_edit.php', 'contact_create.png', 8, 1, NULL),
(17, 4, 1, 'Contacts', '../contacts/contact_list.php', 'contact.png', 8, 0, NULL),
(18, 5, 2, 'Schedule Shipment', '../shipping/shipment_edit.php', 'shipment_schedule.png', 10, 1, NULL),
(19, 5, 1, 'Shipments', '../shipping/shipment_list.php', 'shipment.png', 10, 0, NULL),
(20, 6, 2, 'Schedule Receipt', '../receiving/receipt_edit.php', 'receipt_schedule.png', 11, 1, NULL),
(21, 6, 1, 'Receipts', '../receiving/receipt_list.php', 'receipt.png', 11, 0, NULL),
(22, 7, 1, 'Asset Audit Reports', '../reports/asset_audit_list.php', 'receipt.png', 1, 0, NULL),
(23, 7, 1, 'Inventory Audit Reports', '../reports/inventory_audit_list.php', 'receipt.png', 2, 0, NULL);

--
-- Dumping data for table `state_province`
--

INSERT INTO `state_province` (`state_province_id`, `country_id`, `short_description`, `abbreviation`) VALUES
(1, 228, 'Alabama', 'AL'),
(2, 228, 'Alaska', 'AK'),
(3, 228, 'Arizona', 'AZ'),
(4, 228, 'Arkansas', 'AR'),
(5, 228, 'California', 'CA'),
(6, 228, 'Colorado', 'CO'),
(7, 228, 'Connecticut', 'CT'),
(8, 228, 'Delaware', 'DE'),
(9, 228, 'District of Columbia', 'DC'),
(10, 228, 'Florida', 'FL'),
(11, 228, 'Georgia', 'GA'),
(12, 228, 'Hawaii', 'HI'),
(13, 228, 'Idaho', 'ID'),
(14, 228, 'Illinois', 'IL'),
(15, 228, 'Indiana', 'IN'),
(16, 228, 'Iowa', 'IA'),
(17, 228, 'Kansas', 'KS'),
(18, 228, 'Kentucky', 'KY'),
(19, 228, 'Louisiana', 'LA'),
(20, 228, 'Maine', 'ME'),
(21, 228, 'Maryland', 'MD'),
(22, 228, 'Massachusetts', 'MA'),
(23, 228, 'Michigan', 'MI'),
(24, 228, 'Minnesota', 'MN'),
(25, 228, 'Mississippi', 'MS'),
(26, 228, 'Missouri', 'MO'),
(27, 228, 'Montana', 'MT'),
(28, 228, 'Nebraska', 'NE'),
(29, 228, 'Nevada', 'NV'),
(30, 228, 'New Hampshire', 'NH'),
(31, 228, 'New Jersey', 'NJ'),
(32, 228, 'New Mexico', 'NM'),
(33, 228, 'New York', 'NY'),
(34, 228, 'North Carolina', 'NC'),
(35, 228, 'North Dakota', 'ND'),
(36, 228, 'Ohio', 'OH'),
(37, 228, 'Oklahoma', 'OK'),
(38, 228, 'Oregon', 'OR'),
(39, 228, 'Pennsylvania', 'PA'),
(40, 228, 'Rhode Island', 'RI'),
(41, 228, 'South Carolina', 'SC'),
(42, 228, 'South Dakota', 'SD'),
(43, 228, 'Tennessee', 'TN'),
(44, 228, 'Texas', 'TX'),
(45, 228, 'Utah', 'UT'),
(46, 228, 'Vermont', 'VT'),
(47, 228, 'Virginia', 'VA'),
(48, 228, 'Washington', 'WA'),
(49, 228, 'West Virginia', 'WV'),
(50, 228, 'Wisconsin', 'WI'),
(51, 228, 'Wyoming', 'WY'),
(52, 38, 'Alberta', 'AB'),
(53, 38, 'British Columbia', 'BC'),
(54, 38, 'Manitoba', 'MB'),
(55, 38, 'New Brunswick', 'NB'),
(56, 38, 'Newfoundland', 'NF'),
(57, 38, 'Northwest Territories / Nunavut', 'NT'),
(58, 38, 'Nova Scotia', 'NS'),
(59, 38, 'Ontario', 'ON'),
(60, 38, 'Prince Edward Island', 'PE'),
(61, 38, 'Quebec', 'PQ'),
(62, 38, 'Saskatchewan', 'SK'),
(63, 38, 'Yukon', 'YT'),
(64, 135, 'Aguascalientes', 'AG'),
(65, 135, 'Baja California Norte', 'BC'),
(66, 135, 'Baja California Sur', 'BS'),
(67, 135, 'Chihuahua', 'CH'),
(68, 135, 'Colima', 'CL'),
(69, 135, 'Campeche', 'CM'),
(70, 135, 'Coahuila', 'CO'),
(71, 135, 'Chiapas', 'CS'),
(72, 135, 'Distrito Federal', 'DF'),
(73, 135, 'Durango', 'DG'),
(74, 135, 'Guerrero', 'GR'),
(75, 135, 'Guanajuato', 'GT'),
(76, 135, 'Hidalgo', 'HG'),
(77, 135, 'Jalisco', 'JA'),
(78, 135, 'Michoacan', 'MI'),
(79, 135, 'Morelos', 'MO'),
(80, 135, 'Estado de Mexico', 'MX'),
(81, 135, 'Nayarit', 'NA'),
(82, 135, 'Nuevo Leon', 'NL'),
(83, 135, 'Oaxaca', 'OA'),
(84, 135, 'Puebla', 'PU'),
(85, 135, 'Quintana Roo', 'QR'),
(86, 135, 'Queretaro', 'QT'),
(87, 135, 'Sinaloa', 'SI'),
(88, 135, 'San Luis Potosi', 'SL'),
(89, 135, 'Sonora', 'SO'),
(90, 135, 'Tabasco', 'TB'),
(91, 135, 'Tlaxcala', 'TL'),
(92, 135, 'Tamaulipas', 'TM'),
(93, 135, 'Veracruz', 'VE'),
(94, 135, 'Yucatan', 'YU'),
(95, 135, 'Zacatecas', 'ZA');

--
-- Dumping data for table `transaction`
--


--
-- Dumping data for table `transaction_type`
--

INSERT INTO `transaction_type` (`transaction_type_id`, `short_description`, `asset_flag`, `inventory_flag`) VALUES
(1, 'Move', '', ''),
(2, 'Check In', '', '\0'),
(3, 'Check Out', '', '\0'),
(4, 'Restock', '\0', ''),
(5, 'Take Out', '\0', ''),
(6, 'Ship', '', ''),
(7, 'Receive', '', ''),
(8, 'Reserve', '', '\0'),
(9, 'Unreserve', '', '\0');

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`user_account_id`, `first_name`, `last_name`, `username`, `password_hash`, `email_address`, `active_flag`, `admin_flag`, `portable_access_flag`, `portable_user_pin`, `role_id`, `created_by`, `creation_date`, `modified_by`, `modified_date`) VALUES
(1, 'Admin', 'User', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', NULL, '', '', NULL, NULL, 1, 1, '2008-07-21 15:04:16', NULL, NULL);

--
-- Dumping data for table `weight_unit`
--

INSERT INTO `weight_unit` (`weight_unit_id`, `short_description`) VALUES
(1, 'LBS'),
(2, 'KGS');

SET FOREIGN_KEY_CHECKS = 1;
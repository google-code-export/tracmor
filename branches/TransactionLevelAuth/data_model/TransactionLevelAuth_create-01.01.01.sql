-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(10) unsigned NOT NULL auto_increment,
  `company_id` int(10) unsigned NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) default NULL,
  `city` varchar(50) NOT NULL,
  `state_province_id` int(10) unsigned default NULL,
  `postal_code` varchar(50) NOT NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`address_id`),
  KEY `address_fkindex1` (`company_id`),
  KEY `address_fkindex2` (`country_id`),
  KEY `address_fkindex3` (`state_province_id`),
  KEY `address_fkindex4` (`modified_by`),
  KEY `address_fkindex5` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_setting`
--

CREATE TABLE `admin_setting` (
  `setting_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY  (`setting_id`),
  UNIQUE KEY `short_description` (`short_description`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `asset_id` int(10) unsigned NOT NULL auto_increment,
  `asset_model_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned default NULL,
  `asset_code` varchar(50) NOT NULL,
  `image_path` varchar(255) default NULL,
  `checked_out_flag` bit(1) default NULL,
  `reserved_flag` bit(1) default NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`asset_id`),
  UNIQUE KEY `asset_code` (`asset_code`),
  KEY `asset_fkindex1` (`asset_model_id`),
  KEY `asset_fkindex2` (`location_id`),
  KEY `asset_fkindex3` (`created_by`),
  KEY `asset_fkindex4` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `asset_model`
--

CREATE TABLE `asset_model` (
  `asset_model_id` int(10) unsigned NOT NULL auto_increment,
  `category_id` int(10) unsigned default NULL,
  `manufacturer_id` int(10) unsigned default NULL,
  `asset_model_code` varchar(50) default NULL,
  `short_description` varchar(255) NOT NULL,
  `long_description` text,
  `image_path` varchar(255) default NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`asset_model_id`),
  KEY `asset_model_fkindex1` (`category_id`),
  KEY `asset_model_fkindex2` (`manufacturer_id`),
  KEY `asset_model_fkindex3` (`created_by`),
  KEY `asset_model_fkindex4` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `asset_transaction`
--

CREATE TABLE `asset_transaction` (
  `asset_transaction_id` int(10) unsigned NOT NULL auto_increment,
  `asset_id` int(10) unsigned NOT NULL,
  `transaction_id` int(10) unsigned NOT NULL,
  `parent_asset_transaction_id` int(10) unsigned default NULL,
  `source_location_id` int(10) unsigned default NULL,
  `destination_location_id` int(10) unsigned default NULL,
  `new_asset_flag` bit(1) default NULL COMMENT 'Set to true if a new asset was created while creating the transaction (a receipt, or shipment, e.g.)',
  `new_asset_id` int(10) unsigned default NULL,
  `schedule_receipt_flag` bit(1) default NULL COMMENT 'Set to true if an asset is to be scheduled for a receipt',
  `schedule_receipt_due_date` date default NULL COMMENT 'Placeholder for automatically scheduled receipts until the shipment is completed',
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`asset_transaction_id`),
  KEY `asset_transaction_fkindex2` (`transaction_id`),
  KEY `asset_transaction_fkindex1` (`asset_id`),
  KEY `asset_transaction_fkindex3` (`source_location_id`),
  KEY `asset_transaction_fkindex4` (`destination_location_id`),
  KEY `asset_transaction_fkindex5` (`created_by`),
  KEY `asset_transaction_fkindex6` (`modified_by`),
  KEY `asset_transaction_fkindex7` (`new_asset_id`),
  KEY `asset_transaction_fkindex8` (`parent_asset_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `attachment_id` int(10) NOT NULL auto_increment,
  `entity_qtype_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `tmp_filename` varchar(40) default NULL,
  `file_type` varchar(40) default NULL,
  `path` varchar(255) default NULL,
  `SIZE` int(10) default NULL,
  `created_by` int(10) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  PRIMARY KEY  (`attachment_id`),
  KEY `attachment_fkindex1` (`entity_qtype_id`),
  KEY `attachment_fkindex2` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE `audit` (
  `audit_id` int(10) NOT NULL auto_increment COMMENT 'PK',
  `entity_qtype_id` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`audit_id`),
  KEY `audit_fkindex1` (`entity_qtype_id`),
  KEY `audit_fkindex2` (`created_by`),
  KEY `audit_fkindex3` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `audit_scan`
--

CREATE TABLE `audit_scan` (
  `audit_scan_id` int(10) NOT NULL auto_increment COMMENT 'PK',
  `audit_id` int(10) NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) default NULL COMMENT 'FK',
  `COUNT` int(10) default NULL,
  `system_count` int(10) default NULL,
  PRIMARY KEY  (`audit_scan_id`),
  KEY `audit_scan_fkindex1` (`audit_id`),
  KEY `audit_scan_fkindex2` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `authorization`
--

CREATE TABLE `authorization` (
  `authorization_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) default NULL,
  PRIMARY KEY  (`authorization_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `authorization_level`
--

CREATE TABLE `authorization_level` (
  `authorization_level_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) default NULL,
  PRIMARY KEY  (`authorization_level_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) NOT NULL,
  `long_description` text,
  `image_path` varchar(255) default NULL,
  `asset_flag` bit(1) NOT NULL COMMENT 'bit specifying whether or not this category applies to assets',
  `inventory_flag` bit(1) NOT NULL COMMENT 'bit specifying whether or not this category applies to inventory',
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`category_id`),
  KEY `category_fkindex1` (`created_by`),
  KEY `category_fkindex2` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(10) unsigned NOT NULL auto_increment,
  `address_id` int(10) unsigned default NULL,
  `short_description` varchar(255) NOT NULL,
  `website` varchar(255) default NULL,
  `telephone` varchar(50) default NULL,
  `fax` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `long_description` text,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`company_id`),
  UNIQUE KEY `short_description` (`short_description`),
  KEY `company_fkindex1` (`address_id`),
  KEY `company_fkindex2` (`created_by`),
  KEY `company_fkindex3` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(10) unsigned NOT NULL auto_increment,
  `company_id` int(10) unsigned NOT NULL,
  `address_id` int(10) unsigned default NULL,
  `first_name` varchar(50) default NULL,
  `last_name` varchar(50) NOT NULL,
  `title` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  `phone_office` varchar(50) default NULL,
  `phone_home` varchar(50) default NULL,
  `phone_mobile` varchar(50) default NULL,
  `fax` varchar(50) default NULL,
  `description` text,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`contact_id`),
  KEY `contact_fkindex3` (`modified_by`),
  KEY `contact_fkindex4` (`created_by`),
  KEY `contact_fkindex2` (`address_id`),
  KEY `contact_fkindex1` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(50) NOT NULL,
  `abbreviation` char(2) default NULL,
  `state_flag` bit(1) default NULL,
  `province_flag` bit(1) default NULL,
  PRIMARY KEY  (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courier`
--

CREATE TABLE `courier` (
  `courier_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) NOT NULL,
  `active_flag` bit(1) default NULL,
  PRIMARY KEY  (`courier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `currency_unit`
--

CREATE TABLE `currency_unit` (
  `currency_unit_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) default NULL,
  `symbol` char(6) default NULL,
  PRIMARY KEY  (`currency_unit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field`
--

CREATE TABLE `custom_field` (
  `custom_field_id` int(10) unsigned NOT NULL auto_increment,
  `custom_field_qtype_id` int(10) unsigned NOT NULL,
  `default_custom_field_value_id` int(10) unsigned default NULL,
  `short_description` varchar(255) NOT NULL,
  `active_flag` bit(1) default NULL,
  `required_flag` bit(1) default NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`custom_field_id`),
  KEY `custom_field_fkindex2` (`modified_by`),
  KEY `custom_field_fkindex3` (`created_by`),
  KEY `custom_field_fkindex1` (`custom_field_qtype_id`),
  KEY `custom_field_fkindex4` (`default_custom_field_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_qtype`
--

CREATE TABLE `custom_field_qtype` (
  `custom_field_qtype_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY  (`custom_field_qtype_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_selection`
--

CREATE TABLE `custom_field_selection` (
  `custom_field_selection_id` int(10) unsigned NOT NULL auto_increment,
  `custom_field_value_id` int(10) unsigned NOT NULL,
  `entity_qtype_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`custom_field_selection_id`),
  KEY `custom_field_selection_fkindex1` (`entity_qtype_id`),
  KEY `custom_field_selection_fkindex3` (`custom_field_value_id`),
  KEY `custom_field_selection_index4207` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_value`
--

CREATE TABLE `custom_field_value` (
  `custom_field_value_id` int(10) unsigned NOT NULL auto_increment,
  `custom_field_id` int(10) unsigned NOT NULL,
  `short_description` text,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`custom_field_value_id`),
  KEY `custom_field_value_fkindex2` (`created_by`),
  KEY `custom_field_value_fkindex3` (`modified_by`),
  KEY `custom_field_value_fkindex1` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `datagrid`
--

CREATE TABLE `datagrid` (
  `datagrid_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) NOT NULL,
  PRIMARY KEY  (`datagrid_id`),
  UNIQUE KEY `short_description` (`short_description`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `datagrid_column_preference`
--

CREATE TABLE `datagrid_column_preference` (
  `datagrid_column_preference_id` int(10) unsigned NOT NULL auto_increment,
  `datagrid_id` int(10) unsigned NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `user_account_id` int(10) unsigned NOT NULL,
  `display_flag` bit(1) NOT NULL default '',
  PRIMARY KEY  (`datagrid_column_preference_id`),
  UNIQUE KEY `datagrid_id` (`datagrid_id`,`column_name`,`user_account_id`),
  KEY `datagrid_column_preference_fkindex1` (`datagrid_id`),
  KEY `datagrid_column_preference_fkindex2` (`user_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `entity_qtype`
--

CREATE TABLE `entity_qtype` (
  `entity_qtype_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`entity_qtype_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `entity_qtype_custom_field`
--

CREATE TABLE `entity_qtype_custom_field` (
  `entity_qtype_custom_field_id` int(10) unsigned NOT NULL auto_increment,
  `entity_qtype_id` int(10) unsigned NOT NULL,
  `custom_field_id` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`entity_qtype_custom_field_id`),
  KEY `entity_qtype_custom_field_fkindex1` (`entity_qtype_id`),
  KEY `entity_qtype_custom_field_fkindex2` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fedex_service_type`
--

CREATE TABLE `fedex_service_type` (
  `fedex_service_type_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) NOT NULL,
  `VALUE` varchar(50) NOT NULL,
  PRIMARY KEY  (`fedex_service_type_id`),
  UNIQUE KEY `VALUE` (`VALUE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fedex_shipment`
--

CREATE TABLE `fedex_shipment` (
  `fedex_shipment_id` int(10) unsigned NOT NULL auto_increment,
  `shipment_id` int(10) unsigned NOT NULL,
  `package_type_id` int(10) unsigned default NULL,
  `shipping_account_id` int(10) unsigned default NULL,
  `fedex_service_type_id` int(10) unsigned default NULL,
  `currency_unit_id` int(10) unsigned default NULL,
  `weight_unit_id` int(10) unsigned default NULL,
  `length_unit_id` int(10) unsigned default NULL,
  `to_phone` varchar(25) default NULL,
  `pay_type` int(10) unsigned default NULL,
  `payer_account_number` varchar(12) default NULL,
  `package_weight` float(8,2) default NULL,
  `package_length` float(8,2) default NULL,
  `package_width` float(8,2) default NULL,
  `package_height` float(8,2) default NULL,
  `declared_value` decimal(10,2) default NULL,
  `reference` text,
  `saturday_delivery_flag` bit(1) default NULL,
  `notify_sender_email` varchar(50) default NULL,
  `notify_sender_ship_flag` bit(1) default NULL,
  `notify_sender_exception_flag` bit(1) default NULL,
  `notify_sender_delivery_flag` bit(1) default NULL,
  `notify_recipient_email` varchar(50) default NULL,
  `notify_recipient_ship_flag` bit(1) default NULL,
  `notify_recipient_exception_flag` bit(1) default NULL,
  `notify_recipient_delivery_flag` bit(1) default NULL,
  `notify_other_email` varchar(50) default NULL,
  `notify_other_ship_flag` bit(1) default NULL,
  `notify_other_exception_flag` bit(1) default NULL,
  `notify_other_delivery_flag` bit(1) default NULL,
  `hold_at_location_flag` bit(1) default NULL,
  `hold_at_location_address` varchar(255) default NULL,
  `hold_at_location_city` varchar(50) default NULL,
  `hold_at_location_state` int(10) unsigned default NULL,
  `hold_at_location_postal_code` varchar(50) default NULL,
  PRIMARY KEY  (`fedex_shipment_id`),
  KEY `fedex_shipment_fkindex1` (`shipping_account_id`),
  KEY `fedex_shipment_fkindex2` (`shipment_id`),
  KEY `fedex_shipment_fkindex3` (`fedex_service_type_id`),
  KEY `fedex_shipment_fkindex4` (`length_unit_id`),
  KEY `fedex_shipment_fkindex5` (`weight_unit_id`),
  KEY `fedex_shipment_fkindex6` (`currency_unit_id`),
  KEY `fedex_shipment_fkindex7` (`package_type_id`),
  KEY `fedex_shipment_fkindex8` (`hold_at_location_state`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_location`
--

CREATE TABLE `inventory_location` (
  `inventory_location_id` int(10) unsigned NOT NULL auto_increment,
  `inventory_model_id` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`inventory_location_id`),
  KEY `inventory_location_fkindex1` (`location_id`),
  KEY `inventory_location_fkindex2` (`inventory_model_id`),
  KEY `inventory_location_fkindex3` (`modified_by`),
  KEY `inventory_location_fkindex4` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_model`
--

CREATE TABLE `inventory_model` (
  `inventory_model_id` int(10) unsigned NOT NULL auto_increment,
  `category_id` int(10) unsigned default NULL,
  `manufacturer_id` int(10) unsigned default NULL,
  `inventory_model_code` varchar(50) NOT NULL COMMENT 'Bar code',
  `short_description` varchar(255) NOT NULL,
  `long_description` text,
  `image_path` varchar(255) default NULL,
  `price` decimal(12,2) default NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`inventory_model_id`),
  UNIQUE KEY `inventory_model_code` (`inventory_model_code`),
  KEY `inventory_model_fkindex1` (`category_id`),
  KEY `inventory_model_fkindex2` (`manufacturer_id`),
  KEY `inventory_model_fkindex3` (`created_by`),
  KEY `inventory_model_fkindex4` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_transaction`
--

CREATE TABLE `inventory_transaction` (
  `inventory_transaction_id` int(10) unsigned NOT NULL auto_increment,
  `inventory_location_id` int(10) unsigned NOT NULL,
  `transaction_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `source_location_id` int(10) unsigned default NULL,
  `destination_location_id` int(10) unsigned default NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`inventory_transaction_id`),
  KEY `inventory_transaction_fkindex2` (`transaction_id`),
  KEY `inventory_transaction_fkindex3` (`source_location_id`),
  KEY `inventory_transaction_fkindex4` (`destination_location_id`),
  KEY `inventory_transaction_fkindex1` (`inventory_location_id`),
  KEY `inventory_transaction_fkindex5` (`created_by`),
  KEY `inventory_transaction_fkindex6` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `length_unit`
--

CREATE TABLE `length_unit` (
  `length_unit_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) default NULL,
  PRIMARY KEY  (`length_unit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) NOT NULL,
  `long_description` text,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`location_id`),
  UNIQUE KEY `short_description` (`short_description`),
  KEY `location_fkindex1` (`created_by`),
  KEY `location_fkindex2` (`modified_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `manufacturer_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) NOT NULL,
  `long_description` text,
  `image_path` varchar(255) default NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`manufacturer_id`),
  KEY `manufacturer_fkindex1` (`created_by`),
  KEY `manufacturer_fkindex2` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `module_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) default NULL,
  PRIMARY KEY  (`module_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(10) NOT NULL auto_increment,
  `short_description` varchar(255) NOT NULL,
  `long_description` text,
  `criteria` varchar(255) default NULL,
  `frequency` enum('once','daily','weekly','monthly') NOT NULL,
  `enabled_flag` bit(1) NOT NULL default '\0',
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`notification_id`),
  KEY `notification_fkindex1` (`created_by`),
  KEY `notification_fkindex2` (`modified_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification_user_account`
--

CREATE TABLE `notification_user_account` (
  `notification_user_account_id` int(10) NOT NULL auto_increment,
  `user_account_id` int(10) unsigned NOT NULL,
  `notification_id` int(10) NOT NULL,
  `level` enum('all','owner') default NULL,
  PRIMARY KEY  (`notification_user_account_id`),
  KEY `notification_user_account_fkindex1` (`notification_id`),
  KEY `notification_user_account_fkindex2` (`user_account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `package_type`
--

CREATE TABLE `package_type` (
  `package_type_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) NOT NULL,
  `courier_id` int(10) unsigned NOT NULL,
  `VALUE` varchar(50) default NULL,
  PRIMARY KEY  (`package_type_id`),
  KEY `package_type_fkindex1` (`courier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `receipt`
--

CREATE TABLE `receipt` (
  `receipt_id` int(10) unsigned NOT NULL auto_increment,
  `transaction_id` int(10) unsigned NOT NULL,
  `from_company_id` int(10) unsigned NOT NULL,
  `from_contact_id` int(10) unsigned NOT NULL,
  `to_contact_id` int(10) unsigned NOT NULL,
  `to_address_id` int(10) unsigned NOT NULL,
  `receipt_number` varchar(50) NOT NULL,
  `due_date` date default NULL,
  `receipt_date` date default NULL,
  `received_flag` bit(1) default NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`receipt_id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  UNIQUE KEY `receipt_number` (`receipt_number`),
  KEY `receipt_fkindex1` (`from_company_id`),
  KEY `receipt_fkindex2` (`from_contact_id`),
  KEY `receipt_fkindex3` (`to_contact_id`),
  KEY `receipt_fkindex4` (`to_address_id`),
  KEY `receipt_fkindex5` (`created_by`),
  KEY `receipt_fkindex6` (`modified_by`),
  KEY `receipt_fkindex7` (`transaction_id`),
  KEY `receipt_index3241` (`receipt_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) NOT NULL,
  `long_description` text,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`role_id`),
  KEY `role_fkindex1` (`created_by`),
  KEY `role_fkindex2` (`modified_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role_entity_qtype_built_in_authorization`
--

CREATE TABLE `role_entity_qtype_built_in_authorization` (
  `role_entity_built_in_id` int(10) unsigned NOT NULL auto_increment,
  `role_id` int(10) unsigned NOT NULL,
  `entity_qtype_id` int(10) unsigned NOT NULL,
  `authorization_id` int(10) unsigned NOT NULL,
  `authorized_flag` bit(1) NOT NULL default '\0',
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`role_entity_built_in_id`),
  UNIQUE KEY `role_id` (`role_id`,`entity_qtype_id`,`authorization_id`),
  KEY `role_entity_qtype_built_in_authorization_fkindex1` (`role_id`),
  KEY `role_entity_qtype_built_in_authorization_fkindex2` (`entity_qtype_id`),
  KEY `role_entity_qtype_built_in_authorization_fkindex3` (`authorization_id`),
  KEY `role_entity_qtype_built_in_authorization_fkindex4` (`created_by`),
  KEY `role_entity_qtype_built_in_authorization_fkindex5` (`modified_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role_entity_qtype_custom_field_authorization`
--

CREATE TABLE `role_entity_qtype_custom_field_authorization` (
  `role_entity_qtype_custom_field_authorization_id` int(10) unsigned NOT NULL auto_increment,
  `role_id` int(10) unsigned NOT NULL,
  `entity_qtype_custom_field_id` int(10) unsigned NOT NULL,
  `authorization_id` int(10) unsigned NOT NULL,
  `authorized_flag` bit(1) NOT NULL default '\0',
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`role_entity_qtype_custom_field_authorization_id`),
  UNIQUE KEY `role_id` (`role_id`,`entity_qtype_custom_field_id`,`authorization_id`),
  KEY `role_entity_qtype_custom_field_authorization_fkindex1` (`role_id`),
  KEY `role_entity_qtype_custom_field_authorization_fkindex2` (`entity_qtype_custom_field_id`),
  KEY `role_entity_qtype_custom_field_authorization_fkindex3` (`authorization_id`),
  KEY `role_entity_qtype_custom_field_authorization_fkindex4` (`created_by`),
  KEY `role_entity_qtype_custom_field_authorization_fkindex5` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role_module`
--

CREATE TABLE `role_module` (
  `role_module_id` int(10) unsigned NOT NULL auto_increment,
  `role_id` int(10) unsigned NOT NULL,
  `module_id` int(10) unsigned NOT NULL,
  `access_flag` bit(1) NOT NULL COMMENT 'Determines whether this role has access to this module',
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`role_module_id`),
  KEY `role_module_fkindex1` (`role_id`),
  KEY `role_module_fkindex2` (`module_id`),
  KEY `role_module_fkindex3` (`created_by`),
  KEY `role_module_fkindex4` (`modified_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role_module_authorization`
--

CREATE TABLE `role_module_authorization` (
  `role_module_authorization_id` int(10) unsigned NOT NULL auto_increment,
  `role_module_id` int(10) unsigned default NULL,
  `authorization_id` int(10) unsigned default NULL,
  `authorization_level_id` int(10) unsigned default NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`role_module_authorization_id`),
  KEY `role_module_authorization_fkindex1` (`role_module_id`),
  KEY `role_module_authorization_fkindex2` (`authorization_id`),
  KEY `role_module_authorization_fkindex3` (`authorization_level_id`),
  KEY `role_module_authorization_fkindex4` (`created_by`),
  KEY `role_module_authorization_fkindex5` (`modified_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role_transaction_type_authorization`
--

CREATE TABLE `role_transaction_type_authorization` (
  `role_transaction_type_authorization_id` int(10) NOT NULL auto_increment,
  `role_id` int(10) unsigned NOT NULL,
  `transaction_type_id` int(10) unsigned NOT NULL,
  `authorization_level_id` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`role_transaction_type_authorization_id`),
  UNIQUE KEY `role_transaction_type_authorization_UNIQUE` (`role_id`,`transaction_type_id`),
  KEY `role_transaction_type_authorization_FKIndex1` (`created_by`),
  KEY `role_transaction_type_authorization_FKIndex2` (`modified_by`),
  KEY `role_transaction_type_authorization_FKIndex3` (`authorization_level_id`),
  KEY `role_transaction_type_authorization_FKIndex4` (`transaction_type_id`),
  KEY `role_transaction_type_authorization_FKIndex5` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE `shipment` (
  `shipment_id` int(10) unsigned NOT NULL auto_increment,
  `shipment_number` varchar(50) NOT NULL,
  `transaction_id` int(10) unsigned NOT NULL,
  `from_company_id` int(10) unsigned NOT NULL,
  `from_contact_id` int(10) unsigned NOT NULL,
  `from_address_id` int(10) unsigned NOT NULL,
  `to_company_id` int(10) unsigned NOT NULL,
  `to_contact_id` int(10) unsigned NOT NULL,
  `to_address_id` int(10) unsigned NOT NULL,
  `courier_id` int(10) unsigned default NULL,
  `tracking_number` varchar(50) default NULL,
  `ship_date` date NOT NULL,
  `shipped_flag` bit(1) default NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`shipment_id`),
  UNIQUE KEY `shipment_number` (`shipment_number`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `shipment_fkindex1` (`transaction_id`),
  KEY `shipment_fkindex4` (`from_address_id`),
  KEY `shipment_fkindex5` (`to_address_id`),
  KEY `shipment_fkindex6` (`to_company_id`),
  KEY `shipment_fkindex8` (`courier_id`),
  KEY `shipment_fkindex13` (`created_by`),
  KEY `shipment_fkindex14` (`modified_by`),
  KEY `shipment_fkindex2` (`from_contact_id`),
  KEY `shipment_fkindex3` (`to_contact_id`),
  KEY `shipment_fkindex16` (`from_company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_account`
--

CREATE TABLE `shipping_account` (
  `shipping_account_id` int(10) unsigned NOT NULL auto_increment,
  `courier_id` int(10) unsigned NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `access_id` varchar(255) NOT NULL,
  `access_code` varchar(255) NOT NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`shipping_account_id`),
  KEY `shipping_account_fkindex1` (`courier_id`),
  KEY `shipping_account_fkindex2` (`modified_by`),
  KEY `shipping_account_fkindex3` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shortcut`
--

CREATE TABLE `shortcut` (
  `shortcut_id` int(10) unsigned NOT NULL auto_increment,
  `module_id` int(10) unsigned NOT NULL,
  `authorization_id` int(10) unsigned default NULL,
  `short_description` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image_path` varchar(255) default NULL,
  `entity_qtype_id` int(10) unsigned NOT NULL,
  `create_flag` tinyint(1) unsigned NOT NULL,
  `transaction_type_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`shortcut_id`),
  KEY `shortcut_fkindex1` (`module_id`),
  KEY `shortcut_fkindex2` (`authorization_id`),
  KEY `shortcut_fkindex3` (`entity_qtype_id`),
  KEY `transaction_type_id` (`transaction_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state_province`
--

CREATE TABLE `state_province` (
  `state_province_id` int(10) unsigned NOT NULL auto_increment,
  `country_id` int(10) unsigned default NULL,
  `short_description` varchar(50) default NULL,
  `abbreviation` varchar(2) default NULL,
  PRIMARY KEY  (`state_province_id`),
  KEY `state_province_fkindex1` (`country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(10) unsigned NOT NULL auto_increment,
  `entity_qtype_id` int(10) unsigned NOT NULL,
  `transaction_type_id` int(10) unsigned NOT NULL,
  `note` text,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`transaction_id`),
  KEY `transaction_fkindex1` (`transaction_type_id`),
  KEY `transaction_fkindex2` (`created_by`),
  KEY `transaction_fkindex3` (`modified_by`),
  KEY `transaction_fkindex4` (`entity_qtype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_type`
--

CREATE TABLE `transaction_type` (
  `transaction_type_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(50) NOT NULL,
  `asset_flag` bit(1) NOT NULL default '\0',
  `inventory_flag` bit(1) NOT NULL default '\0',
  PRIMARY KEY  (`transaction_type_id`),
  UNIQUE KEY `short_description` (`short_description`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `user_account_id` int(10) unsigned NOT NULL auto_increment,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password_hash` varchar(40) NOT NULL,
  `email_address` varchar(50) default NULL,
  `active_flag` bit(1) NOT NULL COMMENT 'User account enabled/disabled',
  `admin_flag` bit(1) NOT NULL COMMENT 'Designates user as normal or administrator',
  `portable_access_flag` bit(1) default NULL,
  `portable_user_pin` int(10) default NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_by` int(10) unsigned default NULL,
  `creation_date` datetime default NULL,
  `modified_by` int(10) unsigned default NULL,
  `modified_date` timestamp NULL default NULL on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`user_account_id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_account_fkindex1` (`created_by`),
  KEY `user_account_fkindex2` (`modified_by`),
  KEY `user_account_fkindex3` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='User accounts are stored in this table';

-- --------------------------------------------------------

--
-- Table structure for table `weight_unit`
--

CREATE TABLE `weight_unit` (
  `weight_unit_id` int(10) unsigned NOT NULL auto_increment,
  `short_description` varchar(255) default NULL,
  PRIMARY KEY  (`weight_unit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `address_ibfk_3` FOREIGN KEY (`state_province_id`) REFERENCES `state_province` (`state_province_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `address_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `asset_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `asset_ibfk_1` FOREIGN KEY (`asset_model_id`) REFERENCES `asset_model` (`asset_model_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `asset_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `asset_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `asset_model`
--
ALTER TABLE `asset_model`
  ADD CONSTRAINT `asset_model_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `asset_model_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `asset_model_ibfk_2` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`manufacturer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `asset_model_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `asset_transaction`
--
ALTER TABLE `asset_transaction`
  ADD CONSTRAINT `asset_transaction_ibfk_8` FOREIGN KEY (`parent_asset_transaction_id`) REFERENCES `asset_transaction` (`asset_transaction_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `asset_transaction_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `asset_transaction_ibfk_2` FOREIGN KEY (`source_location_id`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `asset_transaction_ibfk_3` FOREIGN KEY (`destination_location_id`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `asset_transaction_ibfk_4` FOREIGN KEY (`asset_id`) REFERENCES `asset` (`asset_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `asset_transaction_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `asset_transaction_ibfk_6` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `asset_transaction_ibfk_7` FOREIGN KEY (`new_asset_id`) REFERENCES `asset` (`asset_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `attachment`
--
ALTER TABLE `attachment`
  ADD CONSTRAINT `attachment_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `attachment_ibfk_1` FOREIGN KEY (`entity_qtype_id`) REFERENCES `entity_qtype` (`entity_qtype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `audit`
--
ALTER TABLE `audit`
  ADD CONSTRAINT `audit_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `audit_ibfk_1` FOREIGN KEY (`entity_qtype_id`) REFERENCES `entity_qtype` (`entity_qtype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `audit_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `audit_scan`
--
ALTER TABLE `audit_scan`
  ADD CONSTRAINT `audit_scan_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `audit_scan_ibfk_1` FOREIGN KEY (`audit_id`) REFERENCES `audit` (`audit_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `company_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_4` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `contact_ibfk_3` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `custom_field`
--
ALTER TABLE `custom_field`
  ADD CONSTRAINT `custom_field_ibfk_4` FOREIGN KEY (`default_custom_field_value_id`) REFERENCES `custom_field_value` (`custom_field_value_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `custom_field_ibfk_1` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `custom_field_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `custom_field_ibfk_3` FOREIGN KEY (`custom_field_qtype_id`) REFERENCES `custom_field_qtype` (`custom_field_qtype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `custom_field_selection`
--
ALTER TABLE `custom_field_selection`
  ADD CONSTRAINT `custom_field_selection_ibfk_2` FOREIGN KEY (`custom_field_value_id`) REFERENCES `custom_field_value` (`custom_field_value_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `custom_field_selection_ibfk_1` FOREIGN KEY (`entity_qtype_id`) REFERENCES `entity_qtype` (`entity_qtype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `custom_field_value`
--
ALTER TABLE `custom_field_value`
  ADD CONSTRAINT `custom_field_value_ibfk_3` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_field` (`custom_field_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `custom_field_value_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `custom_field_value_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `datagrid_column_preference`
--
ALTER TABLE `datagrid_column_preference`
  ADD CONSTRAINT `datagrid_column_preference_ibfk_2` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`user_account_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `datagrid_column_preference_ibfk_1` FOREIGN KEY (`datagrid_id`) REFERENCES `datagrid` (`datagrid_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `entity_qtype_custom_field`
--
ALTER TABLE `entity_qtype_custom_field`
  ADD CONSTRAINT `entity_qtype_custom_field_ibfk_2` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_field` (`custom_field_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `entity_qtype_custom_field_ibfk_1` FOREIGN KEY (`entity_qtype_id`) REFERENCES `entity_qtype` (`entity_qtype_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `fedex_shipment`
--
ALTER TABLE `fedex_shipment`
  ADD CONSTRAINT `fedex_shipment_ibfk_8` FOREIGN KEY (`hold_at_location_state`) REFERENCES `state_province` (`state_province_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fedex_shipment_ibfk_1` FOREIGN KEY (`shipping_account_id`) REFERENCES `shipping_account` (`shipping_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fedex_shipment_ibfk_2` FOREIGN KEY (`shipment_id`) REFERENCES `shipment` (`shipment_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fedex_shipment_ibfk_3` FOREIGN KEY (`fedex_service_type_id`) REFERENCES `fedex_service_type` (`fedex_service_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fedex_shipment_ibfk_4` FOREIGN KEY (`length_unit_id`) REFERENCES `length_unit` (`length_unit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fedex_shipment_ibfk_5` FOREIGN KEY (`weight_unit_id`) REFERENCES `weight_unit` (`weight_unit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fedex_shipment_ibfk_6` FOREIGN KEY (`currency_unit_id`) REFERENCES `currency_unit` (`currency_unit_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fedex_shipment_ibfk_7` FOREIGN KEY (`package_type_id`) REFERENCES `package_type` (`package_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `inventory_location`
--
ALTER TABLE `inventory_location`
  ADD CONSTRAINT `inventory_location_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `inventory_location_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `inventory_location_ibfk_2` FOREIGN KEY (`inventory_model_id`) REFERENCES `inventory_model` (`inventory_model_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inventory_location_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `inventory_model`
--
ALTER TABLE `inventory_model`
  ADD CONSTRAINT `inventory_model_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inventory_model_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inventory_model_ibfk_2` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturer` (`manufacturer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inventory_model_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `inventory_transaction`
--
ALTER TABLE `inventory_transaction`
  ADD CONSTRAINT `inventory_transaction_ibfk_6` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `inventory_transaction_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `inventory_transaction_ibfk_2` FOREIGN KEY (`source_location_id`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inventory_transaction_ibfk_3` FOREIGN KEY (`destination_location_id`) REFERENCES `location` (`location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inventory_transaction_ibfk_4` FOREIGN KEY (`inventory_location_id`) REFERENCES `inventory_location` (`inventory_location_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inventory_transaction_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD CONSTRAINT `manufacturer_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `manufacturer_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `notification_user_account`
--
ALTER TABLE `notification_user_account`
  ADD CONSTRAINT `notification_user_account_ibfk_2` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `notification_user_account_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`notification_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `package_type`
--
ALTER TABLE `package_type`
  ADD CONSTRAINT `package_type_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `receipt_ibfk_7` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`from_company_id`) REFERENCES `company` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `receipt_ibfk_2` FOREIGN KEY (`from_contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `receipt_ibfk_3` FOREIGN KEY (`to_contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `receipt_ibfk_4` FOREIGN KEY (`to_address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `receipt_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `receipt_ibfk_6` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `role_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role_entity_qtype_built_in_authorization`
--
ALTER TABLE `role_entity_qtype_built_in_authorization`
  ADD CONSTRAINT `role_entity_qtype_built_in_authorization_ibfk_5` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_entity_qtype_built_in_authorization_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_entity_qtype_built_in_authorization_ibfk_2` FOREIGN KEY (`entity_qtype_id`) REFERENCES `entity_qtype` (`entity_qtype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_entity_qtype_built_in_authorization_ibfk_3` FOREIGN KEY (`authorization_id`) REFERENCES `authorization` (`authorization_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_entity_qtype_built_in_authorization_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role_entity_qtype_custom_field_authorization`
--
ALTER TABLE `role_entity_qtype_custom_field_authorization`
  ADD CONSTRAINT `role_entity_qtype_custom_field_authorization_ibfk_5` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_entity_qtype_custom_field_authorization_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_entity_qtype_custom_field_authorization_ibfk_2` FOREIGN KEY (`entity_qtype_custom_field_id`) REFERENCES `entity_qtype_custom_field` (`entity_qtype_custom_field_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_entity_qtype_custom_field_authorization_ibfk_3` FOREIGN KEY (`authorization_id`) REFERENCES `authorization` (`authorization_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_entity_qtype_custom_field_authorization_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `role_module`
--
ALTER TABLE `role_module`
  ADD CONSTRAINT `role_module_ibfk_4` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_module_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_module_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_module_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `role_module_authorization`
--
ALTER TABLE `role_module_authorization`
  ADD CONSTRAINT `role_module_authorization_ibfk_5` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_module_authorization_ibfk_1` FOREIGN KEY (`role_module_id`) REFERENCES `role_module` (`role_module_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_module_authorization_ibfk_2` FOREIGN KEY (`authorization_id`) REFERENCES `authorization` (`authorization_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_module_authorization_ibfk_3` FOREIGN KEY (`authorization_level_id`) REFERENCES `authorization_level` (`authorization_level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_module_authorization_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `role_transaction_type_authorization`
--
ALTER TABLE `role_transaction_type_authorization`
  ADD CONSTRAINT `role_transaction_type_authorization_ibfk_5` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_transaction_type_authorization_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_transaction_type_authorization_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_transaction_type_authorization_ibfk_3` FOREIGN KEY (`authorization_level_id`) REFERENCES `authorization_level` (`authorization_level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_transaction_type_authorization_ibfk_4` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_type` (`transaction_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shipment`
--
ALTER TABLE `shipment`
  ADD CONSTRAINT `shipment_ibfk_10` FOREIGN KEY (`from_company_id`) REFERENCES `company` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shipment_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `shipment_ibfk_2` FOREIGN KEY (`from_address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shipment_ibfk_3` FOREIGN KEY (`to_address_id`) REFERENCES `address` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shipment_ibfk_4` FOREIGN KEY (`to_company_id`) REFERENCES `company` (`company_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shipment_ibfk_5` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shipment_ibfk_6` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shipment_ibfk_7` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shipment_ibfk_8` FOREIGN KEY (`from_contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shipment_ibfk_9` FOREIGN KEY (`to_contact_id`) REFERENCES `contact` (`contact_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shipping_account`
--
ALTER TABLE `shipping_account`
  ADD CONSTRAINT `shipping_account_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `shipping_account_ibfk_1` FOREIGN KEY (`courier_id`) REFERENCES `courier` (`courier_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shipping_account_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `shortcut`
--
ALTER TABLE `shortcut`
  ADD CONSTRAINT `shortcut_ibfk_4` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_type` (`transaction_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shortcut_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shortcut_ibfk_2` FOREIGN KEY (`authorization_id`) REFERENCES `authorization` (`authorization_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `shortcut_ibfk_3` FOREIGN KEY (`entity_qtype_id`) REFERENCES `entity_qtype` (`entity_qtype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `state_province`
--
ALTER TABLE `state_province`
  ADD CONSTRAINT `state_province_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_4` FOREIGN KEY (`entity_qtype_id`) REFERENCES `entity_qtype` (`entity_qtype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_type` (`transaction_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `user_account_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_account_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `user_account` (`user_account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

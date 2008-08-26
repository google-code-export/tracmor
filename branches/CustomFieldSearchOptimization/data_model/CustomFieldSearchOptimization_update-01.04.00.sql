CREATE TABLE inventory_model_custom_field_helper (
  inventory_model_id INTEGER UNSIGNED NOT NULL,
  	PRIMARY KEY ( inventory_model_id), 
  	INDEX inventory_model_custom_field_helper_fkindex1 ( inventory_model_id ))
TYPE = INNODB;

ALTER TABLE inventory_model_custom_field_helper
  ADD CONSTRAINT FOREIGN KEY( inventory_model_id) references  inventory_model (
    inventory_model_id
  )
ON Delete CASCADE ON Update NO ACTION;

CREATE TABLE asset_model_custom_field_helper (
  asset_model_id INTEGER UNSIGNED NOT NULL,
  	PRIMARY KEY ( asset_model_id), 
  	INDEX asset_model_custom_field_helper_fkindex1 ( asset_model_id ))
TYPE = INNODB;

ALTER TABLE asset_model_custom_field_helper
  ADD CONSTRAINT FOREIGN KEY( asset_model_id) references asset_model (
    asset_model_id
  )
ON Delete CASCADE ON Update NO ACTION;

CREATE TABLE manufacturer_custom_field_helper (
  manufacturer_id INTEGER UNSIGNED NOT NULL,
  	PRIMARY KEY ( manufacturer_id), 
  	INDEX manufacturer_custom_field_helper_fkindex1 ( manufacturer_id ))
TYPE = INNODB;

ALTER TABLE manufacturer_custom_field_helper
  ADD CONSTRAINT FOREIGN KEY( manufacturer_id) references manufacturer (
    manufacturer_id
  )
ON Delete CASCADE ON Update NO ACTION;

CREATE TABLE category_custom_field_helper (
  category_id INTEGER UNSIGNED NOT NULL,
  	PRIMARY KEY ( category_id), 
  	INDEX category_custom_field_helper_fkindex1 ( category_id ))
TYPE = INNODB;

ALTER TABLE category_custom_field_helper
  ADD CONSTRAINT FOREIGN KEY( category_id) references category (
    category_id
  )
ON Delete CASCADE ON Update NO ACTION;

CREATE TABLE company_custom_field_helper (
  company_id INTEGER UNSIGNED NOT NULL,
  	PRIMARY KEY ( company_id), 
  	INDEX company_custom_field_helper_fkindex1 ( company_id ))
TYPE = INNODB;

ALTER TABLE company_custom_field_helper
  ADD CONSTRAINT FOREIGN KEY( company_id) references company (
    company_id
  )
ON Delete CASCADE ON Update NO ACTION;

CREATE TABLE contact_custom_field_helper (
  contact_id INTEGER UNSIGNED NOT NULL,
  	PRIMARY KEY ( contact_id), 
  	INDEX contact_custom_field_helper_fkindex1 ( contact_id ))
TYPE = INNODB;

ALTER TABLE contact_custom_field_helper
  ADD CONSTRAINT FOREIGN KEY( contact_id) references contact (
    contact_id
  )
ON Delete CASCADE ON Update NO ACTION;

CREATE TABLE shipment_custom_field_helper (
  shipment_id INTEGER UNSIGNED NOT NULL,
  	PRIMARY KEY ( shipment_id), 
  	INDEX shipment_custom_field_helper_fkindex1 ( shipment_id ))
TYPE = INNODB;

ALTER TABLE shipment_custom_field_helper
  ADD CONSTRAINT FOREIGN KEY( shipment_id) references shipment (
    shipment_id
  )
ON Delete CASCADE ON Update NO ACTION;

CREATE TABLE receipt_custom_field_helper (
  receipt_id INTEGER UNSIGNED NOT NULL,
  	PRIMARY KEY ( receipt_id), 
  	INDEX receipt_custom_field_helper_fkindex1 ( receipt_id ))
TYPE = INNODB;

ALTER TABLE receipt_custom_field_helper
  ADD CONSTRAINT FOREIGN KEY( receipt_id) references receipt (
    receipt_id
  )
ON Delete CASCADE ON Update NO ACTION;
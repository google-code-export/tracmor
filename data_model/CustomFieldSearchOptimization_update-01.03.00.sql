CREATE TABLE asset_custom_field_helper (
  asset_id INTEGER UNSIGNED NOT NULL,
  	PRIMARY KEY ( asset_id), 
  	INDEX asset_custom_field_helper_fkindex1 ( asset_id ))
TYPE = INNODB;

ALTER TABLE asset_custom_field_helper
  ADD CONSTRAINT FOREIGN KEY( asset_id) references asset (
    asset_id
  )
ON Delete CASCADE ON Update NO ACTION;
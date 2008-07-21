CREATE TABLE role_transaction_type_authorization (
  role_transaction_type_authorization_id INT(10) NOT NULL AUTO_INCREMENT,
  role_id INTEGER UNSIGNED NOT NULL,
  transaction_type_id INTEGER UNSIGNED NOT NULL,
  authorization_level_id INTEGER UNSIGNED NOT NULL,
  created_by INTEGER UNSIGNED NULL,
  creation_date DATETIME NULL DEFAULT NULL,
  modified_by INTEGER UNSIGNED NULL,
  modified_date TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY(role_transaction_type_authorization_id),
    INDEX role_transaction_type_authorization_FKIndex1(created_by),
    INDEX role_transaction_type_authorization_FKIndex2(modified_by),
    INDEX role_transaction_type_authorization_FKIndex3(authorization_level_id),
    INDEX role_transaction_type_authorization_FKIndex4(transaction_type_id),
    INDEX role_transaction_type_authorization_FKIndex5(role_id),
    UNIQUE role_transaction_type_authorization_UNIQUE(role_id, transaction_type_id)
)
TYPE=InnoDB;

alter table role_transaction_type_authorization
	add constraint 
	foreign key (			
		created_by
	) references user_account (
		user_account_id
	)
	ON Delete NO ACTION ON Update NO ACTION;

alter table role_transaction_type_authorization
	add constraint 
	foreign key (			
		modified_by
	) references user_account (
		user_account_id
	)
	ON Delete NO ACTION ON Update NO ACTION;
	
alter table role_transaction_type_authorization
	add constraint 
	foreign key (			
		authorization_level_id
	) references authorization_level (
		authorization_level_id
	)
	ON Delete NO ACTION ON Update NO ACTION;
	
alter table role_transaction_type_authorization
	add constraint 
	foreign key (			
		transaction_type_id
	) references transaction_type (
		transaction_type_id
	)
	ON Delete NO ACTION ON Update NO ACTION;

alter table role_transaction_type_authorization
	add constraint 
	foreign key (			
		role_id
	) references role (
		role_id
	)
	ON Delete CASCADE ON Update NO ACTION;
	
alter table shortcut
  ADD transaction_type_id INTEGER UNSIGNED NULL;
  
alter table shortcut
	add constraint 
	foreign key (			
		transaction_type_id
	) references transaction_type (
		transaction_type_id
	)
	ON Delete NO ACTION ON Update NO ACTION;


UPDATE shortcut SET transaction_type_id=1 WHERE shortcut_id=5;

UPDATE shortcut SET transaction_type_id=3 WHERE shortcut_id=6;

UPDATE shortcut SET transaction_type_id=2 WHERE shortcut_id=7;

UPDATE shortcut SET transaction_type_id=8 WHERE shortcut_id=8;

UPDATE shortcut SET transaction_type_id=1 WHERE shortcut_id=11;

UPDATE shortcut SET transaction_type_id=5 WHERE shortcut_id=12;

UPDATE shortcut SET transaction_type_id=4 WHERE shortcut_id=13;



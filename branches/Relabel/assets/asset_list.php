<?php
/*
 * Copyright (c)  2009, Tracmor, LLC 
 *
 * This file is part of Tracmor.  
 *
 * Tracmor is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version. 
 *	
 * Tracmor is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Tracmor; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */

	require_once('../includes/prepend.inc.php');
	QApplication::Authenticate(2);
	require_once(__FORMBASE_CLASSES__ . '/AssetListFormBase.class.php');

	/**
	 * This is a quick-and-dirty draft form object to do the List All functionality
	 * of the Asset class.  It extends from the code-generated
	 * abstract AssetListFormBase class.
	 *
	 * Any display custimizations and presentation-tier logic can be implemented
	 * here by overriding existing or implementing new methods, properties and variables.
	 *
	 * Additional qform control objects can also be defined and used here, as well.
	 * 
	 * @package Application
	 * @subpackage FormDraftObjects
	 * 
	 */
	class AssetListForm extends AssetListFormBase {

		// Header Tabs
		protected $ctlHeaderMenu;
		
		// Shortcut Menu
		protected $ctlShortcutMenu;
		
		// Search Menu
		public $ctlSearchMenu;
		
		protected function Form_Create() {
			
			$this->ctlHeaderMenu_Create();
			$this->ctlShortcutMenu_Create();
			$this->ctlSearchMenu_Create();
		}
  	
		// Create and Setup the Header Composite Control
		protected function ctlHeaderMenu_Create() {
			$this->ctlHeaderMenu = new QHeaderMenu($this);
		}
	
		// Create and Setp the Shortcut Menu Composite Control
		protected function ctlShortcutMenu_Create() {
			$this->ctlShortcutMenu = new QShortcutMenu($this);
		}
		
		// Create and Setup the Asset Search Composite Control
		protected function ctlSearchMenu_Create() {
			$this->ctlSearchMenu = new QAssetSearchComposite($this, null, false);
		}
	}  

	// Go ahead and run this form object to generate the page and event handlers, using
	// generated/asset_edit.php.inc as the included HTML template file
	// AssetListForm::Run('AssetListForm', './Qcodo/assets/asset_list.php.inc');
	AssetListForm::Run('AssetListForm', __DOCROOT__ . __SUBDIRECTORY__ . '/assets/asset_list.tpl.php');
?>
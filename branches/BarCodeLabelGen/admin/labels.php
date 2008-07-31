<?php
/*
 * Copyright (c)  2006, Universal Diagnostic Solutions, Inc. 
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

	// Include prepend.inc to load Qcodo
	require('../includes/prepend.inc.php');		/* if you DO NOT have "includes/" in your include_path */
	QApplication::Authenticate(2);
	
	class AdminLabelsForm extends QForm {
		// Header Menu
		protected $ctlHeaderMenu;
		
		// Drop-down select list
		protected $objLabelTypeControl;
		// Modal dialog for printing labels
		protected $dlgPrintLabels;
		protected $objLabelStock;
		protected $objLabelOffset;
		protected $btnPrint;
		// Search Menu
		protected $ctlSearchMenu;
		// Buttons
		protected $btnPrintLabels;
		
		// Array of ObjectIds of checked items 
		protected $intObjectIdArray;
		
		protected function Form_Create() {
			// Create the Header Menu
			$this->ctlHeaderMenu_Create();
			// Create Label Type
			$this->objLabelTypeControl_Create();

			// Create Modal Window for Printing Labels
			$this->btnPrintLabels_Create();
			$this->dlgPrintLabels = new QDialogBox($this);
      $this->dlgPrintLabels->Text = '';
      
      // Let's setup some basic appearance options
      $this->dlgPrintLabels->Width = '300px';
      $this->dlgPrintLabels->Height = '100px';
      $this->dlgPrintLabels->Overflow = QOverflow::Auto;
      $this->dlgPrintLabels->Padding = '10px';
      $this->dlgPrintLabels->FontSize = '12px';
      //$this->dlgPrintLabels->FontNames = QFontFamily::Georgia;
      $this->dlgPrintLabels->BackColor = '#ffffff';
      // Make sure this Dislog Box is "hidden"
      $this->dlgPrintLabels->Display = false;

      // Add some contorls into modal window
      //$txtLabelStock = new QLabel($this->dlgPrintLabels);
      //$txtLabelStock->Text = "Label Stock: ";
      $this->objLabelStock = new QListBox($this->dlgPrintLabels);
      $this->objLabelStock->Width = 200;
      $this->objLabelStock->AddItem(new QListItem('- Select One -',0));
			$this->objLabelStock->AddItem(new QListItem('Avery 6577 (5/8" x 3")',1));
			$this->objLabelStock->AddItem(new QListItem('Avery 6576 (1-1/4" x 1-3/4")',2));
			//$txtLabelOffset = new QLabel($this->dlgPrintLabels);
			//$txtLabelOffset->Text = "Label Offset: ";
			$this->objLabelOffset = new QListBox($this->dlgPrintLabels);
			$this->objLabelOffset->Width = 200;
			$this->objLabelOffset->AddItem(new QListItem('None',0));
			$this->btnPrint = new QButton($this->dlgPrintLabels);
			$this->btnPrint->Text = "Print";
			$this->btnPrint->AddAction(new QClickEvent(), new QAjaxAction('btnPrint_Click'));
			//$this->dlgPrintLabels->AutoRenderChildren = true;
      $this->dlgPrintLabels->Template = 'labels_printing_labels.tpl.php';
		}
		
		// Create and Setup the Header Composite Control
		protected function ctlHeaderMenu_Create() {
			$this->ctlHeaderMenu = new QHeaderMenu($this);
		}
		
		// Create and Setup the Label Type drop-down select list
		protected function objLabelTypeControl_Create() {
			$this->objLabelTypeControl = new QListBox($this);
			$this->objLabelTypeControl->Width = 150;
			$this->objLabelTypeControl->AddItem(new QListItem('- Select One -',0));
			$this->objLabelTypeControl->AddItem(new QListItem('Assets',1));
			$this->objLabelTypeControl->AddItem(new QListItem('Inventory',2));
			$this->objLabelTypeControl->AddItem(new QListItem('Locations',3));
			$this->objLabelTypeControl->AddItem(new QListItem('Users',4));
			$this->objLabelTypeControl->AddAction(new QChangeEvent(), new QServerAction('objLabelTypeControl_Change'));
		}
		
		// Create and display the search on change Label Type
		protected function objLabelTypeControl_Change() {
      // Create and display search control
		  switch ($this->objLabelTypeControl->SelectedValue) {
  		  case 1:
  		    $this->ctlSearchMenu = new QAssetSearchComposite($this, null, true);
  		    break;
  		  case 2:
  		    $this->ctlSearchMenu = new QInventorySearchComposite($this, null, true);
  		    break;
  		  case 3:
  		    $this->ctlSearchMenu = new QLocationSearchComposite($this, null, true);
  		    break;
  		  case 4:
  		    $this->ctlSearchMenu = new QUserSearchComposite($this, null, true);
  		    break;  
  		  default:
  		    break;
  		}
  		// Uncheck all on change Label Type
      foreach ($this->GetAllControls() as $objControl) {
        if (substr($objControl->ControlId, 0, 11) == 'chkSelected') {
          $objControl->Checked = false;
        }
      }
      if (!$this->ctlSearchMenu) $this->btnPrintLabels->Display = false;
      else $this->btnPrintLabels->Display = true;
  	}
  	
  	// Create and Setup the PrintLabels Button
		protected function btnPrintLabels_Create() {
			$this->btnPrintLabels = new QButton($this);
			$this->btnPrintLabels->Text = 'Print Labels';
			$this->btnPrintLabels->AddAction(new QClickEvent(), new QAjaxAction('btnPrintLabels_Click'));
			$this->btnPrintLabels->Display = false;
		}
		
		// PrintLables button click action
		protected function btnPrintLabels_Click() {
		  $this->intObjectIdArray = array();
			foreach ($this->GetAllControls() as $objControl) {
        if (substr($objControl->ControlId, 0, 11) == 'chkSelected') {
          if ($objControl->Checked) {
            array_push($this->intObjectIdArray, $objControl->ActionParameter);
          }
        }
      }
      
      if (count($this->intObjectIdArray)) {
		    $this->dlgPrintLabels->ShowDialogBox();
		  }
		  else {
		    // There must be alert message
		    
		  }
		}
		
		protected function btnPrint_Click() {
		  if ($this->objLabelStock->SelectedValue) {
		    $this->objLabelStock->Warning = "";
		    
		  }
		  else {
		    $this->objLabelStock->Warning = "Please select one";
		  }
		}
	}

  	// Go ahead and run this form object to generate the page
	AdminLabelsForm::Run('AdminLabelsForm', 'labels.tpl.php');	
?>
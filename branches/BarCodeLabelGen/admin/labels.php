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
		protected $lstLabelTypeControl;
		// Modal dialog for printing labels
		protected $dlgPrintLabels;
		protected $lstLabelStock;
		protected $lstLabelOffset;
		protected $btnPrint;
		protected $dlgGeneratedLabels;
		// Search Menu
		protected $ctlSearchMenu;
		// Buttons
		protected $btnPrintLabels;
		
		// Array of ObjectIds of checked items 
		protected $intObjectIdArray;
		protected $strBarCodeArray;
		
		protected function Form_Create() {
			// Create the Header Menu
			$this->ctlHeaderMenu_Create();
			// Create Label Type
			$this->lstLabelTypeControl_Create();

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
      
      $this->dlgGeneratedLabels = new QDialogBox($this);
      $this->dlgGeneratedLabels->Width = '600px';
      $this->dlgGeneratedLabels->Height = '400px';
      $this->dlgGeneratedLabels->Overflow = QOverflow::Auto;
      $this->dlgGeneratedLabels->Padding = '10px';
      $this->dlgGeneratedLabels->FontSize = '12px';
      $this->dlgGeneratedLabels->BackColor = '#ffffff';
      // Make sure this Dislog Box is "hidden"
      $this->dlgGeneratedLabels->Display = false;

      // Add some contorls into modal window
      //$txtLabelStock = new QLabel($this->dlgPrintLabels);
      //$txtLabelStock->Text = "Label Stock: ";
      $this->lstLabelStock = new QListBox($this->dlgPrintLabels);
      $this->lstLabelStock->Width = 200;
      $this->lstLabelStock->AddItem(new QListItem('- Select One -',0));
			$this->lstLabelStock->AddItem(new QListItem('Avery 6577 (5/8" x 3")',1));
			$this->lstLabelStock->AddItem(new QListItem('Avery 6576 (1-1/4" x 1-3/4")',2));
			$this->lstLabelStock->AddAction(new QChangeEvent(), new QAjaxAction('lstLabelStock_Change'));
			//$txtLabelOffset = new QLabel($this->dlgPrintLabels);
			//$txtLabelOffset->Text = "Label Offset: ";
			$this->lstLabelOffset = new QListBox($this->dlgPrintLabels);
			$this->lstLabelOffset->Width = 200;
			$this->lstLabelOffset->AddItem(new QListItem('None',null,1));
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
		protected function lstLabelTypeControl_Create() {
			$this->lstLabelTypeControl = new QListBox($this);
			$this->lstLabelTypeControl->Width = 150;
			$this->lstLabelTypeControl->AddItem(new QListItem('- Select One -',0));
			$this->lstLabelTypeControl->AddItem(new QListItem('Assets',1));
			$this->lstLabelTypeControl->AddItem(new QListItem('Inventory',2));
			$this->lstLabelTypeControl->AddItem(new QListItem('Locations',3));
			$this->lstLabelTypeControl->AddItem(new QListItem('Users',4));
			$this->lstLabelTypeControl->AddAction(new QChangeEvent(), new QServerAction('lstLabelTypeControl_Change'));
		}
		
		// Create and display the search on change Label Type
		protected function lstLabelTypeControl_Change() {
      // Create and display search control
		  switch ($this->lstLabelTypeControl->SelectedValue) {
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
  		// Uncheck all items on change Label Type
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
			$this->strBarCodeArray = array();
		  // Switch statement in here to make this work for all four entity types
		  switch ($this->lstLabelTypeControl->SelectedValue) {
		    case 1:
  		    $this->intObjectIdArray = $this->ctlSearchMenu->dtgAsset->GetSelected('AssetId');
  		    if (count($this->intObjectIdArray)) {
  		      $objCheckedArray = Asset::QueryArray(QQ::In(QQN::Asset()->AssetId, $this->intObjectIdArray));
  		      $objAssetArrayById = array();
  		      // Create array of objects where the key is Id
  		      foreach ($objCheckedArray as $objAsset) {
  		        $objAssetArrayById[$objAsset->AssetId] = $objAsset;
  		      }
  		      // Fill the BarCodeArray in the order items sorted in the datagrid
  		      foreach ($this->intObjectIdArray as $intObjectId) {
  		        $this->strBarCodeArray[] = $objAssetArrayById[$intObjectId]->AssetCode;
  		      }
  		    }
  		    break;
  		  case 2:
  		    $this->intObjectIdArray = $this->ctlSearchMenu->dtgInventoryModel->GetSelected('InventoryModelId');
  		    if (count($this->intObjectIdArray)) {
  		      $objCheckedArray = InventoryModel::QueryArray(QQ::In(QQN::InventoryModel()->InventoryModelId, $this->intObjectIdArray));
  		      $objInventoryModelArrayById = array();
  		      // Create array of objects where the key is Id
  		      foreach ($objCheckedArray as $objInventoryModel) {
  		        $objInventoryModelArrayById[$objInventoryModel->InventoryModelId] = $objInventoryModel;
  		      }
  		      // Fill the BarCodeArray in the order items sorted in the datagrid
  		      foreach ($this->intObjectIdArray as $intObjectId) {
  		        $this->strBarCodeArray[] = $objInventoryModelArrayById[$intObjectId]->InventoryModelCode;
  		      }
  		    }
  		    break;
  		  case 3:
  		    $this->intObjectIdArray = $this->ctlSearchMenu->dtgLocation->GetSelected('LocationId');
  		    if (count($this->intObjectIdArray)) {
  		      $objCheckedArray = Location::QueryArray(QQ::In(QQN::Location()->LocationId, $this->intObjectIdArray));
  		      $objLocationArrayById = array();
  		      // Create array of objects where the key is Id
  		      foreach ($objCheckedArray as $objLocation) {
  		        $objLocationArrayById[$objLocation->LocationId] = $objLocation;
  		      }
  		      // Fill the BarCodeArray in the order items sorted in the datagrid
  		      foreach ($this->intObjectIdArray as $intObjectId) {
  		        $this->strBarCodeArray[] = $objLocationArrayById[$intObjectId]->ShortDescription;
  		      }
  		    }
  		    break;
  		  case 4:
  		    $this->intObjectIdArray = $this->ctlSearchMenu->dtgUserAccount->GetSelected('UserAccountId');
  		    if (count($this->intObjectIdArray)) {
  		      $objCheckedArray = UserAccount::QueryArray(QQ::In(QQN::UserAccount()->UserAccountId, $this->intObjectIdArray));
  		      $objUserAccountArrayById = array();
  		      // Create array of objects where the key is Id
  		      foreach ($objCheckedArray as $objUserAccount) {
  		        $objUserAccountArrayById[$objUserAccount->UserAccountId] = $objUserAccount;
  		      }
  		      // Fill the BarCodeArray in the order items sorted in the datagrid
  		      foreach ($this->intObjectIdArray as $intObjectId) {
  		        $this->strBarCodeArray[] = $objUserAccountArrayById[$intObjectId]->Username;
  		      }
  		    }
  		    break;  
  		  default:
  		    $this->btnPrintLabels->Warning = "Please select Label Type.<br/>";
  		    $this->intObjectIdArray = array();
  		    break;  
		  }
		        
      if (count($this->strBarCodeArray)) {
        $this->btnPrintLabels->Warning = "";
        $this->dlgPrintLabels->ShowDialogBox();
		  }
		  else {
		    // If we have no checked items
		    $this->btnPrintLabels->Warning .= "You must check at least one item.";
		  }
		}
		
		protected function lstLabelStock_Change() {
		  if ($this->lstLabelStock->SelectedValue) {
		    $intLabelOffsetCount = 0;
		    $this->lstLabelStock->Warning = "";
  		  $this->lstLabelOffset->RemoveAllItems();
  		  $this->lstLabelOffset->AddItem(new QListItem('None',null,1));
  		  if ($this->lstLabelStock->SelectedValue == 1 && count($this->strBarCodeArray) > 30) {
 		      $intLabelOffsetCount = 30;
  		  }
  		  elseif ($this->lstLabelStock->SelectedValue == 2 && count($this->strBarCodeArray) > 40) {
  		    $intLabelOffsetCount = 40;
  		  }
  		  else {
  		    $intLabelOffsetCount = count($this->strBarCodeArray)-1;
  		  }
        for ($i = 0; $i < $intLabelOffsetCount; $i++) {
          $this->lstLabelOffset->AddItem(new QListItem($this->strBarCodeArray[$i],$i));
        }
		  }
		  else {
		    $this->lstLabelStock->Warning = "Please select one";
		  }
		}
		
		protected function btnPrint_Click() {
		  if ($this->lstLabelStock->SelectedValue) {
		    $this->lstLabelStock->Warning = "";
		    $this->dlgPrintLabels->HideDialogBox();
		    // Bar Code Label Generation
		    $this->dlgGeneratedLabels->Text = "<div class=\"title\">Bar Code Label Generation</div><table>";
		    if (is_null($this->lstLabelOffset->SelectedValue)) {
		      $i = 0;
		    }
		    else {
		      $i = $this->lstLabelOffset->SelectedValue + 1;
		    }
		    // Count of total labels
		    $intBarCodeArrayCount = count($this->strBarCodeArray);
		    if ($this->lstLabelStock->SelectedValue == 1) {
		      // Labels per row for Avery 6577 (5/8" x 3")
		      $intNumberInTableRow = 2;
		    }
		    else {
		      // Labels per row for Avery 6576 (1-1/4" x 1-3/4")
		      $intNumberInTableRow = 4;
		    }
		    while ($i < $intBarCodeArrayCount) {
		      $this->dlgGeneratedLabels->Text .= "<tr>";
		      $j = 0;
		      while ($j < $intNumberInTableRow) {
		        if ($i < $intBarCodeArrayCount) {
		          $this->dlgGeneratedLabels->Text .= "<td><img src=\"../includes/php/barcode.php?code=".$this->strBarCodeArray[$i++]."&encoding=128&scale=1\"></td>";
		        }
		        else {
		          $this->dlgGeneratedLabels->Text .= "<td></td>";
		        }
		        $j++;
		      }
		    }
		    $this->dlgGeneratedLabels->Text .= "</table>";
		    $this->dlgGeneratedLabels->ShowDialogBox();
  	  }
		  else {
		    $this->lstLabelStock->Warning = "Please select one";
		  }
		  
		  
		}
	}

  	// Go ahead and run this form object to generate the page
	AdminLabelsForm::Run('AdminLabelsForm', 'labels.tpl.php');	
?>
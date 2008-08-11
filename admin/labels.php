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
	QApplication::Authenticate();
	
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
		protected $btnCancel;
		
		// Search Menu
		protected $ctlSearchMenu;
		// Buttons
		protected $btnPrintLabels;
		
		// Array of ObjectIds of checked items 
		protected $intObjectIdArray;
		protected $strBarCodeArray;
		protected $intCurrentBarCodeLabel;
		protected $intLabelsPerPage;
		
		protected function Form_Create() {
			// Create the Header Menu
			$this->ctlHeaderMenu_Create();
			// Create Label Type
			$this->lstLabelTypeControl_Create();
			// Create Print Labels button
			$this->btnPrintLabels_Create();
			// Create Modal Window for Printing Labels
			$this->dlgPrintLabels_Create();
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
		
		// Create and Setup the Modal Window for Printing Labels
		protected function dlgPrintLabels_Create() {
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
      
      /* If you try to make moveable - error "qc.regDB is not a function"
      $this->dlgPrintLabels->Position = QPosition::Absolute;
      $this->dlgPrintLabels->AddControlToMove();
      */
      
      // Add some controls into modal window
      $this->lstLabelStock = new QListBox($this->dlgPrintLabels);
      $this->lstLabelStock->Width = 200;
      $this->lstLabelStock->AddItem(new QListItem('- Select One -', 0));
			$this->lstLabelStock->AddItem(new QListItem('Avery 6577 (5/8" x 3")', 1));
			$this->lstLabelStock->AddItem(new QListItem('Avery 6576 (1-1/4" x 1-3/4")', 2));
			$this->lstLabelStock->AddAction(new QChangeEvent(), new QAjaxAction('lstLabelStock_Change'));
			$this->lstLabelOffset = new QListBox($this->dlgPrintLabels);
			$this->lstLabelOffset->Width = 200;
			$this->lstLabelOffset->AddItem(new QListItem('None', 0, 1));
			$this->btnPrint = new QButton($this->dlgPrintLabels);
			$this->btnPrint->Text = "Print";
			$this->btnPrint->AddAction(new QClickEvent(), new QServerAction('btnPrint_Click'));
			$this->btnPrint->AddAction(new QClickEvent(), new QToggleEnableAction($this->btnPrint));
			$this->btnCancel = new QButton($this->dlgPrintLabels);
			$this->btnCancel->Text = "Cancel";
			$this->btnCancel->AddAction(new QClickEvent(), new QServerAction('btnCancel_Click'));
			$this->dlgPrintLabels->Template = 'labels_printing_labels.tpl.php';
		}
  	
  	// Create and Setup the Print Labels Button
		protected function btnPrintLabels_Create() {
			$this->btnPrintLabels = new QButton($this);
			$this->btnPrintLabels->Text = 'Print Labels';
			$this->btnPrintLabels->AddAction(new QClickEvent(), new QAjaxAction('btnPrintLabels_Click'));
			$this->btnPrintLabels->Display = false;
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
      // Show/Hide Print Labels button
      if (!$this->ctlSearchMenu) {
        $this->btnPrintLabels->Display = false;
      }
      else {
        $this->btnPrintLabels->Display = true;
      }
  	}
		
		// Print Lables button click action
		protected function btnPrintLabels_Click() {
			$this->strBarCodeArray = array();
			set_time_limit(0);
			$blnError = false;
			$arrDataGridObjectNameId = $this->ctlSearchMenu->GetDataGridObjectNameId();
  		$this->intObjectIdArray = $this->ctlSearchMenu->$arrDataGridObjectNameId[0]->GetSelected($arrDataGridObjectNameId[1]);
  		$objCheckedArray = array();
  		if (count($this->intObjectIdArray)) {
  		  // Switch statement for all four entity types
  		  switch ($this->lstLabelTypeControl->SelectedValue) {
  		    case 1:
  		      // Load an array of Assets by AssetId
    		    $objCheckedArray = Asset::QueryArray(QQ::In(QQN::Asset()->AssetId, $this->intObjectIdArray));
    		    break;
    		  case 2:
    		    // Load an array of Inventories by InventoryModelId
    		    $objCheckedArray = InventoryModel::QueryArray(QQ::In(QQN::InventoryModel()->InventoryModelId, $this->intObjectIdArray));
    		    break;
    		  case 3:
    		    // Load an array of Locations by LocationId
    		    $objCheckedArray = Location::QueryArray(QQ::In(QQN::Location()->LocationId, $this->intObjectIdArray));
    		    break;
    		  case 4:
    		    $objCheckedArray = UserAccount::QueryArray(QQ::In(QQN::UserAccount()->UserAccountId, $this->intObjectIdArray));
    		    break;  
    		  default:
    		    $this->btnPrintLabels->Warning = "Please select Label Type.<br/>";
    		    $this->intObjectIdArray = array();
    		    $blnError = true;
    		    break;  
  		  }
  		  $objArrayById = array();
    		// Create array of objects where the key is Id
    		foreach ($objCheckedArray as $objChecked) {
    		  $objArrayById[$objChecked->$arrDataGridObjectNameId[1]] = $objChecked;
    		}
    		// Fill the BarCodeArray in the order items sorted in the datagrid
    		foreach ($this->intObjectIdArray as $intObjectId) {
    		  $this->strBarCodeArray[] = $objArrayById[$intObjectId]->$arrDataGridObjectNameId[2];
    		}
  		}
  		else {
  		  $blnError = true;
  		}
		  
      if (!$blnError) {
        $this->btnPrintLabels->Warning = "";
        $this->dlgPrintLabels->ShowDialogBox();
		  }
		  else {
		    // If we have no checked items
		    $this->btnPrintLabels->Warning .= "You must check at least one item.";
		  }
		}
		
		// Cancel button click action
		protected function btnCancel_Click() {
		  $this->dlgPrintLabels->HideDialogBox();
		  $this->btnPrint->Enabled = true;
		  // Uncheck all items
      foreach ($this->GetAllControls() as $objControl) {
        if (substr($objControl->ControlId, 0, 11) == 'chkSelected') {
          $objControl->Checked = false;
        }
      }
		}
		
		// Create the Label Offset drop-down menu on change Label Stock
		protected function lstLabelStock_Change() {
		  if ($this->lstLabelStock->SelectedValue) {
		    $intLabelOffsetCount = 0;
		    $this->lstLabelStock->Warning = "";
  		  $this->lstLabelOffset->RemoveAllItems();
  		  $this->lstLabelOffset->AddItem(new QListItem('None', 0, 1));
  		  // Labels per page for Avery 6577 (5/8" x 3")
  		  if ($this->lstLabelStock->SelectedValue == 1) {
 		      $this->intLabelsPerPage = 30;
  		  }
  		  // Labels per page for Avery 6576 (1-1/4" x 1-3/4")
  		  else {
  		    $this->intLabelsPerPage = 32;
  		  }
  		  for ($i = 1; $i < $this->intLabelsPerPage; $i++) {
          $this->lstLabelOffset->AddItem(new QListItem($i, $i));
        }
		  }
		  else {
		    $this->lstLabelStock->Warning = "Please select one";
		  }
		}
		
		// Create and Setup the table per each page for Bar Code Label Generation
		protected function CreateTableByBarCodeArray() {
		  $strTable = "<table width=\"100%\" height=\"100%\">";
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
		  
		  $i = 0;
		  while ($i < $this->intLabelsPerPage) {
		    $strTable .= "<tr>";
		    $j = 0;
		    while ($j < $intNumberInTableRow) {
		      // If Label Offset set
		      if ($i < $this->lstLabelOffset->SelectedValue && $this->intCurrentBarCodeLabel == 0) {
		        $strTable .= "<td><img src=\"../includes/php/tcpdf/images/_blank.png\" height=\"";
		        if ($this->lstLabelStock->SelectedValue == 1) {
		          $strTable .= "40";
            }
            else {
              $strTable .= "60";
            }
            $strTable .= "\" /></td>";
		      }
		      elseif ($this->intCurrentBarCodeLabel < $intBarCodeArrayCount) {
		        $strTable .= "<td><img src=\"../includes/php/tcpdf/images/tmp/".$_SESSION['intUserAccountId']."_".($this->intCurrentBarCodeLabel+1).".png\"";
		        if ($this->lstLabelStock->SelectedValue == 1) {
		          $strTable .= " height=\"40\"";
            }
            $strTable .= " border=\"0\" align=\"left\" /></td>";
		        $image = ImageCreateFromPNG("http://localhost/tracmor/includes/php/barcode.php?code=".$this->strBarCodeArray[$this->intCurrentBarCodeLabel++]."&encoding=128&scale=1");
		        ImagePNG($image,"../includes/php/tcpdf/images/tmp/".$_SESSION['intUserAccountId']."_".$this->intCurrentBarCodeLabel.".png");
		        imagedestroy($image);
		      }
		      else {
		        $strTable .= "<td></td>";
		      }
		      $j++;
		      $i++;
		    }
		    $strTable .= "</tr>";
		  }
		  
		  $strTable .= "</table>";
		  return $strTable;
		}
		
		// Print button click action
		protected function btnPrint_Click() {
		  if ($this->lstLabelStock->SelectedValue) {
		    // Begin rendering the QForm
			  $this->RenderBegin(false);
		    
			  $this->lstLabelStock->Warning = "";
		    $this->dlgPrintLabels->HideDialogBox();
		    $this->intCurrentBarCodeLabel = 0;
		    
		    include_once('../includes/php/tcpdf/config/lang/eng.php');
        include_once('../includes/php/tcpdf/tcpdf.php');
        
        set_time_limit(0);
        
        $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true);
        // Set document information
        $pdf->SetCreator("Tracmor");
        $pdf->SetAuthor("Tracmor");
        $pdf->SetTitle("Bar Codes");
        
        // Disable header and footer
        $pdf->setPrintHeader(false);
        $pdf->setPrintFooter(false);
        
        // Set margins
        $pdf->SetMargins(10, 5, 10);
        
        // Disable auto page breaks
        $pdf->SetAutoPageBreak(false);
        
        // Set some language-dependent strings
        $pdf->setLanguageArray($l); 
        
        // Initialize document
        $pdf->AliasNbPages();
        
        while ($this->intCurrentBarCodeLabel < count($this->strBarCodeArray)) {
          // add a page
          $pdf->AddPage();
          // Create HTML content
          $htmlcontent = $this->CreateTableByBarCodeArray();
          // output the HTML content
          $pdf->writeHTML($htmlcontent);
        }
        
        // Clean the Output Buffer
        ob_end_clean();
        
        // Close and display PDF document
        $pdf->Output("BarCodes.pdf", "D");
        
        // Delete temporary created images
        for ($i = 1; $i <= $this->intCurrentBarCodeLabel; $i++) {
          @unlink("../includes/php/tcpdf/images/tmp/".$_SESSION['intUserAccountId']."_".$i.".png");
        }
        
        $this->RenderEnd(false);
				exit();
  	  }
		  else {
		    $this->lstLabelStock->Warning = "Please select one";
		  }
		}
	}

	// Go ahead and run this form object to generate the page
	AdminLabelsForm::Run('AdminLabelsForm', 'labels.tpl.php');	
?>
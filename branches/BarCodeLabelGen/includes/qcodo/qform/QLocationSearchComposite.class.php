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
?>

<?php

class QLocationSearchComposite extends QControl {
	
	public $dtgLocation;
	public $objParentObject;
	
	// We want to override the constructor in order to setup the subcontrols
	public function __construct($objParentObject, $strControlId = null, $blnShowCheckboxes = false) {
		
    // First, call the parent to do most of the basic setup
    try {
        parent::__construct($objParentObject, $strControlId);
    } catch (QCallerException $objExc) {
        $objExc->IncrementOffset();
        throw $objExc;
    }
    
    $this->objParentObject = $objParentObject;
    
		$this->dtgLocation = new QDataGrid($this);
		$this->dtgLocation->Name = 'location_list';
		$this->dtgLocation->CellPadding = 5;
  	$this->dtgLocation->CellSpacing = 0;
  	$this->dtgLocation->CssClass = "datagrid";
      		
    // Disable AJAX for the datagrid
    $this->dtgLocation->UseAjax = false;
      
    // Allow for column toggling
    $this->dtgLocation->ShowColumnToggle = true;
      
    // Allow for CSV Export
    $this->dtgLocation->ShowExportCsv = true;

    // Enable Pagination, and set to 20 items per page
    $objPaginator = new QPaginator($this->dtgLocation);
    $this->dtgLocation->Paginator = $objPaginator;
    $this->dtgLocation->ItemsPerPage = 20;
    
    // If the user wants the checkboxes column
    if ($blnShowCheckboxes) {
    	// This will render all of the necessary controls and actions. chkSelected_Render expects a unique ID for each row of the database.
    	$this->dtgLocation->AddColumn(new QDataGridColumnExt('<?=$_CONTROL->chkSelectAll_Render() ?>', '<?=$_CONTROL->chkSelected_Render($_ITEM->LocationId) ?>', 'CssClass="dtg_column"', 'HtmlEntities=false'));
    }
    $this->dtgLocation->AddColumn(new QDataGridColumnExt('Location', '<?= $_ITEM->__toStringWithLink("bluelink") ?>', 'SortByCommand="short_description ASC"', 'ReverseSortByCommand="short_description DESC"', 'CssClass="dtg_column"', 'HtmlEntities=false'));
    $this->dtgLocation->AddColumn(new QDataGridColumnExt('Description', '<?= $_ITEM->LongDescription ?>', 'Width=200', 'SortByCommand="long_description ASC"', 'ReverseSortByCommand="long_description DESC"', 'CssClass="dtg_column"'));
    $this->dtgLocation->AddColumn(new QDataGridColumnExt('Created By', '<?= $_ITEM->CreatedByObject->__toStringFullName() ?>', 'SortByCommand="location__created_by__last_name DESC, location__created_by__first_name DESC"', 'ReverseSortByCommand="location__created_by__last_name ASC, location__created_by__first_name ASC"', 'CssClass="dtg_column"'));
    
    // Add the custom field columns with Display set to false. These can be shown by using the column toggle menu.
    $objCustomFieldArray = CustomField::LoadObjCustomFieldArray(2, false);
    if ($objCustomFieldArray) {
    	foreach ($objCustomFieldArray as $objCustomField) {
    		//Only add the custom field column if the role has authorization to view it.
     		if($objCustomField->objRoleAuthView && $objCustomField->objRoleAuthView->AuthorizedFlag){
     			$this->dtgLocation->AddColumn(new QDataGridColumnExt($objCustomField->ShortDescription, '<?= $_ITEM->GetVirtualAttribute(\''.$objCustomField->CustomFieldId.'\') ?>', 'SortByCommand="__'.$objCustomField->CustomFieldId.' ASC"', 'ReverseSortByCommand="__'.$objCustomField->CustomFieldId.' DESC"','HtmlEntities="false"', 'CssClass="dtg_column"', 'Display="false"'));
     		}
     	}
    }
    
    $this->dtgLocation->SortColumnIndex = 1;
    $this->dtgLocation->SortDirection = 0;
      
    $objStyle = $this->dtgLocation->RowStyle;
    $objStyle->ForeColor = '#000000';
    $objStyle->BackColor = '#FFFFFF';
    $objStyle->FontSize = 12;

    $objStyle = $this->dtgLocation->AlternateRowStyle;
    $objStyle->BackColor = '#EFEFEF';

    $objStyle = $this->dtgLocation->HeaderRowStyle;
    $objStyle->ForeColor = '#000000';
    $objStyle->BackColor = '#EFEFEF';
    $objStyle->CssClass = 'dtg_header';
      
    $this->dtgLocation->SetDataBinder('dtgLocation_Bind', $this);
  }
	
	public function ParsePostData() {
		
	}
	
	public function GetJavaScriptAction() {
			return "onchange";
	}
	
	public function Validate() {return true;}
	
	protected function GetControlHtml() {
		
		$strStyle = $this->GetStyleAttributes();
		if ($strStyle) {
			$strStyle = sprintf('style="%s"', $strStyle);
		}
		
		$strAttributes = $this->GetAttributes();
		
		// Store the Output Buffer locally
		$strAlreadyRendered = ob_get_contents();
		ob_clean();

		// Evaluate the template
		require('../admin/location_search_composite.tpl.php');
		$strTemplateEvaluated = ob_get_contents();
		ob_clean();

		// Restore the output buffer and return evaluated template
		print($strAlreadyRendered);
		
		$strToReturn =  sprintf('<span id="%s" %s%s>%s</span>',
		$this->strControlId,
		$strStyle,
		$strAttributes,
		$strTemplateEvaluated);
		
		return $strToReturn;		
	}
	
  public function dtgLocation_Bind() {
		$objExpansionMap[Location::ExpandCreatedByObject] = true;
		// Get Total Count b/c of Pagination
		$this->dtgLocation->TotalItemCount = Location::CountAllLocations();
		if ($this->dtgLocation->TotalItemCount == 0) {
			$this->dtgLocation->ShowHeader = false;
		}
		else {
			$this->dtgLocation->DataSource = Location::LoadAllLocations(false, false, $this->dtgLocation->SortInfo, $this->dtgLocation->LimitInfo, $objExpansionMap);
			$this->dtgLocation->ShowHeader = true;
		}
  }
  
 	// And our public getter/setters
  public function __get($strName) {
	  switch ($strName) {
			case "ParentObject": return $this->objParentObject;
				break;
      default:
        try {
            return parent::__get($strName);
        } catch (QCallerException $objExc) {
            $objExc->IncrementOffset();
            throw $objExc;
        }
	  }
  }
  
  /////////////////////////
	// Public Properties: SET
	/////////////////////////
	public function __set($strName, $mixValue) {
		$this->blnModified = true;

		switch ($strName) {
			default:
				try {
					parent::__set($strName, $mixValue);
				} catch (QCallerException $objExc) {
					$objExc->IncrementOffset();
					throw $objExc;
				}
				break;
		}
	}
}
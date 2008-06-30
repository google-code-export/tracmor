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
class FieldLevelAuthPanel extends QLabel{

	public $chkEntityView;
	public $chkEntityEdit;
	public $chkBuiltInView;
	public $chkBuiltInEdit;
	public $arrCustomChecks;
	public $intEntityQtypeId;
	public $objModule;
	public $arrControls;
	public $strPnlName;
	public $blnEditMode;


	public function __construct($objParentObject, $intEntityQtypeId, $arrControls, $intModuleId,$strPnlName,$blnEditMode,$strControlId = null) {
		// Call the Parent
		try {
			parent::__construct($objParentObject, $strControlId);
		} catch (QCallerException $objExc) {
			$objExc->IncrementOffset();
			throw $objExc;
		}
		//Setup Grid
		$this->Template = 'FieldLevelAuthPanel.tpl.php';
		$this->Display=false;
		$this->intEntityQtypeId=$intEntityQtypeId;
		$this->objModule = Module::Load($intModuleId);
		$this->arrControls = $arrControls;
		$this->strPnlName=$strPnlName;
		$this->blnEditMode=$blnEditMode;

		$this->chkEntity_Create();
		$this->chkBuiltIn_Create();
		$this->chkCustom_Create();
			
			

	}
	//Create/Setup chkEntityView and chkEntityEdit
	protected function chkEntity_Create(){
		$this->chkEntityView = new QCheckBox($this);
		$this->chkEntityView->AddAction(new QClickEvent(), new QAjaxAction('chkEntityView_Click'));
		$this->chkEntityView->ActionParameter=$this->strPnlName;
			
		$this->chkEntityEdit = new QCheckBox($this);
		$this->chkEntityEdit->AddAction(new QClickEvent(), new QAjaxAction('chkEntityEdit_Click'));

		$this->chkEntityEdit->ActionParameter=$this->strPnlName;
	}
	//Create/Setup chkBuiltInView and chkBuiltInEdit
	protected function chkBuiltIn_Create(){
		$this->chkBuiltInView = new QCheckBox($this);
		$this->chkBuiltInView->Enabled=false;
		$this->chkBuiltInView->Checked=true;
		$intRoleId = QApplication::QueryString('intRoleId');
		$this->chkBuiltInEdit = new QCheckBox($this);
			
		if($intRoleId)
			$objBuiltInEditAuth = RoleEntityQtypeBuiltInAuthorization::LoadByRoleIdEntityQtypeIdAuthorizationId($intRoleId,$this->intEntityQtypeId,2);
			
		if(!$this->blnEditMode)
			$this->chkBuiltInEdit->Checked=1;
		elseif(isset($objBuiltInEditAuth))
			$this->chkBuiltInEdit->Checked=$objBuiltInEditAuth->AuthorizedFlag;
	}

	// Load all custom fields and their values into an array arrCustomChecks
	protected function chkCustom_Create(){
		$intRoleId = QApplication::QueryString('intRoleId');

			
		$objCustomFieldArray = CustomField::LoadObjCustomFieldArray($this->intEntityQtypeId, false, null);
		foreach ($objCustomFieldArray as $objCustomField){
			$chkCustomView = new QCheckBox($this);
			$chkCustomView->AddAction(new QClickEvent(), new QAjaxAction('chkCustom_Click'));
			$chkCustomEdit = new QCheckBox($this);
			$chkCustomView->ActionParameter=$chkCustomEdit->ControlId;
			$objEntityQtypeCustomField=EntityQtypeCustomField::LoadByEntityQtypeIdCustomFieldId($this->intEntityQtypeId,$objCustomField->CustomFieldId);
			if($objEntityQtypeCustomField){
				$objCustomAuthView=RoleEntityQtypeCustomFieldAuthorization::LoadByRoleIdEntityQtypeCustomFieldIdAuthorizationId($intRoleId,$objEntityQtypeCustomField->EntityQtypeCustomFieldId,1);
				if(!$this->blnEditMode)
					$chkCustomView->Checked=1;
				elseif(isset($objCustomAuthView))
					$chkCustomView->Checked=$objCustomAuthView->AuthorizedFlag;
					
				$objCustomAuthEdit=RoleEntityQtypeCustomFieldAuthorization::LoadByRoleIdEntityQtypeCustomFieldIdAuthorizationId($intRoleId,$objEntityQtypeCustomField->EntityQtypeCustomFieldId,2);
				if(!$this->blnEditMode)
					$chkCustomEdit->Checked=1;
				elseif(isset($objCustomAuthEdit))
					$chkCustomEdit->Checked=$objCustomAuthEdit->AuthorizedFlag;
				//if view access is not authorized, edit access won't be authorized
				if(!$chkCustomView->Checked){
					$chkCustomEdit->Enabled=false;
					$chkCustomEdit->Checked=false;
				}
					
					
				
			}
			$this->arrCustomChecks[] = array('name' => $objCustomField->ShortDescription.':', 'view' => $chkCustomView,'edit' => $chkCustomEdit,'id' => $objCustomField->CustomFieldId);

		}
	}
	public function UnCheckAll(){
		$this->UnCheckEditColumn();
		$this->UnCheckViewColumn();
	}
	public function CheckAll(){
		$this->CheckEditColumn();
		$this->CheckViewColumn();
	}
	public function DisabledAll(){
		$this->DisableEditColumn();
		$this->DisableViewColumn();
	}
	public function EnableAll(){
		$this->chkEntityView->Enabled=true;
		$this->chkBuiltInView->Checked=true;
		if($this->arrCustomChecks)foreach($this->arrCustomChecks as $chkCustom){
			$chkCustom['view']->Enabled=true;
		}
		if($this->arrControls[$this->objModule->ShortDescription]['edit']->SelectedValue==1 || $this->arrControls[$this->objModule->ShortDescription]['edit']->SelectedValue==2){
			$this->chkEntityEdit->Enabled=true;
			$this->chkBuiltInEdit->Enabled=true;
			$this->chkBuiltInEdit->Checked=true;
			if($this->arrCustomChecks)foreach($this->arrCustomChecks as $chkCustom){
				$chkCustom['edit']->Enabled=true;
			}
		}

	}
	public function EnableEdit(){
		$this->chkEntityEdit->Enabled=true;
		$this->chkBuiltInEdit->Enabled=true;
		if($this->arrCustomChecks)foreach($this->arrCustomChecks as $chkCustom){
			if ($chkCustom['view']->Checked)
			$chkCustom['edit']->Enabled=true;
		}
	}
	public function UnCheckEditColumn(){
		$this->chkEntityEdit->Checked=false;
		$this->chkBuiltInEdit->Checked=false;
		if($this->arrCustomChecks)foreach($this->arrCustomChecks as $chkCustom){
			$chkCustom['edit']->Checked=false;
		}
	}
	public function CheckEditColumn(){
		$this->chkEntityEdit->Checked=true;
		$this->chkBuiltInEdit->Checked=true;
		if($this->arrCustomChecks)foreach($this->arrCustomChecks as $chkCustom){
			if($chkCustom['view']->Checked)
			$chkCustom['edit']->Checked=true;
		}
	}
	public function UnCheckViewColumn(){
		$this->chkBuiltInView->Checked=false;
		$this->chkEntityView->Checked=false;
		if($this->arrCustomChecks)foreach($this->arrCustomChecks as $chkCustom){
			$chkCustom['view']->Checked=false;
			$chkCustom['edit']->Checked=false;
			$chkCustom['edit']->Enabled=false;
		}
	}
	public function CheckViewColumn(){
		$this->chkEntityView->Checked=true;
		if($this->arrCustomChecks)foreach($this->arrCustomChecks as $chkCustom){
			$chkCustom['view']->Checked=true;
			$chkCustom['edit']->Enabled=true;
		}
	}

	public function DisableEditColumn(){
		$this->chkEntityEdit->Enabled=false;
		$this->chkBuiltInEdit->Enabled=false;
		if($this->arrCustomChecks)foreach($this->arrCustomChecks as $chkCustom){
			$chkCustom['edit']->Enabled=false;
		}
	}
	public function DisableViewColumn(){
		$this->chkBuiltInView->Enabled=false;
		if($this->arrCustomChecks)foreach($this->arrCustomChecks as $chkCustom){
			$chkCustom['view']->Enabled=false;
		}
	}
	protected function chkCustom_Click($strFormId, $strControlId, $strParameter) {
		$objCustomView = $this->GetControl($strControlId);
		$objCustomEdit = $this->GetControl($strParameter);
		if($objCustomView->Checked){
			$objCustomEdit->Checked=false;
			$objCustomEdit->Enabled=false;
		}else{
			$objCustomEdit->Enabled=true;
		}
		 
	}
}
?>
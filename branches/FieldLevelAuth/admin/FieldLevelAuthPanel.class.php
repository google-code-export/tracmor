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
class FieldLevelAuthPanel extends QPanel{
	
	public $chkEntityView;
	public $chkEntityEdit;
	public $chkBuiltInView;
	public $chkBuiltInEdit;
	public $arrCustomChecks;
	public $intEntityQtypeId;

	
	
	public function __construct($objParentObject, $intEntityQtypeId, $strControlId = null) {
		// Call the Parent
			try {
				parent::__construct($objParentObject, $strControlId);
			} catch (QCallerException $objExc) {
				$objExc->IncrementOffset();
				throw $objExc;
			}
			$this->Template = 'FieldLevelAuthPanel.tpl.php';
			$this->AutoRenderChildren = true;
			$this->Visible=false;
			$this->intEntityQtypeId=$intEntityQtypeId;
			
			$this->chkEntityView = new QCheckBox($this);
			$this->chkEntityEdit = new QCheckBox($this);
			$this->chkBuiltInView = new QCheckBox($this);
			$intRoleId = QApplication::QueryString('intRoleId');
			if($intRoleId)
				$objBuiltInViewAuth = RoleEntityQtypeBuiltInAuthorization::LoadByRoleIdEntityQtypeIdAuthorizationId($intRoleId,$intEntityQtypeId,1);
			
			if($objBuiltInViewAuth)
				$this->chkBuiltInView->Checked=$objBuiltInViewAuth->AuthorizedFlag;
				
				
			$this->chkBuiltInEdit = new QCheckBox($this);
			
			if($intRoleId)
				$objBuiltInEditAuth = RoleEntityQtypeBuiltInAuthorization::LoadByRoleIdEntityQtypeIdAuthorizationId($intRoleId,$intEntityQtypeId,2);
			
			if($objBuiltInEditAuth)
				$this->chkBuiltInEdit->Checked=$objBuiltInEditAuth->AuthorizedFlag;
				
				
			// Load all custom fields and their values into an array objCustomFieldArray->CustomFieldSelection->CustomFieldValue
			
			$objCustomFieldArray = CustomField::LoadObjCustomFieldArray($intEntityQtypeId, false, null);
			foreach ($objCustomFieldArray as $objCustomField){
				$chkCustomView = new QCheckBox($this);
				$chkCustomEdit = new QCheckBox($this);
				$objEntityQtypeCustomField=EntityQtypeCustomField::LoadByEntityQtypeIdCustomFieldId($intEntityQtypeId,$objCustomField->CustomFieldId);
				if($objEntityQtypeCustomField){
					$objCustomAuthView=RoleEntityQtypeCustomFieldAuthorization::LoadByRoleIdEntityQtypeCustomFieldIdAuthorizationId($intRoleId,$objEntityQtypeCustomField->EntityQtypeCustomFieldId,1);
					if($objCustomAuthView)
						$chkCustomView->Checked=$objCustomAuthView->AuthorizedFlag;
					
					$objCustomAuthEdit=RoleEntityQtypeCustomFieldAuthorization::LoadByRoleIdEntityQtypeCustomFieldIdAuthorizationId($intRoleId,$objEntityQtypeCustomField->EntityQtypeCustomFieldId,2);
					if($objCustomAuthEdit)
						$chkCustomEdit->Checked=$objCustomAuthEdit->AuthorizedFlag;
				}								
				$this->arrCustomChecks[] = array('name' => $objCustomField->ShortDescription.':', 'view' => $chkCustomView,'edit' => $chkCustomEdit);
			}
	}

}
?>
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

	require_once('../includes/prepend.inc.php');
	QApplication::Authenticate(7);
	require_once(__FORMBASE_CLASSES__ . '/AssetListFormBase.class.php');
	ini_set("include_path",ini_get("include_path").";" . __INCLUDES__ . "/php/PHPReports/;");
	require_once('PHPReportMaker.php');
	$_SESSION["phpReportsLanguage"] = null;

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
	class AssetTransactionListForm extends AssetListFormBase {

		// Header Tabs
		protected $ctlHeaderMenu;

		// Shortcut Menu
		protected $ctlShortcutMenu;

		// Search Menu
		public $ctlSearchMenu;

		// Basic Inputs
		protected $lstCategory;
		protected $lstManufacturer;
		protected $lstUser;
		protected $lstCheckedOutBy;
		protected $lstReservedBy;
		protected $lstTransactionDate;
		protected $lstSortByDate;
		protected $dtpTransactionDateFirst;
		protected $dtpTransactionDateLast;
		protected $txtShortDescription;
		protected $txtAssetCode;
		protected $txtAssetModelCode;
		protected $chkMove;
		protected $chkCheckIn;
		protected $chkCheckOut;
		protected $chkReserve;
		protected $chkUnreserve;
		protected $lblAssetModelId;
		protected $lblReport;
		protected $arrCustomFields;
		protected $pnlCustomFields;
		protected $chkCustomFieldArray;

		// Buttons
		protected $btnGenerate;
		protected $blnGenerate;

		// Advanced Label/Link
		protected $lblAdvanced;
		// Boolean that toggles Advanced Search display
		protected $blnAdvanced;
		// Advanced Search Composite control
		protected $ctlAdvanced;

		// Search Values
		protected $intAssetModelId;
		protected $strShortDescription;
		protected $strAssetCode;
		protected $intCategoryId;
		protected $intManufacturerId;
		protected $blnOffsite;
		protected $strAssetModelCode;
		protected $intReservedBy;
		protected $intCheckedOutBy;
		protected $strDateModified;
		protected $strDateModifiedFirst;
		protected $strDateModifiedLast;

		protected function Form_Create() {

			$this->ctlHeaderMenu_Create();
			$this->ctlShortcutMenu_Create();

      $this->lstCategory_Create();
      $this->lstManufacturer_Create();
      $this->lstUserCheckedOutReserved_Create();
      $this->lstTransactionDate_Create();
      $this->dtpTransactionDateFirst_Create();
      $this->dtpTransactionDateLast_Create();
      $this->lstSortByDate_Create();
      $this->txtShortDescription_Create();
      $this->txtAssetCode_Create();
      $this->txtAssetModelCode_Create();
      $this->chkTransactionType_Create();
      $this->lblAssetModelId_Create();
      $this->btnGenerate_Create();
      $this->customFields_Create();
      //the report code will be render in a Qlabel
      $this->lblReport = new QLabel($this);
      //if don't put this you will see HTML code instead of a report
      $this->lblReport->HtmlEntities = false;

			if (QApplication::QueryString('intAssetModelId')) {
				$this->lblAssetModelId->Text = QApplication::QueryString('intAssetModelId');
				$this->blnGenerate = true;
			}
  	}

  	  //protected function Form_Exit() {
  	  // Output database profiling - it shows you the queries made to create this page
  	  // This will not work on pages with the AJAX Pagination
      // QApplication::$Database[1]->OutputProfiling();
  	  //}

  	// Create and Setup the Header Composite Control
  	protected function ctlHeaderMenu_Create() {
  		$this->ctlHeaderMenu = new QHeaderMenu($this);
  	}

  	// Create and Setp the Shortcut Menu Composite Control
  	protected function ctlShortcutMenu_Create() {
  		$this->ctlShortcutMenu = new QShortcutMenu($this);
  	}

		/*************************
		 *	CREATE INPUT METHODS
		*************************/

  	protected function lstCategory_Create() {
	  	$this->lstCategory = new QListBox($this);
			$this->lstCategory->Name = 'Category';
			$this->lstCategory->AddItem('- ALL -', null);
			foreach (Category::LoadAllWithFlags(true, false, 'short_description') as $objCategory) {
				$this->lstCategory->AddItem($objCategory->ShortDescription, $objCategory->CategoryId);
			}
	  }

	  protected function lstManufacturer_Create() {
      $this->lstManufacturer = new QListBox($this);
			$this->lstManufacturer->Name = 'Manufacturer';
			$this->lstManufacturer->AddItem('- ALL -', null);
			foreach (Manufacturer::LoadAll(QQ::Clause(QQ::OrderBy(QQN::Manufacturer()->ShortDescription))) as $objManufacturer) {
				$this->lstManufacturer->AddItem($objManufacturer->ShortDescription, $objManufacturer->ManufacturerId);
			}
	  }

	  protected function lstUserCheckedOutReserved_Create() {
	    $this->lstUser = new QListBox($this);
	    $this->lstUser->Name = 'User';
	    $this->lstUser->AddItem('- Select One -', null);
	    $this->lstCheckedOutBy = new QListBox($this);
	    $this->lstCheckedOutBy->Name = 'Checked Out By';
	    $this->lstCheckedOutBy->AddItem('- Select One -', null);
	    //$this->lstCheckedOutBy->AddItem('- Any -', 'any');
	    $this->lstReservedBy = new QListBox($this);
	    $this->lstReservedBy->Name = 'Reserved By';
	    $this->lstReservedBy->AddItem('- Select One -', null);
	    //$this->lstReservedBy->AddItem('- Any -', 'any');
	    foreach (UserAccount::LoadAll(QQ::Clause(QQ::OrderBy(QQN::UserAccount()->Username))) as $objUserAccount) {
        $this->lstUser->AddItem($objUserAccount->Username, $objUserAccount->UserAccountId);
        $this->lstCheckedOutBy->AddItem($objUserAccount->Username, $objUserAccount->UserAccountId);
        $this->lstReservedBy->AddItem($objUserAccount->Username, $objUserAccount->UserAccountId);
	    }
	  }

	  protected function lstSortByDate_Create() {
	    $this->lstSortByDate = new QListBox($this);
	    $this->lstSortByDate->Name = "Sort By Date";
	    $this->lstSortByDate->AddItem('ASC', 'ASC');
	    $this->lstSortByDate->AddItem('DESC', 'DESC');
	  }

	  protected function txtShortDescription_Create() {
	    $this->txtShortDescription = new QTextBox($this);
			$this->txtShortDescription->Name = 'Model';
			// Because the enter key will also call form.submit() on some browsers, which we
      // absolutely DON'T want to have happen, let's be sure to terminate any additional
      // actions on EnterKey
      $this->txtShortDescription->AddAction(new QEnterKeyEvent(), new QServerAction('btnGenerate_Click'));
      $this->txtShortDescription->AddAction(new QEnterKeyEvent(), new QTerminateAction());

	  }

	  protected function txtAssetCode_Create() {
	  	$this->txtAssetCode = new QTextBox($this);
	  	$this->txtAssetCode->Name = 'Asset Code';
	  	$this->txtAssetCode->AddAction(new QEnterKeyEvent(), new QServerAction('btnGenerate_Click'));
	  	$this->txtAssetCode->AddAction(new QEnterKeyEvent(), new QTerminateAction());
	  }

	  protected function txtAssetModelCode_Create() {
	  	$this->txtAssetModelCode = new QTextBox($this);
	  	$this->txtAssetModelCode->Name = 'Asset Model Code';
	  	$this->txtAssetModelCode->AddAction(new QEnterKeyEvent(), new QServerAction('btnGenerate_Click'));
	  	$this->txtAssetModelCode->AddAction(new QEnterKeyEvent(), new QTerminateAction());
	  }

	  protected function chkTransactionType_Create() {
	  	$this->chkMove = new QCheckBox($this);
	  	$this->chkMove->Text = 'Move';
	  	$this->chkMove->Checked = true;
	  	$this->chkCheckIn = new QCheckBox($this);
	  	$this->chkCheckIn->Text = 'Check In';
	  	$this->chkCheckIn->Checked = true;
	  	$this->chkCheckOut = new QCheckBox($this);
	  	$this->chkCheckOut->Text = 'Check Out';
	  	$this->chkCheckOut->Checked = true;
	  	$this->chkReserve = new QCheckBox($this);
	  	$this->chkReserve->Text = 'Reserve';
	  	$this->chkReserve->Checked = true;
	  	$this->chkUnreserve = new QCheckBox($this);
	  	$this->chkUnreserve->Text = 'Unreserve';
	  	$this->chkUnreserve->Checked = true;
	  }

	  protected function lblAssetModelId_Create() {
	  	$this->lblAssetModelId = new QLabel($this);
	  	$this->lblAssetModelId->Text = '';
	  	$this->lblAssetModelId->Visible = false;
	  }

	  protected function dtpTransactionDateFirst_Create() {
    	$this->dtpTransactionDateFirst = new QDateTimePicker($this);
    	$this->dtpTransactionDateFirst->Name = '';
    	$this->dtpTransactionDateFirst->DateTime = new QDateTime(QDateTime::Now);
    	$this->dtpTransactionDateFirst->DateTimePickerType = QDateTimePickerType::Date;
    	$this->dtpTransactionDateFirst->DateTimePickerFormat = QDateTimePickerFormat::MonthDayYear;
    	$this->dtpTransactionDateFirst->Enabled = false;
    }

    protected function dtpTransactionDateLast_Create() {
    	$this->dtpTransactionDateLast = new QDateTimePicker($this);
    	$this->dtpTransactionDateLast->Name = '';
    	$this->dtpTransactionDateLast->DateTime = new QDateTime(QDateTime::Now);
    	$this->dtpTransactionDateLast->DateTimePickerType = QDateTimePickerType::Date;
    	$this->dtpTransactionDateLast->DateTimePickerFormat = QDateTimePickerFormat::MonthDayYear;
    	$this->dtpTransactionDateLast->Enabled = false;
    }

  	protected function lstTransactionDate_Create() {
  		$this->lstTransactionDate = new QListBox($this);
  		$this->lstTransactionDate->Name = "Transaction Date";
  		$this->lstTransactionDate->AddItem('None', null, true);
  		$this->lstTransactionDate->AddItem('Before', 'before');
  		$this->lstTransactionDate->AddItem('After', 'after');
  		$this->lstTransactionDate->AddItem('Between', 'between');
  		$this->lstTransactionDate->AddAction(new QChangeEvent(), new QAjaxAction('lstTransactionDate_Select'));
  	}

  	protected function customFields_Create() {
      $this->pnlCustomFields = new QPanel($this);
  		$this->pnlCustomFields->AutoRenderChildren = true;
  		// Load all custom fields and their values into an array objCustomFieldArray->CustomFieldSelection->CustomFieldValue
  		$this->arrCustomFields = CustomField::LoadObjCustomFieldArray(1, false, null);
  		$i = 0;
  		foreach ($this->arrCustomFields as $objCustomField) {
        $this->chkCustomFieldArray[$i] = new QCheckBox($this->pnlCustomFields);
        $this->chkCustomFieldArray[$i]->Text = $objCustomField->ShortDescription;
        $this->chkCustomFieldArray[$i]->ActionParameter = $objCustomField->CustomFieldId;
        $i++;
  		}
  	}

	  /**************************
	   *	CREATE BUTTON METHODS
	  **************************/

	  protected function btnGenerate_Create() {
			$this->btnGenerate = new QButton($this);
			$this->btnGenerate->Name = 'Generate';
			$this->btnGenerate->Text = 'Generate';
			$this->btnGenerate->AddAction(new QClickEvent(), new QServerAction('btnGenerate_Click'));
			$this->btnGenerate->AddAction(new QEnterKeyEvent(), new QServerAction('btnGenerate_Click'));
			$this->btnGenerate->AddAction(new QEnterKeyEvent(), new QTerminateAction());
	  }

	 public function lstTransactionDate_Select($strFormId, $strControlId, $strParameter) {
  		$value = $this->lstTransactionDate->SelectedValue;
  		if ($value == null) {
  			$this->dtpTransactionDateFirst->Enabled = false;
  			$this->dtpTransactionDateLast->Enabled = false;
  		}
  		elseif ($value == 'before') {
  			$this->dtpTransactionDateFirst->Enabled = true;
  			$this->dtpTransactionDateLast->Enabled = false;
  		}
  		elseif ($value == 'after') {
  			$this->dtpTransactionDateFirst->Enabled = true;
  			$this->dtpTransactionDateLast->Enabled = false;
  		}
  		elseif ($value == 'between') {
  			$this->dtpTransactionDateFirst->Enabled = true;
  			$this->dtpTransactionDateLast->Enabled = true;
  		}
  	}

	  protected function lblAdvanced_Create() {
	  	$this->lblAdvanced = new QLabel($this);
	  	$this->lblAdvanced->Name = 'Advanced';
	  	$this->lblAdvanced->Text = 'Advanced Search';
	  	$this->lblAdvanced->AddAction(new QClickEvent(), new QToggleDisplayAction($this->ctlAdvanced));
	  	$this->lblAdvanced->AddAction(new QClickEvent(), new QAjaxAction('lblAdvanced_Click'));
	  	$this->lblAdvanced->SetCustomStyle('text-decoration', 'underline');
	  	$this->lblAdvanced->SetCustomStyle('cursor', 'pointer');
	  }

	  protected function btnGenerate_Click() {
	  	$this->blnGenerate = true;
			// Enable Profiling
      //QApplication::$Database[1]->EnableProfiling();
      // Expand the Asset object to include the AssetModel, Category, Manufacturer, and Location Objects
      $objExpansionMap[AssetTransaction::ExpandAsset][Asset::ExpandAssetModel][AssetModel::ExpandCategory] = true;
      $objExpansionMap[AssetTransaction::ExpandAsset][Asset::ExpandAssetModel][AssetModel::ExpandManufacturer] = true;
      $objExpansionMap[AssetTransaction::ExpandSourceLocation] = true;
      $objExpansionMap[AssetTransaction::ExpandDestinationLocation] = true;
      $objExpansionMap[AssetTransaction::ExpandTransaction][Transaction::ExpandTransactionType] = true;
      $objExpansionMap[AssetTransaction::ExpandTransaction][Transaction::ExpandCreatedByObject ] = true;
      $objExpansionMap[AssetTransaction::ExpandTransaction][Transaction::ExpandModifiedByObject] = true;

      $arrTransactionTypes = array();
      if ($this->chkMove->Checked) {
        $arrTransactionTypes[] = 1;
      }
      if ($this->chkCheckIn->Checked) {
        $arrTransactionTypes[] = 2;
      }
      if ($this->chkCheckOut->Checked) {
        $arrTransactionTypes[] = 3;
      }
      if ($this->chkReserve->Checked) {
        $arrTransactionTypes[] = 8;
      }
      if ($this->chkUnreserve->Checked) {
        $arrTransactionTypes[] = 9;
      }

      // begins the report process
      $oRpt = new PHPReportMaker();
      // Total Transactions Count
      $oRpt->putEnvObj("TotalTransactions", AssetTransaction::CountBySearch($this->txtShortDescription->Text, $this->txtAssetCode->Text, $this->txtAssetModelCode->Text, $this->lstUser->SelectedValue, $this->lstCheckedOutBy->SelectedValue, $this->lstReservedBy->SelectedValue, $this->lstCategory->SelectedValue, $this->lstManufacturer->SelectedValue, $this->lstSortByDate->SelectedValue, $this->lstTransactionDate->SelectedValue, $this->dtpTransactionDateFirst->DateTime, $this->dtpTransactionDateLast->DateTime, $arrTransactionTypes, $objExpansionMap));
      //some data to show in the report
      $sSql = AssetTransaction::LoadArrayBySearch(true, $this->txtShortDescription->Text, $this->txtAssetCode->Text, $this->txtAssetModelCode->Text, $this->lstUser->SelectedValue, $this->lstCheckedOutBy->SelectedValue, $this->lstReservedBy->SelectedValue, $this->lstCategory->SelectedValue, $this->lstManufacturer->SelectedValue, $this->lstSortByDate->SelectedValue, $this->lstTransactionDate->SelectedValue, $this->dtpTransactionDateFirst->DateTime, $this->dtpTransactionDateLast->DateTime, $arrTransactionTypes, $objExpansionMap);
      $strXmlColNameByCustomField = "";
      $strXmlFieldByCustomField = "";
      $intCustomFieldCount = 0;
      foreach ($this->chkCustomFieldArray as $chkCustomField) {
        if ($chkCustomField->Checked) {
          $strXmlColNameByCustomField .= "<COL>".$chkCustomField->Text."</COL>";
          $strXmlFieldByCustomField .= "<COL TYPE='FIELD'>__".$chkCustomField->ActionParameter."</COL>";
          $intCustomFieldCount++;
        }
      }
      $oGroups = "
        <GROUP NAME='transaction_id' EXPRESSION='transaction_id'>
          <HEADER>
            <ROW>
              <COL ALIGN='LEFT'>Transaction:</COL>
              <COL ALIGN='LEFT' TYPE='EXPRESSION' COLSPAN='".(3 + $intCustomFieldCount)."'><LINK TYPE='EXPRESSION'>'". __SUBDIRECTORY__ ."/common/transaction_edit.php?intTransactionId='.\$this->getValue('transaction_id')</LINK>\$this->getValue('asset_transaction__transaction_id__transaction_type_id__short_description').' by '.(\$this->getValue('asset_transaction__transaction_id__modified_by')?\$this->getValue('asset_transaction__transaction_id__modified_by__first_name').' '.\$this->getValue('asset_transaction__transaction_id__modified_by__last_name').' on '.\$this->getValue('asset_transaction__transaction_id__modified_date'):\$this->getValue('asset_transaction__transaction_id__created_by__first_name').' '.\$this->getValue('asset_transaction__transaction_id__created_by__last_name').' on '.\$this->getValue('asset_transaction__transaction_id__creation_date'))</COL>
            </ROW>
            <ROW>
              <COL>Asset Code:</COL>
              <COL>Asset Model:</COL>
              <COL>From:</COL>
              <COL>To:</COL>
              $strXmlColNameByCustomField
            </ROW>
          </HEADER>
          <FIELDS>
            <ROW>
              <COL TYPE='FIELD'><LINK TYPE='EXPRESSION'>'". __SUBDIRECTORY__ ."/assets/asset_edit.php?intAssetId='.\$this->getValue('asset_transaction__asset_id__asset_id')</LINK>asset_transaction__asset_id__asset_code</COL>
              <COL TYPE='FIELD'><LINK TYPE='EXPRESSION'>'". __SUBDIRECTORY__ ."/assets/asset_model_edit.php?intAssetModelId='.\$this->getValue('asset_transaction__asset_id__asset_model_id__asset_model_id')</LINK>asset_transaction__asset_id__asset_model_id__asset_model_code</COL>
              <COL TYPE='FIELD'>asset_transaction__source_location_id__short_description</COL>
              <COL TYPE='FIELD'>asset_transaction__destination_location_id__short_description</COL>
              $strXmlFieldByCustomField
            </ROW>
          </FIELDS>
        </GROUP>";
      $oRpt->setSQL($sSql);
      $oRpt->setUser('root');
      $oRpt->setPassword('');
      $oRpt->setConnection('localhost');
      $oRpt->setDatabaseInterface('mysql');
      $oRpt->setDatabase('tracmor');
      $oRpt->createFromTemplate('Asset Transaction Report', __DOCROOT__ . __SUBDIRECTORY__ . '/reports/asset_transaction_report.xml',null,null,$oGroups);
      $oRpt->setNoDataMsg("No data was found, check your query");
      //$oRpt->setXML(__DOCROOT__ . __SUBDIRECTORY__ . '/reports/asset_transaction_report.xml');
      //the head of the final html will be write by the Qform
      $oRpt->setBody(false);
      //star the output buffer
      ob_start();
      //process the report
      $oRpt->run();
      //put the output buffer content in the Qlabel
      $this->lblReport->Text = ob_get_contents();
      //clean the output buffer
      ob_end_clean();
      $this->blnGenerate = false;
	  }

	  protected function lblAdvanced_Click() {
	  	if ($this->blnAdvanced) {

	  		$this->blnAdvanced = false;
	  		$this->lblAdvanced->Text = 'Advanced Search';

	  		$this->ctlAdvanced->ClearControls();

	  	}
	  	else {
	  		$this->blnAdvanced = true;
	  		$this->lblAdvanced->Text = 'Hide Advanced';
	  	}
	  }

	  protected function assignGenerateValues() {
	  	$this->intCategoryId = $this->lstCategory->SelectedValue;
			$this->intManufacturerId = $this->lstManufacturer->SelectedValue;
			$this->strShortDescription = $this->txtShortDescription->Text;
			$this->strAssetCode = $this->txtAssetCode->Text;
			$this->intAssetModelId = $this->lblAssetModelId->Text;
			$this->strAssetModelCode = $this->ctlAdvanced->AssetModelCode;
			$this->intReservedBy = $this->ctlAdvanced->ReservedBy;
			$this->intCheckedOutBy = $this->ctlAdvanced->CheckedOutBy;
			$this->strDateModified = $this->ctlAdvanced->DateModified;
			$this->strDateModifiedFirst = $this->ctlAdvanced->DateModifiedFirst;
			$this->strDateModifiedLast = $this->ctlAdvanced->DateModifiedLast;

			$this->arrCustomFields = $this->ctlAdvanced->CustomFieldArray;
			if ($this->arrCustomFields) {
				foreach ($this->arrCustomFields as &$field) {
					if ($field['input'] instanceof QListBox) {
						$field['value'] = $field['input']->SelectedValue;
					}
					elseif ($field['input'] instanceof QTextBox) {
						$field['value'] = $field['input']->Text;
					}
				}
			}
	  }
	}

	// Go ahead and run this form object to search the page and event handlers, using
	// generated/asset_edit.php.inc as the included HTML template file
	// AssetListForm::Run('AssetListForm', './Qcodo/assets/asset_list.php.inc');
	AssetTransactionListForm::Run('AssetTransactionListForm', __DOCROOT__ . __SUBDIRECTORY__ . '/reports/asset_transaction_report.tpl.php');
?>
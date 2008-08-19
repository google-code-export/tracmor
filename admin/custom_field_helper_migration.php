<?php

require_once('../includes/prepend.inc.php');

$intEntityQtypeId = 1;

switch ($intEntityQtypeId) {
				case 1: 
					$strId = 'asset`.`asset_id';
					$strHelperTable = '`asset_custom_field_helper`';
					break;
				case 2: 
					$strId = 'inventory_model`.`inventory_model_id';
					$strHelperTable = '`inventory_custom_field_helper`';
					break;
				case 4: 
					$strId = 'asset_model`.`asset_model_id';
					$strHelperTable = '`asset_model_custom_field_helper`';
					break;
				case 5: 
					$strId = 'manufacturer`.`manufacturer_id';
					$strHelperTable = '`manufacturer_custom_field_helper`';
					break;
				case 6: 
					$strId = 'category`.`category_id';
					$strHelperTable = '`category_custom_field_helper`';
					break;
				case 7: 
					$strId = 'company`.`company_id';
					$strHelperTable = '`company_custom_field_helper`';
					break;
				case 8: 
					$strId = 'contact`.`contact_id';
					$strHelperTable = '`contact_custom_field_helper`';
					break;
				case 9: 
					$strId = 'address`.`address_id';
					$strHelperTable = '`address_custom_field_helper`';
					break;
				case 10: 
					$strId = 'shipment`.`shipment_id';
					$strHelperTable = '`shipment_custom_field_helper`';
					break;
				case 11: 
					$strId = 'receipt`.`receipt_id';
					$strHelperTable = '`receipt_custom_field_helper`';
					break;
}

$objEntityQtypeCustomFieldArray = EntityQtypeCustomField::LoadArrayByEntityQtypeId(1, QQ::Clause(QQ::Expand(QQN::EntityQtypeCustomField()->CustomField)));

if ($objEntityQtypeCustomFieldArray) {
	foreach ($objEntityQtypeCustomFieldArray as $objEntityQtypeCustomField) {
		echo 'ALTER TABLE ' . $strHelperTable . ' ADD cfv_' . $objEntityQtypeCustomField->CustomFieldId . " TEXT DEFAULT NULL;<br />";
	}
}

$arrCustomFieldSql = array();
$arrCustomFieldSql['strSelect'] = '';
$arrCustomFieldSql['strFrom'] = '';
$arrCustomFieldSql['strInsertColumnHeader'] = '';
$arrCustomFieldSql['strInsertValues'] = '';

if ($objEntityQtypeCustomFieldArray) {
	foreach ($objEntityQtypeCustomFieldArray as $objEntityQtypeCustomField) {
		$strAlias = $objEntityQtypeCustomField->CustomFieldId;
		$arrCustomFieldSql['strSelect'] .= sprintf(', `cfv_%s`.`short_description` AS `%s`', $strAlias, '__' . $strAlias);
		$arrCustomFieldSql['strFrom'] .= sprintf('LEFT JOIN (`custom_field_selection` AS `cfs_%s` JOIN `custom_field_value` AS `cfv_%s` ON `cfv_%s`.`custom_field_id` = %s AND `cfs_%s`.`custom_field_value_id` = `cfv_%s`.`custom_field_value_id` AND `cfs_%s`.`entity_qtype_id` = %s) ON `cfs_%s`.`entity_id` = `%s`', $strAlias, $strAlias, $strAlias, $strAlias, $strAlias, $strAlias, $strAlias, 1, $strAlias, $strId);
		$arrCustomFieldSql['strInsertColumnHeader'] .= sprintf(', %s', 'cfv_' . $strAlias);
	}
}

$strQuery = sprintf('
				SELECT
					`asset`.`asset_id` AS `asset_id`
					%s
				FROM
					`asset` AS `asset`
					%s
				WHERE
				1=1
			', $arrCustomFieldSql['strSelect'],
				$arrCustomFieldSql['strFrom']);
				
			$objDatabase = QApplication::$Database[1];
				
			$objDbResult = $objDatabase->Query($strQuery);
			
			$objAssetArray = Asset::InstantiateDbResult($objDbResult);
			
if ($objAssetArray) {
	foreach ($objAssetArray as $objAsset) {
		$strInsertAssetSql = '';
		if ($objEntityQtypeCustomFieldArray) {
			foreach ($objEntityQtypeCustomFieldArray as $objEntityQtypeCustomField) {
				$strInsertAssetSql .= ", '" . addslashes($objAsset->GetVirtualAttribute($objEntityQtypeCustomField->CustomFieldId)) . "'";
			}
		}
		$strQuery = sprintf('INSERT INTO %s (asset_id %s) VALUES (%s %s);', $arrCustomFieldSql['strInsertColumnHeader'], $strHelperTable, $objAsset->AssetId, $strInsertAssetSql);
		echo ($strQuery . "<br />");
	}
}

?>
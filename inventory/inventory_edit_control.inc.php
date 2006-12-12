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
	
	// Build array of all fields to display
	$arrInventoryFields[] = array('name' => 'Short Description:',  'value' => $this->lblShortDescription->Render(false) . $this->txtShortDescription->RenderWithError(false));
	$arrInventoryFields[] = array('name' => 'Category:', 'value' => $this->lblCategory->Render(false) . $this->lstCategory->RenderWithError(false));
	$arrInventoryFields[] = array('name' => 'Manufacturer:', 'value' => $this->lblManufacturer->Render(false) . $this->lstManufacturer->RenderWithError(false));
	$arrInventoryFields[] = array('name' => 'Inventory Code:', 'value' => $this->lblInventoryModelCode->Render(false) . $this->txtInventoryModelCode->RenderWithError(false));
	$arrInventoryFields[] = array('name' => 'Long Description:', 'value' => $this->pnlLongDescription->Render(false) . $this->txtLongDescription->RenderWithError(false));

	// Custom Fields
	if ($this->arrCustomFields) {
		foreach ($this->arrCustomFields as $field) {
			$arrInventoryFields[] = array('name' => $field['lbl']->Name.':', 'value' => $field['lbl']->Render(false).$field['input']->RenderWithError(false));
		}
	}
	
	// Show quantity and metadata if this is not a new inventory model
	if ($this->blnEditMode) {
		$arrInventoryFields[] = array('name' => 'Quantity:', 'value' => $this->lblTotalQuantity->Render(false));
		$arrInventoryFields[] = array('name' => 'Date Created:', 'value' => $this->lblCreationDate->Render(false));
		$arrInventoryFields[] = array('name' => 'Date Modified:', 'value' => $this->lblModifiedDate->Render(false));			
	}
	
?>


<div class="title">Inventory: <?php $this->lblHeaderInventoryModelCode->Render(); ?> </div>
<table class="datagrid" cellpadding="5" cellspacing="0" border="0" >
	<tr>
		<td class="record_header">
			<?php 
				$this->btnEdit->Render();
				$this->btnSave->RenderWithError();
				echo('&nbsp;');
				$this->btnCancel->RenderWithError();
				$this->btnDelete->Render();
			?>
		</td>
	</tr>
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td style="vertical-align:top;">
						<table cellpadding="0" cellspacing="0">
						<?php
							for ($i=0;$i<ceil(count($arrInventoryFields)/2);$i++) {
								echo('<tr>');
								echo('<td class="record_field_name">'. $arrInventoryFields[$i]['name'] .'&nbsp;</td>');
								echo('<td class="record_field_value">'. $arrInventoryFields[$i]['value'] .'&nbsp;</td>');
								echo('</tr>');
							}
						?>
						</table>
					</td>
					<td style="vertical-align:top;">
						<table cellpadding="0" cellspacing="0">
						<?php
							for ($i=ceil(count($arrInventoryFields)/2);$i<count($arrInventoryFields);$i++) {
								echo('<tr>');
								echo('<td class="record_field_name">'. $arrInventoryFields[$i]['name'] .'&nbsp;</td>');
								echo('<td class="record_field_value">'. $arrInventoryFields[$i]['value'] .'&nbsp;</td>');
								echo('</tr>');
							}
						?>				
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br class="item_divider">

<?php 
		if ($this->blnEditMode) {
			echo('<div class="title">Quantity by Location</div>');
			$this->dtgInventoryQuantities->RenderWithError(); 
			echo('<br class="item_divider" />');
			echo('<div class="title">Transactions</div>');
			$this->btnMove->Render();
			$this->btnTakeOut->Render();
			$this->btnRestock->Render();
			$this->btnShip->Render();
			$this->btnReceive->Render();
			$this->dtgInventoryTransaction->RenderWithError();
		}
?>	
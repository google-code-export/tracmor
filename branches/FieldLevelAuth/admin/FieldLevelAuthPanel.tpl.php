<tr>
	<td class="role_table_left"></td>
	<td class="role_table_cell"><?php echo EntityQtype::$NameArray[$_CONTROL->intEntityQtypeId]?></td>
	<td class="role_table_cell"> <?php $_CONTROL->chkEntityView->Render()?></td>
	<td class="role_table_cell"><?php $_CONTROL->chkEntityEdit->Render()?></td>
	<td class="role_table_cell"></td>
	</td>
</tr>
<tr>
	<td class="role_table_left"></td>
	<td class="role_table_cell">BuiltInFields</td>
	<td class="role_table_cell"><?php $_CONTROL->chkBuiltInView->Render();?></td>
	<td class="role_table_cell"><?php $_CONTROL->chkBuiltInEdit->Render();?></td>
	<td class="role_table_cell"></td>
</tr>
<?php
if($_CONTROL->arrCustomChecks)foreach ($_CONTROL->arrCustomChecks as $ChkCustomFields){
	echo '<tr>';
	echo '<td class="role_table_left"></td>';
	echo '<td class="role_table_cell">'.$ChkCustomFields['name'].'</td>';
	echo '<td class="role_table_cell">'.$ChkCustomFields['view']->Render(false).'</td>';
	echo '<td class="role_table_cell">'.$ChkCustomFields['edit']->Render(false).'</td>';
	echo '<td class="role_table_cell"></td>';
	echo '</tr>';
}
?>	


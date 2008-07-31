<table align="center" width="100%">
  <tr>
    <td>Label Stock:</td>
    <td><?php $this->objLabelStock->RenderWithError() ?></td>
  </tr>
  <tr>
    <td>Label Offset:</td>
    <td><?php $this->objLabelOffset->Render() ?></td>
  </tr>
</table>
<br />
<?php $this->btnPrint->Render() ?>
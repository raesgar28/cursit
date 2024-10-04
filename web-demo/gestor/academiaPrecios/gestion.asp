<!--#include file="../comun/menu_sup.asp"-->  
<%if cod<>""then
Sql= "SELECT * from academia_precios where id_precio="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then
anyo=ob_rs("anyo")
precio_septiembre=ob_rs("precio_septiembre")
precio_octubre=ob_rs("precio_octubre")
precio_noviembre=ob_rs("precio_noviembre")
precio_diciembre=ob_rs("precio_diciembre")
precio_enero=ob_rs("precio_enero")
precio_febrero=ob_rs("precio_febrero")
precio_marzo=ob_rs("precio_marzo")
precio_abril=ob_rs("precio_abril")
precio_mayo=ob_rs("precio_mayo")
precio_junio=ob_rs("precio_junio")
precio_julio=ob_rs("precio_julio")
precio_agosto=ob_rs("precio_agosto")
borrado=ob_rs("borrado")
end if
ob_rs.close
end if '[FIN RECOGEMOS DATOS SI MODIFICACION]%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<div class="breadcrumbs">
<h1>Gestión Precios | 
  <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>academiaPrecios/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado Precios</a></li>
<li class="active">Gestión Profesores</li>
</ol>
</div>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>academiaPrecios/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i> Listado Precios</a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión Precios</a></li>
</ul>
</nav>
</div>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Precios <%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span></div>
</div>
<div class="portlet-body">
<form action="guardar.asp" class="form-horizontal" id="envio" name="envio" method="post">
<input name="r" type="hidden" value="<%=r%>">
<input name="rd" type="hidden" value="<%=rd%>">
<input name="n" type="hidden" value="<%=n%>">
<input name="ndos" type="hidden" value="<%=ndos%>">
<input name="ntres" type="hidden" value="<%=ntres%>">
<input name="ncuat" type="hidden" value="<%=ncuat%>">
<%if cod<>""then%><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><%else%><input name="op" type="hidden" value="in"><%end if%>
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> El profesor ya se encuentra registrado.</div><%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div>
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-5">
<div class="form-group form-md-line-input" id="anyo_a">
<label class="col-md-4 control-label" for="ciudad" >Temporada.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="anyo" id="anyo" onKeyUp="resetea_error('anyo_a');" maxlength="9" value="<%=anyo%>"><div class="form-control-focus"> </div>
<i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">debes introducir aaaa-aaaa</span></div></div></div>
</div><!--col-md-6-->
<!--col-md-6-->
</div><!--col-md-12-->
<div class="col-md-12" style="margin-top:25px">
*Debes introducir las temporadas con formato aaaa-aaaa<br><br>
<table class="blueTable2">
<thead>
<tr>
<th>Sep.</th>
<th>Oct.</th>
<th>Nov.</th>
<th>Dic.</th>
<th>Ene.</th>
<th>Feb.</th>
<th>Mar.</th>
<th>Abr.</th>
<th>May.</th>
<th>Jun.</th>
<th>Jul.</th>
<th>Ago.</th>
</tr>
</thead>
<tbody>
<tr>
<td>
<div class="form-group form-md-line-input col-md-12" style="margin:0 auto;">
<input name="precio_septiembre" type="text" class="form-control" style="text-align:center" id="precio_septiembre" size="4" <%if precio_septiembre <> 0 then%> value="<%=FormatNumber(ccur(precio_septiembre),2)%>"<%end if%>>
</div>
</td>
<td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="precio_octubre" type="text" class="form-control" style="text-align:center" id="precio_octubre" size="4" <%if precio_octubre <> 0 then%> value="<%=FormatNumber(ccur(precio_octubre),2)%>"<%end if%>></div></td>
  <td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="precio_noviembre" type="text" class="form-control" style="text-align:center" id="precio_noviembre" size="4" <%if precio_noviembre <> 0 then%> value="<%=FormatNumber(ccur(precio_noviembre),2)%>"<%end if%>></div></td>
  <td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="precio_diciembre" type="text" class="form-control" style="text-align:center" id="precio_diciembre" size="4" <%if precio_diciembre <> 0 then%> value="<%=FormatNumber(ccur(precio_diciembre),2)%>"<%end if%>></div></td>
  <td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="precio_enero" type="text"  class="form-control" style="text-align:center" id="precio_enero" size="4" <%if precio_enero <> 0 then%> value="<%=FormatNumber(ccur(precio_enero),2)%>"<%end if%>></div></td>
  <td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="precio_febrero" type="text"  class="form-control" style="text-align:center" id="precio_febrero" size="4" <%if precio_febrero <> 0 then%> value="<%=FormatNumber(ccur(precio_febrero),2)%>"<%end if%>></div></td>
  <td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="precio_marzo" type="text" class="form-control" style="text-align:center" id="precio_marzo" size="4" <%if precio_marzo <> 0 then%> value="<%=FormatNumber(ccur(precio_marzo),2)%>"<%end if%>></div></td>
  <td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="precio_abril" type="text" class="form-control" style="text-align:center" id="precio_abril" size="4" <%if precio_abril <> 0 then%> value="<%=FormatNumber(ccur(precio_abril),2)%>"<%end if%>></div></td>
  <td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="precio_mayo" type="text" class="form-control" style="text-align:center" id="precio_mayo" size="4" <%if precio_mayo <> 0 then%> value="<%=FormatNumber(ccur(precio_mayo),2)%>"<%end if%>></div></td>
  <td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="precio_junio" type="text" class="form-control" style="text-align:center" id="precio_junio" size="4" <%if precio_junio <> 0 then%> value="<%=FormatNumber(ccur(precio_junio),2)%>"<%end if%>></div></td>
  <td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="precio_julio" type="text" class="form-control" style="text-align:center" id="precio_julio" size="4" <%if precio_julio <> 0 then%> value="<%=FormatNumber(ccur(precio_julio),2)%>"<%end if%>></div></td>
  <td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="precio_agosto" type="text" class="form-control" style="text-align:center" id="precio_agosto" size="4" <%if precio_agosto <> 0 then%> value="<%=FormatNumber(ccur(precio_agosto),2)%>"<%end if%>></div></td>
</tr>
</tbody>
</table>
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green" onclick="Enviar_precios(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>academiaPrecios/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div>
</div>
</div>
</div><!--form-body-->
</form>
</div><!--portlet-body-->
</div><!--portlet light portlet-fit portlet-form bordered-->
</div><!--page-content-col-->
</div><!--page-content-row-->
</div><!--page-content-container-->
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<script src="/gestor/ckfinder/libs/sf.js"></script>
<script src="/gestor/ckfinder/libs/tree-a.js"></script>
<script src="<%=r%>ckeditor/ckeditor.js"></script>
<script src="/gestor/ckfinder/ckfinder.js"></script>
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script>
CKEDITOR.replace('texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Basica'});
var limita=function(){
var a=function(){
$("#ciudad").maxlength({limitReachedClass:"label label-danger"})
};return{init:function(){a()}}}();jQuery(document).ready(function(){limita.init()});


$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$('#multiple').select2({maximumSelectionLength: 5});;})



</script>

<style>
table.blueTable {
  width: 100%;;
  text-align: left;
  border-collapse: collapse;
}
table.blueTable td, table.blueTable th {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
}
table.blueTable tbody td {
  font-size: 13px;
}

table.blueTable thead {
  background: #32C5D2;
}
table.blueTable thead th {
  font-size: 15px;
  font-weight: normal;
  color: #FFFFFF;
  text-align: center;
  border-left: 2px solid #D0E4F5;
}
table.blueTable thead th:first-child {
  border-left: none;
}
table.blueTable2 {
  width: 100%;
  text-align: left;
  border-collapse: collapse;
}
table.blueTable2 td, table.blueTable2 th {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
}
table.blueTable2 tbody td {
  font-size: 13px;
}

table.blueTable2 thead {
  background: #32C5D2;
}
table.blueTable2 thead th {
  font-size: 15px;
  font-weight: normal;
  color: #FFFFFF;
  text-align: center;
  border-left: 2px solid #D0E4F5;
  width:120px
}
table.blueTable2 thead th:first-child {
  border-left: none;
}
.select-100{min-width:250px}
td select{width:90%;}
</style>
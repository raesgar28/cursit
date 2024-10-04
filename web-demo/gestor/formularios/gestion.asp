<!--#include file="../comun/menu_sup.asp"-->  
<%if cod<>""then

Sql= "SELECT * from formularios where id_formulario="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp=ob_rs("titulo_esp")
texto_esp=ob_rs("texto_esp")
email=ob_rs("email")
a_nl=ob_rs("a_nl")
a_bd=ob_rs("a_bd")
asunto=ob_rs("asunto")
end if
ob_rs.close
end if '[FIN RECOGEMOS DATOS SI MODIFICACION]%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión Formularios | 
  <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>formularios/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado Formularios</a></li>
<li class="active">Gestión Formularios</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<%if edi=""then%><div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>formularios/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i> Listado Formularios
</a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión Formulario</a></li>
</ul>
</nav>
</div><%end if%>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Formulario <%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span></div>
</div>
<div class="portlet-body">
<form action="guardar.asp" class="form-horizontal" id="envio" name="envio" method="post">
<input name="r" type="hidden" value="<%=r%>">
<input name="rd" type="hidden" value="<%=rd%>">
<input name="n" type="hidden" value="<%=n%>">
<input name="ndos" type="hidden" value="<%=ndos%>">
<input name="ntres" type="hidden" value="<%=ntres%>">
<input name="ncuat" type="hidden" value="<%=ncuat%>">
<input name="edi" type="hidden" value="<%=edi%>">
<%if cod<>""then%><input name="op" type="hidden" value="up"><input name="cod" type="hidden" value="<%=cod%>"><%else%><input name="op" type="hidden" value="in"><%end if%>
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> La URL amigable ya se encuentra registrada. Debes modificarla.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div><!--RESPUESTAS-->
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-6">
<div class="form-group form-md-line-input" id="titulo_esp_a">
<label class="col-md-4 control-label" for="titulo_esp" >Nombre descriptivo.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_esp" id="titulo_esp" onKeyUp="resetea_error('titulo_esp_a');" maxlength="160" value="<%=titulo_esp%>"><div class="form-control-focus"> </div>
<i class="fa fa-globe" aria-hidden="true"></i><span class="help-block">debes introducir un nombre</span></div></div></div>
<div class="form-group form-md-line-input" id="email_a">
<label class="col-md-4 control-label" for="email" >Email envío.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="email" id="email" onKeyUp="resetea_error('email_a');" maxlength="160" value="<%=email%>"><div class="form-control-focus"> </div>
<i class="fa fa-envelope" aria-hidden="true"></i><span class="help-block">debes introducir un email</span></div></div></div>
<div class="form-group form-md-line-input" id="asunto_a">
<label class="col-md-4 control-label" for="titulo_esp" >Asunto.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="asunto" id="asunto" onKeyUp="resetea_error('asunto_a');" maxlength="160" value="<%=asunto%>"><div class="form-control-focus"> </div>
<i class="fa fa-pencil" aria-hidden="true"></i><span class="help-block">debes introducir un asunto</span></div></div></div>
</div><!--col-md-6-->
<div class="col-md-6">
<div class="form-group form-md-checkboxes"><label class="col-md-3 control-label" for="form_control_1">Opciones.</label>
<div class="col-md-7">
<div class="md-checkbox-list">
<div class="md-checkbox"><input name="a_nl" type="checkbox" class="md-check" id="a_nl" value="si" <%if cod="" then%>checked="checked"<%end if%> <%if a_nl="si"then%>checked="checked"<%end if%>><label for="a_nl">Newsletter </label></div>
<div class="md-checkbox"><input name="a_bd" type="checkbox" class="md-check" id="a_bd"  value="si" <%if cod="" then%>checked="checked"<%end if%> <%if a_bd="si"then%>checked="checked"<%end if%>>
<label for="a_bd"> Base datos</label></div>
</div></div></div></div></div>
<div class="col-md-12"><div class="form-group form-md-line-input"><label class="col-md-2 control-label margin-left-12" for="texto_esp">Descripción.</label><div class="col-md-4"><textarea class="form-control" name="texto_esp" id="texto_esp" rows="2"><%=texto_esp%></textarea></div></div></div>
<div class="col-md-12"><div class="campos_conceptos form-group form-md-line-input campos_conceptos"><div class="col-md-12" style="border-top:2px solid #ddd;padding-top:20px;margin-bottom:20px;"><a class="inserta_concepto btn green"><i class="fa fa-plus" style="margin-right:8px"></i>Añadir Campo</a></div>
<div class="col-md-offset-1 col-md-10"><table class="table table-striped table-bordered table-hover" style="min-width:750px;text-align:left"><thead><tr><th width="12%">Label.</th><th width="8%">Nombre.</th><th width="8%">Valor.</th><th width="5%">Longitud.</th><th width="8%">Tipo.</th><th width="8%">Tipo datos.</th><th width="8%">Dato.</th><th width="5%" style="text-align:center;">Orden.</th><th width="5%" style="text-align:center;">Obligatorio.</th><th width="3%" style="text-align:center;">Eliminar.</th></tr></thead>
<tbody class="opciones_in">
<%if cod<>"" then
Sql= "SELECT * FROM formulariosCampos WHERE id_formulario="&cod&" order by orden"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i_opciones=1
do while not ob_rs.eof%>
<tr class="fila_opcion">
<td><input type="text" class="form-control" placeholder="" name="nombre_[<%=i_opciones%>]" id="nombre_<%=i_opciones%>" value="<%=ob_rs("nombre")%>"></td>
<td><input type="text" class="form-control" placeholder="" name="nombre_nombre_[<%=i_opciones%>]" id="nombre_nombre_<%=i_opciones%>" value="<%=ob_rs("nombre_nombre")%>"></td>
<td><input type="text" class="form-control" placeholder="" name="valor_[<%=i_opciones%>]" id="valor_<%=i_opciones%>" value="<%=ob_rs("valor")%>"></td>
<td><select id="longitud_<%=i_opciones%>" name="longitud_[<%=i_opciones%>]" style="width:100%" >
<option value="0" <%if ob_rs("longitud")=0 then%>selected<%end if%>>Normal</option>
<option value="25" <%if ob_rs("longitud")=25 then%>selected<%end if%>>25%</option>
<option value="50" <%if ob_rs("longitud")=50 then%>selected<%end if%>>50%</option>
<option value="75" <%if ob_rs("longitud")=75 then%>selected<%end if%>>75%</option>
<option value="100" <%if ob_rs("longitud")=100 then%>selected<%end if%>>100%</option>
</select></td>
<td><select id="tipo_input_<%=i_opciones%>" name="tipo_input_[<%=i_opciones%>]" style="width:100%" >
<option value="txt" <%if ob_rs("tipo_input")="txt" then%>selected<%end if%>>Texto</option>
<option value="mem" <%if ob_rs("tipo_input")="mem" then%>selected<%end if%>>Memo</option>
<option value="sel" <%if ob_rs("tipo_input")="sel" then%>selected<%end if%>>Select</option>
<option value="rad" <%if ob_rs("tipo_input")="rad" then%>selected<%end if%>>Radio</option>
<option value="che" <%if ob_rs("tipo_input")="che" then%>selected<%end if%>>Check</option>
<option value="lab" <%if ob_rs("tipo_input")="lab" then%>selected<%end if%>>Label</option>
</select></td>
<td><select id="tipo_dato_<%=i_opciones%>" name="tipo_dato_[<%=i_opciones%>]" style="width:100%" >
<option value="txt" <%if ob_rs("tipo_dato")="txt" then%>selected<%end if%>>Texto</option>
<option value="num" <%if ob_rs("tipo_dato")="num" then%>selected<%end if%>>Numérico</option>
<option value="fec" <%if ob_rs("tipo_dato")="fec" then%>selected<%end if%>>Fecha</option>
</select></td>
<td><select id="dato_<%=i_opciones%>" name="dato_[<%=i_opciones%>]" style="width:100%" >
<option value="d_nombre" <%if ob_rs("dato")="d_nombre" then%>selected<%end if%>>Nombre</option>
<option value="d_apellidos" <%if ob_rs("dato")="d_apellidos" then%>selected<%end if%>>Apellidos</option>
<option value="d_email" <%if ob_rs("dato")="d_email" then%>selected<%end if%>>eMail</option>
<option value="d_nif" <%if ob_rs("dato")="d_nif" then%>selected<%end if%>>NIF</option>
<option value="d_fecha" <%if ob_rs("dato")="d_fecha" then%>selected<%end if%>>Fecha</option>
<option value="d_otros" <%if ob_rs("dato")="d_otros" then%>selected<%end if%>>Otros</option>
</select></td>
<td><input type="text" class="form-control orden" placeholder="" name="orden_[<%=i_opciones%>]" id="orden_<%=i_opciones%>" value="<%=ob_rs("orden")%>" style="width:50px;margin:0 auto"></td>
<td style="text-align:center;"><div class="campos_obliga form-md-checkboxes" ><div class="md-checkbox" style="width:25px;margin:0 auto;"><input name="obligatorio_[<%=i_opciones%>]" type="checkbox" class="md-check" id="obligatorio_<%=i_opciones%>" value="si" <%if ob_rs("obligatorio")="si"then%>checked<%end if%>><label for="obligatorio_<%=i_opciones%>"><span></span><span class="check"></span><span class="box"></span>&nbsp;</label></div></div></td>
<td style="padding-top:15px;text-align:center;">
<div class="col-md-2"><div class="md-checkbox"><input type="checkbox" name="del_[<%=i_opciones%>]" id="del_<%=i_opciones%>" class="md-check" value="si"><label for="del_<%=i_opciones%>"><span></span><span class="check"></span><span class="box"></span></label></div></div>
</td>
</tr>
<%i_opciones=i_opciones+1
ob_rs.movenext
loop
end if
ob_rs.close
end if
if i_opciones="" then
i_opciones=1%>
<tr class="fila_opcion">
<td><input type="text" class="form-control" placeholder="" name="nombre_[<%=i_opciones%>]" id="nombre_<%=i_opciones%>"></td>
<td><input type="text" class="form-control" placeholder="" name="nombre_nombre_[<%=i_opciones%>]" id="nombre_nombre_<%=i_opciones%>"></td>
<td><input type="text" class="form-control" placeholder="" name="valor_[<%=i_opciones%>]" id="valor_<%=i_opciones%>"></td>
<td><select id="longitud_<%=i_opciones%>" name="longitud_[<%=i_opciones%>]" style="width:100%" >
<option value="0" >Normal</option>
<option value="25">25%</option>
<option value="50">50%</option>
<option value="75">75%</option>
<option value="100">100%</option>
</select></td>
<td><select id="tipo_input_<%=i_opciones%>" name="tipo_input_[<%=i_opciones%>]" style="width:100%" >
<option value="txt">Texto</option>
<option value="mem">Memo</option>
<option value="sel">Select</option>
<option value="rad">Radio</option>
<option value="che">Check</option>
<option value="lab">Label</option>
</select></td>
<td><select id="tipo_dato_<%=i_opciones%>" name="tipo_dato_[<%=i_opciones%>]" style="width:100%" >
<option value="txt">Texto</option>
<option value="num">Numérico</option>
<option value="fec">Fecha</option>
</select></td>
<td><select id="dato_<%=i_opciones%>" name="dato_[<%=i_opciones%>]" style="width:100%" >
<option value="d_nombre">Nombre</option>
<option value="d_apellidos">Apellidos</option>
<option value="d_email">eMail</option>
<option value="d_nif">NIF</option>
<option value="d_fecha">Fecha</option>
<option value="d_otros">Otros</option>
</select>
</td><td><input type="text" class="form-control orden" placeholder="" name="orden_[<%=i_opciones%>]" id="orden_<%=i_opciones%>" value="1" style="width:50px;margin:0 auto"></td>
<td style="text-align:center;"><div class="campos_obliga form-md-checkboxes" ><div class="md-checkbox" style="width:25px;margin:0 auto;"><input name="obligatorio_[<%=i_opciones%>]" type="checkbox" class="md-check" id="obligatorio_<%=i_opciones%>" value="si"><label for="obligatorio_<%=i_opciones%>"><span></span><span class="check"></span><span class="box"></span>&nbsp;</label></div></div></td>
<td style="padding-top:15px;text-align:center;"></td>
</tr>
<%end if%></tbody></table></div>
</div></div></div></div>
<div class="form-body"><div class="form-actions"><div class="row"><div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green" onclick="Enviar_formularios(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<%if edi="" then%><a href="<%=r%>formularios/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%>
</div></div></div></div></form></div></div></div></div></div>
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="/gestor/ckfinder/libs/sf.js"></script>
<script src="/gestor/ckfinder/libs/tree-a.js"></script>
<script src="<%=r%>ckeditor/ckeditor.js"></script>
<script src="/gestor/ckfinder/ckfinder.js"></script>
<script>
CKEDITOR.replace('texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Basica'});
$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$('#multiple').select2({maximumSelectionLength: 5});;})
$("[name='a_nl'],[name='a_bd'],[name='disponible']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
<%'for a=1 to a-1%>
$('.inserta_concepto').one('click',function(){
}).click(function(){<%if i_opciones=0then%>var n = $('.fila_opcion').length;<%else%>var n = $('.fila_opcion').length + 1;<%end if%>
if( 25 < n ) {$('#alerta_conceptos').modal();return false;}
x=n;
var box_htmle = $('<tr class="fila_opcion"><td><input type="text" class="form-control" placeholder="" name="nombre_['+x+']" id="nombre_'+x+'"></td><td><input type="text" class="form-control" placeholder="" name="nombre_nombre_['+x+']" id="nombre_nombre_'+x+'"></td><td><input type="text" class="form-control" placeholder="" name="valor_['+x+']" id="valor_'+x+'"></td><td><select id="longitud_'+x+'" name="longitud_['+x+']" style="width:100%" ><option value="0" >Normal</option><option value="25">25%</option><option value="50">50%</option><option value="75">75%</option><option value="100">100%</option></select></td><td><select id="tipo_input_'+x+'" name="tipo_input_['+x+']" style="width:100%" ><option value="txt">Texto</option><option value="mem">Memo</option><option value="sel">Select</option><option value="rad">Radio</option><option value="che">Check</option></select></td><td><select id="tipo_dato_'+x+'" name="tipo_dato_['+x+']" style="width:100%" ><option value="txt">Texto</option><option value="num">Numérico</option><option value="fec">Fecha</option></select></td><td><select id="dato_+x+" name="dato_[+x+]" style="width:100%" ><option value="d_nombre">Nombre</option><option value="d_apellidos">Apellidos</option><option value="d_email">eMail</option><option value="d_nif">NIF</option><option value="d_fecha">Fecha</option><option value="d_otros">Otros</option></select></td><td><input type="text" class="form-control orden_op" placeholder="" name="orden_['+x+']" id="orden_'+x+'" value="'+x+'" style="width:50px;margin:0 auto"></td><td style="text-align:center;"><div class="campos_obliga form-md-checkboxes" ><div class="md-checkbox" style="width:25px;margin:0 auto;"><input name="obligatorio_['+x+']" type="checkbox" class="md-check" id="obligatorio_'+x+'" value="si"><label for="obligatorio_'+x+'"><span></span><span class="check"></span><span class="box"></span>&nbsp;</label></div></div></td><td style="padding-top:15px;text-align:center;"><div class="col-md-2"><button class="elimina_campo btn red"><i class="fa fa-trash" style="margin-right:8px"></i>Eliminar</button></div></td></tr>');
box_htmle.hide();
$('.campos_conceptos tr.fila_opcion:last').after(box_htmle);
box_htmle.fadeIn('slow');
$('select').select2({minimumResultsForSearch: -1,language: "es"});
return false;});
$('.campos_conceptos').on('click', '.elimina_campo', function(){
if( $('.fila_opcion').length >1){
$(this).closest('tr').css( 'background-color', '#32C5D2' );
$(this).closest('tr').fadeOut("slow", function() {
$(this).closest('tr').remove();
$(".orden_op").each(function(index){$(this).val( index + 2);})
});
};return false;
});
</script>
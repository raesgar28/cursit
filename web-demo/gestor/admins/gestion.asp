<!--#include file="../comun/menu_sup.asp"-->  
<!--#include file="../../conex/conex_back.asp"-->
<%if cod<>""then
Sql= "SELECT * from admins where id_admin="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre=ob_rs("nombre")
apellidos=ob_rs("apellidos")
email=ob_rs("mail")
user=ob_rs("user_m")
telefono=ob_rs("telefono")
division=ob_rs("division")
habilitado=ob_rs("habilitado")
pr_academia=ob_rs("pr_academia")
pr_cursos=ob_rs("pr_cursos")
pr_alumnos=ob_rs("pr_alumnos")
pr_contabilidad=ob_rs("pr_contabilidad")
pr_precio_real=ob_rs("pr_precio_real")
pr_datos_comunes=ob_rs("pr_datos_comunes")
pr_cat_sec=ob_rs("pr_cat_sec")
pr_fluctuaciones=ob_rs("pr_fluctuaciones")
pr_proveedores=ob_rs("pr_proveedores")
pr_admin=ob_rs("pr_admin")
pr_menu=ob_rs("pr_menu")
pr_paginas=ob_rs("pr_paginas")
pr_comunicados=ob_rs("pr_comunicados")
pr_datos_gestion=ob_rs("pr_datos_gestion")
pr_usuarios_crm=ob_rs("pr_usuarios_crm")
pr_factura=ob_rs("pr_factura")
codigo_activacion=ob_rs("codigo_activacion")
pr_opciones=ob_rs("pr_opciones")
pr_team_od=ob_rs("pr_team_od")
pr_team=ob_rs("pr_team")
pr_observaciones=ob_rs("pr_observaciones")
puesto=ob_rs("puesto")
end if
ob_rs.close
end if
Sql= "SELECT id_admin from admins"     '[TOTAL]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
num_=ob_rs.RecordCount
end if
ob_rs.close
Sql= "SELECT url FROM webs WHERE principal='si'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
url=ob_rs("url")
end if
ob_rs.close%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión Usuarios CRM | <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<%if pr_usuarios_crm_ad="si" then%><li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>admins/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado <%if ntres="ag" then%>Agentes<%else%>Usuarios<%end if%></a></li><%end if%>
<li class="active">Gestión Usuarios CRM</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container"><div class="page-content-row"><%if edi=""then%><div class="page-sidebar"><nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<%if pr_usuarios_crm_ad="si" then%>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>admins/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i> Listado Usuarios
<%if num_<>""then%><span class="baddge badge badge-default"> <%=num_%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li><%end if%>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión Usuarios CRM</a></li>
</ul></nav></div><%end if%>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-body">
<div class="form-body">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> El mail o usuario se encuentran registrados en otro usuario.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos de usuario modificados con éxito! </div><%end if%></div><!--RESPUESTAS-->
<form action="guardar.asp" method="post" enctype="multipart/form-data" name="envio" class="form-horizontal" id="envio"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><%if cod<>""then%><input name="op" type="hidden" value="up"><%else%><input name="op" type="hidden" value="in"><%end if%><input name="cod" type="hidden" value="<%=cod%>"><div class="form-body"><div class="row"><div class="col-md-12"><div class="col-md-5"><div class="form-group form-md-line-input" id="u_nombre_a"><label class="col-md-4 control-label" for="u_nombre" >Nombre <%if ntres="ag" then%>(contacto)<%end if%>.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_nombre" id="u_nombre" onKeyUp="resetea_error('u_nombre_a');" maxlength="160" value="<%=nombre%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir un nombre</span></div></div></div>
<div class="form-group form-md-line-input" id="u_apellidos_a">
<label class="col-md-4 control-label" for="u_apellidos" >Apellidos <%if ntres="ag" then%>(contacto)<%end if%>.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_apellidos" id="u_apellidos" onKeyUp="resetea_error('u_apellidos_a');" maxlength="160" value="<%=apellidos%>"><div class="form-control-focus"> </div>
<i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir los apellidos</span></div></div></div>
<div class="form-group form-md-line-input" id="u_email_a">
<label class="col-md-4 control-label" for="u_email" >Email.<span class="required">*</span></label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_email" id="u_email" onKeyUp="resetea_error('u_email_a');" maxlength="160" value="<%=email%>"><div class="form-control-focus"> </div><i class="fa fa-envelope" aria-hidden="true"></i><span class="help-block">debes introducir un email</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="puesto" >Puesto.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="puesto" id="puesto" maxlength="160" value="<%=puesto%>"><div class="form-control-focus"> </div><i class="fa fa-wrench" aria-hidden="true"></i><span class="help-block">debes introducir un puesto</span></div></div></div>
<div class="form-group form-md-line-input" id="u_usuario_a">
<label class="col-md-4 control-label" for="u_usuario" >Usuario.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_usuario" id="u_usuario" onKeyUp="resetea_error('u_usuario_a');" maxlength="160" value="<%=user%>" ><div class="form-control-focus"> </div><i class="fa fa-user-o" aria-hidden="true"></i><span class="help-block">debes introducir un usuario</span></div></div></div>
<div class="form-group form-md-line-input" id="u_telefono_a">
<label class="col-md-4 control-label" for="u_telefono" >Teléfono.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_telefono" id="u_telefono" onKeyUp="resetea_error('u_telefono_a');" maxlength="160" value="<%=telefono%>"><div class="form-control-focus"> </div>
<i class="fa fa-phone" aria-hidden="true"></i><span class="help-block">debes introducir un teléfono</span></div></div></div>
<div class="form-group form-md-line-input" >
<label class="col-md-4 control-label" for="codigo_activacion" >Código.</label>
<div class="col-md-8">
<div class="input-icon"><input name="codigo_activacion" type="text" class="form-control" id="codigo_activacion" placeholder="" value="<%=url%>/recover-crm/<%=codigo_activacion%>"  maxlength="160" readonly><div class="form-control-focus"> </div>
<i class="fa fa-code" aria-hidden="true"></i></div></div></div>
</div><!--col-md-6-->
<div class="col-md-6"><%if (pr_opciones_ad="si" and (principal<>"si" or ISNULL(principal))) or (principal="si" and cod<>session("admin")) then%>
<div class="form-group form-md-checkboxes">
<div class="col-md-12">
<div class="col-md-6">Gestiona...
<div class="md-checkbox-inline">
<div class="md-checkbox"><input name="habilitado" type="checkbox" class="md-check" id="habilitado"  value="si" <%if habilitado="si" or cod="" then%>checked="checked"<%end if%> ><label for="habilitado" > Habilitado </label></div><br>
<div class="md-checkbox"><input name="pr_academia" type="checkbox" class="md-check" id="pr_academia"  value="si" <%if pr_academia="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_academia"> Academia </label></div><br>
<div class="md-checkbox"><input name="pr_cursos" type="checkbox" class="md-check" id="pr_cursos"  value="si" <%if pr_cursos="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_cursos"> Cursos </label></div><br>
<div class="md-checkbox"><input name="pr_alumnos" type="checkbox" class="md-check" id="pr_alumnos"  value="si" <%if pr_alumnos="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_alumnos"> Alumnos </label></div><br>
<div class="md-checkbox"><input name="pr_contabilidad" type="checkbox" class="md-check" id="pr_contabilidad"  value="si" <%if pr_contabilidad="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_contabilidad"> Contabilidad </label></div><br>
<div class="md-checkbox"><input name="pr_precio_real" type="checkbox" class="md-check" id="pr_precio_real"  value="si" <%if pr_precio_real="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_precio_real"> Precios reales </label></div><br>
<div class="md-checkbox"><input name="pr_datos_comunes" type="checkbox" class="md-check" id="pr_datos_comunes"  value="si" <%if pr_datos_comunes="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_datos_comunes"> Datos comunes </label></div>
<div class="md-checkbox"><input name="pr_usuarios_crm" type="checkbox" class="md-check" id="pr_usuarios_crm"  value="si" <%if pr_usuarios_crm="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_usuarios_crm"> Usuarios CRM </label></div>
<div class="md-checkbox"><input name="pr_team" type="checkbox" class="md-check" id="pr_team"  value="si" <%if pr_team="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_team"> Mostrar en equipo </label></div>
<div class="form-group form-md-line-input"><div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="pr_team_od" id="pr_team_od"  value="<%=pr_team_od%>"><i class="fa fa-sort-numeric-desc" aria-hidden="true"></i></div></div></div>
</div>
</div>
<div class="col-md-6">
<div class="md-checkbox-inline">
<div class="md-checkbox"><input name="pr_cat_sec" type="checkbox" class="md-check" id="pr_cat_sec"  value="si" <%if pr_cat_sec="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_cat_sec">Cat./secc. </label></div><br>
<div class="md-checkbox"><input name="pr_fluctuaciones" type="checkbox" class="md-check" id="pr_fluctuaciones"  value="si" <%if pr_fluctuaciones="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_fluctuaciones"> Fluctuaciones </label></div>
<div class="md-checkbox"><input name="pr_proveedores" type="checkbox" class="md-check" id="pr_proveedores"  value="si" <%if pr_proveedores="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_proveedores"> Proveedores </label></div>
<div class="md-checkbox"><input name="pr_admin" type="checkbox" class="md-check" id="pr_admin"  value="si" <%if pr_admin="si" then%>checked="checked"<%end if%> ><label for="pr_admin"> Administración web </label></div>
<div class="md-checkbox"><input name="pr_menu" type="checkbox" class="md-check" id="pr_menu"  value="si" <%if pr_menu="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_menu"> Menús </label></div><br>
<div class="md-checkbox"><input name="pr_paginas" type="checkbox" class="md-check" id="pr_paginas"  value="si" <%if pr_academia="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_paginas"> Páginas </label></div><br>
<div class="md-checkbox"><input name="pr_comunicados" type="checkbox" class="md-check" id="pr_comunicados"  value="si" <%if pr_comunicados="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_comunicados"> Comunicados </label></div><br>
<div class="md-checkbox"><input name="pr_datos_gestion" type="checkbox" class="md-check" id="pr_datos_gestion"  value="si" <%if pr_datos_gestion="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_datos_gestion"> Datos MKT </label></div><br>
<div class="md-checkbox"><input name="pr_factura" type="checkbox" class="md-check" id="pr_factura"  value="si" <%if pr_factura="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_factura"> Generar facturas </label></div>
<div class="md-checkbox"><input name="pr_opciones" type="checkbox" class="md-check" id="pr_opciones"  value="si" <%if pr_opciones="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_opciones"> Opciones gestión </label></div>
<div class="md-checkbox"><input name="pr_observaciones" type="checkbox" class="md-check" id="pr_observaciones"  value="si" <%if pr_observaciones="si" or cod="" then%>checked="checked"<%end if%> ><label for="pr_observaciones"> Observaciones internas </label></div>
</div></div>
</div></div>
<%else%>
No tienes opciones de gestión habilitadas
<%end if%>
<div class="row documentos">
<%if cod<>""then
Sql= "SELECT * from adminsArchivos where id_admin="&cod&""
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="col-md-12 col-sm-12" style="margin-top:10px;margin-bottom:20px"><div class="col-md-12"><a href="../../up_docs/admins/<%=ob_rs("nombre")%>" target="_blank"><img src="../../up_docs/admins/<%=ob_rs("nombre")%>" width="150" height="auto" style="margin-right:12px;border:1px solid #ddd;padding:4px"><i class="fa fa-share" aria-hidden="true"></i></a></div>
<div class="md-checkbox col-md-12" style="margin-top:15px;margin-left:15px"><input type="checkbox" id="del_1" class="c-check" value="<%=ob_rs("Id_admin_archivo")%>" name="del_1" autocomplete="off" ><label for="del_1"><span></span><span class="check"></span><span class="box"></span><i class="fa fa-trash" aria-hidden="true"></i> eliminar</label></div></div>
<%else%>
<div class="col-md-8 col-sm-8" style="margin-top:10px;margin-bottom:20px;margin-left:15px">
<div class="col-md-10" style="padding:0"><input type="file" class="filestyle" id="archivo_1" name="archivo_1" data-buttonName="btn-primary" ></div>
<button type="button" class="btn default" id="limpia_archivo_1" language="javascript"><i class="fa fa-trash" aria-hidden="true"></i></button>
</div>
<%end if
ob_rs.close
else%>
<div class="col-md-8 col-sm-8" style="margin-top:10px;margin-bottom:20px;margin-left:15px">
<div class="col-md-10" style="padding:0"><input type="file" class="filestyle" id="archivo_1" name="archivo_1" data-buttonName="btn-primary" ></div>
<button type="button" class="btn default" id="limpia_archivo_1" language="javascript"><i class="fa fa-trash" aria-hidden="true"></i></button>
<%end if%>
</div>
</div>
</div></div></div>
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green" onclick="Enviar_usuarios(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%if pr_usuarios_crm_ad="si" then%>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>admins/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
<%end if%></div></div></div>
</form>
</div></div></div></div></div>
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/js/validador.js" type="text/javascript"></script><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script><script src="/gestor/ckfinder/libs/sf.js"></script><script src="/gestor/ckfinder/libs/tree-a.js"></script><script src="<%=r%>ckeditor/ckeditor.js"></script><script src="/gestor/ckfinder/ckfinder.js"></script><script type="text/javascript" src="<%=r%>lib/js/bootstrap-filestyle.min.js"></script><script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script><script src="<%=r%>lib/js/upload/vendor/jquery.ui.widget.js"></script><script src="<%=r%>lib/js/upload/jquery.iframe-transport.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-process.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-image.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-validate.js"></script><script src="<%=r%>lib/js/upload/jquery.fileupload-ui.js"></script><!--[if (gte IE 8)&(lt IE 10)]><script src="<%=r%>lib/js/upload/cors/jquery.xdr-transport.js"></script><![endif]--><link rel="stylesheet" href="<%=r%>lib/css/upload/style.css"><link rel="stylesheet" href="<%=r%>lib/css/upload/jquery.fileupload.css"><link rel="stylesheet" href="<%=r%>lib/css/upload/jquery.fileupload-ui.css"><!--<script src="<%'=r%>lib/js/upload/main.js">--></script><link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css"><script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/datatables/datatables.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
$("#archivo_1").filestyle('buttonText', '&nbsp;Subir Archivo');
$("#archivo_1").filestyle('placeholder', 'Elegir archivo');
$("#limpia_archivo_1").click(function() {$("#archivo_1").filestyle('clear');});
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$("[name='u_agente'],[name='habilitado'],[name='pr_academia'],[name='pr_cursos'],[name='pr_alumnos'],[name='pr_contabilidad'],[name='pr_precio_real'],[name='pr_datos_comunes'],[name='pr_cat_sec'],[name='pr_fluctuaciones'],[name='pr_proveedores'],[name='pr_admin'],[name='pr_menu'],[name='pr_paginas'],[name='pr_comunicados'],[name='pr_datos_gestion'],[name='pr_usuarios_crm'],[name='pr_factura'],[name='pr_opciones'],[name='pr_team'],[name='pr_observaciones']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});})</script>
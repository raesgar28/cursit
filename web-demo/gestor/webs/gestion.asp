<!--#include file="../comun/menu_sup.asp"-->  
<%if cod<>""then
Sql= "SELECT * from webs where id_web="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp=ob_rs("titulo_esp")
texto_esp=ob_rs("texto_esp")
url=ob_rs("url")
categorias=ob_rs("categorias")
cursos_tipo=ob_rs("cursos_tipo")
cursos_tipo_sub=ob_rs("cursos_tipo_sub")
meta_title=ob_rs("meta_title")
meta_key=ob_rs("meta_key")
meta_desc=ob_rs("meta_desc")
visible=ob_rs("visible")
fecha_in=ob_rs("fecha_in")
https=ob_rs("https")
f_smtp=ob_rs("f_smtp")
f_usuario=ob_rs("f_usuario")
f_pass=ob_rs("f_pass")
f_email=ob_rs("f_email")
f_puerto=ob_rs("f_puerto")
f_ssl=ob_rs("f_ssl")
f_texto_legal=ob_rs("f_texto_legal")
f_mail=ob_rs("f_email")
email=ob_rs("email")
direccion=ob_rs("direccion")
cod_postal=ob_rs("cod_postal")
ciudad=ob_rs("ciudad")
provincia=ob_rs("provincia")
pais=ob_rs("pais")
telefono=ob_rs("telefono")
datos_complementarios=ob_rs("datos_complementarios")
principal=ob_rs("principal")
end if
ob_rs.close
Sql= "SELECT * from rel where id_web="&cod&""
Set ob_rs = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
Dim archivo_(20),alt_(20),orden_img_(20)
do while not ob_rs.eof
id_archivo=ob_rs("id_archivo")
	if id_archivo<>""then
	Sql2= "SELECT * from archivos where id_archivo="&id_archivo&""
	Set ob_rs2 = Server.CreateObject("ADODB.Recordset")
	ob_rs2.Open Sql2, ob_conn,adOpenStatic, adCmdText
	if not ob_rs2.eof then
	for i=0 to 20
	if ob_rs2("campo")="archivo_"&(i) then 
	execute("archivo_"& i & "= ob_rs2(""nombre"")")
	execute("alt_"& i & "= ob_rs2(""alt"")")
	execute("orden_img_"& i & "= ob_rs2(""orden"")")
	end if
	next
	end if
	ob_rs2.close
	end if
ob_rs.movenext
i=i+1
loop
end if
ob_rs.close
end if '[FIN RECOGEMOS DATOS SI MODIFICACION]%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión Webs | <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%><a href="<%=r%>webs/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado Webs</a></li>
<li class="active">Gestión Web</li>
</ol>
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%><a href="<%=r%>webs/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i> Listado Webs<%if num_w<>""then%><span class="baddge badge badge-default"> <%=num_w%> </span><%else%><span class="baddge badge badge-danger"> 0 </span><%end if%></a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión Webs</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat="))%><a href="<%=r%>categorias/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat=")%>"><i class="icon-note"></i> Categorías<%if num_c<>""then%><span class="baddge badge badge-default"> <%=num_c%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat="))%><a href="<%=r%>secciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=s&ncuat=")%>"><i class="icon-note"></i> Tipos Curso<%if num_s<>""then%><span class="baddge badge badge-default"> <%=num_s%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat="))%>
<a href="<%=r%>subSecciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat=")%>"><i class="icon-note"></i> Subsecciones Cursos 
<%if num_ss<>""then%><span class="baddge badge badge-default"> <%=num_ss%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li><a data-toggle="modal" data-target="#externo1"><i class="icon-list"></i> Cursos <%if num_it<>""then%><span class="baddge badge badge-default"> <%=num_it%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
</ul>
</nav>
</div>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Web <%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span></div>
<ul class="nav nav-tabs">
<li class="active"><a href="#tab_1" data-toggle="tab"> General </a></li>
<li><a href="#tab_2" data-toggle="tab"> Ajustes </a></li>
<li style="display:none"><a href="#tab_3" data-toggle="tab"> SEO </a></li>
</ul>
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
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> La URL ya se encuentra registrada.</div><%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div>
<div class="tab-content" >
<div class="tab-pane active" id="tab_1">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-6">
<div class="form-group form-md-line-input" id="titulo_esp_a"><label class="col-md-4 control-label" for="titulo_esp" >Título Web.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_esp" id="titulo_esp" onKeyUp="resetea_error('titulo_esp_a');" maxlength="160" value="<%=titulo_esp%>"><div class="form-control-focus"> </div><i class="fa fa-globe" aria-hidden="true"></i><span class="help-block">debes introducir un nombre descriptivo</span></div></div></div>
<!--IMAGEN-->
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label">Imagen destacada.</label>
<div class="col-md-8"><div class="input-group"><div class="input-icon"><i class="fa fa-picture-o" aria-hidden="true"></i><input id="archivo_1" class="form-control" type="field" name="archivo_[1]" placeholder="imagen (jpg, png, .gif)" autocomplete="off"></div><span class="input-group-btn"><button class="btn default" id="modal_1" type="button" onclick="javascript:archivo('Imagen',1);"><i class="fa fa-arrow-left fa-fw" /></i> Seleccionar</button></span></div></div></div>
<input type="hidden" class="form-control" placeholder="" name="orden_img_[1]" id="orden_img_1" maxlength="250" value="1">
<div class="form-group form-md-line-input" id="alt_1">
<label class="col-md-4 control-label" for="alt_1" >Título imagen.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_[1]" id="alt_1" maxlength="250" value="<%=alt_1%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
</div>
<div class="row" id="div_imagen_1">
<div class="col-md-7">
<div class="form-group form-md-line-input" id="imagen_1">
<label class="col-md-7 control-label">Imagen destacada.</label>
<div class="col-sm-4 col-md-5"><a href="#/" id="pop" onClick="modal_img_1();" class="thumbnail thumbs_p"><img src="<%=archivo_1%>" alt="100%x180"></a></div></div>
</div>
<div class="col-md-4">
<div class="form-group form-md-line-input" >
<span class="input-group-btn" id="anular_1"><button class="btn default" id="anular" type="button" onclick="javascript:anular_1();"><i class="fa fa-arrow-left fa-fw" /></i> Anular Imagen</button></span>
<div class="form-group form-md-line-input"  id="eliminar_1">
<label class="col-md-7 control-label" for="del_img_1">Eliminar Img.</label>
<div class="col-md-4"><div class="md-checkbox-list"><div class="md-checkbox"><input name="del_img_1" type="checkbox" class="md-check" id="del_img_1" value="si" ></div></div></div>
</div>
</div>
</div>
<div class="modal fade" id="imagemodal_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
<h4 class="modal-title" id="myModalLabel">Vista Previa</h4></div>
<div class="modal-body" style="text-align:center;"><img src="<%=archivo_1%>" id="imagepreview_1" style="width: 400px; margin:0 auto;" ></div>
<div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button></div>
</div>
</div>
</div>
<script>
function modal_img_1() { $('#imagemodal_1').modal('show'); }; //MODAL DE IMAGEN
<%if archivo_1=""then%>
function anular_1(){$('#archivo_1').val("");$('#div_imagen_1').fadeOut("fast");}
<%else%>
function anular_1(){
$('#archivo_1').val("");$('#anular_1').fadeOut("fast");$('#eliminar_1').fadeIn("fast");
$("[name='del_img_1']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});$('#imagen_1 img').attr('src','<%=archivo_1%>');$('#imagepreview_1').attr('src','<%=archivo_1%>');
}
<%end if%>
<%if archivo_1=""then%>
$('#div_imagen_1').hide();$('#eliminar_1').hide();
<%else%>
$('#eliminar_1').show();$("[name='del_img_1']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});$('#anular_1').hide();  //FIN MODAL DE IMAGEN
<%end if%>
</script>
</div><!--row-->
<!--FIN IMAGEN-->
<%Sql= "SELECT id_division, titulo_esp from divisiones"   '[ASOCIAMOS CON UNA WEB]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_div="si"%>
<div class="form-group form-md-line-input"  id="id_division_a">
<label class="col-md-4 control-label" for="id_division">División de negocio.<span class="required">*</span></label>
<div class="col-md-8"><div class="input-icon">
<select name="id_division" id="id_division" multiple="multiple" class="select-100" onChange="resetea_error('id_division_a');">
<%do while not ob_rs.eof
id_division=ob_rs("id_division")
tit_division=ob_rs("titulo_esp")
	if cod<>""then
	Sql2= "SELECT id_web, id_division from rel where id_web = "&cod&" and id_division= "&id_division&""   '[ASOCIAMOS CON UNA DIVISION]
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	sel="si"
	end if
	ob_rs2.close
	end if%>
<option value="<%=id_division%>" <%if sel="si" then%>Selected<%end if%>><%=tit_division%></option>
<%ob_rs.movenext
sel=""
loop%>
</select>
<i class="fa fa-registered" aria-hidden="true"></i><span class="help-block">selecciona una división</span></div>
</div>
</div>
<%else%>
<script>
function notifica(){
var UINotific8=function(){return{init:function(){jQuery(document).ready(function(i){
var t={theme:'lime',
sticky:'',
horizontalEdge:'right',
verticalEdge:'top'},
n=$(this);""!=$.trim('No se puede crear ninguna web')&&(t.heading=$.trim('No se puede crear ninguna web')),
t.sticky||(t.life='12000'),
$.notific8("zindex",11500),
$.notific8($.trim('Por favor, crea una División de Negocio'),t),
n.attr("disabled","disabled"),
setTimeout(function(){n.removeAttr("disabled")},1e3)})}}}();
UINotific8.init();
}
notifica();
</script>
<div class="col-md-12" >
<div class="col-md-2" ></div>
<div class="col-md-8" >
<div class="alert-danger sin_regstros">
<a data-toggle="modal" data-target="#division_mod" class="f_red"><i class="icon-note"></i> Debes crear una Divsión de Negocio para poder continuar</a>
</div>
</div>
</div>
<%end if
ob_rs.close
ob_conn.close                               '[FIN ASOCIAMOS CON UNA DIVISION]%>
</div><!--col-md-6-->
<div class="col-md-6">
<div class="form-group form-md-checkboxes"><label class="col-md-3 control-label" for="form_control_1">Opciones.</label>
<div class="col-md-7">
<div class="md-checkbox-list">
<div class="md-checkbox"><input name="principal" type="checkbox" class="md-check" id="principal" value="si" <%if principal="si"then%>checked="checked"<%end if%>>
<label for="principal"> Web principal </label></div>
<div class="md-checkbox"><input name="visible" type="checkbox" class="md-check" id="visible" value="si" <%if cod="" then%>checked="checked"<%end if%> <%if visible="si"then%>checked="checked"<%end if%>><label for="visible"> Visible </label></div>
<div class="md-checkbox"><input name="categorias" type="checkbox" class="md-check" id="categorias" value="si" <%if cod="" then%>checked="checked"<%end if%> <%if categorias="si"then%>checked="checked"<%end if%>><label for="categorias"> Gestión Categorías </label></div>
<div class="md-checkbox"><input name="cursos_tipo" type="checkbox" class="md-check" id="cursos_tipo"  value="si" <%if cod="" then%>checked="checked"<%end if%> <%if cursos_tipo="si"then%>checked="checked"<%end if%>><label for="cursos_tipo"> Gestión Secciones </label></div>
<div class="md-checkbox"><input name="cursos_tipo_sub" type="checkbox" class="md-check" id="cursos_tipo_sub"  value="si" <%if cod="" then%>checked="checked"<%end if%> <%if cursos_tipo_sub="si"then%>checked="checked"<%end if%>><label for="cursos_tipo_sub"> Subsecciones Cursos </label></div>
<div class="md-checkbox"><input name="https" type="checkbox" class="md-check" id="https"  value="si" <%if https="si"then%>checked="checked"<%end if%>><label for="https"> https </label></div>
</div>
</div>
</div>
</div><!--col-md-6-->
</div><!--col-md-12-->
<div class="col-md-12">
<div class="form-group form-md-line-input"><label class="col-md-2 control-label margin-left-12" for="texto_esp">Descripción.</label>
<div class="col-md-8"><textarea class="form-control" name="texto_esp" id="texto_esp" rows="3"><%=texto_esp%></textarea></div>
</div>
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
</div><!--tab_1-->
<div class="tab-pane" id="tab_2" >
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="note note-info magin-top-0" ><h4 class="block">Datos para envíos automáticos de mails</h4><p><i class="fa fa-info-circle" aria-hidden="true"></i> Información para el envío de mails automáticos, regsitros de usuarios y funcionalidades del sistema. Si se deja en blanco o incompleto no funcionará el servicio de envío.</p></div>
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="f_smtp" >Host / smtp.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="f_smtp" id="f_smtp" maxlength="160" value="<%=f_smtp%>"><div class="form-control-focus"></div><i class="fa fa-hdd-o" aria-hidden="true"></i><span class="help-block">introduce el host smtp (ej. mail.dominio.com)</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="f_usuario" >Usuario mail.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="f_usuario" id="f_usuario" maxlength="160" value="<%=f_usuario%>"><div class="form-control-focus"></div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">introduce el usuario mail (ej. nombre@dominio.com)</span></div></div>
</div>
<!--IMAGEN-->
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label">Logo cabecera.</label>
<div class="col-md-8"><div class="input-group"><div class="input-icon"><i class="fa fa-picture-o" aria-hidden="true"></i><input id="archivo_2" class="form-control" type="field" name="archivo_[2]" placeholder="imagen (jpg, png, .gif)" autocomplete="off"></div><span class="input-group-btn"><button class="btn default" id="modal_2" type="button" onclick="javascript:archivo('Imagen',2);"><i class="fa fa-arrow-left fa-fw" /></i> Seleccionar</button></span></div></div></div>
<input type="hidden" class="form-control" placeholder="" name="orden_img_[2]" id="orden_img_2" maxlength="250" value="1">
<div class="form-group form-md-line-input" id="alt_2">
<label class="col-md-3 control-label" for="alt_2" >Título imagen.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_[2]" id="alt_2" maxlength="250" value="<%=alt_2%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
</div>
<div class="row" id="div_imagen_2"><!--SI SELECCIONAMOS-->
<div class="col-md-6">
<div class="form-group form-md-line-input" id="imagen_2">
<label class="col-md-6 control-label">Logo caberera.</label>
<div class="col-sm-4 col-md-5"><a href="#/" id="pop" onClick="modal_img_2();" class="thumbnail thumbs_p"><img src="<%=archivo_2%>" alt="100%x180"></a></div></div>
</div>
<div class="col-md-3">
<div class="form-group form-md-line-input" >
<span class="input-group-btn" id="anular_2"><button class="btn default" id="anular" type="button" onclick="javascript:anular_2();"><i class="fa fa-arrow-left fa-fw" /></i> Anular Imagen</button></span>
<div class="form-group form-md-line-input"  id="eliminar_2">
<label class="col-md-8 control-label" for="del_img_2">Eliminar Img.</label>
<div class="col-md-4"><div class="md-checkbox-list"><div class="md-checkbox"><input name="del_img_2" type="checkbox" class="md-check" id="del_img_2" value="si" ></div></div></div>
</div>
</div>
</div>
<div class="modal fade" id="imagemodal_2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
<h4 class="modal-title">Vista Previa</h4></div>
<div class="modal-body" style="text-align:center;"><img src="<%=archivo_2%>" id="imagepreview_2" style="width: 400px; margin:0 auto;" ></div>
<div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button></div>
</div>
</div>
</div>
<script>
function modal_img_2() { $('#imagemodal_2').modal('show'); };  //   MODAL IMAGEN 2
<%if archivo_2=""then%>
function anular_2(){$('#archivo_2').val("");$('#div_imagen_2').fadeOut("fast");}
<%else%>
function anular_2(){$('#archivo_2').val("");$('#anular_2').fadeOut("fast");$('#eliminar_2').fadeIn("fast");$('#imagen_2 img').attr('src','<%=archivo_2%>');$('#imagepreview_2').attr('src','<%=archivo_2%>');}
<%end if%>
<%if archivo_2=""then%>
$('#div_imagen_2').hide();$('#eliminar_2').hide();<%else%>
$('#eliminar_2').show();$("[name='del_img_2']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});$('#anular_2').hide();   // FIN  MODAL IMAGEN 2
<%end if%>
</script>
</div><!--row-->
<!--FIN IMAGEN-->
</div><!--col-md-5-->
<div class="col-md-6">
<div class="form-group form-md-line-input" id="f_email_a">
<label class="col-md-2 control-label" for="f_email" >Email.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="f_email" id="f_email" onKeyUp="resetea_error('f_email_a');" maxlength="160" value="<%=f_mail%>"><div class="form-control-focus"></div><i class="fa fa-envelope-o" aria-hidden="true"></i><span class="help-block">introduce la cuenta mail</span></div></div>
</div>
<div class="row">
<div class="col-md-5">
<div class="form-group form-md-line-input">
<label class="col-md-5 control-label" for="f_puerto" >Puerto.</label>
<div class="col-md-7"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="f_puerto" id="f_puerto" maxlength="160" value="<%=f_puerto%>"><div class="form-control-focus"></div><i class="fa fa-unlock" aria-hidden="true"></i><span class="help-block">587 ó 25</span></div></div>
</div>
</div>
<div class="col-md-3">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="f_ssl">SSL.</label>
<div class="col-md-8"><div class="md-checkbox-list"><div class="md-checkbox"><input name="f_ssl" type="checkbox" class="md-check" id="f_ssl" value="si" <%if f_ssl="si"then%>checked="checked"<%end if%>></div></div></div>
</div>
</div>
</div><!--row-->
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="f_pass" >Contraseña.</label>
<div class="col-md-8"><div class="input-icon"><input type="password" class="form-control" placeholder="" name="f_pass" id="f_pass" maxlength="160" value="<%=f_pass%>"><div class="form-control-focus"></div><i class="fa fa-key" aria-hidden="true"></i><span class="help-block">introduce la contraseña de la cuenta mail</span></div></div>
</div>
</div><!--col-md-5-->
<div class="col-md-9 margin-bottom-15">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="f_texto_legal">Texto legal [mails].</label>
<div class="col-md-8"><div class="input-icon"><textarea class="form-control" name="f_texto_legal" id="f_texto_legal" rows="2"><%=f_texto_legal%></textarea><div class="form-control-focus"></div><i class="fa fa-gavel" aria-hidden="true"></i><span class="help-block">texto legal para el footer de los mensajes</span></div></div>
</div>
</div>
<div class="col-md-12"><div class="note note-info"><h4 style="padding-top:9px">Datos de la empresa para contacto</h4></div></div>
<div class="col-md-6">
<div class="form-group form-md-line-input" id="email_a">
<label class="col-md-3 control-label" for="email_a" >Email de contacto.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="email" id="email" onKeyUp="resetea_error('email_a');" maxlength="160" value="<%=email%>"><div class="form-control-focus"></div><i class="fa fa-envelope-o" aria-hidden="true"></i><span class="help-block">mail de contacto</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="direccion" >Dirección.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="direccion" id="direccion" maxlength="160" value="<%=direccion%>"><div class="form-control-focus"></div><i class="fa fa-street-view" aria-hidden="true"></i></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="cod_postal" >Código Postal.</label>
<div class="col-md-4"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="cod_postal" id="cod_postal" maxlength="160" value="<%=cod_postal%>"><div class="form-control-focus"></div><i class="fa fa-envelope-square" aria-hidden="true"></i></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label" for="ciudad" >Ciudad.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="ciudad" id="ciudad" maxlength="160" value="<%=ciudad%>"><div class="form-control-focus"></div><i class="fa fa-map-pin" aria-hidden="true"></i></div></div>
</div>
</div><!--col-md-5-->
<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label " for="provincia">Provincia.</label>
<div class="col-md-8"><div class="input-icon">
<select name="provincia" id="provincia" multiple="multiple" placeholder="Selecciona una o varas provincias" >
<option value="ALAVA" <%if instr(provincia,"ALAVA")then%>selected<%end if%>>ALAVA</option>
<option value="ALBACETE" <%if instr(provincia,"ALBACETE")then%>selected<%end if%>>ALBACETE</option>
<option value="ALICANTE" <%if instr(provincia,"ALICANTE")then%>selected<%end if%>>ALICANTE</option>
<option value="ALMERIA" <%if instr(provincia,"ALMERIA")then%>selected<%end if%>>ALMERIA</option>
<option value="ASTURIAS" <%if instr(provincia,"ASTURIAS")then%>selected<%end if%>>ASTURIAS</option>
<option value="AVILA" <%if instr(provincia,"AVILA")then%>selected<%end if%>>AVILA</option>
<option value="BADAJOZ" <%if instr(provincia,"BADAJOZ")then%>selected<%end if%>>BADAJOZ</option>
<option value="BARCELONA" <%if instr(provincia,"BARCELONA")then%>selected<%end if%>>BARCELONA</option>
<option value="BURGOS" <%if instr(provincia,"BURGOS")then%>selected<%end if%>>BURGOS</option>
<option value="CACERES" <%if instr(provincia,"CACERES")then%>selected<%end if%>>CACERES</option>
<option value="CADIZ" <%if instr(provincia,"CADIZ")then%>selected<%end if%>>CADIZ</option>
<option value="CANTABRIA" <%if instr(provincia,"CANTABRIA")then%>selected<%end if%>>CANTABRIA</option>
<option value="CASTELLON" <%if instr(provincia,"CASTELLON")then%>selected<%end if%>>CASTELLON</option>
<option value="CEUTA" <%if instr(provincia,"CEUTA")then%>selected<%end if%>>CEUTA</option>
<option value="CIUDAD REAL" <%if instr(provincia,"CIUDAD REAL")then%>selected<%end if%>>CIUDAD REAL</option>
<option value="CORDOBA" <%if instr(provincia,"CORDOBA")then%>selected<%end if%>>CORDOBA</option>
<option value="CORU&Ntilde;A, A" <%if instr(provincia,"CORU&Ntilde;A, A")then%>selected<%end if%>>CORU&Ntilde;A, A</option>
<option value="CUENCA" <%if instr(provincia,"CUENCA")then%>selected<%end if%>>CUENCA</option>
<option value="GIRONA" <%if instr(provincia,"GIRONA")then%>selected<%end if%>>GIRONA</option>
<option value="GRANADA" <%if instr(provincia,"GRANADA")then%>selected<%end if%>>GRANADA</option>
<option value="GUADALAJARA" <%if instr(provincia,"GUADALAJARA")then%>selected<%end if%>>GUADALAJARA</option>
<option value="GUIPUZCOA" <%if instr(provincia,"GUIPUZCOA")then%>selected<%end if%>>GUIPUZCOA</option>
<option value="HUELVA" <%if instr(provincia,"HUELVA")then%>selected<%end if%>>HUELVA</option>
<option value="HUESCA" <%if instr(provincia,"HUESCA")then%>selected<%end if%>>HUESCA</option>
<option value="ILLES BALEARS" <%if instr(provincia,"ILLES BALEARS")then%>selected<%end if%>>ILLES BALEARS</option>
<option value="JAEN" <%if instr(provincia,"JAEN")then%>selected<%end if%>>JAEN</option>
<option value="LEON" <%if instr(provincia,"LEON")then%>selected<%end if%>>LEON</option>
<option value="LLEIDA" <%if instr(provincia,"LLEIDA")then%>selected<%end if%>>LLEIDA</option>
<option value="LUGO" <%if instr(provincia,"LUGO")then%>selected<%end if%>>LUGO</option>
<option value="MADRID" <%if instr(provincia,"MADRID")then%>selected<%end if%>>MADRID</option>
<option value="MALAGA" <%if instr(provincia,"MALAGA")then%>selected<%end if%>>MALAGA</option>
<option value="MELILLA" <%if instr(provincia,"MELILLA")then%>selected<%end if%>>MELILLA</option>
<option value="MURCIA" <%if instr(provincia,"MURCIA")then%>selected<%end if%>>MURCIA</option>
<option value="NAVARRA" <%if instr(provincia,"NAVARRA")then%>selected<%end if%>>NAVARRA</option>
<option value="OURENSE" <%if instr(provincia,"OURENSE")then%>selected<%end if%>>OURENSE</option>
<option value="PALENCIA" <%if instr(provincia,"PALENCIA")then%>selected<%end if%>>PALENCIA</option>
<option value="PALMAS, LAS" <%if instr(provincia,"PALMAS, LAS")then%>selected<%end if%>>PALMAS, LAS</option>
<option value="PONTEVEDRA" <%if instr(provincia,"PONTEVEDRA")then%>selected<%end if%>>PONTEVEDRA</option>
<option value="RIOJA, LA" <%if instr(provincia,"RIOJA, LA")then%>selected<%end if%>>RIOJA, LA</option>
<option value="SALAMANCA" <%if instr(provincia,"SALAMANCA")then%>selected<%end if%>>SALAMANCA</option>
<option value="SANTA CRUZ DE TENERIFE" <%if instr(provincia,"SANTA CRUZ DE TENERIFE")then%>selected<%end if%>>SANTA CRUZ DE TENERIFE</option>
<option value="SEGOVIA" <%if instr(provincia,"SEGOVIA")then%>selected<%end if%>>SEGOVIA</option>
<option value="SEVILLA" <%if instr(provincia,"SEVILLA")then%>selected<%end if%>>SEVILLA</option>
<option value="SORIA" <%if instr(provincia,"SORIA")then%>selected<%end if%>>SORIA</option>
<option value="TARRAGONA" <%if instr(provincia,"TARRAGONA")then%>selected<%end if%>>TARRAGONA</option>
<option value="TERUEL" <%if instr(provincia,"TERUEL")then%>selected<%end if%>>TERUEL</option>
<option value="TOLEDO" <%if instr(provincia,"TOLEDO")then%>selected<%end if%>>TOLEDO</option>
<option value="VALENCIA" <%if instr(provincia,"VALENCIA")then%>selected<%end if%>>VALENCIA</option>
<option value="VALLADOLID" <%if instr(provincia,"VALLADOLID")then%>selected<%end if%>>VALLADOLID</option>
<option value="VIZCAYA" <%if instr(provincia,"VIZCAYA")then%>selsected<%end if%>>VIZCAYA</option>
<option value="ZAMORA" <%if instr(provincia,"ZAMORA")then%>selected<%end if%>>ZAMORA</option>
<option value="ZARAGOZA" <%if instr(provincia,"ZARAGOZA")then%>selected<%end if%>>ZARAGOZA</option>
<option value="OTRAS" <%if instr(provincia,"OTRAS")then%>selected<%end if%>>OTRAS</option></select>
<i class="fa fa-map-marker" aria-hidden="true"></i></div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="pais" >País.</label>
<div class="col-md-8"><div class="input-icon">
<select name="pais" id="pais" multiple="multiple">
<option value='ad' <%if instr(pais,"ad")then%>selsected<%end if%>>Andorra</option>
<option value='ae' <%if instr(pais,"ae") then%>Selected<%end if%>>United Arab Emirates</option>
<option value='af' <%if instr(pais,"af") then%>Selected<%end if%>>Afghanistan</option>
<option value='ag' <%if instr(pais,"ag") then%>Selected<%end if%>>Antigua and Barbuda</option>
<option value='ai' <%if instr(pais,"ai") then%>Selected<%end if%>>Anguilla</option>
<option value='al' <%if instr(pais,"al") then%>Selected<%end if%>>Albania</option>
<option value='am' <%if instr(pais,"am") then%>Selected<%end if%>>Armenia</option>
<option value='an' <%if instr(pais,"an") then%>Selected<%end if%>>Netherlands Antilles</option>
<option value='ao' <%if instr(pais,"ao") then%>Selected<%end if%>>Angola</option>
<option value='aq' <%if instr(pais,"aq") then%>Selected<%end if%>>Antarctica</option>
<option value='ar' <%if instr(pais,"ar") then%>Selected<%end if%>>Argentina</option>
<option value='as' <%if instr(pais,"as") then%>Selected<%end if%>>American Samoa</option>
<option value='at' <%if instr(pais,"at") then%>Selected<%end if%>>Austria</option>
<option value='au' <%if instr(pais,"au") then%>Selected<%end if%>>Australia</option>
<option value='aw' <%if instr(pais,"aw") then%>Selected<%end if%>>Aruba</option>
<option value='ax' <%if instr(pais,"ax") then%>Selected<%end if%>>Aland Islands</option>
<option value='az' <%if instr(pais,"az") then%>Selected<%end if%>>Azerbaijan</option>
<option value='ba' <%if instr(pais,"ba") then%>Selected<%end if%>>Bosnia and Herzegovina</option>
<option value='bb' <%if instr(pais,"bb") then%>Selected<%end if%>>Barbados</option>
<option value='bd' <%if instr(pais,"bd") then%>Selected<%end if%>>Bangladesh</option>
<option value='be' <%if instr(pais,"be") then%>Selected<%end if%>>Belgium</option>
<option value='bf' <%if instr(pais,"bf") then%>Selected<%end if%>>Burkina Faso</option>
<option value='bg' <%if instr(pais,"bg") then%>Selected<%end if%>>Bulgaria</option>
<option value='bh' <%if instr(pais,"bh") then%>Selected<%end if%>>Bahrain</option>
<option value='bi' <%if instr(pais,"bi") then%>Selected<%end if%>>Burundi</option>
<option value='bj' <%if instr(pais,"bj") then%>Selected<%end if%>>Benin</option>
<option value='bm' <%if instr(pais,"bm") then%>Selected<%end if%>>Bermuda</option>
<option value='bn' <%if instr(pais,"bn") then%>Selected<%end if%>>Brunei Darussalam</option>
<option value='bo' <%if instr(pais,"bo") then%>Selected<%end if%>>Bolivia</option>
<option value='br' <%if instr(pais,"br") then%>Selected<%end if%>>Brazil</option>
<option value='bs' <%if instr(pais,"bs") then%>Selected<%end if%>>Bahamas</option>
<option value='bt' <%if instr(pais,"bt") then%>Selected<%end if%>>Bhutan</option>
<option value='bv' <%if instr(pais,"bv") then%>Selected<%end if%>>Bouvet Island</option>
<option value='bw' <%if instr(pais,"bw") then%>Selected<%end if%>>Botswana</option>
<option value='by' <%if instr(pais,"by") then%>Selected<%end if%>>Belarus</option>
<option value='bz' <%if instr(pais,"bz") then%>Selected<%end if%>>Belize</option>
<option value='ca' <%if instr(pais,"ca") then%>Selected<%end if%>>Canada</option>
<option value='cc' <%if instr(pais,"cc") then%>Selected<%end if%>>Cocos (Keeling) Islands</option>
<option value='cd' <%if instr(pais,"cd") then%>Selected<%end if%>>Democratic Republic of the Congo</option>
<option value='cf' <%if instr(pais,"cf") then%>Selected<%end if%>>Central African Republic</option>
<option value='cg' <%if instr(pais,"cg") then%>Selected<%end if%>>Congo</option>
<option value='ch' <%if instr(pais,"ch") then%>Selected<%end if%>>Switzerland</option>
<option value='ci' <%if instr(pais,"ci") then%>Selected<%end if%>>Cote D'Ivoire (Ivory Coast)</option>
<option value='ck' <%if instr(pais,"ck") then%>Selected<%end if%>>Cook Islands</option>
<option value='cl' <%if instr(pais,"cl") then%>Selected<%end if%>>Chile</option>
<option value='cm' <%if instr(pais,"cm") then%>Selected<%end if%>>Cameroon</option>
<option value='cn' <%if instr(pais,"cn") then%>Selected<%end if%>>China</option>
<option value='co' <%if instr(pais,"co") then%>Selected<%end if%>>Colombia</option>
<option value='cr' <%if instr(pais,"cr") then%>Selected<%end if%>>Costa Rica</option>
<option value='cs' <%if instr(pais,"cs") then%>Selected<%end if%>>Serbia and Montenegro</option>
<option value='cu' <%if instr(pais,"cu") then%>Selected<%end if%>>Cuba</option>
<option value='cv' <%if instr(pais,"cv") then%>Selected<%end if%>>Cape Verde</option>
<option value='cx' <%if instr(pais,"cx") then%>Selected<%end if%>>Christmas Island</option>
<option value='cy' <%if instr(pais,"cy") then%>Selected<%end if%>>Cyprus</option>
<option value='cz' <%if instr(pais,"cz") then%>Selected<%end if%>>Czech Republic</option>
<option value='de' <%if instr(pais,"de") then%>Selected<%end if%>>Germany</option>
<option value='dj' <%if instr(pais,"dj") then%>Selected<%end if%>>Djibouti</option>
<option value='dk' <%if instr(pais,"dk") then%>Selected<%end if%>>Denmark</option>
<option value='dm' <%if instr(pais,"dm") then%>Selected<%end if%>>Dominica</option>
<option value='do' <%if instr(pais,"do") then%>Selected<%end if%>>Dominican Republic</option>
<option value='dz' <%if instr(pais,"dz") then%>Selected<%end if%>>Algeria</option>
<option value='ec' <%if instr(pais,"ec") then%>Selected<%end if%>>Ecuador</option>
<option value='ee' <%if instr(pais,"ee") then%>Selected<%end if%>>Estonia</option>
<option value='eg' <%if instr(pais,"eg") then%>Selected<%end if%>>Egypt</option>
<option value='eh' <%if instr(pais,"eh") then%>Selected<%end if%>>Western Sahara</option>
<option value='er' <%if instr(pais,"er") then%>Selected<%end if%>>Eritrea</option>
<option value='es' <%if instr(pais,"es") then%>Selected<%end if%>>Espana / Spain</option>
<option value='et' <%if instr(pais,"et") then%>Selected<%end if%>>Ethiopia</option>
<option value='fi' <%if instr(pais,"fi") then%>Selected<%end if%>>Finland</option>
<option value='fj' <%if instr(pais,"fj") then%>Selected<%end if%>>Fiji</option>
<option value='fk' <%if instr(pais,"fk") then%>Selected<%end if%>>Falkland Islands (Malvinas)</option>
<option value='fm' <%if instr(pais,"fm") then%>Selected<%end if%>>Federated States of Micronesia</option>
<option value='fo' <%if instr(pais,"fo") then%>Selected<%end if%>>Faroe Islands</option>
<option value='fr' <%if instr(pais,"fr") then%>Selected<%end if%>>France</option>
<option value='fx' <%if instr(pais,"fx") then%>Selected<%end if%>>France, Metropolitan</option>
<option value='ga' <%if instr(pais,"ga") then%>Selected<%end if%>>Gabon</option>
<option value='gb' <%if instr(pais,"gb") then%>Selected<%end if%>>Great Britain (UK)</option>
<option value='gd' <%if instr(pais,"gd") then%>Selected<%end if%>>Grenada</option>
<option value='ge' <%if instr(pais,"ge") then%>Selected<%end if%>>Georgia</option>
<option value='gf' <%if instr(pais,"gf") then%>Selected<%end if%>>French Guiana</option>
<option value='gh' <%if instr(pais,"gh") then%>Selected<%end if%>>Ghana</option>
<option value='gi' <%if instr(pais,"gi") then%>Selected<%end if%>>Gibraltar</option>
<option value='gl' <%if instr(pais,"gl") then%>Selected<%end if%>>Greenland</option>
<option value='gm' <%if instr(pais,"gm") then%>Selected<%end if%>>Gambia</option>
<option value='gn' <%if instr(pais,"gn") then%>Selected<%end if%>>Guinea</option>
<option value='gp' <%if instr(pais,"gp") then%>Selected<%end if%>>Guadeloupe</option>
<option value='gq' <%if instr(pais,"gq") then%>Selected<%end if%>>Equatorial Guinea</option>
<option value='gr' <%if instr(pais,"gr") then%>Selected<%end if%>>Greece</option>
<option value='gs' <%if instr(pais,"gs") then%>Selected<%end if%>>S. Georgia and S. Sandwich Islands</option>
<option value='gt' <%if instr(pais,"gt") then%>Selected<%end if%>>Guatemala</option>
<option value='gu' <%if instr(pais,"gu") then%>Selected<%end if%>>Guam</option>
<option value='gw' <%if instr(pais,"gw") then%>Selected<%end if%>>Guinea-Bissau</option>
<option value='gy' <%if instr(pais,"gy") then%>Selected<%end if%>>Guyana</option>
<option value='hk' <%if instr(pais,"hk") then%>Selected<%end if%>>Hong Kong</option>
<option value='hm' <%if instr(pais,"hm") then%>Selected<%end if%>>Heard Island and McDonald Islands</option>
<option value='hn' <%if instr(pais,"hn") then%>Selected<%end if%>>Honduras</option>
<option value='hr' <%if instr(pais,"hr") then%>Selected<%end if%>>Croatia (Hrvatska)</option>
<option value='ht' <%if instr(pais,"ht") then%>Selected<%end if%>>Haiti</option>
<option value='hu' <%if instr(pais,"hu") then%>Selected<%end if%>>Hungary</option>
<option value='id' <%if instr(pais,"id") then%>Selected<%end if%>>Indonesia</option>
<option value='ie' <%if instr(pais,"ie") then%>Selected<%end if%>>Ireland</option>
<option value='il' <%if instr(pais,"il") then%>Selected<%end if%>>Israel</option>
<option value='in' <%if instr(pais,"in") then%>Selected<%end if%>>India</option>
<option value='io' <%if instr(pais,"io") then%>Selected<%end if%>>British Indian Ocean Territory</option>
<option value='iq' <%if instr(pais,"iq") then%>Selected<%end if%>>Iraq</option>
<option value='ir' <%if instr(pais,"ir") then%>Selected<%end if%>>Iran</option>
<option value='is' <%if instr(pais,"is") then%>Selected<%end if%>>Iceland</option>
<option value='it' <%if instr(pais,"it") then%>Selected<%end if%>>Italy</option>
<option value='jm' <%if instr(pais,"jm") then%>Selected<%end if%>>Jamaica</option>
<option value='jo' <%if instr(pais,"jo") then%>Selected<%end if%>>Jordan</option>
<option value='jp' <%if instr(pais,"jp") then%>Selected<%end if%>>Japan</option>
<option value='ke' <%if instr(pais,"ke") then%>Selected<%end if%>>Kenya</option>
<option value='kg' <%if instr(pais,"kg") then%>Selected<%end if%>>Kyrgyzstan</option>
<option value='kh' <%if instr(pais,"kh") then%>Selected<%end if%>>Cambodia</option>
<option value='ki' <%if instr(pais,"ki") then%>Selected<%end if%>>Kiribati</option>
<option value='km' <%if instr(pais,"km") then%>Selected<%end if%>>Comoros</option>
<option value='kn' <%if instr(pais,"kn") then%>Selected<%end if%>>Saint Kitts and Nevis</option>
<option value='kp' <%if instr(pais,"kp") then%>Selected<%end if%>>Korea (North)</option>
<option value='kr' <%if instr(pais,"kr") then%>Selected<%end if%>>Korea (South)</option>
<option value='kw' <%if instr(pais,"kw") then%>Selected<%end if%>>Kuwait</option>
<option value='ky' <%if instr(pais,"ky") then%>Selected<%end if%>>Cayman Islands</option>
<option value='kz' <%if instr(pais,"kz") then%>Selected<%end if%>>Kazakhstan</option>
<option value='la' <%if instr(pais,"la") then%>Selected<%end if%>>Laos</option>
<option value='lb' <%if instr(pais,"lb") then%>Selected<%end if%>>Lebanon</option>
<option value='lc' <%if instr(pais,"lc") then%>Selected<%end if%>>Saint Lucia</option>
<option value='li' <%if instr(pais,"li") then%>Selected<%end if%>>Liechtenstein</option>
<option value='lk' <%if instr(pais,"lk") then%>Selected<%end if%>>Sri Lanka</option>
<option value='lr' <%if instr(pais,"lr") then%>Selected<%end if%>>Liberia</option>
<option value='ls' <%if instr(pais,"ls") then%>Selected<%end if%>>Lesotho</option>
<option value='lt' <%if instr(pais,"lt") then%>Selected<%end if%>>Lithuania</option>
<option value='lu' <%if instr(pais,"lu") then%>Selected<%end if%>>Luxembourg</option>
<option value='lv' <%if instr(pais,"lv") then%>Selected<%end if%>>Latvia</option>
<option value='ly' <%if instr(pais,"ly") then%>Selected<%end if%>>Libya</option>
<option value='ma' <%if instr(pais,"ma") then%>Selected<%end if%>>Morocco</option>
<option value='mc' <%if instr(pais,"mc") then%>Selected<%end if%>>Monaco</option>
<option value='md' <%if instr(pais,"md") then%>Selected<%end if%>>Moldova</option>
<option value='mg' <%if instr(pais,"mg") then%>Selected<%end if%>>Madagascar</option>
<option value='mh' <%if instr(pais,"mh") then%>Selected<%end if%>>Marshall Islands</option>
<option value='mk' <%if instr(pais,"mk") then%>Selected<%end if%>>Macedonia</option>
<option value='ml' <%if instr(pais,"ml") then%>Selected<%end if%>>Mali</option>
<option value='mm' <%if instr(pais,"mm") then%>Selected<%end if%>>Myanmar</option>
<option value='mn' <%if instr(pais,"mn") then%>Selected<%end if%>>Mongolia</option>
<option value='mo' <%if instr(pais,"mo") then%>Selected<%end if%>>Macao</option>
<option value='mp' <%if instr(pais,"mp") then%>Selected<%end if%>>Northern Mariana Islands</option>
<option value='mq' <%if instr(pais,"mq") then%>Selected<%end if%>>Martinique</option>
<option value='mr' <%if instr(pais,"mr") then%>Selected<%end if%>>Mauritania</option>
<option value='ms' <%if instr(pais,"ms") then%>Selected<%end if%>>Montserrat</option>
<option value='mt' <%if instr(pais,"mt") then%>Selected<%end if%>>Malta</option>
<option value='mu' <%if instr(pais,"mu") then%>Selected<%end if%>>Mauritius</option>
<option value='mv' <%if instr(pais,"mv") then%>Selected<%end if%>>Maldives</option>
<option value='mw' <%if instr(pais,"mw") then%>Selected<%end if%>>Malawi</option>
<option value='mx' <%if instr(pais,"mx") then%>Selected<%end if%>>Mexico</option>
<option value='my' <%if instr(pais,"my") then%>Selected<%end if%>>Malaysia</option>
<option value='mz' <%if instr(pais,"mz") then%>Selected<%end if%>>Mozambique</option>
<option value='na' <%if instr(pais,"na") then%>Selected<%end if%>>Namibia</option>
<option value='nc' <%if instr(pais,"nc") then%>Selected<%end if%>>New Caledonia</option>
<option value='ne' <%if instr(pais,"ne") then%>Selected<%end if%>>Niger</option>
<option value='nf' <%if instr(pais,"nf") then%>Selected<%end if%>>Norfolk Island</option>
<option value='ng' <%if instr(pais,"ng") then%>Selected<%end if%>>Nigeria</option>
<option value='ni' <%if instr(pais,"ni") then%>Selected<%end if%>>Nicaragua</option>
<option value='nl' <%if instr(pais,"nl") then%>Selected<%end if%>>Netherlands</option>
<option value='no' <%if instr(pais,"no") then%>Selected<%end if%>>Norway</option>
<option value='np' <%if instr(pais,"np") then%>Selected<%end if%>>Nepal</option>
<option value='nr' <%if instr(pais,"nr") then%>Selected<%end if%>>Nauru</option>
<option value='nu' <%if instr(pais,"nu") then%>Selected<%end if%>>Niue</option>
<option value='nz' <%if instr(pais,"nz") then%>Selected<%end if%>>New Zealand (Aotearoa)</option>
<option value='om' <%if instr(pais,"om") then%>Selected<%end if%>>Oman</option>
<option value='pa' <%if instr(pais,"pa") then%>Selected<%end if%>>Panama</option>
<option value='pe' <%if instr(pais,"pe") then%>Selected<%end if%>>Peru</option>
<option value='pf' <%if instr(pais,"pf") then%>Selected<%end if%>>French Polynesia</option>
<option value='pg' <%if instr(pais,"pg") then%>Selected<%end if%>>Papua New Guinea</option>
<option value='ph' <%if instr(pais,"ph") then%>Selected<%end if%>>Philippines</option>
<option value='pk' <%if instr(pais,"pk") then%>Selected<%end if%>>Pakistan</option>
<option value='pl' <%if instr(pais,"pl") then%>Selected<%end if%>>Poland</option>
<option value='pm' <%if instr(pais,"pm") then%>Selected<%end if%>>Saint Pierre and Miquelon</option>
<option value='pn' <%if instr(pais,"pn") then%>Selected<%end if%>>Pitcairn</option>
<option value='pr' <%if instr(pais,"pr") then%>Selected<%end if%>>Puerto Rico</option>
<option value='ps' <%if instr(pais,"ps") then%>Selected<%end if%>>Palestinian Territory</option>
<option value='pt' <%if instr(pais,"pt") then%>Selected<%end if%>>Portugal</option>
<option value='pw' <%if instr(pais,"pw") then%>Selected<%end if%>>Palau</option>
<option value='py' <%if instr(pais,"py") then%>Selected<%end if%>>Paraguay</option>
<option value='qa' <%if instr(pais,"qa") then%>Selected<%end if%>>Qatar</option>
<option value='re' <%if instr(pais,"re") then%>Selected<%end if%>>Reunion</option>
<option value='ro' <%if instr(pais,"ro") then%>Selected<%end if%>>Romania</option>
<option value='ru' <%if instr(pais,"ru") then%>Selected<%end if%>>Russian Federation</option>
<option value='rw' <%if instr(pais,"rw") then%>Selected<%end if%>>Rwanda</option>
<option value='sa' <%if instr(pais,"sa") then%>Selected<%end if%>>Saudi Arabia</option>
<option value='sb' <%if instr(pais,"sb") then%>Selected<%end if%>>Solomon Islands</option>
<option value='sc' <%if instr(pais,"sc") then%>Selected<%end if%>>Seychelles</option>
<option value='sd' <%if instr(pais,"sd") then%>Selected<%end if%>>Sudan</option>
<option value='se' <%if instr(pais,"se") then%>Selected<%end if%>>Sweden</option>
<option value='sg' <%if instr(pais,"sg") then%>Selected<%end if%>>Singapore</option>
<option value='sh' <%if instr(pais,"sh") then%>Selected<%end if%>>Saint Helena</option>
<option value='si' <%if instr(pais,"si") then%>Selected<%end if%>>Slovenia</option>
<option value='sj' <%if instr(pais,"sj") then%>Selected<%end if%>>Svalbard and Jan Mayen</option>
<option value='sk' <%if instr(pais,"sk") then%>Selected<%end if%>>Slovakia</option>
<option value='sl' <%if instr(pais,"sl") then%>Selected<%end if%>>Sierra Leone</option>
<option value='sm' <%if instr(pais,"sm") then%>Selected<%end if%>>San Marino</option>
<option value='sn' <%if instr(pais,"sn") then%>Selected<%end if%>>Senegal</option>
<option value='so' <%if instr(pais,"so") then%>Selected<%end if%>>Somalia</option>
<option value='sr' <%if instr(pais,"sr") then%>Selected<%end if%>>Suriname</option>
<option value='st' <%if instr(pais,"st") then%>Selected<%end if%>>Sao Tome and Principe</option>
<option value='su' <%if instr(pais,"su") then%>Selected<%end if%>>USSR (former)</option>
<option value='sv' <%if instr(pais,"sv") then%>Selected<%end if%>>El Salvador</option>
<option value='sy' <%if instr(pais,"sy") then%>Selected<%end if%>>Syria</option>
<option value='sz' <%if instr(pais,"sz") then%>Selected<%end if%>>Swaziland</option>
<option value='tc' <%if instr(pais,"tc") then%>Selected<%end if%>>Turks and Caicos Islands</option>
<option value='td' <%if instr(pais,"td") then%>Selected<%end if%>>Chad</option>
<option value='tf' <%if instr(pais,"tf") then%>Selected<%end if%>>French Southern Territories</option>
<option value='tg' <%if instr(pais,"tg") then%>Selected<%end if%>>Togo</option>
<option value='th' <%if instr(pais,"th") then%>Selected<%end if%>>Thailand</option>
<option value='tj' <%if instr(pais,"tj") then%>Selected<%end if%>>Tajikistan</option>
<option value='tk' <%if instr(pais,"tk") then%>Selected<%end if%>>Tokelau</option>
<option value='tl' <%if instr(pais,"tl") then%>Selected<%end if%>>Timor-Leste</option>
<option value='tm' <%if instr(pais,"tm") then%>Selected<%end if%>>Turkmenistan</option>
<option value='tn' <%if instr(pais,"tn") then%>Selected<%end if%>>Tunisia</option>
<option value='to' <%if instr(pais,"to") then%>Selected<%end if%>>Tonga</option>
<option value='tp' <%if instr(pais,"tp") then%>Selected<%end if%>>East Timor</option>
<option value='tr' <%if instr(pais,"tr") then%>Selected<%end if%>>Turkey</option>
<option value='tt' <%if instr(pais,"tt") then%>Selected<%end if%>>Trinidad and Tobago</option>
<option value='tv' <%if instr(pais,"tv") then%>Selected<%end if%>>Tuvalu</option>
<option value='tw' <%if instr(pais,"tw") then%>Selected<%end if%>>Taiwan</option>
<option value='tz' <%if instr(pais,"tz") then%>Selected<%end if%>>Tanzania</option>
<option value='ua' <%if instr(pais,"ua") then%>Selected<%end if%>>Ukraine</option>
<option value='ug' <%if instr(pais,"ug") then%>Selected<%end if%>>Uganda</option>
<option value='uk' <%if instr(pais,"uk") then%>Selected<%end if%>>United Kingdom</option>
<option value='um' <%if instr(pais,"um") then%>Selected<%end if%>>United States Minor Outlying Islands</option>
<option value='us' <%if instr(pais,"us") then%>Selected<%end if%>>United States</option>
<option value='uy' <%if instr(pais,"uy") then%>Selected<%end if%>>Uruguay</option>
<option value='uz' <%if instr(pais,"uz") then%>Selected<%end if%>>Uzbekistan</option>
<option value='va' <%if instr(pais,"va") then%>Selected<%end if%>>Vatican City State (Holy See)</option>
<option value='vc' <%if instr(pais,"vc") then%>Selected<%end if%>>Saint Vincent and the Grenadines</option>
<option value='ve' <%if instr(pais,"ve") then%>Selected<%end if%>>Venezuela</option>
<option value='vg' <%if instr(pais,"vg") then%>Selected<%end if%>>Virgin Islands (British)</option>
<option value='vi' <%if instr(pais,"vi") then%>Selected<%end if%>>Virgin Islands (U.S.)</option>
<option value='vn' <%if instr(pais,"vn") then%>Selected<%end if%>>Viet Nam</option>
<option value='vu' <%if instr(pais,"vu") then%>Selected<%end if%>>Vanuatu</option>
<option value='wf' <%if instr(pais,"wf") then%>Selected<%end if%>>Wallis and Futuna</option>
<option value='ws' <%if instr(pais,"ws") then%>Selected<%end if%>>Samoa</option>
<option value='ye' <%if instr(pais,"ye") then%>Selected<%end if%>>Yemen</option>
<option value='yt' <%if instr(pais,"yt") then%>Selected<%end if%>>Mayotte</option>
<option value='yu' <%if instr(pais,"yu") then%>Selected<%end if%>>Yugoslavia (former)</option>
<option value='za' <%if instr(pais,"za") then%>Selected<%end if%>>South Africa</option>
<option value='zm' <%if instr(pais,"zm") then%>Selected<%end if%>>Zambia</option>
<option value='zr' <%if instr(pais,"zr") then%>Selected<%end if%>>Zaire (former)</option>
<option value='zw' <%if instr(pais,"zw") then%>Selected<%end if%>>Zimbabwe</option></select>
<div class="form-control-focus"> </div>
<i class="fa fa-globe" aria-hidden="true"></i></div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="telefono" >Teléfono.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="telefono" id="telefono" maxlength="160" value="<%=telefono%>"><div class="form-control-focus"></div><i class="fa fa-phone" aria-hidden="true"></i></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="datos_complementarios" >Otros datos.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="datos_complementarios" id="datos_complementarios" maxlength="250" value="<%=datos_complementarios%>"><div class="form-control-focus"></div><i class="fa fa-pencil" aria-hidden="true"></i></div></div>
</div>
</div><!--col-md-5-->
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
</div><!--tab_2-->
<div class="tab-pane" id="tab_3" style="display:none">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="form-group form-md-line-input" id="url_a">
<label class="col-md-2 control-label" for="url_esp">URL.<span class="required">*</span></label>
<div class="col-md-6"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="url" id="url" onkeyup="resetea_error('url_a')" maxlength="250" value="<%=url%>"><div class="form-control-focus"></div><i class="fa fa-link" aria-hidden="true"></i><span class="help-block">debes introducir una URL completa (http://www.dominio.tld)</span></div></div>
</div>
<div class="form-group form-md-line-input" id="titulo_esp_a">
<label class="col-md-2 control-label" for="meta_title" >[meta] Título.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="meta_title" id="meta_title" maxlength="65" value="<%=meta_title%>"><div class="form-control-focus"></div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">debes introducir un título descriptivo de unos 65 caracteres</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="meta_desc">[meta] Descripción.</label>
<div class="col-md-8"><div class="input-icon"><textarea class="form-control" name="meta_desc" id="meta_desc" rows="2" maxlength="160"> <%=meta_desc%></textarea><div class="form-control-focus"></div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">debes introducir una descripción concisa de unos 160 caracteres</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="f_texto_legal">[meta] Keywords.</label>
<div class="col-md-8"><div class="input-icon"><textarea class="form-control" name="meta_key" id="meta_key" rows="2"><%=meta_key%></textarea><div class="form-control-focus"></div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">palabras clave separadas por comas</span></div></div>
</div>
</div><!--col-md-12-->
</div><!--row-->
</div><!--form-body-->
</div><!--tab_3-->
</div><!--tab-content-->
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-sm-offset-5 col-md-12">
<button type="button" class="btn green<%if sel_div<>"si" then%> disabled<%end if%>" <%if sel_div="si" then%>onclick="Enviar_webs(this.form);"<%end if%> value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<%if edi="" then%><a href="<%=r%>webs/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%>
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
<div class="modal fade" id="externo1" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i>  Listado de Cursos actuales</h4>
</div>
<div class="modal-body" id="alerta_txt"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=&ntres=&ncuat="))%><iframe src="<%=r%>items/listado_iframe.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=&ntres=&ncuat=")%>" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<div class="modal fade" id="division_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear División de Negocio</h4>
</div>
<div class="modal-body" id="alerta_txt"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ad&ndos=con&ntres=dn&ncuat=&edi=rap"))%><iframe src="<%=r%>divisiones/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ad&ndos=con&ntres=dn&ncuat=&edi=rap")%>" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<button type="button" class="btn blue btn-outline" onClick="recargar();">Actualizar</button>
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<script src="/gestor/ckfinder/libs/sf.js"></script>
<script src="/gestor/ckfinder/libs/tree-a.js"></script>
<script src="<%=r%>ckeditor/ckeditor.js"></script>
<script src="/gestor/ckfinder/ckfinder.js"></script>
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<script src="<%=r%>lib/js/url_amigable.js"></script>
<link href="<%=r%>lib/app/jquery-notific8/jquery.notific8.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/app/jquery-notific8/jquery.notific8.min.js" type="text/javascript"></script>
<script>
CKEDITOR.replace('texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Basica'});$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$('#multiple').select2({maximumSelectionLength: 5});;})
$("[name='visible'],[name='categorias'],[name='cursos_tipo'],[name='cursos_tipo_sub'],[name='f_ssl'],[name='https'],[name='principal']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
function urlea_esp(){document.getElementById("url_esp").value = document.getElementById("titulo_esp").value.slugify();}
function urlea_esp_inf(){document.getElementById("url_esp").value=document.getElementById("url_esp").value.slugify();}
var limita=function(){
var a=function(){
$("#titulo_esp").maxlength({limitReachedClass:"label label-danger"}),
$("#url").maxlength({limitReachedClass:"label label-danger"}),
$("#meta_title").maxlength({limitReachedClass:"label label-danger"}),
$("#datos_complementarios").maxlength({limitReachedClass:"label label-danger"}),
$("#meta_desc").maxlength({limitReachedClass:"label label-danger"})
};return{init:function(){a()}}}();jQuery(document).ready(function(){limita.init()});
function recargar() {location.reload();}
</script>
<!--#include file="../comun/menu_sup.asp"-->  
<%if cod<>""then
Sql= "SELECT id_seccion, id_archivo from rel where id_seccion="&cod&" and id_archivo<>0" '[IMAGENES VIDEOS TOTALES]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
num_img_tot=ob_rs.RecordCount 
end if
ob_rs.close
Sql= "SELECT titulo_esp,texto_esp,url_esp,meta_title,meta_key,meta_desc,visible,disponible,destacado,fecha_in,orden,en_menu from secciones where id_seccion="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
titulo_esp=ob_rs("titulo_esp")
texto_esp=ob_rs("texto_esp")
url_esp=ob_rs("url_esp")
meta_title=ob_rs("meta_title")
meta_key=ob_rs("meta_key")
meta_desc=ob_rs("meta_desc")
visible=ob_rs("visible")
disponible=ob_rs("disponible")
destacado=ob_rs("destacado")
fecha_in=ob_rs("fecha_in")
orden_sec=ob_rs("orden")
en_menu=ob_rs("en_menu")
end if
ob_rs.close
Sql= "SELECT id_seccion, id_archivo from rel where id_seccion="&cod&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
Dim archivo_(20),alt_(20),orden_img_(20)
do while not ob_rs.eof
id_archivo=ob_rs("id_archivo")
	if id_archivo<>""then
	Sql2= "SELECT id_archivo, campo, nombre, alt, orden from archivos where id_archivo="&id_archivo&""
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
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
ob_rs.close 'ob_conn.close
end if '[FIN RECOGEMOS DATOS SI MODIFICACION]%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión Secciones Cursos | <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>secciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado Secciones Cursos</a></li>
<li class="active">Gestión Seciones Cursos</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<%if edi=""then%><div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%><a href="<%=r%>secciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i> Listado Secciones<%if num_s<>""then%><span class="baddge badge badge-default"> <%=num_s%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión Secciones</a></li>
<%if subseccion_on="si"then%><li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat="))%>
<a href="<%=r%>subSecciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=ss&ncuat=")%>"><i class="icon-note"></i> Subsecciones Cursos
<%if num_ss<>""then%><span class="baddge badge badge-default"> <%=num_ss%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li><%end if%>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat="&ncuat))%><a href="<%=r%>categorias/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat="&ncuat)%>"><i class="icon-note"></i> Gestión Categorías<%if num_c<>""then%><span class="baddge badge badge-default"> <%=num_c%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ad&ndos=con&ntres=w&ncuat="))%>
<a href="<%=r%>webs/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ad&ndos=con&ntres=w&ncuat=")%>"><i class="icon-note"></i> Gestión Webs <%if num_w<>""then%><span class="baddge badge badge-default"> <%=num_w%> </span><%else%><span class="baddge badge badge-danger"> 0 </span><%end if%></a></li>
<li><a href="javascript:modal_programas();"><i class="icon-share-alt"></i> Listar Programas <%if num_it<>""then%><span class="baddge badge badge-default"> <%=num_it%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
</ul>
</nav>
</div><%end if%>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Sección Curso <%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span></div>
<ul class="nav nav-tabs">
<li class="active"><a href="#tab_1" data-toggle="tab"> General </a></li>
<li><a href="#tab_2" data-toggle="tab"> Ajustes / Galería<%if num_img_tot<>""then%><span class="badge badge-success" style="margin-left:5px""> <%=num_img_tot%> </span><%end if%></a></li>
<li><a href="#tab_3" data-toggle="tab"> SEO</a></li>
</ul><!--NAV TABS-->
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
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> El nombre o la URL amigable ya se encuentran registrados. Debes modificarlo.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div><!--RESPUESTAS-->
<div class="tab-content" >
<div class="tab-pane active" id="tab_1">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="col-md-6">
<div class="form-group form-md-line-input" id="titulo_esp_a">
<label class="col-md-4 control-label" for="titulo_esp" >Nombre sección.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titulo_esp" id="titulo_esp" onKeyUp="resetea_error('titulo_esp_a');urlea_esp();" maxlength="160" value="<%=titulo_esp%>"><div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">debes introducir un nombre descriptivo</span></div></div></div>
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
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="orden_sec" >Orden.</label>
<div class="col-md-3">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="orden_sec" id="orden_sec" maxlength="160" value="<%if orden_sec<>0 and cod<>"" then%><%=orden_sec%><%else%><%if num_s<>0then%><%=num_s+1%><%else%>1<%end if%><%end if%>"><div class="form-control-focus"> </div><i class="fa fa-sort-numeric-desc" aria-hidden="true"></i><span class="help-block">orden sección</span></div>
</div>
</div>
</div><!--col-md-6-->
<div class="col-md-6">
<div class="form-group form-md-checkboxes"><label class="col-md-3 control-label" for="form_control_1">Opciones.</label>
<div class="col-md-7">
<div class="md-checkbox-list">
<div class="md-checkbox"><input name="visible" type="checkbox" class="md-check" id="visible" value="si" <%if cod="" then%>checked="checked"<%end if%> <%if visible="si"then%>checked="checked"<%end if%>><label for="visible">Visible </label></div>
<div class="md-checkbox"><input name="disponible" type="checkbox" class="md-check" id="disponible"  value="si" <%if cod="" then%>checked="checked"<%end if%> <%if disponible="si"then%>checked="checked"<%end if%>><label for="disponible"> Disponible </label></div>
<div class="md-checkbox"><input name="destacado" type="checkbox" class="md-check" id="destacado"  value="si" <%if destacado="si"then%>checked="checked"<%end if%>><label for="destacado"> Destacado </label></div>
<div class="md-checkbox"><input name="en_menu" type="checkbox" class="md-check" id="en_menu" value="si" <%if cod="" then%>checked="checked"<%end if%> <%if en_menu="si"then%>checked="checked"<%end if%>><label for="en_menu">Mostrar en menú </label></div>
</div>
</div>
</div>


<%Sql= "SELECT id_categoria, titulo_esp from categorias order by titulo_esp"   '[ASOCIAMOS CON UNA WEB]
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
sel_sec="si"%>
<div class="form-group form-md-line-input" id="id_categoria_a">
<label class="col-md-3 control-label" for="id_web">Categoría.<span class="required">*</span></label>
<div class="col-md-7" ><div class="input-icon">
<select name="id_categoria" id="id_categoria" multiple="multiple" class="select-100" onChange="resetea_error('id_categoria_a');">
<%do while not ob_rs.eof
id_categoria=ob_rs("id_categoria")
tit_categoria=ob_rs("titulo_esp")
	if cod<>""then
	Sql2= "SELECT id_seccion, id_categoria from rel where id_seccion = "&cod&" and id_categoria= "&id_categoria&" and id_item=0"   '[ASOCIAMOS CON UNA CAT]
	Ob_Command.CommandText = Sql2
	SET Ob_RS2 = Ob_Command.Execute ()
	if not ob_rs2.eof then
	sel="si"
	end if
	ob_rs2.close
	end if%>
<option value="<%=id_categoria%>" <%if sel="si" then%>Selected<%end if%>><%=tit_categoria%>	
<%Sql3_2= "SELECT id_categoria,id_web,id_seccion from rel where id_categoria = "&id_categoria&" "   
Set ob_rs3_2 = Server.CreateObject("ADODB.Recordset")
ob_rs3_2.Open Sql3_2, ob_conn,adOpenStatic, adCmdText
if not ob_rs3_2.eof then
b=1%>
(
<%do while not ob_rs3_2.eof
	id_web=ob_rs3_2("id_web")
	if id_web<>"" and id_web<> 0 then
	Sql4= "SELECT * from webs where id_web = "&id_web&" "   
	Set ob_rs4 = Server.CreateObject("ADODB.Recordset")
	ob_rs4.Open Sql4, ob_conn,adOpenStatic, adCmdText
	if not ob_rs4.eof then
	if tit_web<>"" and b>1 then
	tit_web=tit_web &" · " &ob_rs4("titulo_esp")&"&nbsp;"
	else
	tit_web= tit_web &ob_rs4("titulo_esp")&"&nbsp;"
	end if
	end if
	ob_rs4.close
	end if%>
<%ob_rs3_2.movenext
b=b+1
loop%>
<%=tit_web%>)
<%end if
ob_rs3_2.close
ob_rs.movenext
sel=""
tit_web=""
id_web=""%>
</option>
<%loop%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-globe" aria-hidden="true"></i><span class="help-block">selecciona una categoría</span></div>
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
n=$(this);""!=$.trim('No se puede crear ninguna sección')&&(t.heading=$.trim('No se puede crear ninguna sección')),
t.sticky||(t.life='12000'),
$.notific8("zindex",11500),
$.notific8($.trim('Por favor, crea una Categoría en Gestión Categorías'),t),
n.attr("disabled","disabled"),
setTimeout(function(){n.removeAttr("disabled")},1e3)})}}}();
UINotific8.init();
}
notifica();
</script>
<div class="col-md-12" >
<div class="col-md-2" >
</div>
<div class="col-md-8" >
<div class="alert-danger sin_regstros"><a data-toggle="modal" data-target="#categorias_mod" class="f_red"><i class="icon-note"></i> Debes crear una categoría para poder continuar</a> </div>
</div>
</div>
<%end if
ob_rs.close
ob_conn.close                              '[FIN ASOCIAMOS CON UNA WEB]%>
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
<div class="col-md-6">
<!--IMAGEN-->
<div class="form-group form-md-line-input">
<label class="col-md-3 control-label">Banner.</label>
<div class="col-md-8"><div class="input-group"><div class="input-icon"><i class="fa fa-picture-o" aria-hidden="true"></i><input id="archivo_2" class="form-control" type="field" name="archivo_[2]" placeholder="imagen (jpg, png, .gif)" autocomplete="off"></div><span class="input-group-btn"><button class="btn default" id="modal_2" type="button" onclick="javascript:archivo('Imagen',2);"><i class="fa fa-arrow-left fa-fw" /></i> Seleccionar</button></span></div></div></div>
<input type="hidden" class="form-control" placeholder="" name="orden_img_[2]" id="orden_img_2" maxlength="250" value="1">
<div class="row" id="div_imagen_2"><!--SI SELECCIONAMOS-->
<div class="col-md-6">
<div class="form-group form-md-line-input" id="imagen_2">
<label class="col-md-6 control-label">Banner.</label>
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
</div><!--col-md-6-->
<div class="col-md-6">
<div class="form-group form-md-line-input" id="alt_2">
<label class="col-md-3 control-label" for="alt_2" >Título.</label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="alt_[2]" id="alt_2" maxlength="250" value="<%=alt_2%>"><div class="form-control-focus"></div><i class="fa fa-quote-right " aria-hidden="true"></i></div></div>
</div>
</div><!--col-md-5-->
<!--col-md-5-->
<!--#include file="../comun/gest_galerias.asp"--><!--FIN row GALERIAS-->
</div>
</div>
</div><!--form-body-->
</div><!--tab_2-->
<div class="tab-pane" id="tab_3">
<div class="form-body">
<div class="row">
<div class="col-md-12">
<div class="form-group form-md-line-input" id="url_esp_a">
<label class="col-md-2 control-label" for="url_esp">URL amigable.<span class="required">*</span></label>
<div class="col-md-8"><div class="input-icon"><input type="text" class="form-control" placeholder="" name="url_esp" id="url_esp" onkeyup="resetea_error('url_esp_a');urlea_esp_inf();" maxlength="250" value="<%=url_esp%>"><div class="form-control-focus"></div><i class="fa fa-link" aria-hidden="true"></i><span class="help-block">URL "amigable" (para espacios pulsa "espacio" sin soltar).</span></div></div>
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
<div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green <%if sel_sec<>"si" then%>disabled<%end if%>" <%if sel_sec="si" then%>onclick="Enviar_secciones(this.form);"<%end if%> value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<button type="reset" class="btn default"><i class="fa fa-eraser" aria-hidden="true"></i> resetear formulario</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<%if edi="" then%><a href="<%=r%>secciones/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%>
</div>
</div>
</div>
</div><!--ACCIONES fin form-body-->
</form>
</div><!--portlet-body-->
</div><!--portlet light portlet-fit portlet-form bordered-->
</div><!--page-content-col-->
</div><!--page-content-row-->
</div><!--page-content-container-->

<div class="modal fade" id="programas_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Listado de Programas actuales</h4>
</div>
<div class="modal-body"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=&ntres=&ncuat=&cod_cat="&cod_cat))%><iframe src="" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
<div class="modal-footer">
<!--<button type="button" class="btn blue btn-outline" onClick="recargar();">Cerrar</button>-->
<button type="button" class="btn green" data-dismiss="modal">Cerrar</button>
</div>
</div>
</div>
</div>
<script>function modal_programas(){$("#programas_mod iframe" ).attr('src','<%=r%>items/listado_iframe.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=&ntres=&ncuat=&cod_cat="&cod_cat)%>');$("#programas_mod").modal();}</script>
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div class="modal fade" id="categorias_mod" tabindex="-1" role="dialog" aria-hidden="true" >
<div class="modal-dialog modal-full">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title" style="color:#09C"><i class="fa fa-info-circle" aria-hidden="true"></i> Crear Categoría</h4>
</div>
<div class="modal-body" id="alerta_txt"><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat=&edi=rap"))%><iframe src="<%=r%>categorias/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=ac&ndos=css&ntres=c&ncuat=&edi=rap")%>" style="height:100%;width:100%" frameborder="0" scrolling="auto"></iframe> </div>
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
<!--<script src="<%'=r%>lib/app/jquery-notific8/ui-notific8.min.js" type="text/javascript"></script>-->
<script>
CKEDITOR.replace('texto_esp',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$('#multiple').select2({maximumSelectionLength: 5});;})
$("[name='visible'],[name='destacado'],[name='disponible'],[name='en_menu']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});
function urlea_esp(){document.getElementById("url_esp").value = document.getElementById("titulo_esp").value.slugify();}
function urlea_esp_inf(){document.getElementById("url_esp").value=document.getElementById("url_esp").value.slugify();}
var limita=function(){
var a=function(){
$("#titulo_esp").maxlength({limitReachedClass:"label label-danger"}),
$("#url_esp").maxlength({limitReachedClass:"label label-danger"}),
$("#meta_title").maxlength({limitReachedClass:"label label-danger"}),
$("#datos_complementarios").maxlength({limitReachedClass:"label label-danger"}),
$("#meta_desc").maxlength({limitReachedClass:"label label-danger"})
};return{init:function(){a()}}}();jQuery(document).ready(function(){limita.init()});
function recargar() {location.reload();}
</script>
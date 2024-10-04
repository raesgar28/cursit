<!--#include file="../comun/menu_sup.asp"-->  
<!--#include file="../../conex/conex_back.asp"-->
<%if cod<>""then
Sql= "SELECT * from usuarios where id_usuario="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
u_nombre=ob_rs("u_nombre")
u_apellidos=ob_rs("u_apellidos")
u_email=ob_rs("u_email")
u_usuario=ob_rs("u_usuario")
u_telefono=ob_rs("u_telefono")
u_movil=ob_rs("u_movil")
u_direccion=ob_rs("u_direccion")
u_ciudad=ob_rs("u_ciudad")
u_c_postal=ob_rs("u_c_postal")
u_provincia=ob_rs("u_provincia")
u_pais=ob_rs("u_pais")
fecha_in=ob_rs("fecha_in")
u_agente=ob_rs("u_agente")
habilitado=ob_rs("habilitado")
u_observaciones=ob_rs("u_observaciones")
u_empresa=ob_rs("u_empresa")
u_mail_empresa=ob_rs("u_mail_empresa")
u_nif=ob_rs("u_nif")
u_cif=ob_rs("u_cif")
n_letter=ob_rs("n_letter")
codigo_activacion=ob_rs("codigo_activacion")
end if
ob_rs.close
end if
if u_agente="si" then
ntres="ag"
end if
if ntres="ag" then
Sql= "SELECT id_usuario from usuarios WHERE u_agente='si'"     '[TOTAL]
else
Sql= "SELECT id_usuario from usuarios"     '[TOTAL]
end if
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
num_=ob_rs.RecordCount
end if
ob_rs.close%>
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión <%if ntres="ag" then%>Agentes<%else%>Usuarios<%end if%> | <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>usuariosWeb/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado <%if ntres="ag" then%>Agentes<%else%>Usuarios<%end if%></a></li>
<li class="active">Gestión <%if ntres="ag" then%>Agentes<%else%>Usuarios<%end if%></li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<%if edi=""then%><div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>usuariosWeb/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i> Listado <%if ntres="ag" then%>Agentes<%else%>Usuarios<%end if%>
<%if num_<>""then%><span class="baddge badge badge-default"> <%=num_%> </span><%else%><span class="baddge badge badge-warning"> 0 </span><%end if%></a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión <%if ntres="ag" then%>Agentes<%else%>Usuarios<%end if%></a></li>
</ul></nav></div><%end if%>
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión <%if ntres="ag" then%>Agente<%else%>Usuario<%end if%> <%if titulo_esp<>""then%>| <%=titulo_esp%><%end if%></span></div>
<%if cod<>"" then%><ul class="nav nav-tabs">
<li <%if ms="general" or ms="" or ms="ko" then%>class="active"<%end if%>><a href="#tab_1" data-toggle="tab"> General </a></li>
<%if ntres="ag" then%><li <%if ms="cursos" then%>class="active"<%end if%>><a href="#tab_2" data-toggle="tab"> Cursos disponibles <%if num_img_tot<>""then%><span class="badge badge-success" style="margin-left:5px""> <%=num_img_tot%> </span><%end if%></a></li><%end if%>
<li <%if ms="alumnos" then%>class="active"<%end if%>><a href="#tab_3" data-toggle="tab"> Alumnos Inscritos</a></li>
</ul><%end if%><!--NAV TABS-->
</div>
<div class="portlet-body">
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> El mail se encuentra registrado en otro usuario.</div>
<%end if%><%if ms="general"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos de usuario modificados con éxito! </div><%end if%><%if ms="cursos"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Cursos disponibles modificados con éxito! </div><%end if%></div><!--RESPUESTAS-->
<div class="tab-content" >
<div class="tab-pane <%if ms="general" or ms="" or ms="ko" then%>active<%end if%>" id="tab_1">
<form action="guardar.asp" class="form-horizontal" id="envio" name="envio" method="post"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><%if cod<>""then%><input name="op" type="hidden" value="up"><%else%><input name="op" type="hidden" value="in"><%end if%><input name="cod" type="hidden" value="<%=cod%>">
<div class="form-body"><div class="row"><div class="col-md-12">
<div class="col-md-5">
<div class="form-group form-md-line-input" id="u_nombre_a">
<label class="col-md-4 control-label" for="u_nombre" >Nombre <%if ntres="ag" then%>(contacto)<%end if%>.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_nombre" id="u_nombre" onKeyUp="resetea_error('u_nombre_a');" maxlength="160" value="<%=u_nombre%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir un nombre</span></div></div></div>
<div class="form-group form-md-line-input" id="u_apellidos_a">
<label class="col-md-4 control-label" for="u_apellidos" >Apellidos <%if ntres="ag" then%>(contacto)<%end if%>.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_apellidos" id="u_apellidos" onKeyUp="resetea_error('u_apellidos_a');" maxlength="160" value="<%=u_apellidos%>"><div class="form-control-focus"> </div>
<i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir los apellidos</span></div></div></div>
<div class="form-group form-md-line-input" id="u_email_a">
<label class="col-md-4 control-label" for="u_email" >Email.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_email" id="u_email" onKeyUp="resetea_error('u_email_a');" maxlength="160" value="<%=u_email%>"><div class="form-control-focus"> </div><i class="fa fa-envelope" aria-hidden="true"></i><span class="help-block">debes introducir un email</span></div></div></div>
<div class="form-group form-md-line-input" id="u_telefono_a">
<label class="col-md-4 control-label" for="u_telefono" >Teléfono.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_telefono" id="u_telefono" onKeyUp="resetea_error('u_telefono_a');" maxlength="160" value="<%=u_telefono%>"><div class="form-control-focus"> </div>
<i class="fa fa-phone" aria-hidden="true"></i><span class="help-block">debes introducir un teléfono</span></div></div></div>
<div class="form-group form-md-line-input" id="u_movil_a">
<label class="col-md-4 control-label" for="u_movil" >Móvil.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_movil" id="u_movil" onKeyUp="resetea_error('u_movil_a');" maxlength="160" value="<%=u_movil%>"><div class="form-control-focus"> </div>
<i class="fa fa-mobile" aria-hidden="true"></i><span class="help-block">debes introducir un teléfono móvil</span></div></div></div>

<div class="form-group form-md-line-input" id="u_nif">
<label class="col-md-4 control-label" for="u_nif" >NIF  <%if ntres="ag" then%> / CIF<%end if%>.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_nif" id="u_nif" maxlength="160" value="<%=u_nif%>"><div class="form-control-focus"> </div>
<i class="fa fa-id-card" aria-hidden="true"></i><span class="help-block">debes introducir un NIF</span></div></div></div>

<div class="form-group form-md-checkboxes"><label class="col-md-4 control-label" for="form_control_1">Opciones.</label>
<div class="col-md-8">
<div class="md-checkbox-inline">

<div class="md-checkbox"><input name="habilitado" type="checkbox" class="md-check" id="habilitado"  value="si" <%if habilitado="si"then%>checked="checked"<%end if%> ><label for="habilitado"> Habilitado </label></div>
<div class="md-checkbox"><input name="u_agente" type="checkbox" class="md-check" id="u_agente" value="si" <%if u_agente="si" or cod="" then%>checked="checked"<%end if%> onchange="javascript:toggle_to2();" autocomplete="off"><label for="u_agente" onchange="javascript:toggle_to2();" autocomplete="off">Agente </label></div>
<div class="md-checkbox"><input name="n_letter" type="checkbox" class="md-check" id="n_letter"  value="si" <%if n_letter="si"then%>checked="checked"<%end if%> ><label for="n_letter"> Newsletter </label></div>
</div>
</div>
</div>
</div><!--col-md-6-->
<div class="col-md-5">
<div class="form-group form-md-line-input" id="u_direccion_a">
<label class="col-md-4 control-label" for="u_direccion" >Dirección.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_direccion" id="u_direccion" onKeyUp="resetea_error('u_direccion_a');" maxlength="160" value="<%=u_direccion%>"><div class="form-control-focus"> </div>
<i class="fa fa-street-view" aria-hidden="true"></i><span class="help-block">debes introducir una dirección</span></div></div></div>
<div class="form-group form-md-line-input" id="u_ciudad_a">
<label class="col-md-4 control-label" for="u_movil" >Ciudad.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_ciudad" id="u_ciudad" onKeyUp="resetea_error('u_ciudad_a');" maxlength="160" value="<%=u_ciudad%>"><div class="form-control-focus"> </div>
<i class="fa fa-map-marker" aria-hidden="true"></i><span class="help-block">debes introducir una ciudad</span></div></div></div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label " for="u_provincia">Provincia.</label>
<div class="col-md-7"><div class="input-icon">
<select name="u_provincia" id="u_provincia" placeholder="Selecciona una o varas provincias" style="width:100%;">
<option value="ALAVA" <%if instr(u_provincia,"ALAVA")then%>selected<%end if%>>ALAVA</option>
<option value="ALBACETE" <%if instr(u_provincia,"ALBACETE")then%>selected<%end if%>>ALBACETE</option>
<option value="ALICANTE" <%if instr(u_provincia,"ALICANTE")then%>selected<%end if%>>ALICANTE</option>
<option value="ALMERIA" <%if instr(u_provincia,"ALMERIA")then%>selected<%end if%>>ALMERIA</option>
<option value="ASTURIAS" <%if instr(u_provincia,"ASTURIAS")then%>selected<%end if%>>ASTURIAS</option>
<option value="AVILA" <%if instr(u_provincia,"AVILA")then%>selected<%end if%>>AVILA</option>
<option value="BADAJOZ" <%if instr(u_provincia,"BADAJOZ")then%>selected<%end if%>>BADAJOZ</option>
<option value="BARCELONA" <%if instr(u_provincia,"BARCELONA")then%>selected<%end if%>>BARCELONA</option>
<option value="BURGOS" <%if instr(u_provincia,"BURGOS")then%>selected<%end if%>>BURGOS</option>
<option value="CACERES" <%if instr(u_provincia,"CACERES")then%>selected<%end if%>>CACERES</option>
<option value="CADIZ" <%if instr(u_provincia,"CADIZ")then%>selected<%end if%>>CADIZ</option>
<option value="CANTABRIA" <%if instr(u_provincia,"CANTABRIA")then%>selected<%end if%>>CANTABRIA</option>
<option value="CASTELLON" <%if instr(u_provincia,"CASTELLON")then%>selected<%end if%>>CASTELLON</option>
<option value="CEUTA" <%if instr(u_provincia,"CEUTA")then%>selected<%end if%>>CEUTA</option>
<option value="CIUDAD REAL" <%if instr(u_provincia,"CIUDAD REAL")then%>selected<%end if%>>CIUDAD REAL</option>
<option value="CORDOBA" <%if instr(u_provincia,"CORDOBA")then%>selected<%end if%>>CORDOBA</option>
<option value="CORU&Ntilde;A, A" <%if instr(u_provincia,"CORU&Ntilde;A, A")then%>selected<%end if%>>CORU&Ntilde;A, A</option>
<option value="CUENCA" <%if instr(u_provincia,"CUENCA")then%>selected<%end if%>>CUENCA</option>
<option value="GIRONA" <%if instr(u_provincia,"GIRONA")then%>selected<%end if%>>GIRONA</option>
<option value="GRANADA" <%if instr(u_provincia,"GRANADA")then%>selected<%end if%>>GRANADA</option>
<option value="GUADALAJARA" <%if instr(u_provincia,"GUADALAJARA")then%>selected<%end if%>>GUADALAJARA</option>
<option value="GUIPUZCOA" <%if instr(u_provincia,"GUIPUZCOA")then%>selected<%end if%>>GUIPUZCOA</option>
<option value="HUELVA" <%if instr(u_provincia,"HUELVA")then%>selected<%end if%>>HUELVA</option>
<option value="HUESCA" <%if instr(u_provincia,"HUESCA")then%>selected<%end if%>>HUESCA</option>
<option value="ILLES BALEARS" <%if instr(u_provincia,"ILLES BALEARS")then%>selected<%end if%>>ILLES BALEARS</option>
<option value="JAEN" <%if instr(u_provincia,"JAEN")then%>selected<%end if%>>JAEN</option>
<option value="LEON" <%if instr(u_provincia,"LEON")then%>selected<%end if%>>LEON</option>
<option value="LLEIDA" <%if instr(u_provincia,"LLEIDA")then%>selected<%end if%>>LLEIDA</option>
<option value="LUGO" <%if instr(u_provincia,"LUGO")then%>selected<%end if%>>LUGO</option>
<option value="MADRID" <%if instr(u_provincia,"MADRID")then%>selected<%end if%>>MADRID</option>
<option value="MALAGA" <%if instr(u_provincia,"MALAGA")then%>selected<%end if%>>MALAGA</option>
<option value="MELILLA" <%if instr(u_provincia,"MELILLA")then%>selected<%end if%>>MELILLA</option>
<option value="MURCIA" <%if instr(u_provincia,"MURCIA")then%>selected<%end if%>>MURCIA</option>
<option value="NAVARRA" <%if instr(u_provincia,"NAVARRA")then%>selected<%end if%>>NAVARRA</option>
<option value="OURENSE" <%if instr(u_provincia,"OURENSE")then%>selected<%end if%>>OURENSE</option>
<option value="PALENCIA" <%if instr(u_provincia,"PALENCIA")then%>selected<%end if%>>PALENCIA</option>
<option value="PALMAS, LAS" <%if instr(u_provincia,"PALMAS, LAS")then%>selected<%end if%>>PALMAS, LAS</option>
<option value="PONTEVEDRA" <%if instr(u_provincia,"PONTEVEDRA")then%>selected<%end if%>>PONTEVEDRA</option>
<option value="RIOJA, LA" <%if instr(u_provincia,"RIOJA, LA")then%>selected<%end if%>>RIOJA, LA</option>
<option value="SALAMANCA" <%if instr(u_provincia,"SALAMANCA")then%>selected<%end if%>>SALAMANCA</option>
<option value="SANTA CRUZ DE TENERIFE" <%if instr(u_provincia,"SANTA CRUZ DE TENERIFE")then%>selected<%end if%>>SANTA CRUZ DE TENERIFE</option>
<option value="SEGOVIA" <%if instr(u_provincia,"SEGOVIA")then%>selected<%end if%>>SEGOVIA</option>
<option value="SEVILLA" <%if instr(u_provincia,"SEVILLA")then%>selected<%end if%>>SEVILLA</option>
<option value="SORIA" <%if instr(u_provincia,"SORIA")then%>selected<%end if%>>SORIA</option>
<option value="TARRAGONA" <%if instr(u_provincia,"TARRAGONA")then%>selected<%end if%>>TARRAGONA</option>
<option value="TERUEL" <%if instr(u_provincia,"TERUEL")then%>selected<%end if%>>TERUEL</option>
<option value="TOLEDO" <%if instr(u_provincia,"TOLEDO")then%>selected<%end if%>>TOLEDO</option>
<option value="VALENCIA" <%if instr(u_provincia,"VALENCIA")then%>selected<%end if%>>VALENCIA</option>
<option value="VALLADOLID" <%if instr(u_provincia,"VALLADOLID")then%>selected<%end if%>>VALLADOLID</option>
<option value="VIZCAYA" <%if instr(u_provincia,"VIZCAYA")then%>selsected<%end if%>>VIZCAYA</option>
<option value="ZAMORA" <%if instr(u_provincia,"ZAMORA")then%>selected<%end if%>>ZAMORA</option>
<option value="ZARAGOZA" <%if instr(u_provincia,"ZARAGOZA")then%>selected<%end if%>>ZARAGOZA</option>
<option value="OTRAS" <%if instr(u_provincia,"OTRAS")then%>selected<%end if%>>OTRAS</option></select>
<i class="fa fa-map-marker" aria-hidden="true"></i></div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="u_pais" >País.</label>
<div class="col-md-7"><div class="input-icon" >
<select name="u_pais" id="u_pais"  style="width:100%;">
<option value='ad' <%if instr(u_pais,"ad")then%>selsected<%end if%>>Andorra</option>
<option value='ae' <%if instr(u_pais,"ae") then%>Selected<%end if%>>United Arab Emirates</option>
<option value='af' <%if instr(u_pais,"af") then%>Selected<%end if%>>Afghanistan</option>
<option value='ag' <%if instr(u_pais,"ag") then%>Selected<%end if%>>Antigua and Barbuda</option>
<option value='ai' <%if instr(u_pais,"ai") then%>Selected<%end if%>>Anguilla</option>
<option value='al' <%if instr(u_pais,"al") then%>Selected<%end if%>>Albania</option>
<option value='am' <%if instr(u_pais,"am") then%>Selected<%end if%>>Armenia</option>
<option value='an' <%if instr(u_pais,"an") then%>Selected<%end if%>>Netherlands Antilles</option>
<option value='ao' <%if instr(u_pais,"ao") then%>Selected<%end if%>>Angola</option>
<option value='aq' <%if instr(u_pais,"aq") then%>Selected<%end if%>>Antarctica</option>
<option value='ar' <%if instr(u_pais,"ar") then%>Selected<%end if%>>Argentina</option>
<option value='as' <%if instr(u_pais,"as") then%>Selected<%end if%>>American Samoa</option>
<option value='at' <%if instr(u_pais,"at") then%>Selected<%end if%>>Austria</option>
<option value='au' <%if instr(u_pais,"au") then%>Selected<%end if%>>Australia</option>
<option value='aw' <%if instr(u_pais,"aw") then%>Selected<%end if%>>Aruba</option>
<option value='ax' <%if instr(u_pais,"ax") then%>Selected<%end if%>>Aland Islands</option>
<option value='az' <%if instr(u_pais,"az") then%>Selected<%end if%>>Azerbaijan</option>
<option value='ba' <%if instr(u_pais,"ba") then%>Selected<%end if%>>Bosnia and Herzegovina</option>
<option value='bb' <%if instr(u_pais,"bb") then%>Selected<%end if%>>Barbados</option>
<option value='bd' <%if instr(u_pais,"bd") then%>Selected<%end if%>>Bangladesh</option>
<option value='be' <%if instr(u_pais,"be") then%>Selected<%end if%>>Belgium</option>
<option value='bf' <%if instr(u_pais,"bf") then%>Selected<%end if%>>Burkina Faso</option>
<option value='bg' <%if instr(u_pais,"bg") then%>Selected<%end if%>>Bulgaria</option>
<option value='bh' <%if instr(u_pais,"bh") then%>Selected<%end if%>>Bahrain</option>
<option value='bi' <%if instr(u_pais,"bi") then%>Selected<%end if%>>Burundi</option>
<option value='bj' <%if instr(u_pais,"bj") then%>Selected<%end if%>>Benin</option>
<option value='bm' <%if instr(u_pais,"bm") then%>Selected<%end if%>>Bermuda</option>
<option value='bn' <%if instr(u_pais,"bn") then%>Selected<%end if%>>Brunei Darussalam</option>
<option value='bo' <%if instr(u_pais,"bo") then%>Selected<%end if%>>Bolivia</option>
<option value='br' <%if instr(u_pais,"br") then%>Selected<%end if%>>Brazil</option>
<option value='bs' <%if instr(u_pais,"bs") then%>Selected<%end if%>>Bahamas</option>
<option value='bt' <%if instr(u_pais,"bt") then%>Selected<%end if%>>Bhutan</option>
<option value='bv' <%if instr(u_pais,"bv") then%>Selected<%end if%>>Bouvet Island</option>
<option value='bw' <%if instr(u_pais,"bw") then%>Selected<%end if%>>Botswana</option>
<option value='by' <%if instr(u_pais,"by") then%>Selected<%end if%>>Belarus</option>
<option value='bz' <%if instr(u_pais,"bz") then%>Selected<%end if%>>Belize</option>
<option value='ca' <%if instr(u_pais,"ca") then%>Selected<%end if%>>Canada</option>
<option value='cc' <%if instr(u_pais,"cc") then%>Selected<%end if%>>Cocos (Keeling) Islands</option>
<option value='cd' <%if instr(u_pais,"cd") then%>Selected<%end if%>>Democratic Republic of the Congo</option>
<option value='cf' <%if instr(u_pais,"cf") then%>Selected<%end if%>>Central African Republic</option>
<option value='cg' <%if instr(u_pais,"cg") then%>Selected<%end if%>>Congo</option>
<option value='ch' <%if instr(u_pais,"ch") then%>Selected<%end if%>>Switzerland</option>
<option value='ci' <%if instr(u_pais,"ci") then%>Selected<%end if%>>Cote D'Ivoire (Ivory Coast)</option>
<option value='ck' <%if instr(u_pais,"ck") then%>Selected<%end if%>>Cook Islands</option>
<option value='cl' <%if instr(u_pais,"cl") then%>Selected<%end if%>>Chile</option>
<option value='cm' <%if instr(u_pais,"cm") then%>Selected<%end if%>>Cameroon</option>
<option value='cn' <%if instr(u_pais,"cn") then%>Selected<%end if%>>China</option>
<option value='co' <%if instr(u_pais,"co") then%>Selected<%end if%>>Colombia</option>
<option value='cr' <%if instr(u_pais,"cr") then%>Selected<%end if%>>Costa Rica</option>
<option value='cs' <%if instr(u_pais,"cs") then%>Selected<%end if%>>Serbia and Montenegro</option>
<option value='cu' <%if instr(u_pais,"cu") then%>Selected<%end if%>>Cuba</option>
<option value='cv' <%if instr(u_pais,"cv") then%>Selected<%end if%>>Cape Verde</option>
<option value='cx' <%if instr(u_pais,"cx") then%>Selected<%end if%>>Christmas Island</option>
<option value='cy' <%if instr(u_pais,"cy") then%>Selected<%end if%>>Cyprus</option>
<option value='cz' <%if instr(u_pais,"cz") then%>Selected<%end if%>>Czech Republic</option>
<option value='de' <%if instr(u_pais,"de") then%>Selected<%end if%>>Germany</option>
<option value='dj' <%if instr(u_pais,"dj") then%>Selected<%end if%>>Djibouti</option>
<option value='dk' <%if instr(u_pais,"dk") then%>Selected<%end if%>>Denmark</option>
<option value='dm' <%if instr(u_pais,"dm") then%>Selected<%end if%>>Dominica</option>
<option value='do' <%if instr(u_pais,"do") then%>Selected<%end if%>>Dominican Republic</option>
<option value='dz' <%if instr(u_pais,"dz") then%>Selected<%end if%>>Algeria</option>
<option value='ec' <%if instr(u_pais,"ec") then%>Selected<%end if%>>Ecuador</option>
<option value='ee' <%if instr(u_pais,"ee") then%>Selected<%end if%>>Estonia</option>
<option value='eg' <%if instr(u_pais,"eg") then%>Selected<%end if%>>Egypt</option>
<option value='eh' <%if instr(u_pais,"eh") then%>Selected<%end if%>>Western Sahara</option>
<option value='er' <%if instr(u_pais,"er") then%>Selected<%end if%>>Eritrea</option>
<option value='es' <%if instr(u_pais,"es") then%>Selected<%end if%>>España / Spain</option>
<option value='et' <%if instr(u_pais,"et") then%>Selected<%end if%>>Ethiopia</option>
<option value='fi' <%if instr(u_pais,"fi") then%>Selected<%end if%>>Finland</option>
<option value='fj' <%if instr(u_pais,"fj") then%>Selected<%end if%>>Fiji</option>
<option value='fk' <%if instr(u_pais,"fk") then%>Selected<%end if%>>Falkland Islands (Malvinas)</option>
<option value='fm' <%if instr(u_pais,"fm") then%>Selected<%end if%>>Federated States of Micronesia</option>
<option value='fo' <%if instr(u_pais,"fo") then%>Selected<%end if%>>Faroe Islands</option>
<option value='fr' <%if instr(u_pais,"fr") then%>Selected<%end if%>>France</option>
<option value='fx' <%if instr(u_pais,"fx") then%>Selected<%end if%>>France, Metropolitan</option>
<option value='ga' <%if instr(u_pais,"ga") then%>Selected<%end if%>>Gabon</option>
<option value='gb' <%if instr(u_pais,"gb") then%>Selected<%end if%>>Great Britain (UK)</option>
<option value='gd' <%if instr(u_pais,"gd") then%>Selected<%end if%>>Grenada</option>
<option value='ge' <%if instr(u_pais,"ge") then%>Selected<%end if%>>Georgia</option>
<option value='gf' <%if instr(u_pais,"gf") then%>Selected<%end if%>>French Guiana</option>
<option value='gh' <%if instr(u_pais,"gh") then%>Selected<%end if%>>Ghana</option>
<option value='gi' <%if instr(u_pais,"gi") then%>Selected<%end if%>>Gibraltar</option>
<option value='gl' <%if instr(u_pais,"gl") then%>Selected<%end if%>>Greenland</option>
<option value='gm' <%if instr(u_pais,"gm") then%>Selected<%end if%>>Gambia</option>
<option value='gn' <%if instr(u_pais,"gn") then%>Selected<%end if%>>Guinea</option>
<option value='gp' <%if instr(u_pais,"gp") then%>Selected<%end if%>>Guadeloupe</option>
<option value='gq' <%if instr(u_pais,"gq") then%>Selected<%end if%>>Equatorial Guinea</option>
<option value='gr' <%if instr(u_pais,"gr") then%>Selected<%end if%>>Greece</option>
<option value='gs' <%if instr(u_pais,"gs") then%>Selected<%end if%>>S. Georgia and S. Sandwich Islands</option>
<option value='gt' <%if instr(u_pais,"gt") then%>Selected<%end if%>>Guatemala</option>
<option value='gu' <%if instr(u_pais,"gu") then%>Selected<%end if%>>Guam</option>
<option value='gw' <%if instr(u_pais,"gw") then%>Selected<%end if%>>Guinea-Bissau</option>
<option value='gy' <%if instr(u_pais,"gy") then%>Selected<%end if%>>Guyana</option>
<option value='hk' <%if instr(u_pais,"hk") then%>Selected<%end if%>>Hong Kong</option>
<option value='hm' <%if instr(u_pais,"hm") then%>Selected<%end if%>>Heard Island and McDonald Islands</option>
<option value='hn' <%if instr(u_pais,"hn") then%>Selected<%end if%>>Honduras</option>
<option value='hr' <%if instr(u_pais,"hr") then%>Selected<%end if%>>Croatia (Hrvatska)</option>
<option value='ht' <%if instr(u_pais,"ht") then%>Selected<%end if%>>Haiti</option>
<option value='hu' <%if instr(u_pais,"hu") then%>Selected<%end if%>>Hungary</option>
<option value='id' <%if instr(u_pais,"id") then%>Selected<%end if%>>Indonesia</option>
<option value='ie' <%if instr(u_pais,"ie") then%>Selected<%end if%>>Ireland</option>
<option value='il' <%if instr(u_pais,"il") then%>Selected<%end if%>>Israel</option>
<option value='in' <%if instr(u_pais,"in") then%>Selected<%end if%>>India</option>
<option value='io' <%if instr(u_pais,"io") then%>Selected<%end if%>>British Indian Ocean Territory</option>
<option value='iq' <%if instr(u_pais,"iq") then%>Selected<%end if%>>Iraq</option>
<option value='ir' <%if instr(u_pais,"ir") then%>Selected<%end if%>>Iran</option>
<option value='is' <%if instr(u_pais,"is") then%>Selected<%end if%>>Iceland</option>
<option value='it' <%if instr(u_pais,"it") then%>Selected<%end if%>>Italy</option>
<option value='jm' <%if instr(u_pais,"jm") then%>Selected<%end if%>>Jamaica</option>
<option value='jo' <%if instr(u_pais,"jo") then%>Selected<%end if%>>Jordan</option>
<option value='jp' <%if instr(u_pais,"jp") then%>Selected<%end if%>>Japan</option>
<option value='ke' <%if instr(u_pais,"ke") then%>Selected<%end if%>>Kenya</option>
<option value='kg' <%if instr(u_pais,"kg") then%>Selected<%end if%>>Kyrgyzstan</option>
<option value='kh' <%if instr(u_pais,"kh") then%>Selected<%end if%>>Cambodia</option>
<option value='ki' <%if instr(u_pais,"ki") then%>Selected<%end if%>>Kiribati</option>
<option value='km' <%if instr(u_pais,"km") then%>Selected<%end if%>>Comoros</option>
<option value='kn' <%if instr(u_pais,"kn") then%>Selected<%end if%>>Saint Kitts and Nevis</option>
<option value='kp' <%if instr(u_pais,"kp") then%>Selected<%end if%>>Korea (North)</option>
<option value='kr' <%if instr(u_pais,"kr") then%>Selected<%end if%>>Korea (South)</option>
<option value='kw' <%if instr(u_pais,"kw") then%>Selected<%end if%>>Kuwait</option>
<option value='ky' <%if instr(u_pais,"ky") then%>Selected<%end if%>>Cayman Islands</option>
<option value='kz' <%if instr(u_pais,"kz") then%>Selected<%end if%>>Kazakhstan</option>
<option value='la' <%if instr(u_pais,"la") then%>Selected<%end if%>>Laos</option>
<option value='lb' <%if instr(u_pais,"lb") then%>Selected<%end if%>>Lebanon</option>
<option value='lc' <%if instr(u_pais,"lc") then%>Selected<%end if%>>Saint Lucia</option>
<option value='li' <%if instr(u_pais,"li") then%>Selected<%end if%>>Liechtenstein</option>
<option value='lk' <%if instr(u_pais,"lk") then%>Selected<%end if%>>Sri Lanka</option>
<option value='lr' <%if instr(u_pais,"lr") then%>Selected<%end if%>>Liberia</option>
<option value='ls' <%if instr(u_pais,"ls") then%>Selected<%end if%>>Lesotho</option>
<option value='lt' <%if instr(u_pais,"lt") then%>Selected<%end if%>>Lithuania</option>
<option value='lu' <%if instr(u_pais,"lu") then%>Selected<%end if%>>Luxembourg</option>
<option value='lv' <%if instr(u_pais,"lv") then%>Selected<%end if%>>Latvia</option>
<option value='ly' <%if instr(u_pais,"ly") then%>Selected<%end if%>>Libya</option>
<option value='ma' <%if instr(u_pais,"ma") then%>Selected<%end if%>>Morocco</option>
<option value='mc' <%if instr(u_pais,"mc") then%>Selected<%end if%>>Monaco</option>
<option value='md' <%if instr(u_pais,"md") then%>Selected<%end if%>>Moldova</option>
<option value='mg' <%if instr(u_pais,"mg") then%>Selected<%end if%>>Madagascar</option>
<option value='mh' <%if instr(u_pais,"mh") then%>Selected<%end if%>>Marshall Islands</option>
<option value='mk' <%if instr(u_pais,"mk") then%>Selected<%end if%>>Macedonia</option>
<option value='ml' <%if instr(u_pais,"ml") then%>Selected<%end if%>>Mali</option>
<option value='mm' <%if instr(u_pais,"mm") then%>Selected<%end if%>>Myanmar</option>
<option value='mn' <%if instr(u_pais,"mn") then%>Selected<%end if%>>Mongolia</option>
<option value='mo' <%if instr(u_pais,"mo") then%>Selected<%end if%>>Macao</option>
<option value='mp' <%if instr(u_pais,"mp") then%>Selected<%end if%>>Northern Mariana Islands</option>
<option value='mq' <%if instr(u_pais,"mq") then%>Selected<%end if%>>Martinique</option>
<option value='mr' <%if instr(u_pais,"mr") then%>Selected<%end if%>>Mauritania</option>
<option value='ms' <%if instr(u_pais,"ms") then%>Selected<%end if%>>Montserrat</option>
<option value='mt' <%if instr(u_pais,"mt") then%>Selected<%end if%>>Malta</option>
<option value='mu' <%if instr(u_pais,"mu") then%>Selected<%end if%>>Mauritius</option>
<option value='mv' <%if instr(u_pais,"mv") then%>Selected<%end if%>>Maldives</option>
<option value='mw' <%if instr(u_pais,"mw") then%>Selected<%end if%>>Malawi</option>
<option value='mx' <%if instr(u_pais,"mx") then%>Selected<%end if%>>Mexico</option>
<option value='my' <%if instr(u_pais,"my") then%>Selected<%end if%>>Malaysia</option>
<option value='mz' <%if instr(u_pais,"mz") then%>Selected<%end if%>>Mozambique</option>
<option value='na' <%if instr(u_pais,"na") then%>Selected<%end if%>>Namibia</option>
<option value='nc' <%if instr(u_pais,"nc") then%>Selected<%end if%>>New Caledonia</option>
<option value='ne' <%if instr(u_pais,"ne") then%>Selected<%end if%>>Niger</option>
<option value='nf' <%if instr(u_pais,"nf") then%>Selected<%end if%>>Norfolk Island</option>
<option value='ng' <%if instr(u_pais,"ng") then%>Selected<%end if%>>Nigeria</option>
<option value='ni' <%if instr(u_pais,"ni") then%>Selected<%end if%>>Nicaragua</option>
<option value='nl' <%if instr(u_pais,"nl") then%>Selected<%end if%>>Netherlands</option>
<option value='no' <%if instr(u_pais,"no") then%>Selected<%end if%>>Norway</option>
<option value='np' <%if instr(u_pais,"np") then%>Selected<%end if%>>Nepal</option>
<option value='nr' <%if instr(u_pais,"nr") then%>Selected<%end if%>>Nauru</option>
<option value='nu' <%if instr(u_pais,"nu") then%>Selected<%end if%>>Niue</option>
<option value='nz' <%if instr(u_pais,"nz") then%>Selected<%end if%>>New Zealand (Aotearoa)</option>
<option value='om' <%if instr(u_pais,"om") then%>Selected<%end if%>>Oman</option>
<option value='pa' <%if instr(u_pais,"pa") then%>Selected<%end if%>>Panama</option>
<option value='pe' <%if instr(u_pais,"pe") then%>Selected<%end if%>>Peru</option>
<option value='pf' <%if instr(u_pais,"pf") then%>Selected<%end if%>>French Polynesia</option>
<option value='pg' <%if instr(u_pais,"pg") then%>Selected<%end if%>>Papua New Guinea</option>
<option value='ph' <%if instr(u_pais,"ph") then%>Selected<%end if%>>Philippines</option>
<option value='pk' <%if instr(u_pais,"pk") then%>Selected<%end if%>>Pakistan</option>
<option value='pl' <%if instr(u_pais,"pl") then%>Selected<%end if%>>Poland</option>
<option value='pm' <%if instr(u_pais,"pm") then%>Selected<%end if%>>Saint Pierre and Miquelon</option>
<option value='pn' <%if instr(u_pais,"pn") then%>Selected<%end if%>>Pitcairn</option>
<option value='pr' <%if instr(u_pais,"pr") then%>Selected<%end if%>>Puerto Rico</option>
<option value='ps' <%if instr(u_pais,"ps") then%>Selected<%end if%>>Palestinian Territory</option>
<option value='pt' <%if instr(u_pais,"pt") then%>Selected<%end if%>>Portugal</option>
<option value='pw' <%if instr(u_pais,"pw") then%>Selected<%end if%>>Palau</option>
<option value='py' <%if instr(u_pais,"py") then%>Selected<%end if%>>Paraguay</option>
<option value='qa' <%if instr(u_pais,"qa") then%>Selected<%end if%>>Qatar</option>
<option value='re' <%if instr(u_pais,"re") then%>Selected<%end if%>>Reunion</option>
<option value='ro' <%if instr(u_pais,"ro") then%>Selected<%end if%>>Romania</option>
<option value='ru' <%if instr(u_pais,"ru") then%>Selected<%end if%>>Russian Federation</option>
<option value='rw' <%if instr(u_pais,"rw") then%>Selected<%end if%>>Rwanda</option>
<option value='sa' <%if instr(u_pais,"sa") then%>Selected<%end if%>>Saudi Arabia</option>
<option value='sb' <%if instr(u_pais,"sb") then%>Selected<%end if%>>Solomon Islands</option>
<option value='sc' <%if instr(u_pais,"sc") then%>Selected<%end if%>>Seychelles</option>
<option value='sd' <%if instr(u_pais,"sd") then%>Selected<%end if%>>Sudan</option>
<option value='se' <%if instr(u_pais,"se") then%>Selected<%end if%>>Sweden</option>
<option value='sg' <%if instr(u_pais,"sg") then%>Selected<%end if%>>Singapore</option>
<option value='sh' <%if instr(u_pais,"sh") then%>Selected<%end if%>>Saint Helena</option>
<option value='si' <%if instr(u_pais,"si") then%>Selected<%end if%>>Slovenia</option>
<option value='sj' <%if instr(u_pais,"sj") then%>Selected<%end if%>>Svalbard and Jan Mayen</option>
<option value='sk' <%if instr(u_pais,"sk") then%>Selected<%end if%>>Slovakia</option>
<option value='sl' <%if instr(u_pais,"sl") then%>Selected<%end if%>>Sierra Leone</option>
<option value='sm' <%if instr(u_pais,"sm") then%>Selected<%end if%>>San Marino</option>
<option value='sn' <%if instr(u_pais,"sn") then%>Selected<%end if%>>Senegal</option>
<option value='so' <%if instr(u_pais,"so") then%>Selected<%end if%>>Somalia</option>
<option value='sr' <%if instr(u_pais,"sr") then%>Selected<%end if%>>Suriname</option>
<option value='st' <%if instr(u_pais,"st") then%>Selected<%end if%>>Sao Tome and Principe</option>
<option value='su' <%if instr(u_pais,"su") then%>Selected<%end if%>>USSR (former)</option>
<option value='sv' <%if instr(u_pais,"sv") then%>Selected<%end if%>>El Salvador</option>
<option value='sy' <%if instr(u_pais,"sy") then%>Selected<%end if%>>Syria</option>
<option value='sz' <%if instr(u_pais,"sz") then%>Selected<%end if%>>Swaziland</option>
<option value='tc' <%if instr(u_pais,"tc") then%>Selected<%end if%>>Turks and Caicos Islands</option>
<option value='td' <%if instr(u_pais,"td") then%>Selected<%end if%>>Chad</option>
<option value='tf' <%if instr(u_pais,"tf") then%>Selected<%end if%>>French Southern Territories</option>
<option value='tg' <%if instr(u_pais,"tg") then%>Selected<%end if%>>Togo</option>
<option value='th' <%if instr(u_pais,"th") then%>Selected<%end if%>>Thailand</option>
<option value='tj' <%if instr(u_pais,"tj") then%>Selected<%end if%>>Tajikistan</option>
<option value='tk' <%if instr(u_pais,"tk") then%>Selected<%end if%>>Tokelau</option>
<option value='tl' <%if instr(u_pais,"tl") then%>Selected<%end if%>>Timor-Leste</option>
<option value='tm' <%if instr(u_pais,"tm") then%>Selected<%end if%>>Turkmenistan</option>
<option value='tn' <%if instr(u_pais,"tn") then%>Selected<%end if%>>Tunisia</option>
<option value='to' <%if instr(u_pais,"to") then%>Selected<%end if%>>Tonga</option>
<option value='tp' <%if instr(u_pais,"tp") then%>Selected<%end if%>>East Timor</option>
<option value='tr' <%if instr(u_pais,"tr") then%>Selected<%end if%>>Turkey</option>
<option value='tt' <%if instr(u_pais,"tt") then%>Selected<%end if%>>Trinidad and Tobago</option>
<option value='tv' <%if instr(u_pais,"tv") then%>Selected<%end if%>>Tuvalu</option>
<option value='tw' <%if instr(u_pais,"tw") then%>Selected<%end if%>>Taiwan</option>
<option value='tz' <%if instr(u_pais,"tz") then%>Selected<%end if%>>Tanzania</option>
<option value='ua' <%if instr(u_pais,"ua") then%>Selected<%end if%>>Ukraine</option>
<option value='ug' <%if instr(u_pais,"ug") then%>Selected<%end if%>>Uganda</option>
<option value='uk' <%if instr(u_pais,"uk") then%>Selected<%end if%>>United Kingdom</option>
<option value='um' <%if instr(u_pais,"um") then%>Selected<%end if%>>United States Minor Outlying Islands</option>
<option value='us' <%if instr(u_pais,"us") then%>Selected<%end if%>>United States</option>
<option value='uy' <%if instr(u_pais,"uy") then%>Selected<%end if%>>Uruguay</option>
<option value='uz' <%if instr(u_pais,"uz") then%>Selected<%end if%>>Uzbekistan</option>
<option value='va' <%if instr(u_pais,"va") then%>Selected<%end if%>>Vatican City State (Holy See)</option>
<option value='vc' <%if instr(u_pais,"vc") then%>Selected<%end if%>>Saint Vincent and the Grenadines</option>
<option value='ve' <%if instr(u_pais,"ve") then%>Selected<%end if%>>Venezuela</option>
<option value='vg' <%if instr(u_pais,"vg") then%>Selected<%end if%>>Virgin Islands (British)</option>
<option value='vi' <%if instr(u_pais,"vi") then%>Selected<%end if%>>Virgin Islands (U.S.)</option>
<option value='vn' <%if instr(u_pais,"vn") then%>Selected<%end if%>>Viet Nam</option>
<option value='vu' <%if instr(u_pais,"vu") then%>Selected<%end if%>>Vanuatu</option>
<option value='wf' <%if instr(u_pais,"wf") then%>Selected<%end if%>>Wallis and Futuna</option>
<option value='ws' <%if instr(u_pais,"ws") then%>Selected<%end if%>>Samoa</option>
<option value='ye' <%if instr(u_pais,"ye") then%>Selected<%end if%>>Yemen</option>
<option value='yt' <%if instr(u_pais,"yt") then%>Selected<%end if%>>Mayotte</option>
<option value='yu' <%if instr(u_pais,"yu") then%>Selected<%end if%>>Yugoslavia (former)</option>
<option value='za' <%if instr(u_pais,"za") then%>Selected<%end if%>>South Africa</option>
<option value='zm' <%if instr(u_pais,"zm") then%>Selected<%end if%>>Zambia</option>
<option value='zr' <%if instr(u_pais,"zr") then%>Selected<%end if%>>Zaire (former)</option>
<option value='zw' <%if instr(u_pais,"zw") then%>Selected<%end if%>>Zimbabwe</option></select>
<div class="form-control-focus"> </div>
<i class="fa fa-globe" aria-hidden="true"></i></div>
</div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="u_c_postal" >Código Postal.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_c_postal" id="u_c_postal" maxlength="160" value="<%=u_c_postal%>"><div class="form-control-focus"> </div><i class="fa fa-envelope-open-o" aria-hidden="true"></i><span class="help-block">debes introducir un código postal</span></div></div></div>
<div class="form-group form-md-line-input" id="u_usuario_a">
<label class="col-md-4 control-label" for="u_usuario" >Usuario.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_usuario" id="u_usuario" onKeyUp="resetea_error('u_usuario_a');" maxlength="160" value="<%=u_usuario%>" disabled><div class="form-control-focus"> </div><i class="fa fa-user-o" aria-hidden="true"></i><span class="help-block">debes introducir un usuario</span></div></div></div>
</div><!--col-md-6-->
<div class="col-md-10">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="u_empresa" >Agencia / Empresa.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_empresa" id="u_empresa" maxlength="160" value="<%=u_empresa%>"><div class="form-control-focus"> </div>
<i class="fa fa-university" aria-hidden="true"></i><span class="help-block">debes introducir el nombre de la agencia o empresa</span></div></div>
</div>
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="u_cif" >CIF.</label>
<div class="col-md-4">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_cif" id="u_cif" maxlength="160" value="<%=u_cif%>"><div class="form-control-focus"> </div>
<i class="fa fa-id-card-o" aria-hidden="true"></i><span class="help-block">debes introducir el CIF de la agencia o empresa</span></div></div>
</div>
</div>
<div class="col-md-10">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label" for="u_mail_empresa" >eMail contacto.</label>
<div class="col-md-6">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="u_mail_empresa" id="u_mail_empresa" maxlength="160" value="<%=u_mail_empresa%>"><div class="form-control-focus"> </div>
<i class="fa fa-envelope-o" aria-hidden="true"></i><span class="help-block">debes introducir una persona de contacto</span></div></div></div>
</div>
</div><!--col-md-12-->
<div class="col-md-10">
<div class="form-group form-md-line-input">
<label class="col-md-2 control-label margin-left-12" for="u_observaciones">Observaciones.</label>
<div class="col-md-8"><div class="input-icon"><textarea class="form-control" name="u_observaciones" id="u_observaciones" rows="3"><%=u_observaciones%></textarea><i class="fa fa-quote-right" aria-hidden="true"></i></div></div></div>
<%if codigo_activacion<>""then
Sql= "SELECT url FROM webs WHERE principal='si'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, Ob_Conn,adOpenStatic, adCmdText
if not ob_rs.eof then
url=ob_rs("url")
end if
ob_rs.close
end if%>
<div class="form-group form-md-line-input" >
<label class="col-md-2 control-label margin-left-12" for="codigo_activacion" >Código.</label>
<div class="col-md-6">
<div class="input-icon"><input name="codigo_activacion" type="text" class="form-control" id="codigo_activacion" placeholder="" <%if codigo_activacion <>"" then%>value="<%=url%>/recover/<%=codigo_activacion%>"<%end if%>  maxlength="160" readonly><div class="form-control-focus"> </div>
<i class="fa fa-code" aria-hidden="true"></i></div></div></div></div></div></div>
<div class="form-actions">
<div class="row">
<div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green" onclick="Enviar_usuarios(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>usuariosWeb/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div>
</div>
</div>
</form></div><!--tab_1-->
<%if cod<>"" then%>
<div class="tab-pane <%if ms="cursos" then%>active<%end if%>" id="tab_2" >
<form action="guardar.asp" class="form-horizontal" id="envio2" name="envio2" method="post"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="edi" type="hidden" value="<%=edi%>"><input name="op" type="hidden" value="cursos"><input name="cod" type="hidden" value="<%=cod%>">
<div class="form-body"><div class="row"><div class="col-md-12">
<%Sql= "SELECT titulo_esp, id_categoria from categorias order by orden"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_conn,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1
c=1
do while not ob_rs.eof
id_categoria=ob_rs("id_categoria")%>
<div class="col-md-12" id="<%=id_categoria%>"><div class="portlet light"><div class="portlet-title"><div class="caption font-green-sharp"><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="caption-subject bold uppercase"> <%=ob_rs("titulo_esp")%></span></div></div><div class="portlet-body campos_opciones">
<div class="form-group form-md-checkboxes"><div class="md-checkbox-inline">
<%Sql2= "SELECT titulo_esp, rel.id_item FROM rel,items WHERE id_categoria="&id_categoria&" AND rel.id_item=items.id_item GROUP BY rel.id_item, id_categoria, titulo_esp order by titulo_esp asc"
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<div class="col-md-12" style="margin-bottom:25px"> <div class="md-checkbox">
<input type="checkbox" id="checkall<%=c%>" value="" name="checkall" autocomplete="off" class="md-check">
<label for="checkall<%=c%>"><span></span><span class="check"></span><span class="box"></span> Seleccionar / deseleccionar todo</label>
</div></div>
<%do while not ob_rs2.eof%>
<div class="col-md-4"><div class="md-checkbox"><input type="checkbox" id="check<%=i%>" value="<%=ob_rs2("id_item")%>" name="check" autocomplete="off" 
<%Sql3= "SELECT id_agenteCurso FROM agentesCursos WHERE id_item="&ob_rs2("id_item")&" AND id_agente="&cod&""     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
checked="checked"
<%end if
ob_rs3.close%>
class="md-check">
<label for="check<%=i%>"><span></span><span class="check"></span><span class="box"></span> <%=ob_rs2("titulo_esp")%></label>
</div></div>
<%ob_rs2.movenext
i=i+1
loop
end if
ob_rs2.close%>
</div></div></div></div></div>
<script>$("#checkall<%=c%>").click(function () {$('#<%=id_categoria%> input:checkbox').not(this).prop('checked', this.checked);});</script>
<%ob_rs.movenext
c=c+1
loop
end if
ob_rs.close%>
</div></div></div>
<div class="form-actions"><div class="row"><div class="col-md-offset-4 col-md-12"><button type="submit" class="btn green" value="enviar datos"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar cursos</button><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>usuariosWeb/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a></div></div></div>
</form></div><!--tab_2-->
<div class="tab-pane <%if ms="alumnos" then%>active<%end if%>" id="tab_3"><div class="form-body"><div class="row"><div class="col-md-12">
<div class="portlet light">
<!--INSCRITOS-->
<%Sql= "SELECT nom_item, a_nombre, a_apellidos, a_email, id_programa, f_inicio, alumnos.id_alumno, id_categoria, id_agente_cod FROM programas, alumnos WHERE (id_usuario="&cod&" or id_agente_cod="&cod&") and programas.id_alumno=alumnos.id_alumno ORDER BY f_inicio desc"     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="portlet-title"><div class="caption font-green-sharp"><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="caption-subject bold uppercase"> Alumnos Inscritos</span></div></div><div class="portlet-body">
<table class="table table-striped table-bordered ">
<thead>
<tr style="color:#999">
<th><i class="fa fa-user-o"></i> Nombre </th>
<th style="text-align:center"><i class="fa fa-graduation-cap"></i> Programa </th>
<th style="text-align:center"><i class="fa fa-calendar-check-o"></i> Año </th>
<th><i class="fa fa-envelope"></i> Email </th>
<th style="width:50px"> </th>
</tr>
</thead>
<tbody>
<%do while not ob_rs.eof%>
<tr>
<td><%=ob_rs("a_nombre")%>&nbsp;<%=ob_rs("a_apellidos")%> <%if ob_rs("id_agente_cod")<>"" and ob_rs("id_agente_cod")<>0 then%><i class="fa fa-tag" aria-hidden="true" style="color:#999;margin-left:8px;"></i><%end if%></td>
<td style="text-align:center"><%=ob_rs("nom_item")%></td>
<td style="text-align:center"><%=year(ob_rs("f_inicio"))%></td>
<td> <a href="mailto:<%=ob_rs("a_email")%>"><%=ob_rs("a_email")%></a></td>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=gu&ncuat=&cod="&ob_rs("id_alumno")&"&cod_prog="&ob_rs("id_programa")&"&cod_cat="&ob_rs("id_categoria")))%><td><a class="btn btn-sm green" href="<%=r%>alumnos/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=gu&ncuat=&cod="&ob_rs("id_alumno")&"&cod_prog="&ob_rs("id_programa")&"&cod_cat="&ob_rs("id_categoria"))%>"> Ver datos</a></td>
</tr>
<%ob_rs.movenext
loop%>
</tbody>
</table>
</div>
<%end if
ob_rs.close%>
<!--PREINSCRITOS-->
<%Sql= "SELECT nom_item, a_nombre, a_apellidos, a_email, id_programa, f_inicio, alumnos_tmp.id_alumno FROM programas_tmp, alumnos_tmp WHERE id_usuario="&cod&" and programas_tmp.id_alumno=alumnos_tmp.id_alumno"     '[RECOGEMOS DATOS SI MODIFICACION]
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="portlet-title"><div class="caption font-green-sharp"><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="caption-subject bold uppercase"> Alumnos PreInscritos</span></div></div><div class="portlet-body">
<table class="table table-striped table-bordered ">
<thead>
<tr style="color:#999">
<th><i class="fa fa-user-o"></i> Nombre </th>
<th style="text-align:center"><i class="fa fa-graduation-cap"></i> Programa </th>
<th style="text-align:center"><i class="fa fa-calendar-check-o"></i> Año </th>
<th><i class="fa fa-envelope"></i> Email </th>
<th style="width:50px"> </th>
</tr>
</thead>
<tbody>
<%do while not ob_rs.eof%>
<tr>
<td><%=ob_rs("a_nombre")%>&nbsp;<%=ob_rs("a_apellidos")%></td>
<td style="text-align:center"><%=ob_rs("nom_item")%></td>
<td style="text-align:center"> <%=year(ob_rs("f_inicio"))%></td>
<td> <a href="mailto:<%=ob_rs("a_email")%>"><%=ob_rs("a_email")%></a></td>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=gu&ncuat=&cod="&ob_rs("id_programa")))%><td><a class="btn btn-sm green" href="<%=r%>preinscripciones/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=gu&ncuat=&cod="&ob_rs("id_programa"))%>"> Ver datos</a></td>
</tr>
<%ob_rs.movenext
loop%>
</tbody>
</table>
</div>
<%end if
ob_rs.close%>

<%if ntres="agenter" then 'LUEGO CONTACTOS CASO AGENTES X HACER%>
<!--CONTACTOS-->
<div class="portlet-title" style="display:none"><div class="caption font-green-sharp"><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="caption-subject bold uppercase"> Alumnos Inscritos</span></div></div><div class="portlet-body">
<table class="table table-striped table-bordered ">
<thead>
<tr style="color:#999">
<th><i class="fa fa-user-o"></i> Nombre </th>
<th style="text-align:center"><i class="fa fa-briefcase"></i> ¿Agente? </th>
<th style="text-align:center"><i class="fa fa-graduation-cap"></i> Alumnos </th>
<th><i class="fa fa-envelope"></i> Email </th>
<th style="width:50px"> </th>
</tr>
</thead>
<tbody>
<tr>
<td><%=a_nombre%>&nbsp;<%=a_apellidos%> </td>
<td style="text-align:center"><%if u_agente="si"then%><i class="fa fa-check"></i> <%end if%></td>
<td style="text-align:center"> <%if num_al_age_tmp<>"" or num_al_age_tmp<>0 then%><span style="color:#bbb">(<%=num_al_age_tmp%>)</span>&nbsp;<%end if%> <%=num_al_age%></td>
<td> <a href="mailto:<%=u_email%>"><%=u_email%></a></td>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=gu&ncuat=&cod="&id_usuario))%><td><a class="btn btn-sm green" href="<%=r%>usuariosWeb/gestion.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=al&ndos="&ndos&"&ntres=gu&ncuat=&cod="&id_usuario)%>"> Ver datos</a></td>
</tr>
</tbody>
</table>
</div>
<%end if%>
</div></div></div></div></div><!--tab_3-->
<%end if%>
</div><!--tab-content-->
</div></div></div></div></div>
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>
<div id="spinner_back" style="display:none;"><div id="spinner" class="spinner" style="display:none;"><img src="<%=r%>images/ajax-loader.gif" width="220" height="27"><br>Modificando datos</div></div>
<style>.select2-selection{border:none;border-bottom:1px solid #c2cad8;}</style>
<!--#include file="../comun/menu_inf.asp"-->  
<link href="<%=r%>lib/app/select2/css/select2.min.css" rel="stylesheet" type="text/css">
<script src="<%=r%>lib/js/validador.js" type="text/javascript"></script>
<script src="<%=r%>lib/app/select2/js/select2.full.min.js" type="text/javascript"></script>
<script>
<%if u_agente="si" then%><%else%>$("#agentes_a").hide();<%end if%>
function toggle_to2(){$("#agentes_a").slideToggle( "slow" );};
$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$("[name='u_agente'],[name='habilitado'],[name='n_letter']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});})
</script>
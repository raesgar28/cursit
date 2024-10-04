<!--#include file="../comun/menu_sup.asp"--> 
<%if cod<>""then
Sql= "SELECT * from extra_alumnos where id_alumno="&cod&" " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then
id_colegio=ob_rs("id_colegio")
nombre=ob_rs("nombre")
apellidos=ob_rs("apellidos")
mail_alumno=ob_rs("mail_alumno")
curso=ob_rs("curso")
dni=ob_rs("dni")
grupo=ob_rs("grupo")
nombre_padre=ob_rs("nombre_padre")
nombre_madre=ob_rs("nombre_madre")
apellidos_padre=ob_rs("apellidos_padre")
apellidos_madre=ob_rs("apellidos_madre")
telefono_contacto=ob_rs("telefono_contacto")
movil_contacto=ob_rs("movil_contacto")
nombre_titular=ob_rs("nombre_titular")
apellidos_titular=ob_rs("apellidos_titular")
DNI_titular=ob_rs("DNI_titular")
numero_cuenta=ob_rs("numero_cuenta")
entidad_bancaria=ob_rs("entidad_bancaria")
observaciones=ob_rs("observaciones")
borrado=ob_rs("borrado")
fecha_in=ob_rs("fecha_in")
end if
ob_rs.close
end if
form_op=request("form_op")
if form_op ="" then form_op = request_equerystring("form_op")
cod_extra=request("cod_extra")
if cod_extra ="" then cod_extra = request_equerystring("cod_extra")
if cod_extra="" then cod_extra=0 end if%> 
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión Alumno Extraescolar | 
  <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>academiaExtAlumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado Alumnos</a></li>
<li class="active">Gestión Alumno</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>academiaExtAlumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i> Listado Alumnos
</a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión Alumnos</a></li>
</ul>
</nav>
</div><!--MIGAS-->
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Alumno <%if nombre<>""then%>| <%=nombre%>&nbsp;<%=apellidos%><%end if%></span></div>
<%if cod<>""then%><ul class="nav nav-tabs">
<li class="<%if form_op="" or form_op="alumno" then%>active<%end if%>"><a href="#tab_1" data-toggle="tab">Alumno</a></li>
<li class="<%if form_op="modificar" or form_op="inscribir" then%>active<%end if%>"><a href="#tab_2" data-toggle="tab"> Clases inscritas </a></li>
<li><a href="#tab_3" data-toggle="tab"> Inscripción en clase</a></li>
</ul><!--NAV TABS--><%end if%>
</div>
<div class="portlet-body">
<div class="form-body no_pad">
<div class="alert alert-danger  display-hide" id="form_errors"><button class="close" data-close="alert"></button><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Tienes algunos errores. Por favor, revísalos abajo.</div>
<%if ms="ko"then%><div class="alert alert-danger"><button class="close" data-close="alert"></button>
<i class="fa fa-exclamation-triangle" aria-hidden="true"></i> El alumno introducido ya se encuentra registrado.</div>
<%end if%>
<%if ms="ok"then%><div class="alert alert-success"><button class="close" data-close="alert"></button><i class="fa fa-check" aria-hidden="true"></i> Datos <%if cod<>""then%>modificados<%else%>introducidos<%end if%> con éxito! </div><%end if%>
</div><!--RESPUESTAS-->
<div class="tab-content" >
<!--tab1-->
<div class="tab-pane <%if form_op="" or form_op="alumno" then%>active<%end if%>" id="tab_1">
<div class="form-body">
<form action="guardar.asp" class="form-horizontal" id="envio" name="envio" method="post"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>">
<input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="cod" type="hidden" value="<%=cod%>"><input name="op" type="hidden" value="<%if cod<>""then%>up<%else%>in<%end if%>"><input name="form_op" type="hidden" value="alumno">
<div class="row">
<div class="col-md-12">
<div class="col-md-6">
<div class="form-group form-md-line-input" id="nombre_a">
<label class="col-md-4 control-label" for="nombre" >Nombre alumno.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="nombre" id="nombre" onKeyUp="resetea_error('nombre_a');" maxlength="160" value="<%=nombre%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir un nombre</span></div></div></div>

<div class="form-group form-md-line-input" id="apellidos_a">
<label class="col-md-4 control-label" for="apellidos" >Apellidos alumno.<span class="required">*</span></label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="apellidos" id="apellidos" onKeyUp="resetea_error('apellidos_a');" maxlength="160" value="<%=apellidos%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">apellidos del alumno</span></div></div></div>

<div class="form-group form-md-line-input" id="mail_alumno_a">
<label class="col-md-4 control-label" for="mail_alumno" >Email alumno.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="mail_alumno" id="mail_alumno" maxlength="160" value="<%=mail_alumno%>"><div class="form-control-focus"> </div><i class="fa fa-envelope" aria-hidden="true"></i><span class="help-block">debes introducir un email</span></div></div></div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="id_colegio">Colegio.</label>
<div class="col-md-7" ><div class="input-icon">
<select name="id_colegio" id="id_colegio" <%if form_op="" or form_op="alumno" then%>style="width:100%"<%end if%>>
<option value="0" ></option>
<%Sql= "SELECT * from extra_colegios order by nombre " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then
do while not ob_rs.eof%>
<option value="<%=ob_rs("id_colegio")%>" <%if ob_rs("id_colegio") = id_colegio then%>Selected<%end if%>><%=ob_rs("nombre")%></option>
<%ob_rs.movenext
loop
end if
ob_rs.close%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-university" aria-hidden="true"></i><span class="help-block">selecciona un colegio</span></div>
</div>
</div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="curso">Curso actual.</label>
<div class="col-md-7" ><div class="input-icon">
<select name="curso" id="curso" <%if form_op="" or form_op="alumno" then%>style="width:100%"<%end if%>>
<option value="" ></option>
<option value="1_Infantil" <%if curso = "1_Infantil" then%>Selected<%end if%>>1&ordm; Infantil</option>
<option value="2_Infantil" <%if curso = "2_Infantil" then%>Selected<%end if%>>2&ordm; Infantil</option>
<option value="3_Infantil" <%if curso = "3_Infantil" then%>Selected<%end if%>>3&ordm; Infantil</option>
<option value="1_Primaria" <%if curso = "1_Primaria" then%>Selected<%end if%>>1&ordm; Primaria</option>
<option value="2_Primaria" <%if curso = "2_Primaria" then%>Selected<%end if%>>2&ordm; Primaria</option>
<option value="3_Primaria" <%if curso = "3_Primaria" then%>Selected<%end if%>>3&ordm; Primaria</option>
<option value="4_Primaria" <%if curso = "4_Primaria" then%>Selected<%end if%>>4&ordm; Primaria</option>
<option value="5_Primaria" <%if curso = "5_Primaria" then%>Selected<%end if%>>5&ordm; Primaria</option>
<option value="6_Primaria" <%if curso = "6_Primaria" then%>Selected<%end if%>>6&ordm; Primaria</option>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona un curso</span></div>
</div>
</div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="dni" >DNI.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="dni" id="dni" maxlength="160" value="<%=dni%>"><div class="form-control-focus"> </div><i class="fa fa-id-badge" aria-hidden="true"></i><span class="help-block">debes introducir un dni</span></div></div></div>


<div class="form-group form-md-line-input" id="nombre_padre_a">
<label class="col-md-4 control-label" for="nombre_padre" >Padre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="nombre_padre" id="nombre_padre" maxlength="160" value="<%=nombre_padre%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir el nombre del padre</span></div></div></div>

<div class="form-group form-md-line-input" id="apellidos_padre_a">
<label class="col-md-4 control-label" for="apellidos_padre" >Apellidos padre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="apellidos_padre" id="apellidos_padre" maxlength="160" value="<%=apellidos_padre%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir apellidos del padre</span></div></div></div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="telefono" >Teléfono contacto.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="telefono_contacto" id="telefono_contacto" maxlength="160" value="<%=telefono_contacto%>"><div class="form-control-focus"> </div><i class="fa fa-phone" aria-hidden="true"></i><span class="help-block">debes introducir un teléfono</span></div></div></div>

</div>
<div class="col-md-6">

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="movil_contacto" >Móvil contacto.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="movil_contacto" id="movil_contacto" maxlength="160" value="<%=movil_contacto%>"><div class="form-control-focus"> </div><i class="fa fa-phone" aria-hidden="true"></i><span class="help-block">debes introducir un móvil</span></div></div></div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="titular_cuenta" >Nombre titular cuenta.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="nombre_titular" id="nombre_titular" maxlength="160" value="<%=nombre_titular%>"><div class="form-control-focus"> </div><i class="fa fa-id-card-o" aria-hidden="true"></i><span class="help-block">debes introducir el titular de la cuenta bancaria</span></div></div></div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="apellidos_titular" >Apellidos titular cuenta.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="apellidos_titular" id="apellidos_titular" maxlength="160" value="<%=apellidos_titular%>"><div class="form-control-focus"> </div><i class="fa fa-id-card-o" aria-hidden="true"></i><span class="help-block">debes introducir el titular de la cuenta bancaria</span></div></div></div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="DNI_titular" >DNI titular cuenta.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="DNI_titular" id="DNI_titular" maxlength="160" value="<%=DNI_titular%>"><div class="form-control-focus"> </div><i class="fa fa-id-card-o" aria-hidden="true"></i><span class="help-block">debes introducir el DNI del titular</span></div></div></div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="numero_cuenta" >Cuenta bancaria.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="numero_cuenta" id="numero_cuenta" maxlength="160" value="<%=numero_cuenta%>"><div class="form-control-focus"> </div><i class="fa fa-money" aria-hidden="true"></i><span class="help-block">debes introducir la cuenta bancaria</span></div></div></div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="entidad_bancaria" >Entidad bancaria.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="entidad_bancaria" id="entidad_bancaria" maxlength="160" value="<%=entidad_bancaria%>"><div class="form-control-focus"> </div><i class="fa fa-money" aria-hidden="true"></i><span class="help-block">debes introducir la entidad bancaria</span></div></div></div>

<div class="form-group form-md-line-input" id="nombre_madre_a">
<label class="col-md-4 control-label" for="nombre_madre" >Madre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="nombre_madre" id="nombre_madre" maxlength="160" value="<%=nombre_madre%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir el nombre de la madre</span></div></div></div>

<div class="form-group form-md-line-input" id="apellidos_madre_a">
<label class="col-md-4 control-label" for="apellidos_madre" >Apellidos madre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="apellidos_madre" id="apellidos_madre" maxlength="160" value="<%=apellidos_madre%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir apellidos de la madre</span></div></div></div>

</div><!--col-md-6-->


</div><!--col-md-12-->
<div class="col-md-12">
<div class="form-group form-md-line-input"><label class="col-md-2 control-label margin-left-12" for="observaciones">Observaciones.</label>
<div class="col-md-8"><textarea class="form-control" name="observaciones" id="observaciones" rows="3"><%=observaciones%></textarea></div>
</div>
</div>
</div>
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-5 col-md-12">
<button type="button" class="btn green" onclick="Enviar_academia_alumno(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<%if edi="" then%><a href="<%=r%>academiaAlumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%>
</div>
</div>
</div>
</div><!--ACCIONES fin form-body-->
</form>
</div>
</div>
<!--tab1-->
<%if cod<>""then%>
<!--tab_2-->
<div class="tab-pane <%if form_op="modificar" or form_op="inscribir" then%>active<%end if%>" id="tab_2" ><div class="form-body"><div class="row"><div class="col-md-12"><div class="form-body"><div class="row"><div class="col-md-12">

<%Sql= "SELECT * from extra_programas where id_alumno = "&cod&" order by fecha_alta desc"   
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1%>
<div class="panel-group accordion scrollable" id="acordeon_c">

<!--Inicio tab-->
<%do while not ob_rs.eof


Sql2= "SELECT * from extra_actividades where id_actividad= "&ob_rs("id_actividad")&""   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connc,adOpenStatic, adCmdText
if not ob_rs2.eof then
actividad_nombre = ob_rs2("nombre")
precio=ob_rs2("precio")
end if
ob_rs2.close%>

<div class="panel panel-default" style="border:none;margin-bottom:5px"><div class="panel-heading"><h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled <%if int(id_extraescolar)<>int(ob_rs("id_extraescolar"))then%>collapsed<%end if%>" data-toggle="collapse" data-parent="#acordeon_c" href="#acordeon_a<%=i%>"><i class="fa fa-graduation-cap margin-right-8"></i> <%=ob_rs("anyo")%> - <%=actividad_nombre%> </a></h4></div>
<div id="acordeon_a<%=i%>" class="panel-collapse collapse  <%if int(cod_clase)=int(ob_rs("id_extraescolar"))then%>in<%end if%>"><div class="panel-body"><div class="col-md-12"><div class="portlet-body">
<form action="guardar.asp" class="form-horizontal" id="clase<%=i%>" name="clase<%=i%>" method="post"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>">
<input name="cod" type="hidden" value="<%=cod%>">
<input name="cod_extra" type="hidden" value="<%=ob_rs("id_extraescolar")%>">
<input name="form_op" type="hidden" value="modificar">
<input name="acc" type="hidden" value="">

<div class="scroller" style="height: 200px;"><div class="panel-body flotea" >
<div class="col-md-12">

<div class="col-md-6"><!--PRIMERA COLUMNA-->

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="curso">Actividad.</label>
<div class="col-md-7" ><div class="input-icon">
<select name="id_actividad" id="id_actividad" <%if form_op="modificar" then%>style="width:100%"<%end if%>>
<option value="0" ></option>
<%Sql2= "SELECT * from extra_actividades"   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connc,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof

Sql3= "SELECT nombre, apellidos from extra_monitores WHERE id_profesor="&ob_rs2("id_monitor")&""   
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connc,adOpenStatic, adCmdText
if not ob_rs3.eof then
nom_monitor=ob_rs3("nombre")
ape_monitor=ob_rs3("apellidos")
end if
ob_rs3.close

Sql3= "SELECT nombre from extra_colegios WHERE id_colegio="&ob_rs2("id_colegio")&""   
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connc,adOpenStatic, adCmdText
if not ob_rs3.eof then
nom_colegio=ob_rs3("nombre")
end if
ob_rs3.close%>
<option value="<%=ob_rs2("id_actividad")%>" <%if ob_rs("id_actividad") = ob_rs2("id_actividad") then%>selected<%end if%>><%=ob_rs2("nombre")%> <%if ob_rs2("precio") <> "" or ob_rs2("precio") <> "0" then%>&nbsp;/&nbsp;<%=FormatNumber(ccur(ob_rs2("precio")),0)%> eur. / <%end if%> <%=nom_colegio%> / <%=nom_monitor%>&nbsp;<%=ape_monitor%></option>
<%nom_colegio=""
nom_monitor=""
ape_monitor=""
ob_rs2.movenext
loop
end if
ob_rs2.close%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona un curso</span></div>
</div>
</div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="anyo">Temporada.</label>
<div class="col-md-7"><div class="input-icon">
<select name="anyo" id="anyo" <%if form_op="modificar" then%>style="width:100%"<%end if%>>
<option value="" >&nbsp;</option>
<%Sql3= "SELECT anyo FROM academia_precios order by anyo desc" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connc,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>
<option value="<%=ob_rs3("anyo")%>" <%if ob_rs("anyo")=ob_rs3("anyo") then%>Selected<%end if%>><%=ob_rs3("anyo")%></option>
<%ob_rs3.movenext
loop
ob_rs3.close
end if%>
</select><div class="form-control-focus"> </div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">selecciona una temporada</span></div>
</div></div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="grupo">Grupo.</label>
<div class="col-md-7" ><div class="input-icon">
<select name="grupo" id="grupo" style="width:70%">
<option value="" ></option>
<option value="A" <%if ob_rs("grupo") = "A" then%>Selected<%end if%>>A</option>
<option value="B" <%if ob_rs("grupo") = "B" then%>Selected<%end if%>>B</option>
<option value="C" <%if ob_rs("grupo") = "C" then%>Selected<%end if%>>C</option>
<option value="D" <%if ob_rs("grupo") = "D" then%>Selected<%end if%>>D</option>
<option value="E" <%if ob_rs("grupo") = "E" then%>Selected<%end if%>>E</option>
<option value="Tarde" <%if ob_rs("grupo") = "Tarde" then%>Selected<%end if%>>Tarde</option>
<option value="Manana" <%if ob_rs("grupo") = "Manana" then%>Selected<%end if%>>Ma&ntilde;ana</option>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona un curso</span></div>
</div>
</div>


<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="preciete" >Precio Total.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="preciete" id="preciete" maxlength="160" value="<%if ob_rs("descuento_ampa")<>0then%><%=ob_rs("descuento_ampa")+precio%><%else%><%=precio%><%end if%> €"><div class="form-control-focus"> </div><i class="fa fa-euro" aria-hidden="true"></i><span class="help-block">precio total</span></div></div></div>

</div>
<div class="col-md-6"><!--SEGUNDA COLUMNA-->



<div class="form-group form-md-line-input" id="fecha_alta_a">
<label class="col-md-4 control-label" for="fecha_alta" >Fecha alta.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="fecha_alta" id="fecha_alta" maxlength="160" value="<%=ob_rs("fecha_alta")%>"><div class="form-control-focus"> </div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">fecha de alta del alumno (dd/mm/aaaa)</span></div></div></div>

<div class="form-group form-md-line-input" id="fecha_baja_a">
<label class="col-md-4 control-label" for="fecha_baja" >Fecha baja.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="fecha_baja" id="fecha_baja" maxlength="160" value="<%=ob_rs("fecha_baja")%>"><div class="form-control-focus"> </div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">fecha de baja (dd/mm/aaaa)</span></div></div></div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="descuento_ampa" >Sobreprecio no AMPA.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="descuento_ampa" id="descuento_ampa" maxlength="160" value="<%if ob_rs("descuento_ampa")<>0then%><%=ob_rs("descuento_ampa")%><%end if%>"><div class="form-control-focus"> </div><i class="fa fa-euro" aria-hidden="true"></i><span class="help-block">soobreprecio No AMPA</span></div></div></div>

</div><!--FIN SEGUNDA COLUMNA-->

<div class="col-md-12" style="margin-bottom:45px;margin-top:25px;">
<table class="blueTable" style="margin:0 auto;">
<thead>
<tr>
<th nowrap="nowrap" style="background:#fff;border:none">&nbsp;</th>
<th nowrap="nowrap">Lun.</th>
<th nowrap="nowrap">Mar.</th>
<th nowrap="nowrap">Mi&eacute;.</th>
<th nowrap="nowrap">Jue.</th>
<th nowrap="nowrap">Vie.</th>
<th nowrap="nowrap">S&aacute;b.</th>
</tr>
</thead>
<tbody>
<tr>
<td rowspan="2" align="right"><span>D&iacute;as / horas.&nbsp;&nbsp;</span></td>
<td>
<div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
<div class="md-checkbox"><input name="lunes" type="checkbox" class="md-check" id="lunes" value="si" <%if ob_rs("lunes") = "si" then%>checked<%end if%>><label for="lunes"><span></span><span class="check"></span><span class="box"></span></label></div></div>
</td>
<td>
<div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
<div class="md-checkbox"><input name="martes" type="checkbox" class="md-check" id="martes" value="si"<%if ob_rs("martes") = "si" then%>checked<%end if%>><label for="martes"><span></span><span class="check"></span><span class="box"></span></label></div></div>
</td>
<td><div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
<div class="md-checkbox"><input name="miercoles" type="checkbox" class="md-check" id="miercoles" value="si"<%if ob_rs("miercoles") = "si" then%>checked<%end if%>><label for="miercoles"><span></span><span class="check"></span><span class="box"></span></label></div></div>
</td>
<td>
<div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
<div class="md-checkbox"><input name="jueves" type="checkbox" class="md-check" id="jueves" value="si"<%if ob_rs("jueves") = "si" then%>checked<%end if%>><label for="jueves"><span></span><span class="check"></span><span class="box"></span></label></div></div>
</td>
<td>
<div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
<div class="md-checkbox"><input name="viernes" type="checkbox" class="md-check" id="viernes" value="si"<%if ob_rs("viernes") = "si" then%>checked<%end if%>><label for="viernes"><span></span><span class="check"></span><span class="box"></span></label></div></div></td>
<td>
<div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
<div class="md-checkbox"><input name="sabado" type="checkbox" class="md-check" id="sabado" value="si"<%if ob_rs("sabado") = "si" then%>checked<%end if%>><label for="sabado"><span></span><span class="check"></span><span class="box"></span></label></div></div></td>
</tr>
<tr>
<td align="center"><select name="hora_lunes" id="hora_lunes" onchange = "javascript:document.clase<%=i%>.lunes.checked = true;">
<option value = "" >&nbsp;</option>
<option value = "09:00" <%if ob_rs("hora_lunes") = "09:00" then%>selected<%end if%>>09:00</option>
<option value = "09:15" <%if ob_rs("hora_lunes") = "09:15" then%>selected<%end if%>>09:15</option>
<option value = "09:30" <%if ob_rs("hora_lunes") = "09:30" then%>selected<%end if%>>09:30</option>
<option value = "09:45" <%if ob_rs("hora_lunes") = "09:45" then%>selected<%end if%>>09:45</option>
<option value = "10:00" <%if ob_rs("hora_lunes") = "10:00" then%>selected<%end if%>>10:00</option>
<option value = "10:15" <%if ob_rs("hora_lunes") = "10:15" then%>selected<%end if%>>10:15</option>
<option value = "10:30" <%if ob_rs("hora_lunes") = "10:30" then%>selected<%end if%>>10:30</option>
<option value = "10:45" <%if ob_rs("hora_lunes") = "10:45" then%>selected<%end if%>>10:45</option>
<option value = "11:00" <%if ob_rs("hora_lunes") = "11:00" then%>selected<%end if%>>11:00</option>
<option value = "11:15" <%if ob_rs("hora_lunes") = "11:15" then%>selected<%end if%>>11:15</option>
<option value = "11:30" <%if ob_rs("hora_lunes") = "11:30" then%>selected<%end if%>>11:30</option>
<option value = "11:45" <%if ob_rs("hora_lunes") = "11:45" then%>selected<%end if%>>11:45</option>
<option value = "12:00" <%if ob_rs("hora_lunes") = "12:00" then%>selected<%end if%>>12:00</option>
<option value = "12:15" <%if ob_rs("hora_lunes") = "12:15" then%>selected<%end if%>>12:15</option>
<option value = "12:30" <%if ob_rs("hora_lunes") = "12:30" then%>selected<%end if%>>12:30</option>
<option value = "12:45" <%if ob_rs("hora_lunes") = "12:45" then%>selected<%end if%>>12:45</option>
<option value = "13:00" <%if ob_rs("hora_lunes") = "13:00" then%>selected<%end if%>>13:00</option>
<option value = "13:15" <%if ob_rs("hora_lunes") = "13:15" then%>selected<%end if%>>13:15</option>
<option value = "13:30" <%if ob_rs("hora_lunes") = "13:30" then%>selected<%end if%>>13:30</option>
<option value = "13:45" <%if ob_rs("hora_lunes") = "13:45" then%>selected<%end if%>>13:45</option>
<option value = "14:00" <%if ob_rs("hora_lunes") = "14:00" then%>selected<%end if%>>14:00</option>
<option value = "14:15" <%if ob_rs("hora_lunes") = "14:15" then%>selected<%end if%>>14:15</option>
<option value = "14:30" <%if ob_rs("hora_lunes") = "14:30" then%>selected<%end if%>>14:30</option>
<option value = "14:45" <%if ob_rs("hora_lunes") = "14:45" then%>selected<%end if%>>14:45</option>
<option value = "15:00" <%if ob_rs("hora_lunes") = "15:00" then%>selected<%end if%>>15:00</option>
<option value = "15:15" <%if ob_rs("hora_lunes") = "15:15" then%>selected<%end if%>>15:15</option>
<option value = "15:30" <%if ob_rs("hora_lunes") = "15:30" then%>selected<%end if%>>15:30</option>
<option value = "15:45" <%if ob_rs("hora_lunes") = "15:45" then%>selected<%end if%>>15:45</option>
<option value = "16:00" <%if ob_rs("hora_lunes") = "16:00" then%>selected<%end if%>>16:00</option>
<option value = "16:15" <%if ob_rs("hora_lunes") = "16:15" then%>selected<%end if%>>16:15</option>
<option value = "16:30" <%if ob_rs("hora_lunes") = "16:30" then%>selected<%end if%>>16:30</option>
<option value = "16:45" <%if ob_rs("hora_lunes") = "16:45" then%>selected<%end if%>>16:45</option>
<option value = "17:00" <%if ob_rs("hora_lunes") = "17:00" then%>selected<%end if%>>17:00</option>
<option value = "17:15" <%if ob_rs("hora_lunes") = "17:15" then%>selected<%end if%>>17:15</option>
<option value = "17:30" <%if ob_rs("hora_lunes") = "17:30" then%>selected<%end if%>>17:30</option>
<option value = "17:45" <%if ob_rs("hora_lunes") = "17:45" then%>selected<%end if%>>17:45</option>
<option value = "18:00" <%if ob_rs("hora_lunes") = "18:00" then%>selected<%end if%>>18:00</option>
<option value = "18:15" <%if ob_rs("hora_lunes") = "18:15" then%>selected<%end if%>>18:15</option>
<option value = "18:30" <%if ob_rs("hora_lunes") = "18:30" then%>selected<%end if%>>18:30</option>
<option value = "18:45" <%if ob_rs("hora_lunes") = "18:45" then%>selected<%end if%>>18:45</option>
<option value = "19:00" <%if ob_rs("hora_lunes") = "19:00" then%>selected<%end if%>>19:00</option>
<option value = "19:15" <%if ob_rs("hora_lunes") = "19:15" then%>selected<%end if%>>19:15</option>
<option value = "19:30" <%if ob_rs("hora_lunes") = "19:30" then%>selected<%end if%>>19:30</option>
<option value = "19:45" <%if ob_rs("hora_lunes") = "19:45" then%>selected<%end if%>>19:45</option>
<option value = "20:00" <%if ob_rs("hora_lunes") = "20:00" then%>selected<%end if%>>20:00</option>
<option value = "20:15" <%if ob_rs("hora_lunes") = "20:15" then%>selected<%end if%>>20:15</option>
<option value = "20:30" <%if ob_rs("hora_lunes") = "20:30" then%>selected<%end if%>>20:30</option>
<option value = "20:45" <%if ob_rs("hora_lunes") = "20:45" then%>selected<%end if%>>20:45</option>
<option value = "21:00" <%if ob_rs("hora_lunes") = "21:00" then%>selected<%end if%>>21:00</option>
<option value = "21:15" <%if ob_rs("hora_lunes") = "21:15" then%>selected<%end if%>>21:15</option>
<option value = "21:30" <%if ob_rs("hora_lunes") = "21:30" then%>selected<%end if%>>21:30</option>
<option value = "21:45" <%if ob_rs("hora_lunes") = "21:45" then%>selected<%end if%>>21:45</option>
<option value = "22:00" <%if ob_rs("hora_lunes") = "22:00" then%>selected<%end if%>>22:00</option>

                                </select></td>
<td align="center"><select name="hora_martes" class="cajac" id="hora_martes"  onchange = "javascript:document.clase<%=i%>.martes.checked = true;"><option value = "" >&nbsp;</option>
<option value = "09:00" <%if ob_rs("hora_martes") = "09:00" then%>selected<%end if%>>09:00</option>
<option value = "09:15" <%if ob_rs("hora_martes") = "09:15" then%>selected<%end if%>>09:15</option>
<option value = "09:30" <%if ob_rs("hora_martes") = "09:30" then%>selected<%end if%>>09:30</option>
<option value = "09:45" <%if ob_rs("hora_martes") = "09:45" then%>selected<%end if%>>09:45</option>
<option value = "10:00" <%if ob_rs("hora_martes") = "10:00" then%>selected<%end if%>>10:00</option>
<option value = "10:15" <%if ob_rs("hora_martes") = "10:15" then%>selected<%end if%>>10:15</option>
<option value = "10:30" <%if ob_rs("hora_martes") = "10:30" then%>selected<%end if%>>10:30</option>
<option value = "10:45" <%if ob_rs("hora_martes") = "10:45" then%>selected<%end if%>>10:45</option>
<option value = "11:00" <%if ob_rs("hora_martes") = "11:00" then%>selected<%end if%>>11:00</option>
<option value = "11:15" <%if ob_rs("hora_martes") = "11:15" then%>selected<%end if%>>11:15</option>
<option value = "11:30" <%if ob_rs("hora_martes") = "11:30" then%>selected<%end if%>>11:30</option>
<option value = "11:45" <%if ob_rs("hora_martes") = "11:45" then%>selected<%end if%>>11:45</option>
<option value = "12:00" <%if ob_rs("hora_martes") = "12:00" then%>selected<%end if%>>12:00</option>
<option value = "12:15" <%if ob_rs("hora_martes") = "12:15" then%>selected<%end if%>>12:15</option>
<option value = "12:30" <%if ob_rs("hora_martes") = "12:30" then%>selected<%end if%>>12:30</option>
<option value = "12:45" <%if ob_rs("hora_martes") = "12:45" then%>selected<%end if%>>12:45</option>
<option value = "13:00" <%if ob_rs("hora_martes") = "13:00" then%>selected<%end if%>>13:00</option>
<option value = "13:15" <%if ob_rs("hora_martes") = "13:15" then%>selected<%end if%>>13:15</option>
<option value = "13:30" <%if ob_rs("hora_martes") = "13:30" then%>selected<%end if%>>13:30</option>
<option value = "13:45" <%if ob_rs("hora_martes") = "13:45" then%>selected<%end if%>>13:45</option>
<option value = "14:00" <%if ob_rs("hora_martes") = "14:00" then%>selected<%end if%>>14:00</option>
<option value = "14:15" <%if ob_rs("hora_martes") = "14:15" then%>selected<%end if%>>14:15</option>
<option value = "14:30" <%if ob_rs("hora_martes") = "14:30" then%>selected<%end if%>>14:30</option>
<option value = "14:45" <%if ob_rs("hora_martes") = "14:45" then%>selected<%end if%>>14:45</option>
<option value = "15:00" <%if ob_rs("hora_martes") = "15:00" then%>selected<%end if%>>15:00</option>
<option value = "15:15" <%if ob_rs("hora_martes") = "15:15" then%>selected<%end if%>>15:15</option>
<option value = "15:30" <%if ob_rs("hora_martes") = "15:30" then%>selected<%end if%>>15:30</option>
<option value = "15:45" <%if ob_rs("hora_martes") = "15:45" then%>selected<%end if%>>15:45</option>
<option value = "16:00" <%if ob_rs("hora_martes") = "16:00" then%>selected<%end if%>>16:00</option>
<option value = "16:15" <%if ob_rs("hora_martes") = "16:15" then%>selected<%end if%>>16:15</option>
<option value = "16:30" <%if ob_rs("hora_martes") = "16:30" then%>selected<%end if%>>16:30</option>
<option value = "16:45" <%if ob_rs("hora_martes") = "16:45" then%>selected<%end if%>>16:45</option>
<option value = "17:00" <%if ob_rs("hora_martes") = "17:00" then%>selected<%end if%>>17:00</option>
<option value = "17:15" <%if ob_rs("hora_martes") = "17:15" then%>selected<%end if%>>17:15</option>
<option value = "17:30" <%if ob_rs("hora_martes") = "17:30" then%>selected<%end if%>>17:30</option>
<option value = "17:45" <%if ob_rs("hora_martes") = "17:45" then%>selected<%end if%>>17:45</option>
<option value = "18:00" <%if ob_rs("hora_martes") = "18:00" then%>selected<%end if%>>18:00</option>
<option value = "18:15" <%if ob_rs("hora_martes") = "18:15" then%>selected<%end if%>>18:15</option>
<option value = "18:30" <%if ob_rs("hora_martes") = "18:30" then%>selected<%end if%>>18:30</option>
<option value = "18:45" <%if ob_rs("hora_martes") = "18:45" then%>selected<%end if%>>18:45</option>
<option value = "19:00" <%if ob_rs("hora_martes") = "19:00" then%>selected<%end if%>>19:00</option>
<option value = "19:15" <%if ob_rs("hora_martes") = "19:15" then%>selected<%end if%>>19:15</option>
<option value = "19:30" <%if ob_rs("hora_martes") = "19:30" then%>selected<%end if%>>19:30</option>
<option value = "19:45" <%if ob_rs("hora_martes") = "19:45" then%>selected<%end if%>>19:45</option>
<option value = "20:00" <%if ob_rs("hora_martes") = "20:00" then%>selected<%end if%>>20:00</option>
<option value = "20:15" <%if ob_rs("hora_martes") = "20:15" then%>selected<%end if%>>20:15</option>
<option value = "20:30" <%if ob_rs("hora_martes") = "20:30" then%>selected<%end if%>>20:30</option>
<option value = "20:45" <%if ob_rs("hora_martes") = "20:45" then%>selected<%end if%>>20:45</option>
<option value = "21:00" <%if ob_rs("hora_martes") = "21:00" then%>selected<%end if%>>21:00</option>
<option value = "21:15" <%if ob_rs("hora_martes") = "21:15" then%>selected<%end if%>>21:15</option>
<option value = "21:30" <%if ob_rs("hora_martes") = "21:30" then%>selected<%end if%>>21:30</option>
<option value = "21:45" <%if ob_rs("hora_martes") = "21:45" then%>selected<%end if%>>21:45</option>
<option value = "22:00" <%if ob_rs("hora_martes") = "22:00" then%>selected<%end if%>>22:00</option>

                              </select></td>
<td align="center"><select name="hora_miercoles" class="cajac" id="hora_miercoles"  onchange = "javascript:document.clase<%=i%>.miercoles.checked = true;"><option value = "" >&nbsp;</option>
<option value = "09:00" <%if ob_rs("hora_miercoles") = "09:00" then%>selected<%end if%>>09:00</option>
<option value = "09:15" <%if ob_rs("hora_miercoles") = "09:15" then%>selected<%end if%>>09:15</option>
<option value = "09:30" <%if ob_rs("hora_miercoles") = "09:30" then%>selected<%end if%>>09:30</option>
<option value = "09:45" <%if ob_rs("hora_miercoles") = "09:45" then%>selected<%end if%>>09:45</option>
<option value = "10:00" <%if ob_rs("hora_miercoles") = "10:00" then%>selected<%end if%>>10:00</option>
<option value = "10:15" <%if ob_rs("hora_miercoles") = "10:15" then%>selected<%end if%>>10:15</option>
<option value = "10:30" <%if ob_rs("hora_miercoles") = "10:30" then%>selected<%end if%>>10:30</option>
<option value = "10:45" <%if ob_rs("hora_miercoles") = "10:45" then%>selected<%end if%>>10:45</option>
<option value = "11:00" <%if ob_rs("hora_miercoles") = "11:00" then%>selected<%end if%>>11:00</option>
<option value = "11:15" <%if ob_rs("hora_miercoles") = "11:15" then%>selected<%end if%>>11:15</option>
<option value = "11:30" <%if ob_rs("hora_miercoles") = "11:30" then%>selected<%end if%>>11:30</option>
<option value = "11:45" <%if ob_rs("hora_miercoles") = "11:45" then%>selected<%end if%>>11:45</option>
<option value = "12:00" <%if ob_rs("hora_miercoles") = "12:00" then%>selected<%end if%>>12:00</option>
<option value = "12:15" <%if ob_rs("hora_miercoles") = "12:15" then%>selected<%end if%>>12:15</option>
<option value = "12:30" <%if ob_rs("hora_miercoles") = "12:30" then%>selected<%end if%>>12:30</option>
<option value = "12:45" <%if ob_rs("hora_miercoles") = "12:45" then%>selected<%end if%>>12:45</option>
<option value = "13:00" <%if ob_rs("hora_miercoles") = "13:00" then%>selected<%end if%>>13:00</option>
<option value = "13:15" <%if ob_rs("hora_miercoles") = "13:15" then%>selected<%end if%>>13:15</option>
<option value = "13:30" <%if ob_rs("hora_miercoles") = "13:30" then%>selected<%end if%>>13:30</option>
<option value = "13:45" <%if ob_rs("hora_miercoles") = "13:45" then%>selected<%end if%>>13:45</option>
<option value = "14:00" <%if ob_rs("hora_miercoles") = "14:00" then%>selected<%end if%>>14:00</option>
<option value = "14:15" <%if ob_rs("hora_miercoles") = "14:15" then%>selected<%end if%>>14:15</option>
<option value = "14:30" <%if ob_rs("hora_miercoles") = "14:30" then%>selected<%end if%>>14:30</option>
<option value = "14:45" <%if ob_rs("hora_miercoles") = "14:45" then%>selected<%end if%>>14:45</option>
<option value = "15:00" <%if ob_rs("hora_miercoles") = "15:00" then%>selected<%end if%>>15:00</option>
<option value = "15:15" <%if ob_rs("hora_miercoles") = "15:15" then%>selected<%end if%>>15:15</option>
<option value = "15:30" <%if ob_rs("hora_miercoles") = "15:30" then%>selected<%end if%>>15:30</option>
<option value = "15:45" <%if ob_rs("hora_miercoles") = "15:45" then%>selected<%end if%>>15:45</option>
<option value = "16:00" <%if ob_rs("hora_miercoles") = "16:00" then%>selected<%end if%>>16:00</option>
<option value = "16:15" <%if ob_rs("hora_miercoles") = "16:15" then%>selected<%end if%>>16:15</option>
<option value = "16:30" <%if ob_rs("hora_miercoles") = "16:30" then%>selected<%end if%>>16:30</option>
<option value = "16:45" <%if ob_rs("hora_miercoles") = "16:45" then%>selected<%end if%>>16:45</option>
<option value = "17:00" <%if ob_rs("hora_miercoles") = "17:00" then%>selected<%end if%>>17:00</option>
<option value = "17:15" <%if ob_rs("hora_miercoles") = "17:15" then%>selected<%end if%>>17:15</option>
<option value = "17:30" <%if ob_rs("hora_miercoles") = "17:30" then%>selected<%end if%>>17:30</option>
<option value = "17:45" <%if ob_rs("hora_miercoles") = "17:45" then%>selected<%end if%>>17:45</option>
<option value = "18:00" <%if ob_rs("hora_miercoles") = "18:00" then%>selected<%end if%>>18:00</option>
<option value = "18:15" <%if ob_rs("hora_miercoles") = "18:15" then%>selected<%end if%>>18:15</option>
<option value = "18:30" <%if ob_rs("hora_miercoles") = "18:30" then%>selected<%end if%>>18:30</option>
<option value = "18:45" <%if ob_rs("hora_miercoles") = "18:45" then%>selected<%end if%>>18:45</option>
<option value = "19:00" <%if ob_rs("hora_miercoles") = "19:00" then%>selected<%end if%>>19:00</option>
<option value = "19:15" <%if ob_rs("hora_miercoles") = "19:15" then%>selected<%end if%>>19:15</option>
<option value = "19:30" <%if ob_rs("hora_miercoles") = "19:30" then%>selected<%end if%>>19:30</option>
<option value = "19:45" <%if ob_rs("hora_miercoles") = "19:45" then%>selected<%end if%>>19:45</option>
<option value = "20:00" <%if ob_rs("hora_miercoles") = "20:00" then%>selected<%end if%>>20:00</option>
<option value = "20:15" <%if ob_rs("hora_miercoles") = "20:15" then%>selected<%end if%>>20:15</option>
<option value = "20:30" <%if ob_rs("hora_miercoles") = "20:30" then%>selected<%end if%>>20:30</option>
<option value = "20:45" <%if ob_rs("hora_miercoles") = "20:45" then%>selected<%end if%>>20:45</option>
<option value = "21:00" <%if ob_rs("hora_miercoles") = "21:00" then%>selected<%end if%>>21:00</option>
<option value = "21:15" <%if ob_rs("hora_miercoles") = "21:15" then%>selected<%end if%>>21:15</option>
<option value = "21:30" <%if ob_rs("hora_miercoles") = "21:30" then%>selected<%end if%>>21:30</option>
<option value = "21:45" <%if ob_rs("hora_miercoles") = "21:45" then%>selected<%end if%>>21:45</option>
<option value = "22:00" <%if ob_rs("hora_miercoles") = "22:00" then%>selected<%end if%>>22:00</option>

                              </select></td>
<td align="center"><select name="hora_jueves" class="cajac" id="hora_jueves"  onchange = "javascript:document.clase<%=i%>.jueves.checked = true;"><option value = "" >&nbsp;</option>
<option value = "09:00" <%if ob_rs("hora_jueves") = "09:00" then%>selected<%end if%>>09:00</option>
<option value = "09:15" <%if ob_rs("hora_jueves") = "09:15" then%>selected<%end if%>>09:15</option>
<option value = "09:30" <%if ob_rs("hora_jueves") = "09:30" then%>selected<%end if%>>09:30</option>
<option value = "09:45" <%if ob_rs("hora_jueves") = "09:45" then%>selected<%end if%>>09:45</option>
<option value = "10:00" <%if ob_rs("hora_jueves") = "10:00" then%>selected<%end if%>>10:00</option>
<option value = "10:15" <%if ob_rs("hora_jueves") = "10:15" then%>selected<%end if%>>10:15</option>
<option value = "10:30" <%if ob_rs("hora_jueves") = "10:30" then%>selected<%end if%>>10:30</option>
<option value = "10:45" <%if ob_rs("hora_jueves") = "10:45" then%>selected<%end if%>>10:45</option>
<option value = "11:00" <%if ob_rs("hora_jueves") = "11:00" then%>selected<%end if%>>11:00</option>
<option value = "11:15" <%if ob_rs("hora_jueves") = "11:15" then%>selected<%end if%>>11:15</option>
<option value = "11:30" <%if ob_rs("hora_jueves") = "11:30" then%>selected<%end if%>>11:30</option>
<option value = "11:45" <%if ob_rs("hora_jueves") = "11:45" then%>selected<%end if%>>11:45</option>
<option value = "12:00" <%if ob_rs("hora_jueves") = "12:00" then%>selected<%end if%>>12:00</option>
<option value = "12:15" <%if ob_rs("hora_jueves") = "12:15" then%>selected<%end if%>>12:15</option>
<option value = "12:30" <%if ob_rs("hora_jueves") = "12:30" then%>selected<%end if%>>12:30</option>
<option value = "12:45" <%if ob_rs("hora_jueves") = "12:45" then%>selected<%end if%>>12:45</option>
<option value = "13:00" <%if ob_rs("hora_jueves") = "13:00" then%>selected<%end if%>>13:00</option>
<option value = "13:15" <%if ob_rs("hora_jueves") = "13:15" then%>selected<%end if%>>13:15</option>
<option value = "13:30" <%if ob_rs("hora_jueves") = "13:30" then%>selected<%end if%>>13:30</option>
<option value = "13:45" <%if ob_rs("hora_jueves") = "13:45" then%>selected<%end if%>>13:45</option>
<option value = "14:00" <%if ob_rs("hora_jueves") = "14:00" then%>selected<%end if%>>14:00</option>
<option value = "14:15" <%if ob_rs("hora_jueves") = "14:15" then%>selected<%end if%>>14:15</option>
<option value = "14:30" <%if ob_rs("hora_jueves") = "14:30" then%>selected<%end if%>>14:30</option>
<option value = "14:45" <%if ob_rs("hora_jueves") = "14:45" then%>selected<%end if%>>14:45</option>
<option value = "15:00" <%if ob_rs("hora_jueves") = "15:00" then%>selected<%end if%>>15:00</option>
<option value = "15:15" <%if ob_rs("hora_jueves") = "15:15" then%>selected<%end if%>>15:15</option>
<option value = "15:30" <%if ob_rs("hora_jueves") = "15:30" then%>selected<%end if%>>15:30</option>
<option value = "15:45" <%if ob_rs("hora_jueves") = "15:45" then%>selected<%end if%>>15:45</option>
<option value = "16:00" <%if ob_rs("hora_jueves") = "16:00" then%>selected<%end if%>>16:00</option>
<option value = "16:15" <%if ob_rs("hora_jueves") = "16:15" then%>selected<%end if%>>16:15</option>
<option value = "16:30" <%if ob_rs("hora_jueves") = "16:30" then%>selected<%end if%>>16:30</option>
<option value = "16:45" <%if ob_rs("hora_jueves") = "16:45" then%>selected<%end if%>>16:45</option>
<option value = "17:00" <%if ob_rs("hora_jueves") = "17:00" then%>selected<%end if%>>17:00</option>
<option value = "17:15" <%if ob_rs("hora_jueves") = "17:15" then%>selected<%end if%>>17:15</option>
<option value = "17:30" <%if ob_rs("hora_jueves") = "17:30" then%>selected<%end if%>>17:30</option>
<option value = "17:45" <%if ob_rs("hora_jueves") = "17:45" then%>selected<%end if%>>17:45</option>
<option value = "18:00" <%if ob_rs("hora_jueves") = "18:00" then%>selected<%end if%>>18:00</option>
<option value = "18:15" <%if ob_rs("hora_jueves") = "18:15" then%>selected<%end if%>>18:15</option>
<option value = "18:30" <%if ob_rs("hora_jueves") = "18:30" then%>selected<%end if%>>18:30</option>
<option value = "18:45" <%if ob_rs("hora_jueves") = "18:45" then%>selected<%end if%>>18:45</option>
<option value = "19:00" <%if ob_rs("hora_jueves") = "19:00" then%>selected<%end if%>>19:00</option>
<option value = "19:15" <%if ob_rs("hora_jueves") = "19:15" then%>selected<%end if%>>19:15</option>
<option value = "19:30" <%if ob_rs("hora_jueves") = "19:30" then%>selected<%end if%>>19:30</option>
<option value = "19:45" <%if ob_rs("hora_jueves") = "19:45" then%>selected<%end if%>>19:45</option>
<option value = "20:00" <%if ob_rs("hora_jueves") = "20:00" then%>selected<%end if%>>20:00</option>
<option value = "20:15" <%if ob_rs("hora_jueves") = "20:15" then%>selected<%end if%>>20:15</option>
<option value = "20:30" <%if ob_rs("hora_jueves") = "20:30" then%>selected<%end if%>>20:30</option>
<option value = "20:45" <%if ob_rs("hora_jueves") = "20:45" then%>selected<%end if%>>20:45</option>
<option value = "21:00" <%if ob_rs("hora_jueves") = "21:00" then%>selected<%end if%>>21:00</option>
<option value = "21:15" <%if ob_rs("hora_jueves") = "21:15" then%>selected<%end if%>>21:15</option>
<option value = "21:30" <%if ob_rs("hora_jueves") = "21:30" then%>selected<%end if%>>21:30</option>
<option value = "21:45" <%if ob_rs("hora_jueves") = "21:45" then%>selected<%end if%>>21:45</option>
<option value = "22:00" <%if ob_rs("hora_jueves") = "22:00" then%>selected<%end if%>>22:00</option>

                              </select></td>
<td align="center"><select name="hora_viernes" class="cajac" id="hora_viernes"  onchange = "javascript:document.clase<%=i%>.viernes.checked = true;"><option value = "" >&nbsp;</option>
<option value = "09:00" <%if ob_rs("hora_viernes") = "09:00" then%>selected<%end if%>>09:00</option>
<option value = "09:15" <%if ob_rs("hora_viernes") = "09:15" then%>selected<%end if%>>09:15</option>
<option value = "09:30" <%if ob_rs("hora_viernes") = "09:30" then%>selected<%end if%>>09:30</option>
<option value = "09:45" <%if ob_rs("hora_viernes") = "09:45" then%>selected<%end if%>>09:45</option>
<option value = "10:00" <%if ob_rs("hora_viernes") = "10:00" then%>selected<%end if%>>10:00</option>
<option value = "10:15" <%if ob_rs("hora_viernes") = "10:15" then%>selected<%end if%>>10:15</option>
<option value = "10:30" <%if ob_rs("hora_viernes") = "10:30" then%>selected<%end if%>>10:30</option>
<option value = "10:45" <%if ob_rs("hora_viernes") = "10:45" then%>selected<%end if%>>10:45</option>
<option value = "11:00" <%if ob_rs("hora_viernes") = "11:00" then%>selected<%end if%>>11:00</option>
<option value = "11:15" <%if ob_rs("hora_viernes") = "11:15" then%>selected<%end if%>>11:15</option>
<option value = "11:30" <%if ob_rs("hora_viernes") = "11:30" then%>selected<%end if%>>11:30</option>
<option value = "11:45" <%if ob_rs("hora_viernes") = "11:45" then%>selected<%end if%>>11:45</option>
<option value = "12:00" <%if ob_rs("hora_viernes") = "12:00" then%>selected<%end if%>>12:00</option>
<option value = "12:15" <%if ob_rs("hora_viernes") = "12:15" then%>selected<%end if%>>12:15</option>
<option value = "12:30" <%if ob_rs("hora_viernes") = "12:30" then%>selected<%end if%>>12:30</option>
<option value = "12:45" <%if ob_rs("hora_viernes") = "12:45" then%>selected<%end if%>>12:45</option>
<option value = "13:00" <%if ob_rs("hora_viernes") = "13:00" then%>selected<%end if%>>13:00</option>
<option value = "13:15" <%if ob_rs("hora_viernes") = "13:15" then%>selected<%end if%>>13:15</option>
<option value = "13:30" <%if ob_rs("hora_viernes") = "13:30" then%>selected<%end if%>>13:30</option>
<option value = "13:45" <%if ob_rs("hora_viernes") = "13:45" then%>selected<%end if%>>13:45</option>
<option value = "14:00" <%if ob_rs("hora_viernes") = "14:00" then%>selected<%end if%>>14:00</option>
<option value = "14:15" <%if ob_rs("hora_viernes") = "14:15" then%>selected<%end if%>>14:15</option>
<option value = "14:30" <%if ob_rs("hora_viernes") = "14:30" then%>selected<%end if%>>14:30</option>
<option value = "14:45" <%if ob_rs("hora_viernes") = "14:45" then%>selected<%end if%>>14:45</option>
<option value = "15:00" <%if ob_rs("hora_viernes") = "15:00" then%>selected<%end if%>>15:00</option>
<option value = "15:15" <%if ob_rs("hora_viernes") = "15:15" then%>selected<%end if%>>15:15</option>
<option value = "15:30" <%if ob_rs("hora_viernes") = "15:30" then%>selected<%end if%>>15:30</option>
<option value = "15:45" <%if ob_rs("hora_viernes") = "15:45" then%>selected<%end if%>>15:45</option>
<option value = "16:00" <%if ob_rs("hora_viernes") = "16:00" then%>selected<%end if%>>16:00</option>
<option value = "16:15" <%if ob_rs("hora_viernes") = "16:15" then%>selected<%end if%>>16:15</option>
<option value = "16:30" <%if ob_rs("hora_viernes") = "16:30" then%>selected<%end if%>>16:30</option>
<option value = "16:45" <%if ob_rs("hora_viernes") = "16:45" then%>selected<%end if%>>16:45</option>
<option value = "17:00" <%if ob_rs("hora_viernes") = "17:00" then%>selected<%end if%>>17:00</option>
<option value = "17:15" <%if ob_rs("hora_viernes") = "17:15" then%>selected<%end if%>>17:15</option>
<option value = "17:30" <%if ob_rs("hora_viernes") = "17:30" then%>selected<%end if%>>17:30</option>
<option value = "17:45" <%if ob_rs("hora_viernes") = "17:45" then%>selected<%end if%>>17:45</option>
<option value = "18:00" <%if ob_rs("hora_viernes") = "18:00" then%>selected<%end if%>>18:00</option>
<option value = "18:15" <%if ob_rs("hora_viernes") = "18:15" then%>selected<%end if%>>18:15</option>
<option value = "18:30" <%if ob_rs("hora_viernes") = "18:30" then%>selected<%end if%>>18:30</option>
<option value = "18:45" <%if ob_rs("hora_viernes") = "18:45" then%>selected<%end if%>>18:45</option>
<option value = "19:00" <%if ob_rs("hora_viernes") = "19:00" then%>selected<%end if%>>19:00</option>
<option value = "19:15" <%if ob_rs("hora_viernes") = "19:15" then%>selected<%end if%>>19:15</option>
<option value = "19:30" <%if ob_rs("hora_viernes") = "19:30" then%>selected<%end if%>>19:30</option>
<option value = "19:45" <%if ob_rs("hora_viernes") = "19:45" then%>selected<%end if%>>19:45</option>
<option value = "20:00" <%if ob_rs("hora_viernes") = "20:00" then%>selected<%end if%>>20:00</option>
<option value = "20:15" <%if ob_rs("hora_viernes") = "20:15" then%>selected<%end if%>>20:15</option>
<option value = "20:30" <%if ob_rs("hora_viernes") = "20:30" then%>selected<%end if%>>20:30</option>
<option value = "20:45" <%if ob_rs("hora_viernes") = "20:45" then%>selected<%end if%>>20:45</option>
<option value = "21:00" <%if ob_rs("hora_viernes") = "21:00" then%>selected<%end if%>>21:00</option>
<option value = "21:15" <%if ob_rs("hora_viernes") = "21:15" then%>selected<%end if%>>21:15</option>
<option value = "21:30" <%if ob_rs("hora_viernes") = "21:30" then%>selected<%end if%>>21:30</option>
<option value = "21:45" <%if ob_rs("hora_viernes") = "21:45" then%>selected<%end if%>>21:45</option>
<option value = "22:00" <%if ob_rs("hora_viernes") = "22:00" then%>selected<%end if%>>22:00</option>

                              </select></td>
<td align="center"><select name="hora_sabado" class="cajac" id="hora_sabado"  onchange = "javascript:document.clase<%=i%>.sabado.checked = true;"><option value = "" ></option>
<option value = "09:00" <%if ob_rs("hora_sabado") = "09:00" then%>selected<%end if%>>09:00</option>
<option value = "09:15" <%if ob_rs("hora_sabado") = "09:15" then%>selected<%end if%>>09:15</option>
<option value = "09:30" <%if ob_rs("hora_sabado") = "09:30" then%>selected<%end if%>>09:30</option>
<option value = "09:45" <%if ob_rs("hora_sabado") = "09:45" then%>selected<%end if%>>09:45</option>
<option value = "10:00" <%if ob_rs("hora_sabado") = "10:00" then%>selected<%end if%>>10:00</option>
<option value = "10:15" <%if ob_rs("hora_sabado") = "10:15" then%>selected<%end if%>>10:15</option>
<option value = "10:30" <%if ob_rs("hora_sabado") = "10:30" then%>selected<%end if%>>10:30</option>
<option value = "10:45" <%if ob_rs("hora_sabado") = "10:45" then%>selected<%end if%>>10:45</option>
<option value = "11:00" <%if ob_rs("hora_sabado") = "11:00" then%>selected<%end if%>>11:00</option>
<option value = "11:15" <%if ob_rs("hora_sabado") = "11:15" then%>selected<%end if%>>11:15</option>
<option value = "11:30" <%if ob_rs("hora_sabado") = "11:30" then%>selected<%end if%>>11:30</option>
<option value = "11:45" <%if ob_rs("hora_sabado") = "11:45" then%>selected<%end if%>>11:45</option>
<option value = "12:00" <%if ob_rs("hora_sabado") = "12:00" then%>selected<%end if%>>12:00</option>
<option value = "12:15" <%if ob_rs("hora_sabado") = "12:15" then%>selected<%end if%>>12:15</option>
<option value = "12:30" <%if ob_rs("hora_sabado") = "12:30" then%>selected<%end if%>>12:30</option>
<option value = "12:45" <%if ob_rs("hora_sabado") = "12:45" then%>selected<%end if%>>12:45</option>
<option value = "13:00" <%if ob_rs("hora_sabado") = "13:00" then%>selected<%end if%>>13:00</option>
<option value = "13:15" <%if ob_rs("hora_sabado") = "13:15" then%>selected<%end if%>>13:15</option>
<option value = "13:30" <%if ob_rs("hora_sabado") = "13:30" then%>selected<%end if%>>13:30</option>
<option value = "13:45" <%if ob_rs("hora_sabado") = "13:45" then%>selected<%end if%>>13:45</option>
<option value = "14:00" <%if ob_rs("hora_sabado") = "14:00" then%>selected<%end if%>>14:00</option>
<option value = "14:15" <%if ob_rs("hora_sabado") = "14:15" then%>selected<%end if%>>14:15</option>
<option value = "14:30" <%if ob_rs("hora_sabado") = "14:30" then%>selected<%end if%>>14:30</option>
<option value = "14:45" <%if ob_rs("hora_sabado") = "14:45" then%>selected<%end if%>>14:45</option>
<option value = "15:00" <%if ob_rs("hora_sabado") = "15:00" then%>selected<%end if%>>15:00</option>
<option value = "15:15" <%if ob_rs("hora_sabado") = "15:15" then%>selected<%end if%>>15:15</option>
<option value = "15:30" <%if ob_rs("hora_sabado") = "15:30" then%>selected<%end if%>>15:30</option>
<option value = "15:45" <%if ob_rs("hora_sabado") = "15:45" then%>selected<%end if%>>15:45</option>
<option value = "16:00" <%if ob_rs("hora_sabado") = "16:00" then%>selected<%end if%>>16:00</option>
<option value = "16:15" <%if ob_rs("hora_sabado") = "16:15" then%>selected<%end if%>>16:15</option>
<option value = "16:30" <%if ob_rs("hora_sabado") = "16:30" then%>selected<%end if%>>16:30</option>
<option value = "16:45" <%if ob_rs("hora_sabado") = "16:45" then%>selected<%end if%>>16:45</option>
<option value = "17:00" <%if ob_rs("hora_sabado") = "17:00" then%>selected<%end if%>>17:00</option>
<option value = "17:15" <%if ob_rs("hora_sabado") = "17:15" then%>selected<%end if%>>17:15</option>
<option value = "17:30" <%if ob_rs("hora_sabado") = "17:30" then%>selected<%end if%>>17:30</option>
<option value = "17:45" <%if ob_rs("hora_sabado") = "17:45" then%>selected<%end if%>>17:45</option>
<option value = "18:00" <%if ob_rs("hora_sabado") = "18:00" then%>selected<%end if%>>18:00</option>
<option value = "18:15" <%if ob_rs("hora_sabado") = "18:15" then%>selected<%end if%>>18:15</option>
<option value = "18:30" <%if ob_rs("hora_sabado") = "18:30" then%>selected<%end if%>>18:30</option>
<option value = "18:45" <%if ob_rs("hora_sabado") = "18:45" then%>selected<%end if%>>18:45</option>
<option value = "19:00" <%if ob_rs("hora_sabado") = "19:00" then%>selected<%end if%>>19:00</option>
<option value = "19:15" <%if ob_rs("hora_sabado") = "19:15" then%>selected<%end if%>>19:15</option>
<option value = "19:30" <%if ob_rs("hora_sabado") = "19:30" then%>selected<%end if%>>19:30</option>
<option value = "19:45" <%if ob_rs("hora_sabado") = "19:45" then%>selected<%end if%>>19:45</option>
<option value = "20:00" <%if ob_rs("hora_sabado") = "20:00" then%>selected<%end if%>>20:00</option>
<option value = "20:15" <%if ob_rs("hora_sabado") = "20:15" then%>selected<%end if%>>20:15</option>
<option value = "20:30" <%if ob_rs("hora_sabado") = "20:30" then%>selected<%end if%>>20:30</option>
<option value = "20:45" <%if ob_rs("hora_sabado") = "20:45" then%>selected<%end if%>>20:45</option>
<option value = "21:00" <%if ob_rs("hora_sabado") = "21:00" then%>selected<%end if%>>21:00</option>
<option value = "21:15" <%if ob_rs("hora_sabado") = "21:15" then%>selected<%end if%>>21:15</option>
<option value = "21:30" <%if ob_rs("hora_sabado") = "21:30" then%>selected<%end if%>>21:30</option>
<option value = "21:45" <%if ob_rs("hora_sabado") = "21:45" then%>selected<%end if%>>21:45</option>
<option value = "22:00" <%if ob_rs("hora_sabado") = "22:00" then%>selected<%end if%>>22:00</option>

                              </select></td>
</tr>
</tbody>
</table>
</div>

<div class="col-md-12" style="margin-bottom:45px;margin-top:25px">
<table class="blueTable2">
<thead>
<tr>
<th style="background:#fff;border:none">&nbsp;</th>
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
  <td align="right">Pagado.&nbsp;</td>
  <td>
    <div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
      <div class="md-checkbox"><input name="septiembre" type="checkbox" class="md-check" id="septiembre<%=i%>" value="si"<%if ob_rs("septiembre") = "si" then%>checked<%end if%>><label for="septiembre<%=i%>"><span></span><span class="check"></span><span class="box"></span></label></div></div>
    </td>
  <td>
    <div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
      <div class="md-checkbox"><input name="octubre" type="checkbox" class="md-check" id="octubre<%=i%>" value="si"<%if ob_rs("octubre") = "si" then%>checked<%end if%>><label for="octubre<%=i%>"><span></span><span class="check"></span><span class="box"></span></label></div></div>
    </td>
  <td>
    <div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
      <div class="md-checkbox"><input name="noviembre" type="checkbox" class="md-check" id="noviembre<%=i%>" value="si"<%if ob_rs("noviembre") = "si" then%>checked<%end if%>><label for="noviembre<%=i%>"><span></span><span class="check"></span><span class="box"></span></label></div></div>
    </td>
  <td>
    <div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
      <div class="md-checkbox"><input name="diciembre" type="checkbox" class="md-check" id="diciembre<%=i%>" value="si"<%if ob_rs("diciembre") = "si" then%>checked<%end if%>><label for="diciembre<%=i%>"><span></span><span class="check"></span><span class="box"></span></label></div></div>
    </td>
  <td>
    <div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
      <div class="md-checkbox"><input name="enero" type="checkbox" class="md-check" id="enero<%=i%>" value="si"<%if ob_rs("enero") = "si" then%>checked<%end if%>><label for="enero<%=i%>"><span></span><span class="check"></span><span class="box"></span></label></div></div>
    </td>
  <td>
    <div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
      <div class="md-checkbox"><input name="febrero" type="checkbox" class="md-check" id="febrero<%=i%>" value="si"<%if ob_rs("febrero") = "si" then%>checked<%end if%>><label for="febrero<%=i%>"><span></span><span class="check"></span><span class="box"></span></label></div></div>
    </td>
  <td>
    <div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
      <div class="md-checkbox"><input name="marzo" type="checkbox" class="md-check" id="marzo<%=i%>" value="si"<%if ob_rs("marzo") = "si" then%>checked<%end if%>><label for="marzo<%=i%>"><span></span><span class="check"></span><span class="box"></span></label></div></div>
    </td>
  <td>
    <div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
      <div class="md-checkbox"><input name="abril" type="checkbox" class="md-check" id="abril<%=i%>" value="si"<%if ob_rs("abril") = "si" then%>checked<%end if%>><label for="abril<%=i%>"><span></span><span class="check"></span><span class="box"></span></label></div></div>
    </td>
  <td>
    <div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
      <div class="md-checkbox"><input name="mayo" type="checkbox" class="md-check" id="mayo<%=i%>" value="si"<%if ob_rs("mayo") = "si" then%>checked<%end if%>><label for="mayo<%=i%>"><span></span><span class="check"></span><span class="box"></span></label></div></div>
    </td>
  <td>
    <div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
      <div class="md-checkbox"><input name="junio" type="checkbox" class="md-check" id="junio<%=i%>" value="si"<%if ob_rs("junio") = "si" then%>checked<%end if%>><label for="junio<%=i%>"><span></span><span class="check"></span><span class="box"></span></label></div></div>
    </td>
  <td>
    <div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
      <div class="md-checkbox"><input name="julio" type="checkbox" class="md-check" id="julio<%=i%>" value="si"<%if ob_rs("julio") = "si" then%>checked<%end if%>><label for="julio<%=i%>"><span></span><span class="check"></span><span class="box"></span></label></div></div>
    </td>
  <td>
    <div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
      <div class="md-checkbox"><input name="agosto" type="checkbox" class="md-check" id="agosto<%=i%>" value="si"<%if ob_rs("agosto") = "si" then%>checked<%end if%>><label for="agosto<%=i%>"><span></span><span class="check"></span><span class="box"></span></label></div></div>
    </td>
</tr>
</tbody>

<%precio_sum = ob_rs("precio")
sumatot = 0

if ob_rs("septiembre") = "si" then
sumatot = sumatot + precio_sum + ob_rs("descuento_ampa")
end if
if ob_rs("octubre") = "si" then
sumatot = sumatot + precio_sum + ob_rs("descuento_ampa")
end if
if ob_rs("noviembre") = "si" then
sumatot = sumatot + precio_sum + ob_rs("descuento_ampa")
end if
if ob_rs("diciembre") = "si" then
sumatot = sumatot + precio_sum + ob_rs("descuento_ampa")
end if
if ob_rs("enero") = "si" then
sumatot = sumatot + precio_sum + ob_rs("descuento_ampa")
end if
if ob_rs("febrero") = "si" then
sumatot = sumatot + precio_sum + ob_rs("descuento_ampa")
end if
if ob_rs("marzo") = "si" then
sumatot = sumatot + precio_sum + ob_rs("descuento_ampa")
end if
if ob_rs("abril") = "si" then
sumatot = sumatot + precio_sum + ob_rs("descuento_ampa")
end if
if ob_rs("mayo") = "si" then
sumatot = sumatot + precio_sum + ob_rs("descuento_ampa")
end if
if ob_rs("junio") = "si" then
sumatot = sumatot + precio_sum + ob_rs("descuento_ampa")
end if
if ob_rs("julio") = "si" then
sumatot = sumatot + precio_sum + ob_rs("descuento_ampa")
end if
if ob_rs("agosto") = "si" then
sumatot = sumatot + precio_sum + ob_rs("descuento_ampa")
end if%>
<tr>
<td colspan="13" >
<div class="form-group form-md-line-input col-md-3 pull-right" style="margin-right:25px"><input name="precio_total" class="form-control" id="precio_total" value="<%if sumatot <> 0 then%><%=FormatNumber(ccur(sumatot),0)%><%end if%>" size=8 maxlength="240" style="text-align:right;"> <span style="color:#999;float:right" >total pagado</span>
</div></td>
</tr>
</table>
</div>



<div class="col-md-12">
<div class="form-group form-md-line-input" id="observaciones_a">
<label class="col-md-2 control-label" for="titulo_esp" >Observaciones.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="observaciones" id="observaciones" maxlength="160" value="<%=ob_rs("observaciones")%>"><div class="form-control-focus"> </div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">observaciones para la clase</span></div></div></div>
</div>
</div>
<div class="col-md-12 col-sm-12" style="margin-bottom:35px;padding:0px">
<div class="form-body"><div class="form-actions"><div class="row"><div class="col-md-offset-4 col-md-12">
<button type="button" class="btn green" value="enviar datos" onclick="Enviar_clase<%=i%>(this.form);" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>&nbsp;
<a href="javascript:Elimina<%=i%>();" class="btn red"><i class="fa fa-trash-o" aria-hidden="true"></i> eliminar actividad</a>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat))%><a href="<%=r%>academiaAlumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat&"&cod_cat="&cod_cat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a>
</div></div></div></div></div></div></div>
</form></div></div></div></div></div>
<!--fin tab-->

<div class="modal fade" id="confirmaElimina" tabindex="-1" role="basic" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
<div class="modal-header">
<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
<h4 class="modal-title"><i class="fa fa-exclamation-triangle" style="color:#666" aria-hidden="true"></i>  Atención</h4>
</div>
<div class="modal-body" id="alerta_txt"> ¿Seguro que deseas eliminar el/los registros seleccionados? </div>
<div class="modal-footer">
<button type="button" class="btn red " onClick="confirmarElimina_ok<%=i%>();">Confirmar</button>
<button type="button" class="btn green btn-green" data-dismiss="modal">Cancelar</button>
</div>
</div>
</div>
</div>
<script>
function Enviar_clase<%=i%> (form)  {
$('#spinner_back').show();
$('#spinner').show();
setTimeout(function(){ document.clase<%=i%>.submit(); }, 300);
return;}
function Elimina<%=i%> () {$('#confirmaElimina').modal('show');}
function confirmarElimina_ok<%=i%>(){
document.clase<%=i%>.acc.value="del";
$('#confirmaElimina').modal('hide');
$('#spinner_back').show();
$('#spinner').show();
setTimeout(function(){ document.clase<%=i%>.submit(); }, 300);}
</script>
<%ob_rs.movenext
i=i+1
loop%>
<!--FIN tab-->

</div>
<%end if
ob_rs.close%>
</div></div></div></div></div></div></div>
<!--tab_2-->

<!--tab_3-->
<div class="tab-pane" id="tab_3">
<div class="form-body">
<form action="guardar.asp" class="form-horizontal" id="inscribir" name="inscribir" method="post">
<input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>"><input name="form_op" type="hidden" value="inscribir"><input name="cod" type="hidden" value="<%=cod%>">
<div class="row"><div class="col-md-12">


<div class="col-md-6">
<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="curso">Actividad.</label>
<div class="col-md-7" ><div class="input-icon">
<select name="id_actividad" id="id_actividad" <%if form_op="modificar" then%>style="width:100%"<%end if%>>
<option value="0" ></option>
<%Sql2= "SELECT * from extra_actividades"   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connc,adOpenStatic, adCmdText
if not ob_rs2.eof then
do while not ob_rs2.eof

Sql3= "SELECT nombre, apellidos from extra_monitores WHERE id_profesor="&ob_rs2("id_monitor")&""   
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connc,adOpenStatic, adCmdText
if not ob_rs3.eof then
nom_monitor=ob_rs3("nombre")
ape_monitor=ob_rs3("apellidos")
end if
ob_rs3.close

Sql3= "SELECT nombre from extra_colegios WHERE id_colegio="&ob_rs2("id_colegio")&""   
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
ob_rs3.Open Sql3, ob_connc,adOpenStatic, adCmdText
if not ob_rs3.eof then
nom_colegio=ob_rs3("nombre")
end if
ob_rs3.close%>
<option value="<%=ob_rs2("id_actividad")%>"><%=ob_rs2("nombre")%> <%if ob_rs2("precio") <> "" or ob_rs2("precio") <> "0" then%>&nbsp;/&nbsp;<%=FormatNumber(ccur(ob_rs2("precio")),0)%> eur. / <%end if%> <%=nom_colegio%> / <%=nom_monitor%>&nbsp;<%=ape_monitor%></option>
<%nom_colegio=""
nom_monitor=""
ape_monitor=""
ob_rs2.movenext
loop
end if
ob_rs2.close%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona un curso</span></div>
</div>
</div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="anyo">Temporada.</label>
<div class="col-md-7"><div class="input-icon">
<select name="anyo" id="anyo" <%if form_op="modificar" then%>style="width:100%"<%end if%>>
<option value="" >&nbsp;</option>
<%Sql3= "SELECT anyo FROM academia_precios order by anyo desc" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connc,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>
<option value="<%=ob_rs3("anyo")%>" ><%=ob_rs3("anyo")%></option>
<%ob_rs3.movenext
loop
ob_rs3.close
end if%>
</select><div class="form-control-focus"> </div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">selecciona una temporada</span></div>
</div></div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="grupo">Grupo.</label>
<div class="col-md-7" ><div class="input-icon">
<select name="grupo" id="grupo" <%if form_op="modificar" then%>style="width:100%"<%end if%>>
<option value="" ></option>
<option value="A" >A</option>
<option value="B" >B</option>
<option value="C">C</option>
<option value="D">D</option>
<option value="E">E</option>
<option value="Tarde">Tarde</option>
<option value="Manana">Ma&ntilde;ana</option>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona un curso</span></div>
</div>
</div>

</div>


<div class="col-md-6">

<div class="form-group form-md-line-input" id="fecha_alta_a">
<label class="col-md-4 control-label" for="fecha_alta" >Fecha alta.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="fecha_alta" id="fecha_alta" maxlength="160" value=""><div class="form-control-focus"> </div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">fecha de alta del alumno (dd/mm/aaaa)</span></div></div></div>

<div class="form-group form-md-line-input">
<label class="col-md-4 control-label" for="descuento_ampa" >Sobreprecio no AMPA.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="descuento_ampa" id="descuento_ampa" maxlength="160" value=""><div class="form-control-focus"> </div><i class="fa fa-euro" aria-hidden="true"></i><span class="help-block">sobreprecio No AMPA</span></div></div></div>

</div>


</div><!--col-md-12-->
<div class="col-md-10 col-md-offset-1" style="margin-top:25px;margin-bottom:30px;">


<table class="blueTable">
<thead>
<tr>
<th>Lun.</th>
<th>Mar.</th>
<th>Mié.</th>
<th>Jue.</th>
<th>Vie.</th>
<th>Sáb.</th>
</tr>
</thead>
<tbody>
<tr>
<td><div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
<div class="md-checkbox"><input name="lunes" type="checkbox" class="md-check" id="lunes" value="si" ><label for="lunes"><span></span><span class="check"></span><span class="box"></span></label></div></div></td>
<td><div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
<div class="md-checkbox"><input name="martes" type="checkbox" class="md-check" id="martes" value="si" ><label for="martes"><span></span><span class="check"></span><span class="box"></span></label></div></div></td>
<td><div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
<div class="md-checkbox"><input name="miercoles" type="checkbox" class="md-check" id="miercoles" value="si" ><label for="miercoles"><span></span><span class="check"></span><span class="box"></span></label></div></div></td>
<td><div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
<div class="md-checkbox"><input name="jueves" type="checkbox" class="md-check" id="jueves" value="si" ><label for="jueves"><span></span><span class="check"></span><span class="box"></span></label></div></div></td>
<td><div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
<div class="md-checkbox"><input name="viernes" type="checkbox" class="md-check" id="viernes" value="si" ><label for="viernes"><span></span><span class="check"></span><span class="box"></span></label></div></div></td>
<td><div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px">
<div class="md-checkbox"><input name="sabado" type="checkbox" class="md-check" id="sabado" value="si" ><label for="sabado"><span></span><span class="check"></span><span class="box"></span></label></div></div></td>
</tr>
<tr>
<td align="center"><select name="hora_lunes" id="hora_lunes" onchange = "javascript:document.inscribir.lunes.checked = true;"><option value = "" ></option>
<option value = "09:00">09:00</option>
<option value = "09:15">09:15</option>
<option value = "09:30">09:30</option>
<option value = "09:45">09:45</option>
<option value = "10:00">10:00</option>
<option value = "10:15">10:15</option>
<option value = "10:30">10:30</option>
<option value = "10:45">10:45</option>
<option value = "11:00">11:00</option>
<option value = "11:15">11:15</option>
<option value = "11:30">11:30</option>
<option value = "11:45">11:45</option>
<option value = "12:00">12:00</option>
<option value = "12:15">12:15</option>
<option value = "12:30">12:30</option>
<option value = "12:45">12:45</option>
<option value = "13:00">13:00</option>
<option value = "13:15">13:15</option>
<option value = "13:30">13:30</option>
<option value = "13:45">13:45</option>
<option value = "14:00">14:00</option>
<option value = "14:15">14:15</option>
<option value = "14:30">14:30</option>
<option value = "14:45">14:45</option>
<option value = "15:00">15:00</option>
<option value = "15:15">15:15</option>
<option value = "15:30">15:30</option>
<option value = "15:45">15:45</option>
<option value = "16:00">16:00</option>
<option value = "16:15">16:15</option>
<option value = "16:30">16:30</option>
<option value = "16:45">16:45</option>
<option value = "17:00">17:00</option>
<option value = "17:15">17:15</option>
<option value = "17:30">17:30</option>
<option value = "17:45">17:45</option>
<option value = "18:00">18:00</option>
<option value = "18:15">18:15</option>
<option value = "18:30">18:30</option>
<option value = "18:45">18:45</option>
<option value = "19:00">19:00</option>
<option value = "19:15">19:15</option>
<option value = "19:30">19:30</option>
<option value = "19:45">19:45</option>
<option value = "20:00">20:00</option>
<option value = "20:15">20:15</option>
<option value = "20:30">20:30</option>
<option value = "20:45">20:45</option>
<option value = "21:00">21:00</option>
<option value = "21:15">21:15</option>
<option value = "21:30">21:30</option>
<option value = "21:45">21:45</option>
<option value = "22:00">22:00</option>
</select>
</td>
<td align="center"><select name="hora_martes" class="cajac" id="hora_martes" onchange = "javascript:document.inscribir.martes.checked = true;"><option value = "" ></option>
<option value = "09:00">09:00</option>
<option value = "09:15">09:15</option>
<option value = "09:30">09:30</option>
<option value = "09:45">09:45</option>
<option value = "10:00">10:00</option>
<option value = "10:15">10:15</option>
<option value = "10:30">10:30</option>
<option value = "10:45">10:45</option>
<option value = "11:00">11:00</option>
<option value = "11:15">11:15</option>
<option value = "11:30">11:30</option>
<option value = "11:45">11:45</option>
<option value = "12:00">12:00</option>
<option value = "12:15">12:15</option>
<option value = "12:30">12:30</option>
<option value = "12:45">12:45</option>
<option value = "13:00">13:00</option>
<option value = "13:15">13:15</option>
<option value = "13:30">13:30</option>
<option value = "13:45">13:45</option>
<option value = "14:00">14:00</option>
<option value = "14:15">14:15</option>
<option value = "14:30">14:30</option>
<option value = "14:45">14:45</option>
<option value = "15:00">15:00</option>
<option value = "15:15">15:15</option>
<option value = "15:30">15:30</option>
<option value = "15:45">15:45</option>
<option value = "16:00">16:00</option>
<option value = "16:15">16:15</option>
<option value = "16:30">16:30</option>
<option value = "16:45">16:45</option>
<option value = "17:00">17:00</option>
<option value = "17:15">17:15</option>
<option value = "17:30">17:30</option>
<option value = "17:45">17:45</option>
<option value = "18:00">18:00</option>
<option value = "18:15">18:15</option>
<option value = "18:30">18:30</option>
<option value = "18:45">18:45</option>
<option value = "19:00">19:00</option>
<option value = "19:15">19:15</option>
<option value = "19:30">19:30</option>
<option value = "19:45">19:45</option>
<option value = "20:00">20:00</option>
<option value = "20:15">20:15</option>
<option value = "20:30">20:30</option>
<option value = "20:45">20:45</option>
<option value = "21:00">21:00</option>
<option value = "21:15">21:15</option>
<option value = "21:30">21:30</option>
<option value = "21:45">21:45</option>
<option value = "22:00">22:00</option>
 </select>
</td>
<td align="center"><select name="hora_miercoles" class="cajac" id="hora_miercoles" onchange = "javascript:document.inscribir.miercoles.checked = true;"><option value = "" ></option>
<option value = "09:00">09:00</option>
<option value = "09:15">09:15</option>
<option value = "09:30">09:30</option>
<option value = "09:45">09:45</option>
<option value = "10:00">10:00</option>
<option value = "10:15">10:15</option>
<option value = "10:30">10:30</option>
<option value = "10:45">10:45</option>
<option value = "11:00">11:00</option>
<option value = "11:15">11:15</option>
<option value = "11:30">11:30</option>
<option value = "11:45">11:45</option>
<option value = "12:00">12:00</option>
<option value = "12:15">12:15</option>
<option value = "12:30">12:30</option>
<option value = "12:45">12:45</option>
<option value = "13:00">13:00</option>
<option value = "13:15">13:15</option>
<option value = "13:30">13:30</option>
<option value = "13:45">13:45</option>
<option value = "14:00">14:00</option>
<option value = "14:15">14:15</option>
<option value = "14:30">14:30</option>
<option value = "14:45">14:45</option>
<option value = "15:00">15:00</option>
<option value = "15:15">15:15</option>
<option value = "15:30">15:30</option>
<option value = "15:45">15:45</option>
<option value = "16:00">16:00</option>
<option value = "16:15">16:15</option>
<option value = "16:30">16:30</option>
<option value = "16:45">16:45</option>
<option value = "17:00">17:00</option>
<option value = "17:15">17:15</option>
<option value = "17:30">17:30</option>
<option value = "17:45">17:45</option>
<option value = "18:00">18:00</option>
<option value = "18:15">18:15</option>
<option value = "18:30">18:30</option>
<option value = "18:45">18:45</option>
<option value = "19:00">19:00</option>
<option value = "19:15">19:15</option>
<option value = "19:30">19:30</option>
<option value = "19:45">19:45</option>
<option value = "20:00">20:00</option>
<option value = "20:15">20:15</option>
<option value = "20:30">20:30</option>
<option value = "20:45">20:45</option>
<option value = "21:00">21:00</option>
<option value = "21:15">21:15</option>
<option value = "21:30">21:30</option>
<option value = "21:45">21:45</option>
<option value = "22:00">22:00</option>
</select>
</td>
<td align="center"><select name="hora_jueves" class="cajac" id="hora_jueves"  onchange = "javascript:document.inscribir.jueves.checked = true;"><option value = "" ></option>
<option value = "09:00">09:00</option>
<option value = "09:15">09:15</option>
<option value = "09:30">09:30</option>
<option value = "09:45">09:45</option>
<option value = "10:00">10:00</option>
<option value = "10:15">10:15</option>
<option value = "10:30">10:30</option>
<option value = "10:45">10:45</option>
<option value = "11:00">11:00</option>
<option value = "11:15">11:15</option>
<option value = "11:30">11:30</option>
<option value = "11:45">11:45</option>
<option value = "12:00">12:00</option>
<option value = "12:15">12:15</option>
<option value = "12:30">12:30</option>
<option value = "12:45">12:45</option>
<option value = "13:00">13:00</option>
<option value = "13:15">13:15</option>
<option value = "13:30">13:30</option>
<option value = "13:45">13:45</option>
<option value = "14:00">14:00</option>
<option value = "14:15">14:15</option>
<option value = "14:30">14:30</option>
<option value = "14:45">14:45</option>
<option value = "15:00">15:00</option>
<option value = "15:15">15:15</option>
<option value = "15:30">15:30</option>
<option value = "15:45">15:45</option>
<option value = "16:00">16:00</option>
<option value = "16:15">16:15</option>
<option value = "16:30">16:30</option>
<option value = "16:45">16:45</option>
<option value = "17:00">17:00</option>
<option value = "17:15">17:15</option>
<option value = "17:30">17:30</option>
<option value = "17:45">17:45</option>
<option value = "18:00">18:00</option>
<option value = "18:15">18:15</option>
<option value = "18:30">18:30</option>
<option value = "18:45">18:45</option>
<option value = "19:00">19:00</option>
<option value = "19:15">19:15</option>
<option value = "19:30">19:30</option>
<option value = "19:45">19:45</option>
<option value = "20:00">20:00</option>
<option value = "20:15">20:15</option>
<option value = "20:30">20:30</option>
<option value = "20:45">20:45</option>
<option value = "21:00">21:00</option>
<option value = "21:15">21:15</option>
<option value = "21:30">21:30</option>
<option value = "21:45">21:45</option>
<option value = "22:00">22:00</option>
</select>
</td>
<td align="center"><select name="hora_viernes" class="cajac" id="hora_viernes"  onchange = "javascript:document.inscribir.viernes.checked = true;"><option value = "" ></option>
<option value = "09:00">09:00</option>
<option value = "09:15">09:15</option>
<option value = "09:30">09:30</option>
<option value = "09:45">09:45</option>
<option value = "10:00">10:00</option>
<option value = "10:15">10:15</option>
<option value = "10:30">10:30</option>
<option value = "10:45">10:45</option>
<option value = "11:00">11:00</option>
<option value = "11:15">11:15</option>
<option value = "11:30">11:30</option>
<option value = "11:45">11:45</option>
<option value = "12:00">12:00</option>
<option value = "12:15">12:15</option>
<option value = "12:30">12:30</option>
<option value = "12:45">12:45</option>
<option value = "13:00">13:00</option>
<option value = "13:15">13:15</option>
<option value = "13:30">13:30</option>
<option value = "13:45">13:45</option>
<option value = "14:00">14:00</option>
<option value = "14:15">14:15</option>
<option value = "14:30">14:30</option>
<option value = "14:45">14:45</option>
<option value = "15:00">15:00</option>
<option value = "15:15">15:15</option>
<option value = "15:30">15:30</option>
<option value = "15:45">15:45</option>
<option value = "16:00">16:00</option>
<option value = "16:15">16:15</option>
<option value = "16:30">16:30</option>
<option value = "16:45">16:45</option>
<option value = "17:00">17:00</option>
<option value = "17:15">17:15</option>
<option value = "17:30">17:30</option>
<option value = "17:45">17:45</option>
<option value = "18:00">18:00</option>
<option value = "18:15">18:15</option>
<option value = "18:30">18:30</option>
<option value = "18:45">18:45</option>
<option value = "19:00">19:00</option>
<option value = "19:15">19:15</option>
<option value = "19:30">19:30</option>
<option value = "19:45">19:45</option>
<option value = "20:00">20:00</option>
<option value = "20:15">20:15</option>
<option value = "20:30">20:30</option>
<option value = "20:45">20:45</option>
<option value = "21:00">21:00</option>
<option value = "21:15">21:15</option>
<option value = "21:30">21:30</option>
<option value = "21:45">21:45</option>
<option value = "22:00">22:00</option>

                         </select>
</td>
<td align="center"><select name="hora_sabado" class="cajac" id="hora_sabado"  onchange = "javascript:document.inscribir.sabado.checked = true;"><option value = "" ></option>
<option value = "09:00">09:00</option>
<option value = "09:15">09:15</option>
<option value = "09:30">09:30</option>
<option value = "09:45">09:45</option>
<option value = "10:00">10:00</option>
<option value = "10:15">10:15</option>
<option value = "10:30">10:30</option>
<option value = "10:45">10:45</option>
<option value = "11:00">11:00</option>
<option value = "11:15">11:15</option>
<option value = "11:30">11:30</option>
<option value = "11:45">11:45</option>
<option value = "12:00">12:00</option>
<option value = "12:15">12:15</option>
<option value = "12:30">12:30</option>
<option value = "12:45">12:45</option>
<option value = "13:00">13:00</option>
<option value = "13:15">13:15</option>
<option value = "13:30">13:30</option>
<option value = "13:45">13:45</option>
<option value = "14:00">14:00</option>
<option value = "14:15">14:15</option>
<option value = "14:30">14:30</option>
<option value = "14:45">14:45</option>
<option value = "15:00">15:00</option>
<option value = "15:15">15:15</option>
<option value = "15:30">15:30</option>
<option value = "15:45">15:45</option>
<option value = "16:00">16:00</option>
<option value = "16:15">16:15</option>
<option value = "16:30">16:30</option>
<option value = "16:45">16:45</option>
<option value = "17:00">17:00</option>
<option value = "17:15">17:15</option>
<option value = "17:30">17:30</option>
<option value = "17:45">17:45</option>
<option value = "18:00">18:00</option>
<option value = "18:15">18:15</option>
<option value = "18:30">18:30</option>
<option value = "18:45">18:45</option>
<option value = "19:00">19:00</option>
<option value = "19:15">19:15</option>
<option value = "19:30">19:30</option>
<option value = "19:45">19:45</option>
<option value = "20:00">20:00</option>
<option value = "20:15">20:15</option>
<option value = "20:30">20:30</option>
<option value = "20:45">20:45</option>
<option value = "21:00">21:00</option>
<option value = "21:15">21:15</option>
<option value = "21:30">21:30</option>
<option value = "21:45">21:45</option>
<option value = "22:00">22:00</option>

                         </select>
</td>
</tr>
</tbody>
</table>



</div>
<div class="col-md-12">
<div class="form-group form-md-line-input" id="observaciones_b">
<label class="col-md-2 control-label" for="titulo_esp" >Observaciones.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="observaciones" id="observaciones"  maxlength="160" value=""><div class="form-control-focus"> </div><i class="fa fa-quote-right" aria-hidden="true"></i><span class="help-block">introduce observaciones para esta inscripción</span></div></div></div>
</div>
</div><!--row-->
<div class="form-body">                                                  
<div class="form-actions">
<div class="row">
<div class="col-md-offset-5 col-md-12">
<button type="button" class="btn green " onclick="Enviar_incripcion_clase(this.form);" value="enviar datos" language="javascript"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> modificar datos</button>
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<%if edi="" then%><a href="<%=r%>academiaExtAlumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%>
</div>
</div>
</div>
</div><!--ACCIONES fin form-body-->
</form>
</div><!--form-body-->
</div>
<!--tab_3-->

<%end if 'cod<>""%>
</div><!--tab-content-->
</div>
</div>
</div>
</div>
</div>
<div class="modal fade" id="alerta" tabindex="-1" role="basic" aria-hidden="true"><!--MODAL-->
<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button><h4 class="modal-title"><i class="fa fa-exclamation-triangle rojo_ff0" aria-hidden="true"></i>  Error en el campo</h4></div><div class="modal-body" id="alerta_txt"> Alerta </div><div class="modal-footer"><button type="button" class="btn dark btn-outline" data-dismiss="modal">Cerrar</button></div></div></div></div>

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
<script>
CKEDITOR.replace('observaciones',{filebrowserBrowseUrl: '/gestor/ckfinder/CKFinderScripts/ckfinder.html',filebrowserUploadUrl: '/gestor/ckfinder/connector?command=QuickUpload&type=Files',toolbar : 'Medida'});
$(document).ready(function() {
$('select').select2({minimumResultsForSearch: -1,language: "es"})
$('#multiple').select2({maximumSelectionLength: 5});;})
$("[name='visible'],[name='destacado'],[name='disponible'],[name='pres_medida']").bootstrapSwitch({onColor : 'info',onText: "Sí",offText: "No", size:"mini"});

function recargar() {location.reload();}
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
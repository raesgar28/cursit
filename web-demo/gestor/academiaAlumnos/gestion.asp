<!--#include file="../comun/menu_sup.asp"--> 
<%if cod<>""then
Sql= "SELECT * from academia_alumnos where id_alumno="&cod&" " 
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then
nombre=ob_rs("nombre")
apellidos=ob_rs("apellidos")
mail_contacto=ob_rs("mail_contacto")
telefono_contacto=ob_rs("telefono_contacto")
sexo=ob_rs("sexo")
nombre_padre=ob_rs("nombre_padre")
nombre_madre=ob_rs("nombre_madre")
grupo=ob_rs("grupo")
fecha_nacimiento=ob_rs("fecha_nacimiento")
domicilio=ob_rs("domicilio")
colegio=ob_rs("colegio")
viajado_schola=ob_rs("viajado_schola")
observaciones=ob_rs("observaciones")
titular_cuenta=ob_rs("titular_cuenta")
n_cuenta=ob_rs("n_cuenta")
acp_imagen=ob_rs("acp_imagen")
end if
ob_rs.close
end if
form_op=request("form_op")
if form_op ="" then form_op = request_equerystring("form_op")
cod_clase=request("cod_clase")
if cod_clase ="" then cod_clase = request_equerystring("cod_clase")
if cod_clase="" then cod_clase=0 end if%> 
<script src="<%=r%>lib/app/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<%if edi=""then%><div class="breadcrumbs">
<h1>Gestión Alumno Academia | 
  <%if cod<>""then%>Modificar<%else%>Crear<%end if%> </h1>
<ol class="breadcrumb">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd &"&n=dash&ndos="))%><a href="<%=r%>dash/index.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n=dash&ndos=")%>">Escritorio</a></li>
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>academiaAlumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>">Listado Alumnos</a></li>
<li class="active">Gestión Alumno</li>
</ol><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".page-sidebar"><span class="sr-only">Toggle navigation</span><span class="toggle-icon"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></span></button>
</div><%end if%>
<div class="page-content-container">
<div class="page-content-row">
<div class="page-sidebar">
<nav class="navbar" role="navigation">
<ul class="nav navbar-nav margin-bottom-35">
<li><%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat))%>
<a href="<%=r%>academiaAlumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>"><i class="icon-list"></i> Listado Alumnos
</a></li>
<li class="active"><a href="#"><i class="icon-pin"></i> Gestión Alumnos</a></li>
</ul>
</nav>
</div><!--MIGAS-->
<div class="page-content-col">
<div class="portlet light portlet-fit portlet-form bordered">
<div class="portlet-title tabbable-line">
<div class="caption"><i class="icon-note font-green"></i><span class="caption-subject font-green sbold uppercase">Gestión Alumno <%if titulo_crm_esp<>""then%>| <%=titulo_crm_esp%><%end if%></span></div>
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

<div class="form-group form-md-line-input" id="sexo_a">
<label class="col-md-4 control-label" for="sexo">Sexo.</label>
<div class="col-md-6" ><div class="input-icon">
<select name="sexo" id="sexo" <%if form_op="" or form_op="alumno" then%>class="select-100"<%end if%> >
<option value="" ></option>
<option value="Hombre" <%if sexo="Hombre" then%> selected<%end if%>>Hombre</option>
<option value="Mujer"  <%if sexo="Mujer" then%> selected<%end if%>>Mujer</option>
</select>
<div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">selecciona un sexo del alumno</span></div>
</div>
</div>

<div class="form-group form-md-line-input" id="email_a">
<label class="col-md-4 control-label" for="email" >Email alumno.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="mail_contacto" id="email" maxlength="160" value="<%=mail_contacto%>"><div class="form-control-focus"> </div><i class="fa fa-envelope" aria-hidden="true"></i><span class="help-block">debes introducir un email</span></div></div></div>

<div class="form-group form-md-line-input" id="telefono_a">
<label class="col-md-4 control-label" for="telefono" >Teléfono contacto.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="telefono_contacto" id="telefono" maxlength="160" value="<%=telefono_contacto%>"><div class="form-control-focus"> </div><i class="fa fa-phone" aria-hidden="true"></i><span class="help-block">debes introducir un teléfono</span></div></div></div>

<div class="form-group form-md-line-input" id="nombre_padre_a">
<label class="col-md-4 control-label" for="titulo_esp" >Padre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="nombre_padre" id="nombre_padre" maxlength="160" value="<%=nombre_padre%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir el nombre del padre</span></div></div></div>

<div class="form-group form-md-line-input" id="nombre_madre_a">
<label class="col-md-4 control-label" for="nombre_madre" >Madre.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="nombre_madre" id="nombre_madre" maxlength="160" value="<%=nombre_madre%>"><div class="form-control-focus"> </div><i class="fa fa-user" aria-hidden="true"></i><span class="help-block">debes introducir el nombre de la madre</span></div></div></div>

<div class="form-group form-md-line-input" id="telefono_a">
<label class="col-md-4 control-label" for="acp_imagen" >Cede imagen.</label>
<div class="campos_obliga md-checkbox form-md-checkboxes col-md-4" style="margin-bottom:10px">
<div class="md-checkbox"><input name="acp_imagen" type="checkbox" class="md-check" id="acp_imagen" value="si" <%if acp_imagen = "si" or cod="" then%>checked<%end if%>>
<label for="acp_imagen"><span></span><span class="check"></span><span class="box"></span>Sí (marcar) / No (desmarcar)</label></div></div>
</div>

</div>
<div class="col-md-6">

<div class="form-group form-md-line-input" id="grupo_a">
<label class="col-md-4 control-label" for="grupo">Grupo actual.</label>
<div class="col-md-7" ><div class="input-icon">
<select name="grupo" id="grupo" <%if form_op="" or form_op="alumno" then%>class="select-100"<%end if%>>
<option value="" ></option>
<option value="B1_1" <%if grupo = "B1_1" then%>Selected<%end if%>>B1.1</option>
<option value="B1_2" <%if grupo = "B1_2" then%>Selected<%end if%>>B1.2</option>
<option value="B2_1" <%if grupo = "B2_1" then%>Selected<%end if%>>B2.1</option>
<option value="B2_2" <%if grupo = "B2_2" then%>Selected<%end if%>>B2.2</option>
<option value="C1_1" <%if grupo = "C1_1" then%>Selected<%end if%>>C1.1</option>
<option value="C1_2" <%if grupo = "C1_2" then%>Selected<%end if%>>C1.2</option>
<option value="C2_1" <%if grupo = "C2_1" then%>Selected<%end if%>>C2.1</option>
<option value="C2_2" <%if grupo = "C2_2" then%>Selected<%end if%>>C2.2</option>
<option value="1_Infantil" <%if grupo = "1_Infantil" then%>Selected<%end if%>>1&ordm; Infantil</option>
<option value="2_Infantil" <%if grupo = "2_Infantil" then%>Selected<%end if%>>2&ordm; Infantil</option>
<option value="3_Infantil" <%if grupo = "3_Infantil" then%>Selected<%end if%>>3&ordm; Infantil</option>
<option value="1_Primaria" <%if grupo = "1_Primaria" then%>Selected<%end if%>>1&ordm; Primaria</option>
<option value="2_Primaria" <%if grupo = "2_Primaria" then%>Selected<%end if%>>2&ordm; Primaria</option>
<option value="3_Primaria" <%if grupo = "3_Primaria" then%>Selected<%end if%>>3&ordm; Primaria</option>
<option value="4_Primaria" <%if grupo = "4_Primaria" then%>Selected<%end if%>>4&ordm; Primaria</option>
<option value="5_Primaria" <%if grupo = "5_Primaria" then%>Selected<%end if%>>5&ordm; Primaria</option>
<option value="6_Primaria" <%if grupo = "6_Primaria" then%>Selected<%end if%>>6&ordm; Primaria</option>
<option value="3_4_Primaria" <%if grupo = "3_4_Primaria" then%>Selected<%end if%>>3&ordm; y 4&ordm; Primaria</option>
<option value="4_5_Primaria" <%if grupo = "4_5_Primaria" then%>Selected<%end if%>>4&ordm; y 5&ordm; Primaria</option>
<option value="5_6_Primaria" <%if grupo = "5_6_Primaria" then%>Selected<%end if%>>5&ordm; y 6&ordm; Primaria</option>
<option value="1_ESO" <%if grupo = "1_ESO" then%>Selected<%end if%>>1&ordm; ESO</option>
<option value="2_ESO" <%if grupo = "2_ESO" then%>Selected<%end if%>>2&ordm; ESO</option>
<option value="3_ESO" <%if grupo = "3_ESO" then%>Selected<%end if%>>3&ordm; ESO</option>
<option value="4_ESO" <%if grupo = "4_ESO" then%>Selected<%end if%>>4&ordm; ESO</option>
<option value="1_Bachiller" <%if grupo = "1_Bachiller" then%>Selected<%end if%>>1&ordm; Bachiller</option>
<option value="2_Bachiller" <%if grupo = "2_Bachiller" then%>Selected<%end if%>>2&ordm; Bachiller</option>
<option value="C1" <%if grupo = "C1" then%>Selected<%end if%>>C1</option>
<option value="Intensivo_C1" <%if grupo = "Intensivo_C1" then%>Selected<%end if%>>Intensivo C1</option>
<option value="Adulto_Beginner" <%if grupo = "Adulto_Beginner" then%>Selected<%end if%>>Adulto Beginner</option>
<option value="Adulto_Intermedio" <%if grupo = "Adulto_Intermedio" then%>Selected<%end if%>>Adulto Intermedio</option>
<option value="Adulto_Avanzado" <%if grupo = "Adulto_Avanzado" then%>Selected<%end if%>>Adulto Avanzado</option>
<option value="Particular" <%if grupo = "Particular" then%>Selected<%end if%>>Particular</option>
<option value="PET" <%if grupo = "PET" then%>Selected<%end if%>>PET</option>
<option value="KET" <%if grupo = "KET" then%>Selected<%end if%>>KET</option>
<option value="KET2" <%if grupo = "KET2" then%>Selected<%end if%>>KET2</option>
<option value="Pre_First" <%if grupo = "Pre_First" then%>Selected<%end if%>>Pre First</option>
<option value="First" <%if grupo = "First" then%>Selected<%end if%>>First</option>
<option value="Pre-Intermediate" <%if grupo = "Pre-Intermediate" then%>Selected<%end if%>>Pre-Intermediate</option>
<option value="SUMMER_SCHOOL" <%if grupo = "SUMMER_SCHOOL" then%>Selected<%end if%>>SUMMER SCHOOL</option>
<option value="Castellano" <%if grupo = "Castellano" then%>Selected<%end if%>>Castellano</option>
<option value="Conversacion" <%if grupo = "Conversacion" then%>Selected<%end if%>>Conversaci&oacute;n</option>
<option value="Intensive" <%if grupo = "Intensive" then%>Selected<%end if%>>Get Up Intensive</option>
<option value="Aleman" <%if grupo = "Aleman" then%>Selected<%end if%>>Alem&aacute;n</option>
<option value="Aleman" <%if grupo = "Intensivo_Verano" then%>Selected<%end if%>>Intensivo_Verano</option>
<option value="Intensivo_B1_Manana_Marzo" <%if grupo = "Intensivo_B1_Manana_Marzo" then%>Selected<%end if%>>Intensivo B1 Ma&ntilde;ana Marzo</option>
<option value="Intensivo_B1_Tarde_Marzo" <%if grupo = "Intensivo_B1_Tarde_Marzo" then%>Selected<%end if%>>Intensivo B1 Tarde Marzo</option>
<option value="Intensivo_B2_Manana_Marzo" <%if grupo = "Intensivo_B2_Manana_Marzo" then%>Selected<%end if%>>Intensivo B2 Ma&ntilde;ana Marzo</option>
<option value="Intensivo_B2_Tarde_Marzo" <%if grupo = "Intensivo_B2_Tarde_Marzo" then%>Selected<%end if%>>Intensivo B2 Tarde Marzo</option>
<option value="Intensivo_B1_Manana_Octubre" <%if grupo = "Intensivo_B1_Manana_Octubre" then%>Selected<%end if%>>Intensivo B1 Ma&ntilde;ana Octubre</option>
<option value="Intensivo_B1_Tarde_Octubre" <%if grupo = "Intensivo_B1_Tarde_Octubre" then%>Selected<%end if%>>Intensivo B1 Tarde Octubre</option>
<option value="Intensivo_B2_Manana_Octubre" <%if grupo = "Intensivo_B2_Manana_Octubre" then%>Selected<%end if%>>Intensivo B2 Ma&ntilde;ana Octubre</option>
<option value="Intensivo_B2_Tarde_Octubre" <%if grupo = "Intensivo_B2_Tarde_Octubre" then%>Selected<%end if%>>Intensivo B2 Tarde Octubre</option>
<option value="Intensivo_B1_Julio" <%if grupo = "Intensivo_B1_Julio" then%>Selected<%end if%>>Intensivo B1 Julio</option>
<option value="Intensivo_B2_Julio" <%if grupo = "Intensivo_B2_Julio" then%>Selected<%end if%>>Intensivo B2 Julio</option>
<option value="PET_for_School" <%if grupo = "PET_for_School" then%>Selected<%end if%>>PET for School</option>
<option value="Aleman_A1" <%if grupo = "Aleman_A1" then%>Selected<%end if%>>Alem&aacute;n A1</option>
<option value="Aleman_A2" <%if grupo = "Aleman_A2" then%>Selected<%end if%>>Alem&aacute;n A2</option>
<option value="Saturday_Kids" <%if grupo = "Saturday_Kids" then%>Selected<%end if%>>Saturday Kids</option>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona una web</span></div>
</div>
</div>

<div class="form-group form-md-line-input" id="fecha_nacimiento_a">
<label class="col-md-4 control-label" for="fecha_nacimiento" >Fecha nacimiento.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="fecha_nacimiento" id="fecha_nacimiento" maxlength="160" value="<%=fecha_nacimiento%>"><div class="form-control-focus"> </div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">debes introducir la fecha de nacimiento (dd/mm/aaaa)</span></div></div></div>

<div class="form-group form-md-line-input" id="domicilio_a">
<label class="col-md-4 control-label" for="domicilio" >Domicilio.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="domicilio" id="domicilio"  maxlength="160" value="<%=domicilio%>"><div class="form-control-focus"> </div><i class="fa fa-map" aria-hidden="true"></i><span class="help-block">debes introducir el domicilio del alumno</span></div></div></div>

<div class="form-group form-md-line-input" id="colegio_a">
<label class="col-md-4 control-label" for="colegio" >Colegio.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="colegio" id="colegio" maxlength="160" value="<%=colegio%>"><div class="form-control-focus"> </div><i class="fa fa-university" aria-hidden="true"></i><span class="help-block">debes introducir el colegio del alumno</span></div></div></div>

<div class="form-group form-md-line-input" id="viajado_schola_a">
<label class="col-md-4 control-label" for="viajado_schola">Viajado con Get Up.</label>
<div class="col-md-7" ><div class="input-icon">
<select name="viajado_schola" id="viajado_schola" class="select-100" >
<option value="" >&nbsp;</option>
<option value="Si" <%if viajado_schola="Si" then%>selected<%end if%>>Sí</option>
<option value="No" <%if viajado_schola="No" then%>selected<%end if%> >No</option>
</select>
<div class="form-control-focus"> </div><i class="fa fa-plane" aria-hidden="true"></i><span class="help-block">¿ha viajado con nosotros?</span></div>
</div>
</div>

<div class="form-group form-md-line-input" id="titular_cuenta_a">
<label class="col-md-4 control-label" for="titular_cuenta" >Titular cuenta.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="titular_cuenta" id="titular_cuenta" maxlength="160" value="<%=titular_cuenta%>"><div class="form-control-focus"> </div><i class="fa fa-id-card-o" aria-hidden="true"></i><span class="help-block">debes introducir el titular de la cuenta bancaria</span></div></div></div>

<div class="form-group form-md-line-input" id="n_cuenta_a">
<label class="col-md-4 control-label" for="n_cuenta" >Cuenta bancaria.</label>
<div class="col-md-8">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="n_cuenta" id="n_cuenta" maxlength="160" value="<%=n_cuenta%>"><div class="form-control-focus"> </div><i class="fa fa-money" aria-hidden="true"></i><span class="help-block">debes introducir la cuenta bancaria</span></div></div></div>

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

<%Sql= "SELECT * from academia_clases where id_alumno = "&cod&" order by id_precio desc"   
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
ob_rs.Open Sql, ob_connc,adOpenStatic, adCmdText
if not ob_rs.eof then
i=1%>
<div class="panel-group accordion scrollable" id="acordeon_c">

<!--Inicio tab-->
<%do while not ob_rs.eof

Sql_p="SELECT * FROM academia_precios where id_precio = "&ob_rs("id_precio")&" "
Set Ob_RS_p = Server.CreateObject("ADODB.Recordset")
ob_rs_p.Open Sql_p, ob_connc,adOpenStatic, adCmdText
if not ob_rs_p.eof then
precio_septiembre = Ob_RS_p("precio_septiembre")
precio_octubre = Ob_RS_p("precio_octubre")
precio_noviembre = Ob_RS_p("precio_noviembre")
precio_diciembre = Ob_RS_p("precio_diciembre")
precio_enero = Ob_RS_p("precio_enero")
precio_febrero = Ob_RS_p("precio_febrero")
precio_marzo = Ob_RS_p("precio_marzo")
precio_abril = Ob_RS_p("precio_abril")
precio_mayo = Ob_RS_p("precio_mayo")
precio_junio = Ob_RS_p("precio_junio")
precio_julio = Ob_RS_p("precio_julio")
precio_agosto = Ob_RS_p("precio_agosto")
end if
Ob_RS_p.close

Sql2= "SELECT * from academia_precios where id_precio = "&ob_rs("id_precio")&""   
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
ob_rs2.Open Sql2, ob_connc,adOpenStatic, adCmdText
if not ob_rs2.eof then%>

<div class="panel panel-default" style="border:none;margin-bottom:5px"><div class="panel-heading"><h4 class="panel-title acordeon"><a class="accordion-toggle accordion-toggle-styled <%if int(cod_clase)<>int(ob_rs("id_clase"))then%>collapsed<%end if%>" data-toggle="collapse" data-parent="#acordeon_c" href="#acordeon_a<%=i%>"><i class="fa fa-graduation-cap margin-right-8"></i> <%=ob_rs2("anyo")%></a></h4></div>
<div id="acordeon_a<%=i%>" class="panel-collapse collapse  <%if int(cod_clase)=int(ob_rs("id_clase"))then%>in<%end if%>"><div class="panel-body"><div class="col-md-12"><div class="portlet-body">
<form action="guardar.asp" class="form-horizontal" id="clase<%=i%>" name="clase<%=i%>" method="post"><input name="r" type="hidden" value="<%=r%>"><input name="rd" type="hidden" value="<%=rd%>"><input name="n" type="hidden" value="<%=n%>"><input name="ndos" type="hidden" value="<%=ndos%>"><input name="ntres" type="hidden" value="<%=ntres%>"><input name="ncuat" type="hidden" value="<%=ncuat%>">
<input name="cod" type="hidden" value="<%=cod%>">
<input name="cod_clase" type="hidden" value="<%=ob_rs("id_clase")%>">
<input name="form_op" type="hidden" value="modificar">
<input name="acc" type="hidden" value="">

<div class="scroller" style="height: 200px;"><div class="panel-body flotea" >
<div class="col-md-12">

<div class="col-md-6"><!--PRIMERA COLUMNA-->

<div class="form-group form-md-line-input" id="id_profesor_a">
<label class="col-md-3 control-label" for="id_profesor">Profesor.</label>
<div class="col-md-7"><div class="input-icon">
<select name="id_profesor" id="id_profesor" <%if form_op="modificar" or form_op="inscribir" then%>class="select-100"<%end if%>><option value="" >&nbsp;</option>
<%Sql3= "SELECT * from academia_profesores" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connc,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>
<option value="<%=ob_rs3("id_profesor")%>" <%if ob_rs("id_profesor") = ob_rs3("id_profesor") then%>selected<%end if%>><%=ob_rs3("nombre")%></option>
<%ob_rs3.movenext
loop
ob_rs3.close
end if%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona un profesor</span></div>
</div>
</div>

<div class="form-group form-md-line-input" id="id_precio_a">
<label class="col-md-3 control-label" for="id_web">Temporada.</label>
<div class="col-md-5"><div class="input-icon">
<select name="id_precio" id="id_precio" <%if form_op="modificar" or form_op="inscribir" then%>class="select-100"<%end if%>>
<option value="" >&nbsp;</option>
<%Sql3= "SELECT * FROM academia_precios where borrado <> 'si' or borrado is null" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connc,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>
<option value="<%=ob_rs3("id_precio")%>" <%if ob_rs3("id_precio") = ob_rs("id_precio") then%>selected<%end if%>><%=ob_rs3("anyo")%></option>
<%ob_rs3.movenext
loop
ob_rs3.close
end if%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">selecciona una temporada</span></div>
</div>
</div>

<div class="form-group form-md-line-input" id="n_reserva_a" style="display:none">
<label class="col-md-3 control-label" for="n_reserva" >Número reserva.</label>
<div class="col-md-5">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="n_reserva" id="n_reserva" maxlength="160" value="<%=ob_rs("n_reserva")%>"><div class="form-control-focus"> </div><i class="fa fa-sort-numeric-desc" aria-hidden="true"></i><span class="help-block">número de reserva</span></div></div>
<div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px"><div class="md-checkbox col-md-5 "><input type="checkbox" name="genera_factura" id="genera_factura" class="md-check" value="si" ><label for="genera_factura"><span></span><span class="check"></span><span class="box"></span> Generar nº. </label></div></div>
</div>

<div class="form-group form-md-line-input" id="forma_pago_a">
<label class="col-md-3 control-label" for="forma_pago">Forma pago.</label>
<div class="col-md-6" ><div class="input-icon">
<select name="forma_pago" id="forma_pago" <%if form_op="modificar" or form_op="inscribir" then%>class="select-100"<%end if%>>
<option value="">&nbsp;</option>
<option value="efectivo" <%if ob_rs("forma_pago")="efectivo" then%> selected<%end if%>>Efectivo</option>
<option value="bancario" <%if ob_rs("forma_pago")="bancario" then%> selected<%end if%>>Bancario</option>
</select>
<div class="form-control-focus"> </div><i class="fa fa-money" aria-hidden="true"></i><span class="help-block">selecciona una forma de pago</span></div>
</div>
</div>

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
<tr>
<td align="right">&nbsp;</td>
<td align="center"><%if precio_septiembre <> 0 then%><%=precio_septiembre%> &euro;<%end if%></td>
<td align="center"><%if precio_octubre <> 0 then%><%=precio_octubre%> &euro;<%end if%></td>
<td align="center"><%if precio_noviembre <> 0 then%><%=precio_noviembre%> &euro;<%end if%></td>
<td align="center"><%if precio_diciembre <> 0 then%><%=precio_diciembre%> &euro;<%end if%></td>
<td align="center"><%if precio_enero <> 0 then%><%=precio_enero%> &euro;<%end if%></td>
<td align="center"><%if precio_febrero <> 0 then%><%=precio_febrero%> &euro;<%end if%></td>
<td align="center"><%if precio_marzo <> 0 then%><%=precio_marzo%> &euro;<%end if%></td>
<td align="center"><%if precio_abril <> 0 then%><%=precio_abril%> &euro;<%end if%></td>
<td align="center"><%if precio_mayo <> 0 then%><%=precio_mayo%>&nbsp;&euro;<%end if%></td>
<td align="center"><%if precio_junio <> 0 then%><%=precio_junio%> &euro;<%end if%></td>
<td align="center"><%if precio_julio <> 0 then%><%=precio_julio%> &euro;<%end if%></td>
<td align="center"><%if precio_agosto <> 0 then%><%=precio_agosto%> &euro;<%end if%></td>
</tr>
<tr>
<td align="right">opcional.&nbsp;&nbsp;</td>
<td>

<div class="form-group form-md-line-input col-md-12" style="margin:0 auto;">
<input name="septiembre_op" type="text" class="form-control" style="text-align:center" id="septiembre_op" size="4" <%if ob_rs("septiembre_op") <> 0 then%> value="<%=FormatNumber(ccur(ob_rs("septiembre_op")),2)%>"<%end if%>>
</div>

</td>
<td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="octubre_op" type="text" class="form-control" style="text-align:center" id="octubre_op" size="4" <%if ob_rs("octubre_op") <> 0 then%> value="<%=FormatNumber(ccur(ob_rs("octubre_op")),2)%>"<%end if%>></div></td>
<td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="noviembre_op" type="text" class="form-control" style="text-align:center" id="noviembre_op" size="4" <%if ob_rs("noviembre_op") <> 0 then%> value="<%=FormatNumber(ccur(ob_rs("noviembre_op")),2)%>"<%end if%>></div></td>
<td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="diciembre_op" type="text" class="form-control" style="text-align:center" id="diciembre_op" size="4" <%if ob_rs("diciembre_op") <> 0 then%> value="<%=FormatNumber(ccur(ob_rs("diciembre_op")),2)%>"<%end if%>></div></td>
<td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="enero_op" type="text"  class="form-control" style="text-align:center" id="enero_op" size="4" <%if ob_rs("enero_op") <> 0 then%> value="<%=FormatNumber(ccur(ob_rs("enero_op")),2)%>"<%end if%>></div></td>
<td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="febrero_op" type="text"  class="form-control" style="text-align:center" id="febrero_op" size="4" <%if ob_rs("febrero_op") <> 0 then%> value="<%=FormatNumber(ccur(ob_rs("febrero_op")),2)%>"<%end if%>></div></td>
<td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="marzo_op" type="text" class="form-control" style="text-align:center" id="marzo_op" size="4" <%if ob_rs("marzo_op") <> 0 then%> value="<%=FormatNumber(ccur(ob_rs("marzo_op")),2)%>"<%end if%>></div></td>
<td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="abril_op" type="text" class="form-control" style="text-align:center" id="abril_op" size="4" <%if ob_rs("abril_op") <> 0 then%> value="<%=FormatNumber(ccur(ob_rs("abril_op")),2)%>"<%end if%>></div></td>
<td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="mayo_op" type="text" class="form-control" style="text-align:center" id="mayo_op" size="4" <%if ob_rs("mayo_op") <> 0 then%> value="<%=FormatNumber(ccur(ob_rs("mayo_op")),2)%>"<%end if%>></div></td>
<td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="junio_op" type="text" class="form-control" style="text-align:center" id="junio_op" size="4" <%if ob_rs("junio_op") <> 0 then%> value="<%=FormatNumber(ccur(ob_rs("junio_op")),2)%>"<%end if%>></div></td>
<td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="julio_op" type="text" class="form-control" style="text-align:center" id="julio_op" size="4" <%if ob_rs("julio_op") <> 0 then%> value="<%=FormatNumber(ccur(ob_rs("julio_op")),2)%>"<%end if%>></div></td>
<td><div class="form-group form-md-line-input col-md-12" style="margin:0 auto;"><input name="agosto_op" type="text" class="form-control" style="text-align:center" id="agosto_op" size="4" <%if ob_rs("agosto_op") <> 0 then%> value="<%=FormatNumber(ccur(ob_rs("agosto_op")),2)%>"<%end if%>></div></td>
</tr>
<tr>
<td align="right">método pago.&nbsp;&nbsp; </td>
<td align="center"><select name="septiembre_p" id="septiembre_p" style="min-width:70px">
<option value = "" >&nbsp;</option>
<option value = "bancario" <%if ob_rs("septiembre_p") = "bancario" then%>selected<%end if%>>Banco</option>
<option value = "efectivo" <%if ob_rs("septiembre_p") = "efectivo" then%>selected<%end if%>>Efectivo</option>
<option value = "tarjeta" <%if ob_rs("septiembre_p") = "tarjeta" then%>selected<%end if%>>Tarjeta</option>
</select></td>
  <td><select name="octubre_p" id="octubre_p" style="min-width:70px">
<option value = "" >&nbsp;</option>
<option value = "bancario" <%if ob_rs("octubre_p") = "bancario" then%>selected<%end if%>>Banco</option>
<option value = "efectivo" <%if ob_rs("octubre_p") = "efectivo" then%>selected<%end if%>>Efectivo</option>
<option value = "tarjeta" <%if ob_rs("octubre_p") = "tarjeta" then%>selected<%end if%>>Tarjeta</option>
</select></td>
  <td><select name="noviembre_p" id="noviembre_p" style="min-width:70px">
<option value = "" >&nbsp;</option>
<option value = "bancario" <%if ob_rs("noviembre_p") = "bancario" then%>selected<%end if%>>Banco</option>
<option value = "efectivo" <%if ob_rs("noviembre_p") = "efectivo" then%>selected<%end if%>>Efectivo</option>
<option value = "tarjeta" <%if ob_rs("noviembre_p") = "tarjeta" then%>selected<%end if%>>Tarjeta</option>
</select></td>
  <td><select name="diciembre_p" id="diciembre_p" style="min-width:70px">
<option value = "" >&nbsp;</option>
<option value = "bancario" <%if ob_rs("diciembre_p") = "bancario" then%>selected<%end if%>>Banco</option>
<option value = "efectivo" <%if ob_rs("diciembre_p") = "efectivo" then%>selected<%end if%>>Efectivo</option>
<option value = "tarjeta" <%if ob_rs("diciembre_p") = "tarjeta" then%>selected<%end if%>>Tarjeta</option>
</select></td>
  <td><select name="enero_p" id="enero_p" style="min-width:70px">
<option value = "" >&nbsp;</option>
<option value = "bancario" <%if ob_rs("enero_p") = "bancario" then%>selected<%end if%>>Banco</option>
<option value = "efectivo" <%if ob_rs("enero_p") = "efectivo" then%>selected<%end if%>>Efectivo</option>
<option value = "tarjeta" <%if ob_rs("enero_p") = "tarjeta" then%>selected<%end if%>>Tarjeta</option>
</select></td>
  <td><select name="febrero_p" id="febrero_p" style="min-width:70px">
<option value = "" >&nbsp;</option>
<option value = "bancario" <%if ob_rs("febrero_p") = "bancario" then%>selected<%end if%>>Banco</option>
<option value = "efectivo" <%if ob_rs("febrero_p") = "efectivo" then%>selected<%end if%>>Efectivo</option>
<option value = "tarjeta" <%if ob_rs("febrero_p") = "tarjeta" then%>selected<%end if%>>Tarjeta</option>
</select></td>
  <td><select name="marzo_p" id="marzo_p" style="min-width:70px">
<option value = "" >&nbsp;</option>
<option value = "bancario" <%if ob_rs("marzo_p") = "bancario" then%>selected<%end if%>>Banco</option>
<option value = "efectivo" <%if ob_rs("marzo_p") = "efectivo" then%>selected<%end if%>>Efectivo</option>
<option value = "tarjeta" <%if ob_rs("marzo_p") = "tarjeta" then%>selected<%end if%>>Tarjeta</option>
</select></td>
  <td><select name="abril_p" id="abril_p" style="min-width:70px">
<option value = "" >&nbsp;</option>
<option value = "bancario" <%if ob_rs("abril_p") = "bancario" then%>selected<%end if%>>Banco</option>
<option value = "efectivo" <%if ob_rs("abril_p") = "efectivo" then%>selected<%end if%>>Efectivo</option>
<option value = "tarjeta" <%if ob_rs("abril_p") = "tarjeta" then%>selected<%end if%>>Tarjeta</option>
</select></td>
  <td><select name="mayo_p" id="mayo_p" style="min-width:70px">
<option value = "" >&nbsp;</option>
<option value = "bancario" <%if ob_rs("mayo_p") = "bancario" then%>selected<%end if%>>Banco</option>
<option value = "efectivo" <%if ob_rs("mayo_p") = "efectivo" then%>selected<%end if%>>Efectivo</option>
<option value = "tarjeta" <%if ob_rs("mayo_p") = "tarjeta" then%>selected<%end if%>>Tarjeta</option>
</select></td>
  <td><select name="junio_p" id="junio_p" style="min-width:70px">
<option value = "" >&nbsp;</option>
<option value = "bancario" <%if ob_rs("junio_p") = "bancario" then%>selected<%end if%>>Banco</option>
<option value = "efectivo" <%if ob_rs("junio_p") = "efectivo" then%>selected<%end if%>>Efectivo</option>
<option value = "tarjeta" <%if ob_rs("junio_p") = "tarjeta" then%>selected<%end if%>>Tarjeta</option>
</select></td>
  <td><select name="julio_p" id="julio_p" style="min-width:70px">
<option value = "" >&nbsp;</option>
<option value = "bancario" <%if ob_rs("julio_p") = "bancario" then%>selected<%end if%>>Banco</option>
<option value = "efectivo" <%if ob_rs("julio_p") = "efectivo" then%>selected<%end if%>>Efectivo</option>
<option value = "tarjeta" <%if ob_rs("julio_p") = "tarjeta" then%>selected<%end if%>>Tarjeta</option>
</select></td>
  <td><select name="agosto_p" id="agosto_p" style="min-width:70px">
<option value = "" >&nbsp;</option>
<option value = "bancario" <%if ob_rs("agosto_p") = "bancario" then%>selected<%end if%>>Banco</option>
<option value = "efectivo" <%if ob_rs("agosto_p") = "efectivo" then%>selected<%end if%>>Efectivo</option>
<option value = "tarjeta" <%if ob_rs("agosto_p") = "tarjeta" then%>selected<%end if%>>Tarjeta</option>
</select></td>
</tr>
</tbody>

<% precio_sum = 0
if precio_septiembre <> "" and precio_septiembre <> 0 and ob_rs("septiembre") = "si" then 
precio_sum = precio_septiembre + precio_sum
else
precio_sum = ob_rs("septiembre_op") + precio_sum
end if
if precio_octubre <> "" and precio_octubre <> 0 and ob_rs("octubre") = "si" then
precio_sum = precio_octubre + precio_sum
else
precio_sum = ob_rs("octubre_op") + precio_sum
end if
if precio_noviembre <> "" and precio_noviembre <> 0 and ob_rs("noviembre") = "si"  then
precio_sum = precio_noviembre + precio_sum
else
precio_sum = ob_rs("noviembre_op") + precio_sum
end if

if precio_diciembre <> "" and precio_diciembre <> 0 and ob_rs("diciembre") = "si" then
precio_sum = precio_diciembre + precio_sum
else
precio_sum = ob_rs("diciembre_op") + precio_sum
end if
if precio_enero <> "" and precio_enero <> 0 and ob_rs("enero") = "si" then
precio_sum = precio_enero + precio_sum
else
precio_sum = ob_rs("enero_op") + precio_sum
end if
if precio_febrero <> "" and precio_febrero <> 0 and ob_rs("febrero") = "si" then
precio_sum = precio_febrero + precio_sum
else
precio_sum = ob_rs("febrero_op") + precio_sum
end if
if precio_marzo <> "" and precio_marzo <> 0 and ob_rs("marzo") = "si" then
precio_sum = precio_marzo + precio_sum
else
precio_sum = ob_rs("marzo_op") + precio_sum
end if
if precio_abril <> "" and precio_abril <> 0 and ob_rs("abril") = "si" then
precio_sum = precio_abril + precio_sum
else
precio_sum = ob_rs("abril_op") + precio_sum
end if
if precio_mayo <> "" and precio_mayo <> 0 and ob_rs("mayo") = "si" then
precio_sum = precio_mayo + precio_sum
else
precio_sum = ob_rs("mayo_op") + precio_sum
end if

if precio_junio <> "" and precio_junio <> 0 and ob_rs("junio") = "si"  then
precio_sum = precio_junio + precio_sum
else
precio_sum = ob_rs("junio_op") + precio_sum
end if

if precio_julio <> "" and precio_julio <> 0 and ob_rs("julio") = "si"  then
precio_sum = precio_julio + precio_sum
else
precio_sum = ob_rs("julio_op") + precio_sum
end if

if precio_agosto <> "" and precio_agosto <> 0 and ob_rs("agosto") = "si" then
precio_sum = precio_agosto + precio_sum
else
precio_sum =  ob_rs("agosto_op") + precio_sum
end if%>
<tr>
<td colspan="13" >
<div class="form-group form-md-line-input col-md-3 pull-right" style="margin-right:25px"><input name="precio_total" class="form-control" id="precio_total" value="<%if precio_sum <> 0 then%><%=FormatNumber(ccur(precio_sum),2)%><%end if%>" size=8 maxlength="240" style="text-align:right;"> <span style="color:#999;float:right" >total pagado</span>
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
<%end if
ob_rs2.close
ob_rs.movenext
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
<div class="form-group form-md-line-input" id="id_profesor_b">
<label class="col-md-4 control-label" for="id_profesor">Profesor.</label>
<div class="col-md-7"><div class="input-icon">
<select name="id_profesor" id="id_profesor" ><option value="" >&nbsp;</option>
<%Sql3= "SELECT * from academia_profesores" 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connc,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>
<option value="<%=ob_rs3("id_profesor")%>"><%=ob_rs3("nombre")%></option>
<%ob_rs3.movenext
loop
ob_rs3.close
end if%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-graduation-cap" aria-hidden="true"></i><span class="help-block">selecciona un profesor</span></div>
</div>
</div>
<div class="form-group form-md-line-input" id="fecha_alta_b">
<label class="col-md-4 control-label" for="fecha_alta" >Fecha alta.</label>
<div class="col-md-5">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="fecha_alta" id="fecha_alta" maxlength="160"><div class="form-control-focus"> </div><i class="fa fa-calendar-o" aria-hidden="true"></i><span class="help-block">fecha de alta (dd/mm/aaaa)</span></div></div></div>
</div>
<div class="col-md-6">
<div class="form-group form-md-line-input" id="id_precio_b">
<label class="col-md-3 control-label" for="id_web">Temporada.</label>
<div class="col-md-7"><div class="input-icon">
<select name="id_precio" id="id_precio" >
<option value="" >&nbsp;</option>
<%Sql3= "SELECT * FROM academia_precios where borrado <> 'si' or borrado is null order by id_precio desc " 
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connc,adOpenStatic, adCmdText
if not ob_rs3.eof then
do while not ob_rs3.eof%>
<option value="<%=ob_rs3("id_precio")%>"><%=ob_rs3("anyo")%></option>
<%ob_rs3.movenext
loop
ob_rs3.close
end if%>
</select>
<div class="form-control-focus"> </div><i class="fa fa-calendar" aria-hidden="true"></i><span class="help-block">selecciona una temporada</span></div>
</div>
</div>
<div class="form-group form-md-line-input" id="n_reserva_b" style="display:none">
<label class="col-md-3 control-label" for="n_reserva" >Número reserva.</label>
<div class="col-md-5">
<div class="input-icon"><input type="text" class="form-control" placeholder="" name="n_reserva" id="n_reserva" maxlength="160" value=""><div class="form-control-focus"> </div><i class="fa fa-sort-numeric-desc" aria-hidden="true"></i><span class="help-block">número de reserva</span></div></div>
<div class="campos_obliga md-checkbox form-md-checkboxes col-md-offset-5" style="margin-bottom:10px"><div class="md-checkbox col-md-5 "><input type="checkbox" name="genera_factura_ins" id="genera_factura_ins" class="md-check" value="si" ><label for="genera_factura_ins"><span></span><span class="check"></span><span class="box"></span> Generar nº. </label></div></div>
</div>
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
<%if edi="" then%><a href="<%=r%>academiaAlumnos/listado.jpk2?enc=<%=EnCrypt("?r="&r&"&rd="&rd&"&n="&n&"&ndos="&ndos&"&ntres="&ntres&"&ncuat="&ncuat)%>" class="btn default"><i class="fa fa-reply" aria-hidden="true"></i> volver al listado</a><%end if%>
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
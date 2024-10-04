<%rd="../"
id_item=request("id_item")%>
<!--#include file="../conex/conex.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<%Sql= "SELECT u_nombre,u_apellidos,u_email, u_telefono, u_movil, u_direccion,u_ciudad,u_c_postal,u_provincia,u_pais  FROM usuarios WHERE id_usuario= "&session("id_usuario")&""
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<input type="hidden" name="u_nombre" id="u_nombre" value="<%=ob_rs("u_nombre")%>">
<input type="hidden" name="u_apellidos" id="u_apellidos" value="<%=ob_rs("u_apellidos")%>">
<input type="hidden" name="u_email" id="u_email" value="<%=ob_rs("u_email")%>">
<input type="hidden" name="u_telefono" id="u_telefono" value="<%=ob_rs("u_telefono")%>">
<input type="hidden" name="u_movil" id="u_movil" value="<%=ob_rs("u_movil")%>">
<input type="hidden" name="u_direccion" id="u_direccion" value="<%=ob_rs("u_direccion")%>">
<input type="hidden" name="u_ciudad" id="u_ciudad" value="<%=ob_rs("u_ciudad")%>">
<input type="hidden" name="u_c_postal" id="u_c_postal" value="<%=ob_rs("u_c_postal")%>">
<input type="hidden" name="u_provincia" id="u_provincia" value="<%=ob_rs("u_provincia")%>">
<input type="hidden" name="u_pais" id="u_pais" value="<%=ob_rs("u_pais")%>">
<%end if
ob_rs.close
if id_item<>"" and session("u_agente")="si" then
Sql2= "SELECT id_agente FROM agentesCursos WHERE id_agente= "&session("id_usuario")&" AND id_item="&id_item&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then
session("ag_autorizado")="si"
auto="si"
else
session("ag_autorizado")="no"
auto="no"
ob_rs2.close
end if
end if
Sql= "SELECT id_programa FROM programas_tmp, alumnos_tmp WHERE programas_tmp.id_usuario= "&session("id_usuario")&" AND programas_tmp.id_alumno=alumnos_tmp.id_alumno"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
ok_tmp="si"
end if
ob_rs.close
Sql= "SELECT id_programa FROM programas, alumnos WHERE programas.id_usuario= "&session("id_usuario")&" AND programas.id_alumno=alumnos.id_alumno"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
ok_def="si"
end if
ob_rs.close%>
<%if ok_tmp="si" or ok_def="si" then%>
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-graduation-cap" aria-hidden="true" style="margin-right:10px"></i>Alumnos registrados <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:25px;margin-right:7px;"></i><i class="fa fa-user" aria-hidden="true"></i> <%=session("us_nombre")%> <%=session("us_apellidos")%></h3>
</div>
<div class="panel-body"> Listado de alumnos registrados con este usuario. Puedes inscribir a uno de ellos en este curso (mediante <i class="fa fa-pencil-square-o" aria-hidden="true"></i>) o bien inscribir a un nuevo alumno. Situa el cursor sobre los iconos incluidos en la columna "Formalizar" (si los hubiera) para ver el estado de la inscripción</div>
</div>
<%Sql= "SELECT a_nombre, a_apellidos, programas_tmp.id_alumno, id_item, f_inicio, id_programa, estadoPago, metodoPago FROM programas_tmp, alumnos_tmp WHERE programas_tmp.id_usuario= "&session("id_usuario")&" AND programas_tmp.id_alumno=alumnos_tmp.id_alumno GROUP BY programas_tmp.id_alumno, a_nombre, a_apellidos, id_item, f_inicio, id_programa, estadoPago, metodoPago ORDER BY a_apellidos, id_programa DESC"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then%>
<div class="conten_tabla">
<table class="table">
<thead>
<tr>
<th style="width:25px;">#</th>
<th style="width:250px;">Nombre</th>
<th style="width:210px;">Preinscrito en</th>
<th style="text-align:center;width:100px">Año</th>
<th style="text-align:center;width:100px">Presupuesto</th>
<th style="text-align:center;width:50px">Inscribir</th>
<th style="text-align:center;width:50px">Formalizar</th>
<th style="text-align:center;width:50px">Eliminar</th>
</tr>
</thead>
<tbody>
<%i=1
do while not ob_rs.eof%>
<tr>
<th scope="row"><%=i%></th>
<td><%=ob_rs("a_apellidos")%>, &nbsp;<%=ob_rs("a_nombre")%></td>
<td><%if ob_rs("id_item")<>0 and ob_rs("id_item")<>"" then
Sql2= "SELECT titulo_esp FROM items WHERE id_item = "&ob_rs("id_item")&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%><%=ob_rs2("titulo_esp")%><%else%>--<%end if%><%ob_rs2.close%><%end if%></td>
<td style="text-align:center;"><%if year(ob_rs("f_inicio"))<>1000then%><%=year(ob_rs("f_inicio"))%><%end if%></td>
<td style="text-align:center;"><a href="#/" onClick="javascript:a_pdf_presupuesto(<%=ob_rs("id_programa")%>);"><span class="fa fa-download" aria-hidden="true"></span></a></td>
<td style="text-align:center"><%if int(ob_rs("id_item")) <> int(id_item) and session("ag_autorizado")<>"no" and auto<>"no" then%><a href="#/" onClick="javascript:a_inscribir_alumno_reg(<%=ob_rs("id_alumno")%>);"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a><%else%><i class="fa fa-check-square-o" aria-hidden="true" style="color:#ccc"></i><%end if%></td>
<td style="text-align:center">
<%if ob_rs("estadoPago")<>""then
if ob_rs("estadoPago")="Pendiente Transferencia" then%>
<a href="#/" onClick="javascript:a_formalizar_alumno_reg(<%=ob_rs("id_alumno")%>,<%=ob_rs("id_programa")%>);" class="inp_n" data-toggle="tooltip" data-placement="top" title="<%=ob_rs("estadoPago")%> Formalizar por otro medio"><i class="fa fa-exchange" aria-hidden="true" style="color:#ccc;cursor:pointer"></i><i class="fa fa-money" aria-hidden="true" style="margin-left:7px;"></i></a>
<%end if
if ob_rs("estadoPago")="Pendiente Pago Oficina" then%>
<i class="fa fa-money inp_n" aria-hidden="true" style="color:#ccc;cursor:pointer" data-toggle="tooltip" data-placement="top" title="<%=ob_rs("estadoPago")%>"></i>
<%end if
if ob_rs("estadoPago")="Aceptada" and ob_rs("metodoPago")="pag_tarjeta" then%>
<i class="fa fa-credit-card inp_n" aria-hidden="true" style="color:#ccc;cursor:pointer" data-toggle="tooltip" data-placement="top" title="<%=ob_rs("estadoPago")%>"></i>
<%end if
if ob_rs("estadoPago")="Aceptada" and ob_rs("metodoPago")="pag_paypal" then%>
<i class="fa fa-cc-paypal inp_n" aria-hidden="true" style="color:#ccc;cursor:pointer" data-toggle="tooltip" data-placement="top" title="<%=ob_rs("estadoPago")%>"></i>
<%end if
if ob_rs("estadoPago")="Pendiente" and ob_rs("metodoPago")="pag_paypal" then%>
<a href="#/" onClick="javascript:a_formalizar_alumno_reg(<%=ob_rs("id_alumno")%>,<%=ob_rs("id_programa")%>);" class="inp_n" data-toggle="tooltip" data-placement="top" title="Pendiente de formalizar (pago PayPal)"><i class="fa fa-cc-paypal inp_n" aria-hidden="true" style="color:#ccc;cursor:pointer;margin-right:4px"></i><i class="fa fa-money" aria-hidden="true"></i></a>
<%end if
if ob_rs("estadoPago")="Pendiente" and ob_rs("metodoPago")="pag_tarjeta" then%>
<a href="#/" onClick="javascript:a_formalizar_alumno_reg(<%=ob_rs("id_alumno")%>,<%=ob_rs("id_programa")%>);" class="inp_n" data-toggle="tooltip" data-placement="top" title="Pendiente de formalizar (pago tarjeta)"><i class="fa fa-credit-card inp_n" aria-hidden="true" style="color:#ccc;cursor:pointer;margin-right:4px"></i><i class="fa fa-money" aria-hidden="true"></i></a>
<%end if
if ob_rs("estadoPago")="Pendiente de formalizar" then%>
<a href="#/" onClick="javascript:a_formalizar_alumno_reg(<%=ob_rs("id_alumno")%>,<%=ob_rs("id_programa")%>);" class="inp_n" data-toggle="tooltip" data-placement="top" title="Pendiente de formalizar (pago tarjeta)"><i class="fa fa-money" aria-hidden="true"></i></a>
<%end if
if ob_rs("estadoPago")="Aceptada" then%>
<i class="fa fa-check inp_n" aria-hidden="true" style="color:#ccc;cursor:pointer" data-toggle="tooltip" data-placement="top" title="<%=ob_rs("estadoPago")%>"></i>
<%end if
if ob_rs("estadoPago")="Denegada" then%>
<a href="#/" onClick="javascript:a_formalizar_alumno_reg(<%=ob_rs("id_alumno")%>,<%=ob_rs("id_programa")%>);" class="inp_n" data-toggle="tooltip" data-placement="top" title="<%=ob_rs("estadoPago")%> <br> Volver a formalizar" > <%if ob_rs("metodoPago")="pag_tarjeta" then%><i class="fa fa-credit-card" aria-hidden="true" style="color:#ccc;cursor:pointer"></i><%end if%><%if ob_rs("metodoPago")="pag_paypal" then%><i class="fa fa-cc-paypal" aria-hidden="true" style="color:#ccc;cursor:pointer"></i><%end if%>  <i class="fa fa-times" aria-hidden="true" style="color:#F00"></i></a>
<%end if
else%>
<a href="#/" onClick="javascript:a_formalizar_alumno_reg(<%=ob_rs("id_alumno")%>,<%=ob_rs("id_programa")%>);" class="inp_n" data-toggle="tooltip" data-placement="top" title="Pendiente de formalizar"><i class="fa fa-clock-o" aria-hidden="true" style="color:#ccc;margin-right:6px"></i><i class="fa fa-money" aria-hidden="true"></i></a>
<%end if%>
</td>
<td style="text-align:center"><a href="#/" onClick="javascript:a_eliminar_alumno_reg(<%=ob_rs("id_alumno")%>);"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
</tr>
<%ob_rs.movenext
i=i+1
loop%>
</tbody>
</table>
</div>
<%end if
ob_rs.close
Sql= "SELECT a_nombre, a_apellidos, programas.id_alumno, id_item, f_inicio,nom_item,programas.fecha_in FROM programas, alumnos WHERE programas.id_usuario= "&session("id_usuario")&" AND programas.id_alumno=alumnos.id_alumno order by programas.fecha_in DESC "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
if i=""then i=1%>
<div class="col-md-12" style="padding:0;margin-top:25px"><div class="c-content-divider c-divider-sm c-theme-bg"><i class="icon-dot c-square c-theme-bg"></i></div>
<div class="historico">Histórico de Preinscripciones <i class="fa fa-arrow-down" aria-hidden="true"></i></div>
</div>
<div class="conten_tabla">
<table class="table">
<thead>
<tr>
<th style="width:25px;">#</th>
<th style="width:235px;">Nombre</th>
<th style="width:250px;">Inscrito en</th>
<th style="text-align:center;width:150px">Año</th>
<th style="text-align:center;width:110px">Inscribir</th>
</tr>
</thead>
<tbody>
<%do while not ob_rs.eof%>
<tr>
<th scope="row"><%=i%></th>
<td><%=ob_rs("a_apellidos")%>, <%=ob_rs("a_nombre")%></td>
<td><%if ob_rs("id_item")<>0 and ob_rs("id_item")<>"" then

Sql2= "SELECT titulo_esp FROM items WHERE id_item = "&ob_rs("id_item")&""
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then%><%=ob_rs2("titulo_esp")%><%else%>--<%end if%><%ob_rs2.close%><%else%><%=ob_rs("nom_item")%><%end if%></td>
<td style="text-align:center;"><%if year(ob_rs("f_inicio"))<>1111 and year(ob_rs("f_inicio"))<>1000 and year(ob_rs("f_inicio"))<>2003 then%><%=year(ob_rs("f_inicio"))%><%else%><%=year(ob_rs("fecha_in"))%><%end if%></td>
<td style="text-align:center">
<%Sql3= "SELECT id_item, f_inicio,programas.fecha_in FROM programas WHERE id_usuario= "&session("id_usuario")&" AND id_alumno="&ob_rs("id_alumno")&" and id_item = "&id_item&""
Set Ob_RS3 = Server.CreateObject("ADODB.Recordset")
Ob_RS3.Open Sql3, ob_connb,adOpenStatic, adCmdText
if not ob_rs3.eof then%>
<i class="fa fa-check-square-o" aria-hidden="true" style="color:#ccc"></i>
<%else
if int(ob_rs("id_item")) <> int(id_item) and session("ag_autorizado")<>"no" and auto<>"no" then%>
<a href="#/" onClick="javascript:a_inscribir_alumno_reg(<%=ob_rs("id_alumno")%>);"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
<%end if
if int(ob_rs("id_item")) = int(id_item) and year(ob_rs("f_inicio")) < year(date) then%>
<a href="#/" onClick="javascript:a_inscribir_alumno_reg(<%=ob_rs("id_alumno")%>);"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
<%end if
if int(ob_rs("id_item")) = int(id_item) and year(ob_rs("f_inicio")) = year(date) then%>
<i class="fa fa-check-square-o" aria-hidden="true" style="color:#ccc"></i>
<%end if
end if
ob_rs3.close%>

</td>
</tr>
<%ob_rs.movenext
i=i+1
loop%>
</tbody>
</table>
</div>
<%end if
ob_rs.close%>
<div class="col-md-12" style="margin-top:35px;padding:0">
<div class="form-group"><i class="fa fa-comments-o" aria-hidden="true"></i>
<textarea rows="4" placeholder="Observaciones para el curso" onclick="this.placeholder = ''" onblur="this.placeholder = 'Observaciones para el curso'" class="form-control c-theme c-square input-lg inp" name="a_observaciones_curso" id="a_observaciones_curso"></textarea></div>
</div>
<%else%>
<div class="panel panel-default">
<div class="panel-heading">
<h3 class="panel-title"><i class="fa fa-graduation-cap" aria-hidden="true" style="margin-right:10px"></i>Alumnnos registrados <i class="fa fa-arrow-right" aria-hidden="true" style="margin-left:25px;margin-right:7px;"></i><i class="fa fa-user" aria-hidden="true"></i> <%=session("us_nombre")%>&nbsp;<%=session("us_apellidos")%></h3>
</div>
<div class="panel-body"> Actualmente no hay ningún alumno dado de alta bajo este usuario.  </div>
</div>
<%end if%>
<script>$(".inp_n").tooltip({html:true});</script>
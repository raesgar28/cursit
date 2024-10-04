<%rd="../"
Const adCmdText = &H0001
Const adOpenStatic = 3%>
<!--#include file="../conex/conex_back.asp"-->
<!--#include file="comun/pass_sha256.asp"-->
<%usuario=request("usuario")
pass=trim(request("pass"))
id_item=request("id_item")
pass=sha256(pass)
'1 COMPROBAMOS QUE NOMBRE APELLIDOS NO DENTRO
Sql= "SELECT u_nombre, id_usuario, u_apellidos,u_agente FROM usuarios WHERE ( u_email='"&usuario&"' OR u_usuario='"&usuario&"' ) AND u_pass='"&pass&"'"
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then
session("id_usuario")=ob_rs("id_usuario")
id_usuario=ob_rs("id_usuario")
session("us_nombre")=ob_rs("u_nombre")
usu_nombre=ob_rs("u_nombre")
session("us_apellidos")=ob_rs("u_apellidos")
session("ok_log_"&id_usuario)="ok"
session("u_agente")=ob_rs("u_agente")
if id_item<>"" then 
if ob_rs("u_agente")="si" then
Sql2= "SELECT id_agente FROM agentesCursos WHERE id_agente= "&ob_rs("id_usuario")&" AND id_item="&id_item&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then%>
<script>reg_dentro('<%=session("us_nombre")%>');activa4();</script>
<input type="hidden" name="id_usuario" value="<%=session("id_usuario")%>">
<%session("ag_autorizado")="si"%>
<%else%>
<script>reg_dentro('<%=session("us_nombre")%>');activa5();</script>
<input type="hidden" name="id_usuario" value="<%=session("id_usuario")%>">
<%session("ag_autorizado")="no"
ob_rs2.close
end if
else%>
<script>reg_dentro('<%=session("us_nombre")%>');activa4();</script>
<input type="hidden" name="id_usuario" value="<%=session("id_usuario")%>">
<%end if
end if
Session.Timeout = 60
else%>
<div class="error_acceso"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Error con los datos de acceso</div>
<%end if
ob_rs.close%>
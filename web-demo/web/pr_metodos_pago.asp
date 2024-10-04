<%rd="../"%>
<!--#include file="../conex/conex.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<%id_programa=request("id_programa")
id_programar=request("id_programar")
id_programa_f=request("id_programa_f")
if id_programar<>"" then id_programa=id_programar end if
if id_programa_f<>""then id_programa=id_programa_f end if
if id_programa<>""then
Sql= "SELECT id_item, id_alumno, id_curso, pr_cancelacion_pr FROM programas_tmp WHERE id_programa="&id_programa&" "
Set Ob_RS = Server.CreateObject("ADODB.Recordset")
Ob_RS.Open Sql, ob_connb,adOpenStatic, adCmdText
if not ob_rs.eof then 
id_item=ob_rs("id_item")
pr_cancelacion_pr=ob_rs("pr_cancelacion_pr")
Sql2= "SELECT pr_reserva, titulo_esp, completo, disponible FROM items WHERE id_item="&id_item&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then 
pr_reserva=ob_rs2("pr_reserva")+pr_cancelacion_pr
tit_programa=ob_rs2("titulo_esp")
completo_r=ob_rs2("completo")
disponible_r=ob_rs2("disponible")
end if
ob_rs2.close%>
<!--#include file="comun/moneda.asp"-->
<%Sql2= "SELECT titulo_esp, disponible,pr_reserva FROM itemsSub WHERE id_itemSub="&ob_rs("id_curso")&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_conn,adOpenStatic, adCmdText
if not ob_rs2.eof then 
tit_curso=ob_rs2("titulo_esp")
disponible_s_r=ob_rs2("disponible")
if ob_rs2("pr_reserva")<>0 or ob_rs2("pr_reserva")<>"0,00" then pr_reserva=ob_rs2("pr_reserva")+pr_cancelacion_pr end if
end if
ob_rs2.close
Sql2= "SELECT a_nombre, a_apellidos FROM alumnos_tmp WHERE id_alumno="&ob_rs("id_alumno")&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then 
nombre_alumno=ob_rs2("a_nombre") &" "& ob_rs2("a_apellidos")
end if
ob_rs2.close%><script>desactiva_0();</script>
<input name="id_programa_ok" id="id_programa_ok" type="hidden" value="<%=id_programa%>"><%
if completo_r="si" or (disponible_r ="" or disponible_s_r="") then ' SI CURSO COMPLETO%>
<div class="reg_curso_completo"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Lo sentimos, el curso se encuentra COMPLETO.</div>
<script>desactiva_01();</script>
<%else%>
<script>activa_01();</script>
<%end if
else%>
<script>desactiva_0();</script>
<%end if
ob_rs.close%>
<div id="pro_pago">
<div class="alu_metodos_pago"><i class="fa fa-graduation-cap" aria-hidden="true"></i> <%=nombre_alumno%> <i class="fa fa-angle-double-right" aria-hidden="true"></i> <%=tit_programa%> :: <%=tit_curso%></div>
<div class="pr_reserva"><span class="pr_reserva_txt">Precio de la reserva</span><span class="pr_reserva_pr"><%=FormatNumber(ccur(pr_reserva),2)%>&nbsp;<%=mon%></span><span class="met_pag_ver_reserva"><a href="#/" onClick="javascript:a_pdf_presupuesto(<%=id_programa%>);"><i class="fa fa-download" aria-hidden="true"></i> ver presupuesto</a></span></div>
</div>
<%end if%>
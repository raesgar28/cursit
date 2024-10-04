<%rd="../"%>
<!--#include file="../conex/conex_back.asp"-->
<!--#include file="../conex/conex.asp"-->
<%'OBTENEMOS REQUESTS
id_alumno=request("id_alumnor_e")
Sql2= "SELECT id_programa FROM programas_tmp WHERE id_alumno="&id_alumno&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then 
id_programa_t=ob_rs2("id_programa")
end if
ob_rs2.close
if id_programa_t<>""then
mySQL="DELETE FROM programasOp_tmp where id_programa =" & id_programa_t & ""
set ob_rs=Ob_Connb.execute(mySQL)
end if
if id_alumno<>""then
mySQL="DELETE FROM alumnos_tmp where id_alumno =" & id_alumno & ""
set ob_rs=Ob_Connb.execute(mySQL)
mySQL="DELETE FROM programas_tmp where id_alumno =" & id_alumno & ""
set ob_rs=Ob_Connb.execute(mySQL)
Sql2= "SELECT id_archivo FROM alumnos_archivos_tmp WHERE id_alumno="&id_alumno&" "
Set Ob_RS2 = Server.CreateObject("ADODB.Recordset")
Ob_RS2.Open Sql2, ob_connb,adOpenStatic, adCmdText
if not ob_rs2.eof then 
do while not ob_rs2.eof
mySQL="DELETE FROM archivos_tmp where id_archivo =" & ob_rs2("id_archivo") & ""
set ob_rs=Ob_Connb.execute(mySQL)
ob_rs2.movenext
loop
end if
ob_rs2.close
end if%>
<div class="user_in_ok"><i class="fa fa-graduation-cap" aria-hidden="true"></i><i class="fa fa-times" aria-hidden="true"></i><span style="margin-top:35px;">Alumno eliminado de preinscripciones!!</span></div>
<ul class="list-inline">
<li><button type="button" class="btn c-theme-btn c-btn-border-1x c-btn-square c-btn-uppercase c-btn-bold  c-margin-t-20"  onCLick="volver_listado();"><i class="fa fa-arrow-up" aria-hidden="true" style="margin-right:8px"></i> Volver al listado </button></li></ul>
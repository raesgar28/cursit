<%rd="../"
s=request("s")
t=request("t")%>
<!--#include file="../conex/conex.asp"-->
<!--#include file="../conex/conex_back.asp"-->
<!--#include file="pr_pdf_preins_comun.asp"-->
<%Doc.SaveHttp("attachment; filename=" & nombre_pdf & ".pdf")
Set Page = Nothing
Set Doc = Nothing  
Set Pdf = Nothing
end if
ob_conn.close%>
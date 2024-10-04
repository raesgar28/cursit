<!--#include file="pr_pdf_preins_comun.asp"-->
<%if refPago<>"" then
if crm="si"then
Path = Server.MapPath( "..\..\up_docs\temp\") & "\"&nombre_pdf&"-"&year(date)&".pdf"
else
Path = Server.MapPath( rd&"up_docs\temp\") & "\"&nombre_pdf&"-"&year(date)&".pdf"
end if
else
if crm="si"then
Path = Server.MapPath( "..\..\up_docs\temp\") & "\"&nombre_pdf&"-"&year(date)&".pdf"
else
Path = Server.MapPath( "..\up_docs\temp\") & "\"&nombre_pdf&"-"&year(date)&".pdf"
end if
end if
archivo = Doc.Save( Path, true)
Set Page = Nothing
Set Doc = Nothing  
Set Pdf = Nothing
end if%>

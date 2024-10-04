<%if id_item<>""then
Sql_M= "SELECT moneda FROM items WHERE id_item="&id_item&" " 
Set Ob_RS_M = Server.CreateObject("ADODB.Recordset")
Ob_RS_M.Open Sql_M, ob_conn,adOpenStatic, adCmdText
if not ob_rs_M.eof then
moneda=ob_rs_M("moneda")
Select case moneda
case "eur":
mon="€"
mon_pdf="&euro;"
case "dol":
mon="$"
case "lib":
mon="&pound;"
case "dolc":
mon="C$"
case else
mon="€"
mon_pdf="&euro;"
end select
end if
ob_rs_M.close
end if%>
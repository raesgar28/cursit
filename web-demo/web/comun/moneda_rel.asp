<%if id_item_r<>""then
Sql_M= "SELECT moneda FROM items WHERE id_item=224 " 
Set Ob_RS_M = Server.CreateObject("ADODB.Recordset")
Ob_RS_M.Open Sql_M, ob_conn,adOpenStatic, adCmdText
if not ob_rs_M.eof then
moneda=ob_rs_M("moneda")
Select case moneda
case "eur":
mon_r="€"
case "dol":
mon_r="$"
case "lib":
mon_r="&pound;"
case "dolc":
mon_r="C$"
case else
mon_r="€"
end select
'mon_r=moneda
end if
ob_rs_M.close
end if%>
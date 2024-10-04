<%ano_hoy = mid(year(date),3,2)
Sql2= "SELECT n_factura FROM programas where mid((n_factura),7,2) = '"&ano_hoy&"' order by n_factura desc "
Ob_Commandb.CommandText = Sql2
SET Ob_RS2 = Ob_Commandb.Execute ()
if not ob_rs2.eof then
factureta=ob_rs2("n_factura")
last_fac_1=factureta
factureta=mid(factureta,2,4)
factureta= factureta + 1
if len(factureta) = 3 then ceros = "0" end if
if len(factureta) = 2 then ceros = "00" end if
if len(factureta) = 1 then ceros = "000" end if
else
factureta = "0001"
end if
ob_rs2.close
Sql2= "SELECT n_factura FROM facturas WHERE mid((n_factura),7,2) = '"&ano_hoy&"'  order by n_factura desc "   '[SACAMOS FACTURA]
Ob_Commandb.CommandText = Sql2
SET Ob_RS2 = Ob_Commandb.Execute ()
if not ob_rs2.eof then
ano2= mid((ob_rs2("n_factura")),7,2)
factureta2=ob_rs2("n_factura")
last_fac_2=factureta2
factureta2=mid(factureta2,2,4)
factureta2= factureta2 + 1
if len(factureta2) = 3 then ceros2 = "0"end if
if len(factureta2) = 2 then ceros2 = "00" end if
if len(factureta2) = 1 then ceros2 = "000" end if
else
factureta2 = "0001"
end if
ob_rs2.close
if ano2>=ano_hoy then
ano=ano2
if int(factureta2)>int(factureta) then
last_fac=last_fac_2
factureta=factureta2
ceros=ceros2
else
factureta=factureta
last_fac=last_fac_1
end if
else
ano=ano
factureta=factureta
last_fac=last_fac_1
end if
ano_factura= mid(Year(date),3,2)
n_factura_p = "F"&ceros&factureta&"-"&ano_factura
if last_fac="" then last_fac="Sin facturas contabilizadas" end if%>
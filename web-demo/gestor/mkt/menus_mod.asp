<%rd="../../"%>
<!-- #include file="../../conex/conex.asp" -->
<%Dim orden(20),del(20)

for i=1 to 20
del(i)=request("del"&i&"") 
if del(i)<>""then
del(i)=replace(del(i),"C","")
del(i)=replace(del(i),"GF","")
del(i)=replace(del(i),"G","")
mySQL="DELETE FROM menus where menu = "&i&" and (id_general="&del(i)&" or id_categoria="&del(i)&") "
set rstemp=Ob_Conn.execute(mySQL)
end if
next

for i=1 to 20
orden(i)=request("order"&i&"") 
if orden(i)<>""then
mySQL="DELETE FROM menus where menu = "&i&""
set rstemp=Ob_Conn.execute(mySQL)
orden(i) = Split(orden(i), ",")
z=1
For x=0 to ubound(orden(i))
if orden(i)(x)<>"0" then

cadena= Instr(orden(i)(x),"C")
if cadena<>0 then
id_categoria=replace(orden(i)(x),"C","")
id_general=0
id_general_fijo=0
end if
cadena2= Instr(orden(i)(x),"G")
if cadena2<>0 then
id_categoria=0
id_general=replace(orden(i)(x),"G","")
id_general_fijo=0
end if
cadena3= Instr(orden(i)(x),"GF")
if cadena3<>0 then
id_categoria=0
id_general=0
id_general_fijo=replace(orden(i)(x),"GF","")
end if
mySQL="INSERT INTO menus (menu,posicion,id_general,id_categoria)"
	mySQL=mySQL & "VALUES ("
	mySQL=mySQL &  i & ","
	mySQL=mySQL & "" & z & ","
	mySQL=mySQL & "" & id_general & ","
	mySQL=mySQL & "" & id_categoria & ""
	mySQL=mySQL & ");"
set rstemp=Ob_Conn.execute(mySQL)
z=z+1
cadena=""
cadena2=""
cadena3=""
end if
Next
end if
next%>
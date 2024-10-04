<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body style="background:#fff;width:100%;">
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%r=request("r")
rd=request("rd")
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
cod=request("cod")
cod_prog=request("cod_prog")
cod_cat=request("cod_cat")
edi=request("edi")
id_categoria=request("id_categoria")
fecha_mod=now%>
<!--#include file="../comun/estilos.asp"-->
<link href="<%=r%>lib/css/loader.css" rel="stylesheet" type="text/css" />
<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod_prog & "&msc=ok&cod_cat=" & id_categoria)) %>
<div class="form-body" style="position:absolute;top:20%;left:45%;z-index:999999999999">                                                  
<div class="form-actions">
<div class="row">
<div class="">
<a href="gestion.jpk2?enc=<%=EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod_prog & "&msc=ok&cod_cat=" & id_categoria)%>" class="btn green" target="_parent"><i class="fa fa-undo" aria-hidden="true"></i> volver al programa</a>
</div>
</div>
</div>
</div>
<div class="se-pre-con"></div>
<%mySQL="UPDATE rel SET "
mySQL=mySQL & "id_categoria= '" & id_categoria & "',"
mySQL=mySQL & "fecha_mod= '" & fecha_mod & "'"
mySQL=mySQL & " WHERE id_item = " & cod_prog & " and id_categoria<>0;"
set ob_rs=Ob_Conn.execute(mySQL)
Sql= "SELECT id_categoria, titulo_esp from categorias where id_categoria="&cod_cat&"" 
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
categoria_act=ob_rs("titulo_esp")
end if
Sql= "SELECT id_categoria, titulo_esp from categorias where id_categoria="&id_categoria&"" 
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
categoria_new=ob_rs("titulo_esp")
end if
Sql= "SELECT id_item, meta_title, meta_key, meta_desc from items where id_item="&cod_prog&"" 
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
	meta_title=replace(ob_rs("meta_title"),categoria_act,categoria_new)
	meta_key=replace(ob_rs("meta_key"),lcase(categoria_act),lcase(categoria_new))
	meta_desc=replace(ob_rs("meta_desc"),categoria_act,categoria_new)
	mySQL="UPDATE items SET "
	mySQL=mySQL & "meta_title= '" & meta_title & "',"
	mySQL=mySQL & "meta_key= '" & meta_key & "',"
	mySQL=mySQL & "meta_desc= '" & meta_desc & "'"
	mySQL=mySQL & " WHERE id_item = " & cod_prog & ";"
	set ob_rs1=Ob_Conn.execute(mySQL)
end if
Sql= "SELECT rel.id_item, rel.id_itemSub, itemsSub.id_itemSub, itemsSub.meta_title, itemsSub.meta_key, itemsSub.meta_desc from itemsSub, rel where rel.id_item="&cod_prog&" and rel.id_itemSub<>0 and rel.id_itemSub=rel.id_itemSub  " 
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
do while not ob_rs.eof
cod_itemSub=ob_rs("rel.id_itemSub")
	meta_title=replace(ob_rs("meta_title"),categoria_act,categoria_new)
	meta_key=replace(ob_rs("meta_key"),lcase(categoria_act),lcase(categoria_new))
	meta_desc=replace(ob_rs("meta_desc"),categoria_act,categoria_new)
	mySQL="UPDATE itemsSub SET "
	mySQL=mySQL & "meta_title= '" & meta_title & "',"
	mySQL=mySQL & "meta_key= '" & meta_key & "',"
	mySQL=mySQL & "meta_desc= '" & meta_desc & "'"
	mySQL=mySQL & " WHERE id_itemSub = " & cod_itemSub & ";"
	set ob_rs1=Ob_Conn.execute(mySQL)
ob_rs.movenext
loop
end if
url = "gestion.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod_prog & "&msc=ok&cod_cat=" & id_categoria)
Response.Write("<script language='javascript'>self.parent.location='"&url&"';</scr"+"ipt>")%>
</body></html>
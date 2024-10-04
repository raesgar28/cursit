<!DOCTYPE html><!--[if IE 8]><html lang="es-es" class="ie8 no-js"><![endif]--><!--[if IE 9]><html lang="es-es" class="ie9 no-js"><![endif]--><!--[if !IE]><!--><html lang="es-es"><!--<![endif]--><head><meta charset="utf-8" /></head><body>
<!--#INCLUDE file="../lib/asp/cifra.asp"-->
<%r=request("r")
rd=request("rd")
n=request("n")
ndos=request("ndos")
ntres=request("ntres")
ncuat=request("ncuat")
op=request("op")
cod=request("cod")
rd_facebook=trim(request("rd_facebook"))
rd_twitter=trim(request("rd_twitter"))
rd_youtube=trim(request("rd_youtube"))
rd_pinterest=trim(request("rd_pinterest"))
rd_blog=trim(request("rd_blog"))
rd_linkedin=trim(request("rd_linkedin"))
rd_instagram=trim(request("rd_instagram"))
rd_tumblr=trim(request("rd_tumblr"))
rd_flickr=trim(request("rd_flickr"))
rd_reddit=trim(request("rd_reddit"))
rd_google_plus=trim(request("rd_google_plus"))
rd_mailchimp_id=trim(request("rd_mailchimp_id"))
rd_mailchimp_api=trim(request("rd_mailchimp_api"))%>

<!--#include file="../../conex/conex.asp"-->
<!--#include file="../lib/asp/comun.asp"-->
<%
fecha_in=now
fecha_mod=now                                                      '[FIN REQUEST]

Sql= "SELECT id_red from redes where id_red IS NOT NULL"   '[CHEQUEAMOS QUE URL NO I            
Ob_Command.CommandText = Sql
SET Ob_RS = Ob_Command.Execute ()
if not ob_rs.eof then
op="up"
else
op="in"
end if
ob_rs.close

if op="in"then															 '[OPCION INSERTAR]
mySQL="INSERT INTO redes (rd_facebook,rd_twitter,rd_youtube,rd_pinterest,rd_blog,rd_linkedin,rd_instagram,rd_tumblr,rd_flickr,rd_reddit,rd_google_plus)" 				
	mySQL=mySQL & "VALUES ("         '[INSERTAMOS]
	mySQL=mySQL & "'" & rd_facebook & "',"
	mySQL=mySQL & "'" & rd_twitter & "',"
	mySQL=mySQL & "'" & rd_youtube & "',"
	mySQL=mySQL & "'" & rd_pinterest & "',"
	mySQL=mySQL & "'" & rd_blog & "',"
	mySQL=mySQL & "'" & rd_linkedin & "',"
	mySQL=mySQL & "'" & rd_instagram & "',"
	mySQL=mySQL & "'" & rd_tumblr & "',"
	mySQL=mySQL & "'" & rd_flickr & "',"
	mySQL=mySQL & "'" & rd_reddit & "',"
	mySQL=mySQL & "'" & rd_google_plus & "'"
	mySQL=mySQL & ");"
set ob_rs=Ob_Conn.execute(mySQL)
set ob_rs = Ob_Conn.execute("select MAX(id_red) from redes") 
cod = ob_rs(0)
ob_rs.close
end if                                                            '[FIN OPCION INSERTAR]
if op="up"then                                                    '[OPCION MODIFICAR]
mySQL="UPDATE redes SET "
mySQL=mySQL & "rd_facebook = '" & rd_facebook & "',"
mySQL=mySQL & "rd_twitter = '" & rd_twitter & "',"
mySQL=mySQL & "rd_youtube = '" & rd_youtube & "',"
mySQL=mySQL & "rd_pinterest = '" & rd_pinterest & "',"
mySQL=mySQL & "rd_blog = '" & rd_blog & "',"
mySQL=mySQL & "rd_linkedin = '" & rd_linkedin & "',"
mySQL=mySQL & "rd_instagram = '" & rd_instagram & "',"
mySQL=mySQL & "rd_tumblr = '" & rd_tumblr & "',"
mySQL=mySQL & "rd_flickr = '" & rd_flickr & "',"
mySQL=mySQL & "rd_reddit = '" & rd_reddit & "',"
mySQL=mySQL & "rd_google_plus = '" & rd_google_plus & "'"
mySQL=mySQL & " WHERE id_red IS NOT NULL " 
set ob_rs=Ob_Conn.execute(mySQL)
end if                                                           '[FIN OPCION MODIFICAR]


mySQL="UPDATE webs SET "
mySQL=mySQL & "rd_mailchimp_id = '" & rd_mailchimp_id & "',"
mySQL=mySQL & "rd_mailchimp_api = '" & rd_mailchimp_api & "'"
set ob_rs=Ob_Conn.execute(mySQL)


'REDIRECCIONAMOS
Encryption_Key = mid(ReadKeyFromFile(Encryption_KeyLocation),1,Len("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok")) 
Response.Redirect "redes.jpk2?enc=" & EnCrypt("?r=" & r & "&rd=" & rd & "&n=" & n & "&ndos=" & ndos & "&ntres=" & ntres & "&ncuat=" & ncuat & "&cod=" & cod & "&ms=ok") 
ob_rs.close	
ob_conn.close%>
</body></html>
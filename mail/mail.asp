<%Dim nombre, direccion, poblacion, provincia, telefono, movil, fax, mail, comentarios, nombre_rap, email_rap, comentario_rap
nombre = request.form("nombre")
apellidos = request.form("apellidos")
email = request.form("email")
comentarios = request.form("comentarios")
telefono = request.form("telefono")
asunto = request.form("asunto")
n_letter = request.form("n_letter")

Set Mail = Server.CreateObject("Persits.MailSender")
Mail.CharSet = "iso-8859-1"
Mail.ContentTransferEncoding = "Quoted-Printable"
Mail.Host = "mail.wishingwell.es"
Mail.Port = 587
Mail.Username = "ramon@wishingwell.es"
Mail.Password = "fUtUreNow2014)!"
Mail.From = "ramon@wishingwell.es"
Mail.FromName = "Formulario Contacto Cursit"
Mail.AddAddress "ramon@wishingwell.es"

asunto = "Formulario de Contacto - Wishing Well" 
Mail.Subject = Mail.EncodeHeader(asunto, "utf-8")

Mail.Body = "NOMBRE Y APELLIDOS: " & nombre & vbCrLf &  "TELEFONO: " & telefono & vbCrLf & "EMAIL: " & email & vbCrLf & "COMENTARIOS: " & comentarios & vbCrLf & "ASUNTO: " & asunto & vbCrLf & "N Letter: " & n_letter
'On Error Resume Next
Mail.Send
If Err <> 0 Then
  Response.Write "Ocurrió un error: " & Err.Description
  else
  
 response.redirect(urll&"crm-contacto-respuesta")
 
End If 





%>
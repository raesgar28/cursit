<%Set Ob_Conn = Server.CreateObject ("ADODB.Connection")
Set Ob_Command = Server.CreateObject ("ADODB.Command")
Ob_Conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("data/datos.mdb")
Ob_Command.ActiveConnection = Ob_Conn%>
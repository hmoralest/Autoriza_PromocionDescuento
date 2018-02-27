<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rechaza.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <script type="text/javascript">

        function getParameterByName(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
            results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }

        function Confirmacion() { 
            var seleccion = confirm("Confirma su Rechazo de la Promoción?");

            var email = getParameterByName('mail');
            var promo = getParameterByName('promo');

            if (seleccion) {
                //alert("se acepto el mensaje");
                location.href = "Procesado.aspx?mostrar=2&email=" + email + "&reg=" + promo + "";
            }
            else {
                //alert("NO se acepto el mensaje");
                location.href = "Procesado.aspx?mostrar=0&email=" + email + "&reg=" + promo + "";
            }
 
            //usado para que no haga postback el boton de asp.net cuando no se acepte el confirm
            return seleccion;
        }

     
    </script>

</head>
<body onload="return Confirmacion();">
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    
    </div>
    </form>
</body>
</html>

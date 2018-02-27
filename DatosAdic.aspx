<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DatosAdic.aspx.cs" Inherits="_Default" %>

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
            var seleccion = confirm("Confirma su Aprobación de la Promoción?");

            var email = getParameterByName('mail');
            var promo = getParameterByName('promo');

            if (seleccion) {
                alert("se acepto el mensaje");
                location.href = "Procesado.aspx?mostrar=1&email=" + email + "&reg=" + promo + "";
            }
            else {
                alert("NO se acepto el mensaje");
                location.href = "Procesado.aspx?mostrar=0&email=" + email + "&reg=" + promo + "";
            }

            //usado para que no haga postback el boton de asp.net cuando no se acepte el confirm
            return seleccion;
        }
     
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%">
            <tr>
                <td colspan="3" align="center" id="nombre">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" align="center">&nbsp;</td>
            </tr>
            <tr>
                <td align="center"colspan="3">Productos:</td>
            </tr>
            <tr>
                <td align="center">Activadores</td>
                <td>&nbsp;</td>
                <td align="center">Promoción</td>
            </tr>
            <tr>
                <td align="center"><div id="activ" runat="server">&nbsp;</div></td>
                <td>&nbsp;</td>
                <td align="center"><div id="promo" runat="server">&nbsp;</div></td>
            </tr>
            <tr>
                <td colspan="3" align="center">Tiendas:</td>
            </tr>
            <tr>
                <td colspan="3"align="center"><div id="tda" runat="server">&nbsp;</div></td>
            </tr>
        </table>
    </form>
</body>
</html>

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

    <style type="text/css">
        .auto-style1 {
            height: 43px;
            width: 211px;
        }
        #TextArea1 {
            height: 114px;
            width: 310px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <img alt="Logo" class="auto-style1" longdesc="Logo" src="Imagen/BATA%20(rojo).png" />
    </div>
    <div style="text-align:center;color:red;font-family:Cooper Black">    
        Favor de detallar el motivo de Rechazo:<br />
        <br />
        <textarea id="TextArea1" name="S1"></textarea><br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Confirmar" BackColor="Red" ForeColor="White" BorderColor="White" Font-Names="Cooper Black" OnClick="Button1_Click"/>
    </div>
    </form>
</body>
</html>

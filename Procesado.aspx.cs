using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class _Default : System.Web.UI.Page
{
    string user;
    string codigo;
    int estado;

    protected void Page_Load(object sender, EventArgs e)
    {
        Aprobacion aprueba = new Aprobacion();

        estado = Convert.ToInt32(Request.QueryString["mostrar"]);
        user = Convert.ToString(Request.QueryString["email"]);
        codigo = Convert.ToString(Request.QueryString["reg"]);

        if (estado != 0)
        {
            int valida = aprueba.ValidaAprobacion(codigo, user);
            //int valida = 1;
            if (valida == 1)
            {
                if (estado == 1){
                    aprueba.getAprobacion(codigo, user);
                    Label1.Text = "Aprobación registrada satisfactoriamente.";
                }
                else if (estado == 2){
                    aprueba.getRechazo(codigo, user, "");
                    Label1.Text = "Rechazo registrado satisfactoriamente.";
                }
            }else{
                Label1.Text = "Ya se registro anteriormente.";
            }
        }else{
            Label1.Text = "No se realizó ninguna operación.";
        }
    }
}
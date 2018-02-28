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
    string texto;

    protected void Page_Load(object sender, EventArgs e)
    {
        Aprobacion aprueba = new Aprobacion();

        estado = Convert.ToInt32(Request.QueryString["mostrar"]);
        user = Convert.ToString(Request.QueryString["email"]);
        codigo = Convert.ToString(Request.QueryString["reg"]);
        texto = Convert.ToString(Request.QueryString["text"]);

        if (estado != 0)
        {
            int valida = aprueba.ValidaAprobacion(codigo, user);
            //int valida = 1;
            if (valida == 0)
            {
                if (estado == 1){
                    aprueba.getAprobacion(codigo, user);
                    Label1.Text = "Aprobación registrada satisfactoriamente.";
                }
                else if (estado == 2){
                    aprueba.getRechazo(codigo, user, texto);
                    Label1.Text = "Rechazo registrado satisfactoriamente.";
                }
            }else{
                if(valida == 1)
                {
                    Label1.Text = "Ya existe una Aprobación registrada anteriormente.";
                }
                if (valida == 2)
                {
                    Label1.Text = "Ya existe un Rechazo registrado anteriormente.";
                }
            }
        }else{
            Label1.Text = "No se realizó ninguna operación.";
        }
    }
}
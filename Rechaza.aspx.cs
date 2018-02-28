using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Conexion cn = new Conexion();
        SqlConnection sql = cn.getConexion();
                
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string mail = Request.QueryString["mail"];
        string promo = Request.QueryString["promo"];
        String Valor = Request["S1"];
        Response.Redirect("Procesado.aspx?mostrar=2&email=" + mail + "&reg=" + promo + "&text=" + Valor + "");
    }
}
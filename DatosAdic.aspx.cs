using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class _Default : System.Web.UI.Page
{
    public static string GetMyTable(DataTable list, params string[] columns)
    {
        int contar = 0;
        var sb = new StringBuilder();
        sb.Append("<table border='1' style='width:100%;border-width:0px;border-style:solid;border:hidden'> ");
        foreach (DataRow item in list.Rows)
        {
            contar = contar + 1;
            if (contar % 2 == 0)
            {
                sb.Append("<tr align='center' style='background-color:#FFC1C1;color:black;font-family:Calibri;font-size:12px;font-weight:bold'>");
            }
            else
            {
                sb.Append("<tr align='center' style='background-color:#FFEEEE;color:black;font-family:Calibri;font-size:12px;font-weight:bold'>");
            }
            foreach (var column in columns)
            {
                sb.Append("<td>");
                sb.Append(item[column]);
                sb.Append("</td>");
            }
            sb.Append("</tr>");
        }
        sb.Append("</table>");
        return sb.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string email;
        string codigo;

        Aprobacion aprueba = new Aprobacion();

        email = Convert.ToString(Request.QueryString["email"]);
        codigo = Convert.ToString(Request.QueryString["promo"]);
        //email = "001";
        //codigo= "prueba";

        DataTable General = aprueba.ObtenerDatosGral(codigo);
        DataTable Activa = aprueba.ObtenerDatosProdAct(codigo);
        DataTable Promo = aprueba.ObtenerDatosProdProm(codigo);
        DataTable Tienda = aprueba.ObtenerDatosTda(codigo);

        /*DataTable prueba = new DataTable();
        DataColumn column;
        DataRow row;


        column = new DataColumn();
        column.DataType = System.Type.GetType("System.String");
        column.ColumnName = "col1";
        column.Caption = "col1";
        prueba.Columns.Add(column);

        column = new DataColumn();
        column.DataType = System.Type.GetType("System.String");
        column.ColumnName = "col2";
        column.Caption = "col2";
        prueba.Columns.Add(column);
        
        row = prueba.NewRow();
        row["col1"] = "prueba11";
        row["col2"] = "prueba12";
        prueba.Rows.Add(row);

        row = prueba.NewRow();
        row["col1"] = "prueba21";
        row["col2"] = "prueba22";
        prueba.Rows.Add(row);

        string htmlTable = GetMyTable(prueba, "col1", "col2");
        divTabla.InnerHtml = htmlTable;*/

        activ.InnerHtml = GetMyTable(Activa, "des_artic");
        promo.InnerHtml = GetMyTable(Promo, "des_artic");
        tda.InnerHtml = GetMyTable(Tienda, "des_entid");

        foreach (DataRow row in General.Rows)
        {
            titulo.Text = Convert.ToString(row["descrip"]);
        }

    }
}
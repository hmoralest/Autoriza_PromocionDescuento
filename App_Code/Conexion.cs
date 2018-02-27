using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Configuration;

public class Conexion
{
    public SqlConnection getConexion()
    {
        SqlConnection sql = new SqlConnection(ConfigurationManager.ConnectionStrings["sql"].ConnectionString);
        return sql;
    }
}
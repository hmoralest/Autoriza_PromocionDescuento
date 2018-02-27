using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public class Aprobacion
{
    SqlConnection sql;
    Conexion oConexion = new Conexion();

    public void getAprobacion(string promocion, string user)
    {
        sql = oConexion.getConexion();
        sql.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "USP_AprobacionPromocion";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = sql;

        cmd.Parameters.Add("@id_promo", SqlDbType.VarChar).Value = promocion;
        cmd.Parameters.Add("@coduser", SqlDbType.VarChar).Value = user;
        cmd.Parameters.Add("@estado", SqlDbType.VarChar).Value = "A";
        cmd.Parameters.Add("@comentario", SqlDbType.VarChar).Value = "";

        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public void getRechazo(string promocion, string user, string mensaje)
    {
        sql = oConexion.getConexion();
        sql.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "USP_AprobacionPromocion";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = sql;

        cmd.Parameters.Add("@id_promo", SqlDbType.VarChar).Value = promocion;
        cmd.Parameters.Add("@coduser", SqlDbType.VarChar).Value = user;
        cmd.Parameters.Add("@estado", SqlDbType.VarChar).Value = "R";
        cmd.Parameters.Add("@comentario", SqlDbType.VarChar).Value = mensaje;

        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public DataTable ObtenerDatosGral(string promocion)
    {
        DataTable datos = new DataTable();
        
        sql = oConexion.getConexion();
        SqlDataAdapter da = new SqlDataAdapter("USP_DatosPromocion_Gral", sql);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.Add("@id_promo", SqlDbType.VarChar).Value = promocion;

        try
        {
            da.Fill(datos);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        
        return datos;
    }

    public DataTable ObtenerDatosProdAct(string promocion)
    {
        DataTable datos = new DataTable();

        sql = oConexion.getConexion();
        SqlDataAdapter da = new SqlDataAdapter("USP_DatosPromocion_ProdAct", sql);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.Add("@id_promo", SqlDbType.VarChar).Value = promocion;

        try
        {
            da.Fill(datos);
        }
        catch (Exception ex)
        {
            throw ex;
        }

        return datos;
    }

    public DataTable ObtenerDatosProdProm(string promocion)
    {
        DataTable datos = new DataTable();

        sql = oConexion.getConexion();
        SqlDataAdapter da = new SqlDataAdapter("USP_DatosPromocion_ProdProm", sql);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.Add("@id_promo", SqlDbType.VarChar).Value = promocion;

        try
        {
            da.Fill(datos);
        }
        catch (Exception ex)
        {
            throw ex;
        }

        return datos;
    }

    public DataTable ObtenerDatosTda(string promocion)
    {
        DataTable datos = new DataTable();

        sql = oConexion.getConexion();
        SqlDataAdapter da = new SqlDataAdapter("USP_DatosPromocion_Tiendas", sql);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.Add("@id_promo", SqlDbType.VarChar).Value = promocion;

        try
        {
            da.Fill(datos);
        }
        catch (Exception ex)
        {
            throw ex;
        }

        return datos;
    }
    public int ValidaAprobacion(string promocion, string user)
    {
        int estado=0;
        DataTable datos = new DataTable();

        sql = oConexion.getConexion();
        SqlDataAdapter da = new SqlDataAdapter("USP_ValidaAprobacion", sql);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.Add("@id_promo", SqlDbType.VarChar).Value = promocion;
        da.SelectCommand.Parameters.Add("@cod_user", SqlDbType.VarChar).Value = user;

        try
        {
            da.Fill(datos);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        foreach (DataRow row in datos.Rows)
        {
            estado = Convert.ToInt32(row["estado"]);
        }

        return estado;
    }
}
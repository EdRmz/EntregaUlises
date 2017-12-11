using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class _Default : System.Web.UI.Page
{
    
    /// <summary>
    /// Creación de nuestra ConnectionString
    /// </summary>
    private string strcon = WebConfigurationManager.ConnectionStrings["HorarioFinalConnectionString1"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private bool UserLogin(string cv, string pw)
    {
        SqlConnection con = new SqlConnection(strcon);
        SqlCommand comm = new SqlCommand("select administrador from profesores WHERE ClaveProfesor = @cl AND Contraseña = @ci", con);
        comm.Parameters.AddWithValue("@cl", cv);
        comm.Parameters.AddWithValue("@ci", pw);
        con.Open();
        SqlDataReader reader = comm.ExecuteReader();
        if (reader.Read())
        {
            Session["tipo"] = (bool)(reader["administrador"]);
        }
        con.Close();
        SqlCommand cmd = new SqlCommand("SELECT ClaveProfesor FROM Profesores WHERE ClaveProfesor = @cv AND Contraseña = @pw", con);
        cmd.Parameters.AddWithValue("@cv", cv);
        cmd.Parameters.AddWithValue("@pw", pw);
        con.Open();
        string result = Convert.ToString(cmd.ExecuteScalar());
        if (String.IsNullOrEmpty(result)) return false; return true;
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string cv = Login1.UserName;
        string pw = Login1.Password;
        bool result = UserLogin(cv, pw);
        if (result)
        {
            e.Authenticated = true;
            Session["NombreUsuario"] = cv;
        }
        else
            e.Authenticated = false;
    }
}
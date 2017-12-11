using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Windows.Forms;

public partial class Usuarios : System.Web.UI.Page
{
    /// <summary>
    /// Creación de nuestra ConnectionString
    /// </summary>
    private string strcon = WebConfigurationManager.ConnectionStrings["HorarioFinalConnectionString1"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private void BindDropDownList(DropDownList ddl, string query, string text, string value, string defaultText)
    {
        string conString = ConfigurationManager.ConnectionStrings["HorarioFinalConnectionString1"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                con.Open();
                ddl.DataSource = cmd.ExecuteReader();
                ddl.DataTextField = text;
                ddl.DataValueField = value;
                ddl.DataBind();
                con.Close();
            }
        }
        ddl.Items.Insert(0, new ListItem(defaultText, "0"));
    }

    private bool CrearUsuario()
    {
        string ClaveProfesor = txtClave.Text.ToUpper();
        string ApPaterno = txtApPat.Text.ToUpper();
        string ApMaterno = txtApMat.Text.ToUpper();
        string Nombre = txtNombre.Text.ToUpper();
        string HorasPSemana = txtHoras.Text;
        string Contraseña = txtContraseña.Text;
        bool Admin = Convert.ToBoolean (rbSI.SelectedValue.ToString());

        string insert = "INSERT INTO Profesores(ClaveProfesor, ApPaterno, ApMaterno, Nombre, HorasPSemana, Contraseña, Administrador) VALUES(@ClaveProfesor,@ApPaterno,@ApMaterno,@Nombre,@HorasPSemana,@Contraseña,@Administrador)";

        using (SqlConnection con = new SqlConnection(strcon))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = con;
                cmd.CommandText = insert;
                cmd.Parameters.AddWithValue("@ClaveProfesor", ClaveProfesor);
                cmd.Parameters.AddWithValue("@ApPaterno", ApPaterno);
                cmd.Parameters.AddWithValue("@ApMaterno", ApMaterno);
                cmd.Parameters.AddWithValue("@Nombre", Nombre);
                cmd.Parameters.AddWithValue("@HorasPSemana", HorasPSemana);
                cmd.Parameters.AddWithValue("@Contraseña", Contraseña);
                cmd.Parameters.AddWithValue("@Administrador", Admin);
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    ex.Message.ToString();
                }
                finally
                {
                    con.Close();
                }
            }
        }
        return true;
    }

    private void Refresh()
    {
        txtClave.Text = "";
        txtApPat.Text = "";
        txtApMat.Text = "";
        txtNombre.Text = "";
        txtHoras.Text = "";
        txtContraseña.Text = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtClave.Text != "" && txtApPat.Text != "" && txtApMat.Text != "" && txtNombre.Text != "" && txtHoras.Text != "" && txtContraseña.Text != "")
        {
            if (CrearUsuario())
            {
                Response.Write("<script language='JavaScript'>window.alert('Usuario creado exitosamente')</script>");
                Refresh();        
            }
        }
        else
        {
            Response.Write("<script language='JavaScript'>window.alert('Todos los campos son obligatorios.')</script>");           
        }
    }

    protected void txtApPat_TextChanged(object sender, EventArgs e)
    {

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Windows.Forms;
using System.Data.SqlClient;


public partial class Materias : System.Web.UI.Page
{
    /// <summary>
    /// Creación de nuestra ConnectionString
    /// </summary>
    private string strcon = WebConfigurationManager.ConnectionStrings["HorarioFinalConnectionString1"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private bool AgregarMateria()
    {
        string Clave = txtClave.Text;
        string Nombre = txtNombre.Text;
        int HorasSemanales = Convert.ToInt32(ddlHoras.SelectedItem.Value);
        int Semestre = Convert.ToInt32(ddlSemestre.SelectedItem.Value);
        int IdCarrera = Convert.ToInt32(ddlCarrera.SelectedItem.Value);

        string insert = "INSERT INTO Materias(Clave,Nombre,HorasSemanales,Semestre,IdCarrera) VALUES(@Clave,@Nombre,@HorasSemanales,@Semestre,@IdCarrera)";

        using (SqlConnection con = new SqlConnection(strcon))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = con;
                cmd.CommandText = insert;
                cmd.Parameters.AddWithValue("@Clave", Clave);
                cmd.Parameters.AddWithValue("@Nombre", Nombre);
                cmd.Parameters.AddWithValue("@HorasSemanales", HorasSemanales);
                cmd.Parameters.AddWithValue("@Semestre", Semestre);
                cmd.Parameters.AddWithValue("@IdCarrera", IdCarrera);
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

    protected void btnCrear_Click(object sender, EventArgs e)
    {
        if (txtClave.Text != "" && txtNombre.Text != "")
        {
            if (AgregarMateria())
            {
                Response.Write("<script language='JavaScript'>window.alert('Materia agregada exitosamente.')</script>");
            }
            else
                Response.Write("<script language='JavaScript'>window.alert('No ha sido posible realizar la operación.')</script>");
        }
        else
            Response.Write("<script language='JavaScript'>window.alert('Todos los campos son obligatorios.')</script>");
    }
}
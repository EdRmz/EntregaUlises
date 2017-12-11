using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Asignaciones : System.Web.UI.Page
{
    private string strcon = WebConfigurationManager.ConnectionStrings["HorarioFinalConnectionString1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string query = "SELECT Id, NombreCarrera FROM Carreras";
            BindDropDownList(ddlCarrera, query, "NombreCarrera", "Id", "Seleccione Carrera");
            string query2 = "select (nombre+ ' '+appaterno+' '+apmaterno)as nombres,ClaveProfesor from Profesores";
            BindDropDownList(ddlClave, query2, "nombres", "ClaveProfesor", "Nombre Profesor");

            ddlMateria.Items.Insert(0, new ListItem("Seleccione Materia", "0"));
        }
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

    /// <summary>
    /// Método en el que le asignamos sus horas a los profesores
    /// </summary>
    /// <returns></returns>
    private bool Asignar()
    {
        int valor = 0;
        string ClaveProfesor = ddlClave.SelectedItem.Value;
        string clavemateria = ddlMateria.SelectedItem.Value;
        int valor2 = 0;

        SqlConnection con3 = new SqlConnection(strcon);
        SqlCommand comm2 = new SqlCommand("select (HorasPSemana-HorasAsignadas) as total  from Profesores where ClaveProfesor=@cl", con3);
        comm2.Parameters.AddWithValue("@cl", ClaveProfesor);
        con3.Open();
        SqlDataReader reader2 = comm2.ExecuteReader();
        if (reader2.Read())
        {
            valor2 = (int)(reader2["total"]);
        }
        con3.Close();
        SqlConnection con2 = new SqlConnection(strcon);
        SqlCommand comm = new SqlCommand("select HorasSemanales from Materias where Id=@cl", con2);
        comm.Parameters.AddWithValue("@cl", clavemateria);
        con2.Open();
        SqlDataReader reader = comm.ExecuteReader();
        if (reader.Read())
        {
            valor = (int)(reader["HorasSemanales"]);
        }
        con2.Close();


        if (valor2 >= valor)
        {
            string insertar = "update Profesores set HorasAsignadas=HorasAsignadas+@valor where ClaveProfesor=@cl";

            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = insertar;
                    cmd.Parameters.AddWithValue("@valor", valor);
                    cmd.Parameters.AddWithValue("@cl", ClaveProfesor);


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
            string insert = "INSERT INTO AsignMaterias(IdProfesor,id,HorasRes) VALUES(@ClaveProfesor,@clavemateria,@horas)";

            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = insert;
                    cmd.Parameters.AddWithValue("@ClaveProfesor", ClaveProfesor);
                    cmd.Parameters.AddWithValue("@clavemateria", clavemateria);
                    cmd.Parameters.AddWithValue("@horas", valor);
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
        else
        {
            return false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ddlCarrera.SelectedItem.Value != "" && ddlClave.SelectedItem.Value != "" && ddlMateria.SelectedItem.Value != "")
        {
            if (Asignar())
            {
                Response.Write("<script language='JavaScript'>window.alert('Materia asignada correctamente.')</script>");
            }
            else
            {
                Response.Write("<script language='JavaScript'>window.alert('No cuenta con suficientes horas libres solo dispone de ' )</script>");
            }
        }
        else
            Response.Write("<script language='JavaScript'>window.alert('Todos los campos son obligatorios.')</script>");
    }

    protected void ddlCarrera_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlMateria.Items.Clear();
        ddlMateria.Items.Insert(0, new ListItem("Seleccione Materia", "0"));
        int IdCarrera = int.Parse(ddlCarrera.SelectedItem.Value);
        if (IdCarrera > 0)
        {
            string query = string.Format("select Nombre,Id from Materias  WHERE IdCarrera = {0} ", IdCarrera);
            BindDropDownList(ddlMateria, query, "Nombre", "Id", "Seleccione Materia");
        }
    }
}
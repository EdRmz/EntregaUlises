using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Windows.Forms;

public partial class SeleccionHorario : System.Web.UI.Page
{

   
    /// <summary>
    /// Creación de nuestra ConnectionString
    /// </summary>
    private string strcon = WebConfigurationManager.ConnectionStrings["HorarioFinalConnectionString1"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

        //ddlDia.Items.Insert(0, new ListItem("Seleccione", "0"));
        if (!IsPostBack)
        {
            llenardrop();

        }
    }


    private void llenardrop()
    {
        string cv = Convert.ToString(Session["NombreUsuario"]);
        string query = string.Format("SELECT M.Nombre AS Mostrar, A.IdOperacion AS Valor FROM AsignMaterias AS A INNER JOIN Materias AS M ON A.Id = M.Id WHERE A.IdProfesor = '{0}' AND Cargada = 0", cv);
        BindDropDownList(ddlMateria, query, "Mostrar", "Valor", "Seleccione Materia");
        ddlMateria.Enabled = true;
        using (SqlConnection con = new SqlConnection(strcon))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = con;
                cmd.CommandText = query;
            }
        }
    }


    protected void ddlHora1_SelectedIndexChanged(object sender, EventArgs e)
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
    protected void btnCrear_Click(object sender, EventArgs e)
    {

    }

    protected void Cancelar_Click(object sender, EventArgs e)
    {
        if (MessageBox.Show("Sus cambios no serán guardados si cierra esta ventana.\n¿Seguro que desea salir?", "Advertencia", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning) == DialogResult.OK)
        {
            if (IsPostBack)
                Response.Redirect("Welcome.aspx");
        }
    }

    protected void ddlMateria_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    private void llenarlabel()
    {
        int valor = Convert.ToInt32(ddlMateria.SelectedItem.Value);
        int horasrestantes = 1;
        SqlConnection con3 = new SqlConnection(strcon);
        SqlCommand comm2 = new SqlCommand("select HorasRes from AsignMaterias where IdOperacion=@cl", con3);
        comm2.Parameters.AddWithValue("@cl", valor);
        con3.Open();
        SqlDataReader reader2 = comm2.ExecuteReader();
        if (reader2.Read())
        {
            horasrestantes = (int)(reader2["HorasRes"]);
        }
        con3.Close();

        if (horasrestantes > 0)
        {
            Label2.Text = "Horas Por Cargar Restantes:" + horasrestantes;
        }
        else
        {
            string insert = "update AsignMaterias set Cargada=1 where IdOperacion=@valor";

            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = insert;
                    cmd.Parameters.AddWithValue("@valor", valor);



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
            ddlAula7.Visible = false;
            ddlDia7.Visible = false;
            ddlHora7.Visible = false;


            Label2.Visible = false;
            Label20.Visible = false;
            Label21.Visible = false;
            Label22.Visible = false;
            btnSelec6.Visible = false;
            llenardrop();
        }
    }
    public static int Descarga;
    protected void btnSelecciona_Click(object sender, EventArgs e)
    {
        string texto = "Asesoria ";
        string obtenertexto = ddlMateria.SelectedItem.Text;
        if (obtenertexto != "Seleccione Materia")
        {
          
        

            if (obtenertexto.Equals(texto) || obtenertexto.Equals("Investigacion ") || obtenertexto.Equals("Gestion del curso ") || obtenertexto.Equals("Acreditacion") || obtenertexto.Equals("Horas de oficina") || obtenertexto.Equals("Tutoria de descarga ")) 
            {
               Descarga = 1;
                
                
            }
            ddlAula7.Visible = true;
            ddlDia7.Visible = true;
            ddlHora7.Visible = true;
            Label2.Visible = true;
            Label20.Visible = true;
            Label21.Visible = true;
            Label22.Visible = true;
            llenarlabel();
        }

    }

    protected void ddlDia2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void ddlHora2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    private bool actualizar()
    {
       
        int materia = Convert.ToInt32(ddlMateria.SelectedItem.Value);
        int hora = Convert.ToInt32(ddlHora7.SelectedItem.Value);
        int aula = Convert.ToInt32(ddlAula7.SelectedItem.Value);
        if (Descarga == 1)
        {
            Descarga = 0;

            string insert = "Insert into Descargas Values(@materia,@lugar,@hora)";

            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = insert;
                    cmd.Parameters.AddWithValue("@materia",materia);
                    cmd.Parameters.AddWithValue("@lugar", aula);
                    cmd.Parameters.AddWithValue("@hora", hora);

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

            string insertar = "update AsignMaterias set HorasRes=HorasRes-1 where IdOperacion=@materia";

            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = insertar;
                    cmd.Parameters.AddWithValue("@materia", materia);


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
           

            string insert = "update CargasF SET Disponible='NO',AsignacionOperacion=@materia WHERE Id=@aula";

            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = insert;
                    cmd.Parameters.AddWithValue("@materia", materia);
                    cmd.Parameters.AddWithValue("@aula", aula);


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

            string insertar = "update AsignMaterias set HorasRes=HorasRes-1 where IdOperacion=@materia";

            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = con;
                    cmd.CommandText = insertar;
                    cmd.Parameters.AddWithValue("@materia", materia);


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
    }
    protected void btnSelec6_Click(object sender, EventArgs e)
    {
        actualizar();
        llenarlabel();
        ddlAula7.Items.Clear();
        ddlDia7.SelectedIndex = 0;
        ddlHora7.Items.Clear();


    }


    protected void ddlDia7_SelectedIndexChanged(object sender, EventArgs e)
    {


        ddlHora7.Items.Insert(0, new ListItem("Seleccione Hora", "0"));

        if (Convert.ToInt32(ddlDia7.SelectedItem.Value) == 1)
        {

            string query = string.Format("select Hora,id from Horario where Lunes=1");
            BindDropDownList(ddlHora7, query, "Hora", "id", "Seleccione Hora");


        }
        if (Convert.ToInt32(ddlDia7.SelectedItem.Value) == 2)
        {

            string query = string.Format("select Hora,id from Horario where martes=1");
            BindDropDownList(ddlHora7, query, "Hora", "id", "Seleccione Hora");


        }
        if (Convert.ToInt32(ddlDia7.SelectedItem.Value) == 3)
        {

            string query = string.Format("select Hora,id from Horario where miercoles=1");
            BindDropDownList(ddlHora7, query, "Hora", "id", "Seleccione Hora");


        }
        if (Convert.ToInt32(ddlDia7.SelectedItem.Value) == 4)
        {

            string query = string.Format("select Hora,id from Horario where jueves=1");
            BindDropDownList(ddlHora7, query, "Hora", "id", "Seleccione Hora");


        }
        if (Convert.ToInt32(ddlDia7.SelectedItem.Value) == 5)
        {

            string query = string.Format("select Hora,id from Horario where viernes=1");
            BindDropDownList(ddlHora7, query, "Hora", "id", "Seleccione Hora");


        }

    }
   

    protected void ddlHora7_SelectedIndexChanged(object sender, EventArgs e)
    {
     
        if (Descarga == 0)
        {
            int carrera = 0;
            int valor = Convert.ToInt32(ddlMateria.SelectedItem.Value);
            int Valorhorario = Convert.ToInt32(ddlHora7.SelectedItem.Value);
            SqlConnection con3 = new SqlConnection(strcon);
            SqlCommand comm2 = new SqlCommand("select m.IdCarrera as carrera from AsignMaterias as a inner join Materias as m on a.Id=m.Id where a.IdOperacion=@cl", con3);
            comm2.Parameters.AddWithValue("@cl", valor);
            con3.Open();
            SqlDataReader reader2 = comm2.ExecuteReader();
            if (reader2.Read())
            {
                carrera = (int)(reader2["carrera"]);
            }
            con3.Close();
            if (carrera == 3)
            {
                string query = string.Format("select a.NombreAula as nombre,c.Id as id from CargasF as c inner join Aulas as a on c.IdAula=a.Id where IdHorario={0} and Disponible='SI' ", Valorhorario);
                BindDropDownList(ddlAula7, query, "nombre", "id", "Seleccione Aula");

            }
            else
            {

                string query = string.Format("select a.NombreAula as nombre,c.Id as id from CargasF as c inner join Aulas as a on c.IdAula=a.Id where IdHorario={0} and Disponible='SI' and a.NombreAula!='C1' and a.NombreAula!='C2'", Valorhorario);
                BindDropDownList(ddlAula7, query, "nombre", "id", "Seleccione Aula");

            }
        }
        else
        {
            string query = string.Format("select Nombre,Id from LugarDescarga ");
            BindDropDownList(ddlAula7, query, "Nombre", "id", "Seleccione Aula");
        }

    }

    protected void ddlAula7_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnSelec6.Visible = true;

    }
}
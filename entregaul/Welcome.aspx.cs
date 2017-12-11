using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Welcome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["tipo"].Equals(true))
        {
            btnUsuario.Visible = true;
            btnMateria.Visible = true;
            btnAsigna.Visible = true;
        }
        else
            btnSelecciona.Visible = true;
    }

    protected void btnUsuario_Click(object sender, EventArgs e)
    {
        if(IsPostBack)        
            Response.Redirect("Usuarios.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
            Response.Redirect("Materias.aspx");
    }

    protected void btnAsigna_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
            Response.Redirect("Asignaciones.aspx");
    }

    protected void btnSelecciona_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
            Response.Redirect("SeleccionHorario.aspx");
    }

    protected void btnSalir_Click(object sender, EventArgs e)
    {

    }
}
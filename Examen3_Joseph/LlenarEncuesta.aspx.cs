using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Examen3_Joseph
{
    public partial class LlenarEncuesta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPartidosPoliticos();
            }
        }

        protected void CargarPartidosPoliticos()
        {
            if (ddlPartidosPoliticos.Items.Count == 0)
            {
                List<string> partidos = new List<string> { "PLN", "PUSC", "PAC" };

                foreach (string partido in partidos)
                {
                    ddlPartidosPoliticos.Items.Add(partido);
                }
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text;
            int edad = int.Parse(txtEdad.Text);
            string correo = txtCorreo.Text;
            string partidoPolitico = ddlPartidosPoliticos.SelectedValue;

            Encuesta encuestaManager = new Encuesta();

            bool encuestaAgregada = encuestaManager.AgregarEncuesta(nombre, edad, correo, partidoPolitico);

            if (encuestaAgregada)
            {
                lblMensaje.Text = "Encuesta agregada con éxito";
                lblMensaje.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMensaje.Text = "Error al agregar la encuesta. Por favor, inténtalo de nuevo.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}


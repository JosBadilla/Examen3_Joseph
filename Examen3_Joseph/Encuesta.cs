using System;
using System.Data;
using System.Data.SqlClient;

namespace Examen3_Joseph
{
    public class Encuesta
    {
        private string connectionString;

        public Encuesta()
        {
            connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
        }

        public bool AgregarEncuesta(string nombre, int edad, string correo, string partidoPolitico)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("AgregarEncuesta", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Nombre", nombre);
                    cmd.Parameters.AddWithValue("@Edad", edad);
                    cmd.Parameters.AddWithValue("@Correo", correo);
                    cmd.Parameters.AddWithValue("@Partido", partidoPolitico);

                    cmd.ExecuteNonQuery();

                    return true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al agregar la encuesta: " + ex.Message);
                return false;
            }
        }

    }
}

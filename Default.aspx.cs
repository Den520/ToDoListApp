using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToDoListApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void addTaskButton_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=HOME-PC\SQLEXPRESS;Initial Catalog=ToDoList;Integrated Security=True"; // Строка соединения
            string sqlExpression = String.Format("INSERT INTO [ToDoListTable] ([Описание задачи], [Статус]) VALUES ('{0}', '{1}')", taskDescriptionTextBox.Text, statusCheckBox.Checked);
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                var cmd = new SqlCommand(sqlExpression, conn);
                var reader = cmd.ExecuteReader();
                conn.Close();
            }
            taskDescriptionTextBox.Text = "";
            statusCheckBox.Checked = false;
            dataGridView.DataBind();
        }
    }
}
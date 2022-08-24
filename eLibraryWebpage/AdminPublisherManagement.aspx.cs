using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eLibraryWebpage
{
    public partial class AdminPublisherManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GridViewPublisherList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        // add Publisher
        protected void Btn_add_Click1(object sender, EventArgs e)
        {
            if (CheckPublisherExists())
            {
                Response.Write("<script>alert('Publisher ID already exists. Try new Publisher ID');</script>");
            }
            else
            {
                AddNewPublisher();
            }
        }
        // update Publisher
        protected void Btn_update_Click(object sender, EventArgs e)
        {
            if (CheckPublisherExists())
            {
                UpdatePublisher();
            }
            else
            {
                Response.Write("<script>alert('The entered Publisher ID does not exist. Try different Publisher ID');</script>");
            }
        }
        // delete Publisher
        protected void Btn_delete_Click(object sender, EventArgs e)
        {
            if (CheckPublisherExists())
            {
                DeletePublisher();
            }
            else
            {
                Response.Write("<script>alert('The entered Publisher ID does not exist. Try different Publisher ID');</script>");
            }
        }
        // find button event 
        protected void Btn_pGo_Click(object sender, EventArgs e)
        {
            getPublisherbyId();
        }

        // user defined function for find button in publisher id
        void getPublisherbyId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from publisher_master_tbl where publisher_id='" + txt_pId.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    txt_pName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid publisher ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        // user defined function to check unique publisher id
        bool CheckPublisherExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from publisher_master_tbl where publisher_id='" + txt_pId.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        // user defined function to add new publisher
        void AddNewPublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO publisher_master_tbl(publisher_id,publisher_name) values (@publisher_id,@publisher_name)", con);
                cmd.Parameters.AddWithValue("@publisher_id", txt_pId.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", txt_pName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('New publisher added successfully');</script>");
                ClearForm();
                GridViewPublisherList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // user defined function to update publisher 
        void UpdatePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE publisher_master_tbl SET publisher_name = @publisher_name WHERE publisher_id='" + txt_pId.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@publisher_name", txt_pName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher details updated successfully');</script>");
                ClearForm();
                GridViewPublisherList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // user defined function to delete publisher 
        void DeletePublisher()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM publisher_master_tbl WHERE publisher_id='" + txt_pId.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher details deleted successfully');</script>");
                ClearForm();
                GridViewPublisherList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // user defined function to clear from
        void ClearForm()
        {
            txt_pId.Text = "";
            txt_pName.Text = "";
        }
    }
}
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
    public partial class AdminAuthorManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GridViewAuthorsList.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
        }
        // add author
        protected void Btn_add_Click(object sender, EventArgs e)
        {
            if (CheckAuthorExists())
            {
                Response.Write("<script>alert('Author ID already exists. Try new author ID');</script>");
            }
            else
            {
                AddNewAuthor();
            }
        }
        // update author
        protected void Btn_update_Click(object sender, EventArgs e)
        {
            if (CheckAuthorExists())
            {
                UpdateAuthor();
            }
            else
            {
                Response.Write("<script>alert('The entered author ID does not exist. Try different author ID');</script>");
            }
        }
        // delete author
        protected void Btn_delete_Click(object sender, EventArgs e)
        {
            if (CheckAuthorExists())
            {
                DeleteAuthor();
            }
            else
            {
                Response.Write("<script>alert('The entered author ID does not exist. Try different author ID');</script>");
            }
        }
        // find button event 
        protected void Btn_aGo_Click(object sender, EventArgs e)
        {
            getAuthorbyId();
        }

        // user defined function for find button in author id
        void getAuthorbyId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + txt_aId.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    txt_aName.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid author ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                
            }
        }

        // user defined function to check unique author id
        bool CheckAuthorExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from author_master_tbl where author_id='" + txt_aId.Text.Trim() + "';", con);
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

        // user defined function to add new author 
        void AddNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO author_master_tbl(author_id,author_name) values (@author_id,@author_name)", con);
                cmd.Parameters.AddWithValue("@author_id", txt_aId.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", txt_aName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('New author added successfully');</script>");
                ClearForm();
                GridViewAuthorsList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // user defined function to update author 
        void UpdateAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE author_master_tbl SET author_name = @author_name WHERE author_id='"+txt_aId.Text.Trim()+"'", con);
                cmd.Parameters.AddWithValue("@author_name", txt_aName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author details updated successfully');</script>");
                ClearForm();
                GridViewAuthorsList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // user defined function to delete author 
        void DeleteAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM author_master_tbl WHERE author_id='" + txt_aId.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author details deleted successfully');</script>");
                ClearForm();
                GridViewAuthorsList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // user defined function to clear from
        void ClearForm()
        {
            txt_aId.Text = "";
            txt_aName.Text = "";
        }
    }
}
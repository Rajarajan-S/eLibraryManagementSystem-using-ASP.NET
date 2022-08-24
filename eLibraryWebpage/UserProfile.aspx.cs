using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eLibraryWebpage
{
    public partial class UserProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("UserLogin.aspx");
                }
                else
                {
                    getUserBookData();

                    if (!Page.IsPostBack)
                    {
                        getUserPersonalData();
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }
        // update button event
        protected void Btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("UserLogin.aspx");
                }
                else
                {
                    updateUserData();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("userlogin.aspx");
            }
        }

        // user defined functions //

        // user book data
        void getUserBookData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_issue_tbl where member_id='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewBooks.DataSource = dt;
                GridViewBooks.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        // user personal data
        void getUserPersonalData()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + Session["username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                txt_name.Text = dt.Rows[0]["full_name"].ToString();
                txt_dob.Text = dt.Rows[0]["dob"].ToString();
                txt_num.Text = dt.Rows[0]["contact_no"].ToString();
                txt_mail.Text = dt.Rows[0]["email"].ToString();
                ddl_state.SelectedValue = dt.Rows[0]["state"].ToString().Trim();
                txt_city.Text = dt.Rows[0]["city"].ToString();
                txt_pin.Text = dt.Rows[0]["pincode"].ToString();
                txt_address.Text = dt.Rows[0]["full_address"].ToString();
                txt_userid.Text = dt.Rows[0]["member_id"].ToString();
                txt_userpass.Text = dt.Rows[0]["password"].ToString();
                lbl_status.Text = dt.Rows[0]["account_status"].ToString().Trim();

                if (dt.Rows[0]["account_status"].ToString().Trim() == "active")
                {
                    lbl_status.Attributes.Add("class", "badge badge-pill badge-success");
                }
                if (dt.Rows[0]["account_status"].ToString().Trim() == "Pending")
                {
                    lbl_status.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                if (dt.Rows[0]["account_status"].ToString().Trim() == "Deactive")
                {
                    lbl_status.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    lbl_status.Attributes.Add("class", "badge badge-pill badge-info");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        // due date indication
        protected void GridViewBooks_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime duedate = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > duedate)
                    {
                        e.Row.BackColor = System.Drawing.Color.IndianRed;
                        e.Row.ForeColor = System.Drawing.Color.White;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // update user profile data
        void updateUserData()
        {
            string password = "";
            if (txt_newpass.Text.Trim() == "")
            {
                password = txt_userpass.Text.Trim();
            }
            else
            {
                password = txt_newpass.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update member_master_tbl set full_name=@full_name, dob=@dob, " +
                    "contact_no=@contact_no, email=@email, state=@state, city=@city, pincode=@pincode, " +
                    "full_address=@full_address, password=@password, account_status=@account_status " +
                    "WHERE member_id='" + Session["username"].ToString().Trim() + "'", con);

                cmd.Parameters.AddWithValue("@full_name", txt_name.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txt_dob.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txt_num.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txt_mail.Text.Trim());
                cmd.Parameters.AddWithValue("@state", ddl_state.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", txt_city.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txt_pin.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txt_address.Text.Trim());
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@account_status", "pending");

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Write("<script>alert('Your details have been updated successfully');</script>");
                    getUserPersonalData();
                    getUserBookData();
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
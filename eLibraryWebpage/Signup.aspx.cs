using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace eLibraryWebpage
{

    public partial class Signup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Btn_signup_Click(object sender, EventArgs e)
        {
            if (CheckMemberExists())
            {
                Response.Write("<script>alert('User ID already exists. Try new User ID');</script>");
            }
            else
            {
                SignUpNewMember();
            }            
        }

        bool CheckMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + txt_userid.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >=1)
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

        void SignUpNewMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO member_master_tbl(full_name,dob,contact_no,email,state," +
                    "city,pincode,full_address,member_id,password,account_status) values (@full_name,@dob,@contact_no," +
                    "@email,@state,@city,@pincode,@full_address,@member_id,@password,@account_status)", con);
                cmd.Parameters.AddWithValue("@full_name", txt_name.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", txt_dob.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_no", txt_num.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txt_mail.Text.Trim());
                cmd.Parameters.AddWithValue("@state", ddl_state.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", txt_city.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", txt_pin.Text.Trim());
                cmd.Parameters.AddWithValue("@full_address", txt_address.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", txt_userid.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txt_userpass.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign up Successful. Go to Login page');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
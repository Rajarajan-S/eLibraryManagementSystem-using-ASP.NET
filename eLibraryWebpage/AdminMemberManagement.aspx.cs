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
    public partial class AdminMemberManagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewMemsList.DataBind();
        }

        // Go button event
        protected void Btn_mId_Click(object sender, EventArgs e)
        {
            getMemberbyId();
        }

        // active button event
        protected void Btn_active_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("Active");
        }
        // pending button event
        protected void Btn_pending_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("Pending");
        }
        // inactive button event
        protected void Btn_inactive_Click(object sender, EventArgs e)
        {
            updateMemberStatusByID("Deactive");
        }


        // Delete member button event
        protected void Btn_delete_Click(object sender, EventArgs e)
        {
            deleteMemberByID();
        }

        // user defined function for member id find button 
        void getMemberbyId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + txt_mID.Text.Trim() + "';", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        txt_mName.Text = dr.GetValue(0).ToString();
                        txt_memDob.Text = dr.GetValue(1).ToString();
                        txt_memContact.Text = dr.GetValue(2).ToString();
                        txt_memEmail.Text = dr.GetValue(3).ToString();
                        txt_memState.Text = dr.GetValue(4).ToString();
                        txt_memCity.Text = dr.GetValue(5).ToString();
                        txt_memPin.Text = dr.GetValue(6).ToString();
                        txt_memAddress.Text = dr.GetValue(7).ToString();
                        txt_mID.Text = dr.GetValue(8).ToString();
                        txt_aStatus.Text = dr.GetValue(10).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Member Id');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        // update member status
        void updateMemberStatusByID(string status)
        {
            if (CheckMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE member_master_tbl SET account_status = '" + status + "' WHERE member_id='" + txt_mID.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Member status updated successfully');</script>");
                    ClearForm();
                    GridViewMemsList.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");

            }
        }

        // delete member
        void deleteMemberByID()
        {
            if (CheckMemberExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM member_master_tbl WHERE member_id='" + txt_mID.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Member deleted successfully');</script>");
                    ClearForm();
                    GridViewMemsList.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }

        // user defined function to check unique member id
        bool CheckMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from member_master_tbl where member_id='" + txt_mID.Text.Trim() + "';", con);
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

        // user defined function to clear from
        void ClearForm()
        {
            txt_mName.Text = "";
            txt_memDob.Text = "";
            txt_memContact.Text = "";
            txt_memEmail.Text = "";
            txt_memState.Text = "";
            txt_memCity.Text = "";
            txt_memPin.Text = "";
            txt_memAddress.Text = "";
            txt_mID.Text = "";
            txt_aStatus.Text = "";
        }
    }
}
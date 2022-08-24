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
    public partial class AdminBookIssue : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewIssuedBooksList.DataBind();
        }

        // find button event
        protected void Btn_bookid_Click(object sender, EventArgs e)
        {
            getNamesbyID();
        }
        // issue button event
        protected void Btn_issue_Click(object sender, EventArgs e)
        {
            if (checkBookExists() && checkMemberExists())
            {
                if (checkEntryExists())
                {
                    Response.Write("<script>alert('This book has been issued to this member already');</script>");
                }
                else
                {
                    issueBook();
                    GridViewIssuedBooksList.DataBind();
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID or Book ID');</script>");

            }
        }
        // return button event
        protected void Btn_return_Click(object sender, EventArgs e)
        {
            if (checkBookExists() && checkMemberExists())
            {
                if (checkEntryExists())
                {
                    returnBook();
                    GridViewIssuedBooksList.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('There is no entry with this member ID and book ID');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID or Book ID');</script>");
            }
        }


        //user defined functions//

        // get details by ID using find button
        void getNamesbyID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT book_name from book_master_tbl where book_id='" + txt_bID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txt_bookName.Text = dt.Rows[0]["book_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid book ID');</script>");
                }

                cmd = new SqlCommand("SELECT full_name from member_master_tbl where member_id='" + txt_memId.Text.Trim() + "';", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    txt_memName.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid user ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // check book exists
        bool checkBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + txt_bID.Text.Trim() +
                    "' AND current_stock > 0", con);
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
                return false;
            }           
        }

        // check book exists
        bool checkMemberExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT full_name from member_master_tbl WHERE member_id='" + txt_memId.Text.Trim() + "'", con);
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
                return false;
            }
        }

        // check book issued entry exists
        bool checkEntryExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_issue_tbl WHERE " +
                    "member_id='" + txt_memId.Text.Trim() + "' AND book_id='" + txt_bID.Text.Trim() + "'", con);
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
                return false;
            }
        }

        // issue book
        void issueBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_tbl(member_id,member_name,book_id,book_name," +
                    "issue_date,due_date) " + "values (@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date)", con);
                cmd.Parameters.AddWithValue("@member_id", txt_memId.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name",txt_memName.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", txt_bID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", txt_bookName.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", txt_startDate.Text.Trim());
                cmd.Parameters.AddWithValue("@due_date", txt_endtDate.Text.Trim());
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock-1 " +
                    "WHERE book_id = '"+txt_bID.Text.Trim()+"'", con);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Book has been issued successfully');</script>");
                //ClearForm();
                GridViewIssuedBooksList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //return book
        void returnBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM book_issue_tbl WHERE book_id='" + txt_bID.Text.Trim() + "' " +
                    "AND member_id='" + txt_memId.Text.Trim() + "'", con);
                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    cmd = new SqlCommand("UPDATE book_master_tbl SET current_stock = current_stock+1 WHERE book_id='" + txt_bID.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Book has been returned Successfully');</script>");
                    GridViewIssuedBooksList.DataBind();
                    con.Close();
                }
                else
                {
                    Response.Write("<script>alert('There is no entry with this member ID and book ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        // due date indication
        protected void GridViewIssuedBooksList_RowDataBound(object sender, GridViewRowEventArgs e)
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
    }
}
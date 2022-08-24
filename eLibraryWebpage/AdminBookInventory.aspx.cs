using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eLibraryWebpage
{
    public partial class AdminBookInventory : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillAPvalues();
            }
            GridViewBookInv.DataBind();
        }

        // find button event
        protected void btn_bID_Click(object sender, EventArgs e)
        {
            getBookbyId();

        }

        // add book
        protected void btn_add_Click(object sender, EventArgs e)
        {
            if (CheckBoookExists())
            {
                Response.Write("<script>alert('Book already exists');</script>");
            }
            else
            {
                addNewBook();
                GridViewBookInv.DataBind();
            }
        }
        // update book
        protected void btn_update_Click(object sender, EventArgs e)
        {
            if (CheckBoookExists())
            {
                updateBookbyID();  
                GridViewBookInv.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Book already exists');</script>");
            }
        }
        // delete book
        protected void btn_delete_Click(object sender, EventArgs e)
        {
            if (CheckBoookExists())
            {
                deleteBookbyID();
                GridViewBookInv.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Book does not exist');</script>");
            }
        }

        // user defined functions //

        // Find button on book id
        void getBookbyId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + txt_bID.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    txt_bName.Text = dt.Rows[0]["book_name"].ToString();
                    txt_dop.Text = dt.Rows[0]["publish_date"].ToString();
                    txt_edition.Text = dt.Rows[0]["edition"].ToString();
                    txt_cost.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    txt_pages.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    txt_aStock.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    txt_cStock.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    txt_desc.Text = dt.Rows[0]["book_description"].ToString();
                    txt_issuedBooks.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                    DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    ddl_publisher.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                    ddl_authors.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();

                    lb_genre.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < lb_genre.Items.Count; j++)
                        {
                            if (lb_genre.Items[j].ToString() == genre[i])
                            {
                                lb_genre.Items[j].Selected = true;
                            }
                        }
                    }
                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid book ID');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        // fill author, publisher values
        void fillAPvalues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name from author_master_tbl;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                ddl_authors.DataSource = dt;
                ddl_authors.DataValueField = "author_name";
                ddl_authors.DataBind();

                cmd = new SqlCommand("SELECT publisher_name from publisher_master_tbl;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);

                ddl_publisher.DataSource = dt;
                ddl_publisher.DataValueField = "publisher_name";
                ddl_publisher.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        // to check book exists
        bool CheckBoookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl where book_id='" + txt_bID.Text.Trim() + "'" +
                    "OR book_name='" + txt_bName.Text.Trim() + "' ;", con);
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

        // add new book
        void addNewBook()
        {
            try
            {
                string genres = "";
                foreach (int i in lb_genre.GetSelectedIndices())
                {
                    genres = genres + lb_genre.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/book inventory/Book-icon.png";
                string filename = Path.GetFileName(BookCover.PostedFile.FileName);
                BookCover.SaveAs(Server.MapPath("book inventory/" + filename));
                filepath = "~/book inventory/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO book_master_tbl(book_id,book_name,genre,author_name," +
                    "publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock," +
                    "current_stock,book_img_link) values(@book_id,@book_name,@genre,@author_name,@publisher_name," +
                    "@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock," +
                    "@current_stock,@book_img_link)", con);

                cmd.Parameters.AddWithValue("@book_id", txt_bID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", txt_bName.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", ddl_authors.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", ddl_publisher.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", txt_dop.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", txt_edition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", txt_cost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", txt_pages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", txt_desc.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", txt_aStock.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", txt_cStock.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book added successfully.');</script>");
                GridViewBookInv.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        // update book
        void updateBookbyID()
        {
            try
            {

                int actual_stock = Convert.ToInt32(txt_aStock.Text.Trim());
                int current_stock = Convert.ToInt32(txt_cStock.Text.Trim());

                if (global_actual_stock == actual_stock)
                {

                }
                else
                {
                    if (actual_stock < global_issued_books)
                    {
                        Response.Write("<script>alert('Actual Stock value cannot be less than the Issued books');</script>");
                        return;


                    }
                    else
                    {
                        current_stock = actual_stock - global_issued_books;
                        txt_cStock.Text = "" + current_stock;
                    }
                }

                string genres = "";
                foreach (int i in lb_genre.GetSelectedIndices())
                {
                    genres = genres + lb_genre.Items[i] + ",";
                }
                genres = genres.Remove(genres.Length - 1);

                string filepath = "~/book inventory/books1";
                string filename = Path.GetFileName(BookCover.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = global_filepath;

                }
                else
                {
                    BookCover.SaveAs(Server.MapPath("book inventory/" + filename));
                    filepath = "~/book inventory/" + filename;
                }

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE book_master_tbl set book_name=@book_name, genre=@genre, author_name=@author_name, publisher_name=@publisher_name, publish_date=@publish_date, language=@language, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description, actual_stock=@actual_stock, current_stock=@current_stock, book_img_link=@book_img_link where book_id='" + txt_bID.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@book_name", txt_bName.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@author_name", ddl_authors.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", ddl_publisher.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", txt_dop.Text.Trim());
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", txt_edition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", txt_cost.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", txt_pages.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", txt_desc.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", txt_aStock.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", txt_cStock.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);


                cmd.ExecuteNonQuery();
                con.Close();
                GridViewBookInv.DataBind();
                Response.Write("<script>alert('Book Updated Successfully');</script>");
            }
            catch (Exception Ex)
            {
                Response.Write("<script>alert('" + Ex.Message + "');</script>");
            }
        }

        // delete book
        void deleteBookbyID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM book_master_tbl WHERE book_id='" + txt_bID.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book deleted successfully');</script>");
                //ClearForm();
                GridViewBookInv.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}

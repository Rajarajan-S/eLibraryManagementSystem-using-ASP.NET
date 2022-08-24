using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eLibraryWebpage
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    LinkButton1.Visible = true; //user login
                    LinkButton2.Visible = true; //sign up

                    LinkButton3.Visible = false; //log out
                    LinkButton7.Visible = false; //hello user

                    //admin stuffs
                    LinkButton6.Visible = true; //admin login
                    LinkButton11.Visible = false; 
                    LinkButton12.Visible = false; 
                    LinkButton8.Visible = false;
                    LinkButton9.Visible = false; 
                    LinkButton10.Visible = false; 
                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false; //user login
                    LinkButton2.Visible = false; //sign up

                    LinkButton3.Visible = true; //log out
                    LinkButton7.Visible = true; //hello user
                    LinkButton7.Text = "Hi " + Session["username"].ToString();

                    //admin stuffs
                    LinkButton6.Visible = true; //admin login
                    LinkButton11.Visible = false;
                    LinkButton12.Visible = false;
                    LinkButton8.Visible = false;
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false; //user login
                    LinkButton2.Visible = false; //sign up

                    LinkButton3.Visible = true; //log out
                    LinkButton7.Visible = true; //hello user
                    LinkButton7.Text = "Hi admin";

                    //admin stuffs
                    LinkButton6.Visible = false; //admin login
                    LinkButton11.Visible = true;
                    LinkButton12.Visible = true;
                    LinkButton8.Visible = true;
                    LinkButton9.Visible = true;
                    LinkButton10.Visible = true;
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAuthorManagement.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPublisherManagement.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookInventory.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminBookIssue.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminMemberManagement.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewBooks.aspx");
        }

        //Log out button click event
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["status"] = "";
            Session["role"] = "";

            LinkButton1.Visible = true; //user login
            LinkButton2.Visible = true; //sign up

            LinkButton3.Visible = false; //log out
            LinkButton7.Visible = false; //hello user

            //admin stuffs
            LinkButton6.Visible = true; //admin login
            LinkButton11.Visible = false;
            LinkButton12.Visible = false;
            LinkButton8.Visible = false;
            LinkButton9.Visible = false;
            LinkButton10.Visible = false;

            Response.Redirect("Homepage.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }
    }
}
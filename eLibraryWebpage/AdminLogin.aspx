<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="eLibraryWebpage.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="images/AdminIcon.png" width="150px"/>
                                </center>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                <center>
                                   <br /> <h4>Admin Login</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Admin ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_adminid" CssClass="form-control" runat="server" placeholder="Enter Admin ID" ></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="Required_admin_id" runat="server" ErrorMessage="*Admin ID is required" ControlToValidate="txt_adminid" ForeColor="#FF3300"></asp:RequiredFieldValidator>--%>
                                </div>
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_adminpass" CssClass="form-control" runat="server" placeholder="Enter Password" TextMode="Password" ></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="Required_admin_pass" runat="server" ErrorMessage="*Password is required" ControlToValidate="txt_adminpass" ForeColor="#FF3300"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="Btn_login" class="btn btn-warning btn-block" runat="server" Text="Login" OnClick="Btn_login_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="Homepage.aspx" style="color:black"><< Home</a><br /><br />
            </div>
        </div>
    </div>
</asp:Content>

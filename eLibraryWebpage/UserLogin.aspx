<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="eLibraryWebpage.UserLogin" %>
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
                                    <img src="images/UserIcon.png" width="150px"/>
                                </center>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                <center>
                                   <br /> <h4>Member Login</h4>
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
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_memberid" CssClass="form-control" runat="server" placeholder="Enter Member ID" ></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="Required_mem_id" runat="server" ErrorMessage="*Member ID is required" ControlToValidate="txt_memberid" ForeColor="#FF3300"></asp:RequiredFieldValidator>--%>
                                </div>
                                <label>Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_memberpass" CssClass="form-control" runat="server" placeholder="Enter Password" TextMode="Password" ></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="Required_mem_pass" runat="server" ErrorMessage="*Password is required" ControlToValidate="txt_memberpass" ForeColor="#FF3300"></asp:RequiredFieldValidator>--%>
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="Btn_login" class="btn btn-warning btn-block" runat="server" Text="Login" OnClick="Btn_login_Click" />
                                </div>
                                <div class="form-group">
                                    <a href="Signup.aspx">
                                    <input id="Btn_signup" class="btn btn-info btn-block" type="button" value="Sign up" /></a>
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

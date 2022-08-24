<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="eLibraryWebpage.UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="images/UserIcon.png" width="100px"/>
                                </center>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col">
                                <center>
                                   <br /> <h5>Your Profile</h5>
                                    <span>Account Status - </span>
                                    <asp:Label class="badge badge-pill badge-info" runat="server" Text="Pending" ID="lbl_status"></asp:Label>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_name" CssClass="form-control" runat="server" placeholder="Enter Name" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Required_name" runat="server" ErrorMessage="*Name is required" ControlToValidate="txt_name" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionName" runat="server" ErrorMessage="*Should contain only alphabets" ControlToValidate="txt_name" ValidationExpression="^[A-Za-z]+$" ForeColor="#FF3300" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Date of birth</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_dob" CssClass="form-control" runat="server" placeholder="Enter DOB" TextMode="Date"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Required_dob" runat="server" ErrorMessage="*DOB is required" ControlToValidate="txt_dob" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Contact number</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_num" CssClass="form-control" runat="server" placeholder="Enter Contact number" TextMode="Number" ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Required_num" runat="server" ErrorMessage="*Contact number is required" ControlToValidate="txt_num" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionNum" runat="server" ErrorMessage="*Should contain only 10 digits" ControlToValidate="txt_num" ValidationExpression="^[0-9]{10}" ForeColor="#FF3300" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Email</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_mail" CssClass="form-control" runat="server" placeholder="Enter Email id" TextMode="Email" ControlToValidate="txt_mail" EnableTheming="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Required_mail" runat="server" ErrorMessage="*Email id is required" ForeColor="#FF3300" ControlToValidate="txt_mail" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionEmail" runat="server" ErrorMessage="*Invalid Email format" ControlToValidate="txt_mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#FF3300" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="ddl_state" CssClass="form-control" runat="server">
                                        <asp:ListItem>Select state</asp:ListItem>
                                        <asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
                                        <asp:ListItem>Andhra Pradesh</asp:ListItem>
                                        <asp:ListItem>Arunachal Pradesh</asp:ListItem>
                                        <asp:ListItem>Assam</asp:ListItem>
                                        <asp:ListItem>Bihar</asp:ListItem>
                                        <asp:ListItem>Chandigarh</asp:ListItem>
                                        <asp:ListItem>Chattisgarh</asp:ListItem>
                                        <asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
                                        <asp:ListItem>Daman and Diu</asp:ListItem>
                                        <asp:ListItem>Delhi</asp:ListItem>
                                        <asp:ListItem>Goa</asp:ListItem>
                                        <asp:ListItem>Gujarat</asp:ListItem>
                                        <asp:ListItem>Haryana</asp:ListItem>
                                        <asp:ListItem>Himachal Pradesh</asp:ListItem>
                                        <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                                        <asp:ListItem>Jharkhand</asp:ListItem>
                                        <asp:ListItem>Karnataka</asp:ListItem>
                                        <asp:ListItem>Kerala</asp:ListItem>
                                        <asp:ListItem>Lakshadweep</asp:ListItem>
                                        <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                        <asp:ListItem>Maharashtra</asp:ListItem>
                                        <asp:ListItem>Manipur</asp:ListItem>
                                        <asp:ListItem>Meghalaya</asp:ListItem>
                                        <asp:ListItem>Mizoram</asp:ListItem>
                                        <asp:ListItem>Nagaland</asp:ListItem>
                                        <asp:ListItem>Odissa</asp:ListItem>
                                        <asp:ListItem>Pondicherry</asp:ListItem>
                                        <asp:ListItem>Punjab</asp:ListItem>
                                        <asp:ListItem>Rajasthan</asp:ListItem>
                                        <asp:ListItem>Sikkim</asp:ListItem>
                                        <asp:ListItem>Tamil Nadu</asp:ListItem>
                                        <asp:ListItem>Telangana</asp:ListItem>
                                        <asp:ListItem>Tripura</asp:ListItem>
                                        <asp:ListItem>Uttarakhand</asp:ListItem>
                                        <asp:ListItem>Uttaranchal</asp:ListItem>
                                        <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                        <asp:ListItem>West Bengal</asp:ListItem>                                                                    
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorState" runat="server" ErrorMessage="*State is required" ControlToValidate="ddl_state" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_city" CssClass="form-control" runat="server" placeholder="Enter City" TextMode="SingleLine" ControlToValidate="txt_city" EnableTheming="True"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorCity" runat="server" ErrorMessage="*Should contain only alphabets" ControlToValidate="txt_city" ValidationExpression="^[A-Za-z]+$" ForeColor="#FF3300" Display="Dynamic"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" ErrorMessage="*City is required" ForeColor="#FF3300" ControlToValidate="txt_city" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pin code</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_pin" CssClass="form-control" runat="server" placeholder="Enter Pin code" TextMode="Number" ControlToValidate="txt_pin" EnableTheming="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPin" runat="server" ErrorMessage="*Pin code is required" ForeColor="#FF3300" ControlToValidate="txt_pin" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPin" runat="server" ErrorMessage="*Should contain only 6 digits" ControlToValidate="txt_pin" ValidationExpression="^[0-9]{6}" ForeColor="#FF3300" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label>Residential Address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_address" CssClass="form-control" runat="server" placeholder="Enter Address" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAddress" runat="server" ErrorMessage="*Address is required" ControlToValidate="txt_address" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div><br /> 
                        <div class="row">
                            <div class="col">
                                <center>
                                    <span class="badge badge-pill badge-success">Login Credentials</span>
                                </center>
                            </div>
                        </div><br />                                
                        <div class="row">
                            <div class="col-md-4">
                                <label>User ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_userid" CssClass="form-control" runat="server" placeholder="Create an User ID" ReadOnly="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserid" runat="server" ErrorMessage="*User ID is required" ControlToValidate="txt_userid" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Old Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_userpass" CssClass="form-control" runat="server" placeholder="Current Password" ReadOnly="True"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorUserpass" runat="server" ErrorMessage="*Password is required" ControlToValidate="txt_userpass" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>New Password</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_newpass" CssClass="form-control" runat="server" placeholder="Create a new password" ></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorNewpass" runat="server" ErrorMessage="*Password is required" ControlToValidate="txt_newpass" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">                             
                                <div class="form-group">
                                    <center>
                                    <asp:Button ID="Btn_update" class="btn btn-info btn-primary" runat="server" Text="Update" OnClick="Btn_update_Click" />
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="images/Book-icon.png" width="100px"/>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                   <br /> <h5>Issued Books</h5>
                                    <asp:Label class="badge badge-pill badge-info" runat="server" Text="Books info"></asp:Label>
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

                                <asp:GridView ID="GridViewBooks" class="table table-striped table-bordered" runat="server" OnRowDataBound="GridViewBooks_RowDataBound"></asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="Homepage.aspx" style="color:black"><< Home</a><br /><br />
    </div>
</asp:Content>

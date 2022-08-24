<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs" Inherits="eLibraryWebpage.AdminMemberManagement" %>

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
                                   <br /> <h5>Member details</h5>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="images/UserIcon.png" width="100px"/>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txt_mID" CssClass="form-control" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary mr-2" ID="Btn_mId" runat="server" Text="Member ID" OnClick="Btn_mId_Click"><i class="fa-solid fa-square-check"></i></asp:LinkButton>
                                        <%--<asp:RequiredFieldValidator ID="Required_mId" runat="server" ErrorMessage="*Member's ID is required" ControlToValidate="txt_mID" ForeColor="#FF3300"></asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_mName" CssClass="form-control" runat="server" placeholder="Member Name" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Account status</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txt_aStatus" CssClass="form-control" runat="server" placeholder="Status" ReadOnly="true"></asp:TextBox>
                                        <asp:LinkButton ID="Btn_active" class="btn btn-success mr-1" runat="server" Text="A" OnClick="Btn_active_Click"><i class="fa-solid fa-square-check"></i></asp:LinkButton>
                                        <asp:LinkButton ID="Btn_pending" class="btn btn-warning mr-1" runat="server" Text="P" OnClick="Btn_pending_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton ID="Btn_inactive" class="btn btn-danger" runat="server" Text="I" OnClick="Btn_inactive_Click"><i class="fa-solid fa-square-xmark"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <label>DOB</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_memDob" CssClass="form-control" runat="server" placeholder="dd/mm/yyyy" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Contact No.</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_memContact" CssClass="form-control" runat="server" placeholder="Contact number" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label>Email ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_memEmail" CssClass="form-control" runat="server" placeholder="Email address" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_memState" CssClass="form-control" runat="server" placeholder="State" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>City</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_memCity" CssClass="form-control" runat="server" placeholder="City" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Pin Code</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_memPin" CssClass="form-control" runat="server" placeholder="Pin Code" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label>Full Postal address</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_memAddress" CssClass="form-control" runat="server" placeholder="Address" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <div class="form-group">
                                    <center>
                                    <asp:Button ID="Btn_delete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete member" OnClick="Btn_delete_Click" />
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
                           <h5>List of Members</h5>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="GridViewMemsList" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Id" ReadOnly="True" SortExpression="member_id" />
                                        <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact number" SortExpression="contact_no" />
                                        <asp:BoundField DataField="account_status" HeaderText="Account status" SortExpression="account_status" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="Homepage.aspx" style="color: black"><< Home</a><br />
        <br />
    </div>
</asp:Content>

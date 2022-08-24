<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminAuthorManagement.aspx.cs" Inherits="eLibraryWebpage.AdminAuthorManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
   </script>

    <style type="text/css">
        .auto-style1 {
            position: relative;
            width: 100%;
            -ms-flex-preferred-size: 0;
            flex-basis: 0;
            -ms-flex-positive: 1;
            flex-grow: 1;
            max-width: 100%;
            left: 1px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                   <br /> <h5>Author Details</h5>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="images/Author-Icon.png" width="100px"/>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Author ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txt_aId" CssClass="form-control" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button ID="Btn_aGo" class="btn btn-dark" runat="server" Text="Find" OnClick="Btn_aGo_Click" />
                                        <%--<asp:RequiredFieldValidator ID="Required_aId" runat="server" ErrorMessage="*Author's ID is required" ControlToValidate="txt_aId" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_aName" CssClass="form-control" runat="server" placeholder="Author Name"></asp:TextBox>
<%--                                    <asp:RequiredFieldValidator ID="Required_aName" runat="server" ErrorMessage="*Author's Name is required" ControlToValidate="txt_aName" ForeColor="#FF3300"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <center>
                                    <asp:Button ID="Btn_add" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Btn_add_Click" />
                                    </center>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <center>
                                    <asp:Button ID="Btn_update" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Btn_update_Click" />
                                    </center>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <center>
                                    <asp:Button ID="Btn_delete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Btn_delete_Click" />
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
                                   <h5>List of authors</h5>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="auto-style1">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [author_master_tbl]"></asp:SqlDataSource>

                                <asp:GridView ID="GridViewAuthorsList" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id" />
                                        <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
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

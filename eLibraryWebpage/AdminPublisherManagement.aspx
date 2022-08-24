<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminPublisherManagement.aspx.cs" Inherits="eLibraryWebpage.AdminPublisherManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
      $(document).ready(function () {
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
      });
   </script>

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
                                   <br /> <h5>Publisher Details</h5>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="images/Publisher-Icon.png" width="100px"/>
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
                                <label>ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                    <asp:TextBox ID="txt_pId" CssClass="form-control" runat="server" placeholder="ID" ></asp:TextBox>
                                    <asp:Button ID="Btn_pGo" class="btn btn-dark" runat="server" Text="Find" OnClick="Btn_pGo_Click" />
                                    <%--<asp:RequiredFieldValidator ID="Required_pId" runat="server" ErrorMessage="*Publisher's ID is required" ControlToValidate="txt_pId" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                        </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_pName" CssClass="form-control" runat="server" placeholder="Publisher Name"></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="Required_pName" runat="server" ErrorMessage="*Publisher's Name is required" ControlToValidate="txt_pName" ForeColor="#FF3300"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">                             
                                <div class="form-group">
                                    <center>
                                    <asp:Button ID="Btn_add" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Btn_add_Click1" />
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
                                   <h5>List of Publishers</h5>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [publisher_master_tbl]"></asp:SqlDataSource>
                                <asp:GridView ID="GridViewPublisherList" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="publisher_id" HeaderText="publisher_id" ReadOnly="True" SortExpression="publisher_id" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="Homepage.aspx" style="color:black"><< Home</a><br /><br />
    </div>

</asp:Content>

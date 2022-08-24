<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewBooks.aspx.cs" Inherits="eLibraryWebpage.ViewBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <center>
                    <br />
                    <h5>Book Inventory</h5>
                </center>
                <div class="row">
                    <div class="col-sm-12 col-md-12" >
                        <asp:Panel ID="Panel1" class="alert alert-success" role="alert" runat="server" Visible="false">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </asp:Panel>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_master_tbl]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="GridViewBookInv" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" />
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                                                                </div>
                                                            </div><br />
                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Author -
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>' Font-Size="Smaller"></asp:Label>
                                                                    &nbsp;| Genre -
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>' Font-Size="Smaller"></asp:Label>
                                                                    &nbsp;| Language -
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>' Font-Size="Smaller"></asp:Label>
                                                                    &nbsp;| Publisher -
                                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Smaller" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                    &nbsp;| Published on -
                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Smaller" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Edition -
                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="Smaller" Text='<%# Eval("edition") %>'></asp:Label>
                                                                    &nbsp;| Pages -
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Smaller" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                    &nbsp;| Cost -
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Smaller" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                    &nbsp;| Actual stock -
                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Smaller" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                    &nbsp;| Available -
                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Smaller" Text='<%# Eval("current_stock") %>'></asp:Label>

                                                                </div>
                                                            </div><br />
                                                            <div class="row">
                                                                <div class="col-12">

                                                                    Book description -
                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium" Text='<%# Eval("book_description") %>'></asp:Label>

                                                                </div>
                                                            </div><br />
                                                            <%--<div class="row">
                                                                <div class="col-12">

                                                                </div>
                                                            </div>--%>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <asp:Image class="image-fluid" height="150px" Width="100px" ID="Image1" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <center>
                <a href="home.aspx"><< Home</a><span class="clearfix"></span>
                <br />
            </center>
        </div>
    </div>

</asp:Content>

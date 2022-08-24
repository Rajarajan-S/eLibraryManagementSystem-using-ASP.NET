<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookInventory.aspx.cs" Inherits="eLibraryWebpage.AdminBookInventory" %>

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

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                           <h4>Book Details</h4>
                        </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                           <img height="100px" width="100px" src="images/Book-icon.png" id="imgview" />
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
                                <asp:FileUpload class="form-control" onchange="readURL(this);" ID="BookCover" runat="server" />
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="txt_bID" runat="server" placeholder="Book ID"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary" ID="btn_bID" runat="server" OnClick="btn_bID_Click"><i class="fa-solid fa-square-check"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_bName" runat="server" placeholder="Book Name"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Tamil" Value="Tamil" />
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Hindi" Value="Hindi" />
                                        <asp:ListItem Text="Telugu" Value="Telugu" />
                                        <asp:ListItem Text="Kannada" Value="Kannada" />
                                        <asp:ListItem Text="Malayalam" Value="Malayalam" />
                                        <asp:ListItem Text="Urdu" Value="Urdu" />
                                        <asp:ListItem Text="Arabic" Value="Arabic" />
                                    </asp:DropDownList>
                                </div>
                                <label>Publisher</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="ddl_publisher" runat="server">
                                        <asp:ListItem Text="Vikatan" Value="Vikatan" />
                                        <asp:ListItem Text="BlueRose Publishers" Value="BlueRose Publishers" />
                                        <asp:ListItem Text="Pratham Books" Value="Pratham Books" />
                                        <asp:ListItem Text="Amaltaas Publications" Value="Amaltaas Publications" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Author Name</label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="ddl_authors" runat="server">
                                        <asp:ListItem Text="kalki" Value="kalki" />
                                        <asp:ListItem Text="Oscar Wilde" Value="Oscar Wilde" />
                                        <asp:ListItem Text="Premchand" Value="Premchand" />
                                        <asp:ListItem Text="Rabee Jaber" Value="Rabee Jaber" />
                                    </asp:DropDownList>
                                </div>
                                <label>Date of Publication</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_dop" runat="server" placeholder="Date" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Genre</label>
                                <div class="form-group">
                                    <asp:ListBox CssClass="form-control" ID="lb_genre" runat="server" SelectionMode="Multiple" Rows="5">
                                        <asp:ListItem Text="Action" Value="Action" />
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Comic" Value="Comic Book" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />
                                        <asp:ListItem Text="Health and wellness" Value="Health and wellness" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="Horror" Value="Horror" />
                                        <asp:ListItem Text="Poetry" Value="Poetry" />
                                        <asp:ListItem Text="Personal Development" Value="Personal Development" />
                                        <asp:ListItem Text="Romance" Value="Romance" />
                                        <asp:ListItem Text="Science Fiction" Value="Science Fiction" />
                                        <asp:ListItem Text="Suspense" Value="Suspense" />
                                        <asp:ListItem Text="Thriller" Value="Thriller" />
                                        <asp:ListItem Text="Art" Value="Art" />
                                        <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                        <asp:ListItem Text="Encyclopedia" Value="Encyclopedia" />
                                        <asp:ListItem Text="History" Value="History" />
                                        <asp:ListItem Text="Math" Value="Math" />
                                        <asp:ListItem Text="Textbook" Value="Textbook" />
                                        <asp:ListItem Text="Travel" Value="Travel" />
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Edition</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_edition" runat="server" placeholder="Edition"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Cost (in Rs)</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_cost" runat="server" placeholder="Cost per book" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Total Pages</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_pages" runat="server" placeholder="Pages" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <label>Actual Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_aStock" runat="server" placeholder="Actual Stock" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Current Stock</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_cStock" runat="server" placeholder="Current Stock" TextMode="Number" ReadOnly="False"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label>Issued Books</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_issuedBooks" runat="server" placeholder="Issued books" TextMode="Number" ReadOnly="False"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <label>Book Description</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="txt_desc" runat="server" placeholder="Description of Book" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="btn_add" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="btn_add_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btn_update" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="btn_update_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="btn_delete" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="btn_delete_Click" />
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
                           <h4>Book Inventory List</h4>
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
        </div>
        <a href="Homepage.aspx" style="color: black"><< Home</a><br />
    </div>
</asp:Content>

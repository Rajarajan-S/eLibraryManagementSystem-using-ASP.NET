<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookIssue.aspx.cs" Inherits="eLibraryWebpage.AdminBookIssue" %>

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
                                   <br /> <h5>Issue Books</h5>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                    <img src="images/Book-Icon.png" width="100px"/>
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
                                <label>Member ID</label>
                                <div class="form-group">                                   
                                    <asp:TextBox ID="txt_memId" CssClass="form-control" runat="server" placeholder="Member ID" ></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="Required_memId" runat="server" ErrorMessage="*Member's ID is required" ControlToValidate="txt_memId" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>--%>                                   
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="txt_bID" CssClass="form-control" runat="server" placeholder="ID"></asp:TextBox>
                                        <asp:Button ID="Btn_bookid" class="btn btn-dark" runat="server" Text="Find" OnClick="Btn_bookid_Click" />
                                        <%--<asp:RequiredFieldValidator ID="Required_bId" runat="server" ErrorMessage="*Book's ID is required" ControlToValidate="txt_bID" ForeColor="#FF3300"></asp:RequiredFieldValidator>--%>
                                    </div>                              
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member Name</label>
                                <div class="form-group">                                   
                                    <asp:TextBox ID="txt_memName" CssClass="form-control" runat="server" placeholder="Member name" ReadOnly="True" ></asp:TextBox>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorMemName" runat="server" ErrorMessage="*Member's name is required" ControlToValidate="txt_memName" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>--%>                                   
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book Name</label>
                                <div class="form-group">                                   
                                    <asp:TextBox ID="txt_bookName" CssClass="form-control" runat="server" placeholder="Book name" ReadOnly="True"></asp:TextBox>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBookName" runat="server" ErrorMessage="*Book's name is required" ControlToValidate="txt_bookName" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>                                   --%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                Issue
                                <label>&nbsp;date</label>
                                <div class="form-group">                                   
                                    <asp:TextBox ID="txt_startDate" CssClass="form-control" runat="server" TextMode="Date" ></asp:TextBox>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSDate" runat="server" ErrorMessage="*Start date is required" ControlToValidate="txt_startDate" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>                                   --%>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Due date</label>
                                <div class="form-group">                                   
                                    <asp:TextBox ID="txt_endtDate" CssClass="form-control" runat="server" TextMode="Date" ></asp:TextBox>
<%--                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEDate" runat="server" ErrorMessage="*End date is required" ControlToValidate="txt_endtDate" ForeColor="#FF3300" Display="Dynamic"></asp:RequiredFieldValidator>                                   --%>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">                             
                                <div class="form-group">
                                    <center>
                                    <asp:Button ID="Btn_issue" class="btn btn-lg btn-block btn-success" runat="server" Text="Issue" OnClick="Btn_issue_Click" />
                                    </center>
                                </div>
                            </div>
                            <div class="col-md-6">                             
                                <div class="form-group">
                                    <center>
                                    <asp:Button ID="Btn_return" class="btn btn-lg btn-block btn-primary" runat="server" Text="Return" OnClick="Btn_return_Click" />
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
                                   <h5>List of Issued books</h5>
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_tbl]"></asp:SqlDataSource>
                                <asp:GridView ID="GridViewIssuedBooksList" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridViewIssuedBooksList_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="Name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="Title" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="Date of issue" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="Due date" SortExpression="due_date" />
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

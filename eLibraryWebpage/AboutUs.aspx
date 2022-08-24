<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="eLibraryWebpage.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: medium;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <center>
                    <h2>About Us</h2>
                </center>
            </div>
        </div>
        <div class="row" style="padding: 30px">
            <div class="col-12">
                <p style="text-align: justify">
                    &nbsp; &nbsp; &nbsp; The Anna Centenary Library (ACL), a state-of the-art library was inaugurated on September 15, 2010 on the occasion of the 102nd birth anniversary of the former Chief Minister of Tamil Nadu Dr. C N Annadurai popularly called ‘ANNA’. By reason of his great interest towards the books and library, this library is named as ‘Anna Centenary Library’. The foundation stone laid on August 16, 2008, completed in a short span and declared open to the public from 20th September 2010.
The built up area of this centralized air-conditioned library is 3.75 lakh sq. ft., encompasses ground and eight floors. At present, it hosts five lakhs books covering wide range of subjects to serve the information needs of the public, academic and corporate community. Our Library has a Braille Section, Own Books Reading Section, Children Section, Periodicals and Newspapers Section, Tamil books Section, English Books Section and Digital Library. In addition, the library has a Conference Hall that can facilitate 150 members.
                </p>
            </div>
        </div>
        <div class="row" style="padding: 30px">
            <div class="col-6">
                <center>
                    <table align="center" border="1" bordercolor="white" bgcolor="#006699" cellpadding="0" cellspacing="0" style="width: 100%; height:100%; color:white; font-weight:100">
                        <tbody>
                        <tr>
                            <th>
                                <span style="font-size: medium;">&nbsp; Location </span>
                            </th>
                            <th>
                                <span style="font-size: medium;">&nbsp; Kotturpuram, Chennai</span>
                            </th>
                        </tr>
                            <tr>
                                <th>
                                <span style="font-size: medium;">&nbsp; Area</span>
                            </th>
                            <th>
                                <span style="font-size: medium;">&nbsp; 8 acres</span></th>
                        </tr>
                            <tr>
                            <th>
                                <span style="font-size: medium;">&nbsp; Floors </span>
                            </th>
                            <th>
                                <span style="font-size: medium;">&nbsp; 9 (8 + Ground) </span>
                            </th>
                        </tr>
                            <tr>   
                            <th>
                                <span style="font-size: medium;">&nbsp; Books </span>
                            </th>
                            <th>
                                <span style="font-size: medium;">&nbsp; 5 Lakhs+</span></th>
                        </tr>
                            <tr>
                            <th>
                                <span style="font-size: medium;">&nbsp; Capacity </span>
                            </th>
                            <th>
                                <span style="font-size: medium;">&nbsp; 1500 people</span></th>
                        </tr>
                        </tbody>
                    </table>
                </center>
            </div>
            <div class="col-6">
                <img src="images/AboutUs-img.jpg" width="700px"/>
            </div>
        </div>
    </div>
</asp:Content>

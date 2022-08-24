<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="eLibraryWebpage.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <center>
                    <h2>Contact Us</h2>
                </center>
            </div>
        </div>
        <div class="row" style="padding: 30px">
            <div class="col-6">
                <center>
                    <h5 style="text-align:left">Address</h5>
                        <p style="text-align: left;margin : 0; padding-top:0;">Anna Centenary Library,</p>
                        <p style="text-align: left;margin : 0; padding-top:0;">Kotturpuram, Chennai - 600025.</p>
                        <p style="text-align: left;margin : 0; padding-top:0;">Phone Number : 04422201011</p>
                        <p style="text-align: left;margin : 0; padding-top:0;">Email : clbrnaclchn.dopl@tn.gov.in</p>
                </center>
                <br />
                <center>
                    <h5 style="text-align:left">Working Hours</h5>
                    <p style="text-align: left;margin : 0; padding-top:0;">Own book reading section: 8 AM to 9 PM.</p>
                    <p style="text-align: left;margin : 0; padding-top:0;">Other sections: 9 AM to 8 PM.</p>
                </center>
                <br />
                <center>
                    <h5 style="text-align:left">Follow us on Social Networks</h5><br />
                    <div style="position:absolute;">
                         <a href="https://www.facebook.com/ACLChennai/"  class="fa-brands fa-facebook fa-5x" style="color:#243c64;"></a>&nbsp;
                        <a href="https://www.youtube.com/channel/UCbyj57dSX1DVXDuGduXGrQg" class="fa-brands fa-youtube fa-5x" style="color:red;"></a>&nbsp;
                        <a href="https://twitter.com/ACLChennai?s=20&t=0uGtPFqUsFFfcG-7zQpV8g" class="fa-brands fa-twitter fa-5x" style="color:#00acee;"></a>&nbsp;
                    </div>
                </center>
            </div>
            <div class="col-6">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3887.291269111248!2d80.23776881461247!3d13.017114590826106!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a526772eb0d4451%3A0xcfc3c35cdd3a47d3!2sAnna%20Centenary%20Library!5e0!3m2!1sen!2sin!4v1661255225584!5m2!1sen!2sin" width="600" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
    </div>
</asp:Content>

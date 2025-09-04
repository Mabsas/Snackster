<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Snackster.User.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script>
    // For disappearing alert message
    window.onload = function () {
        var seconds = 5;
        setTimeout(function () {
            var lbl = document.getElementById("<%=lblMsg.ClientID%>");
            if (lbl) lbl.style.display = "none";
        }, seconds * 1000);
    }

    function ImagePreview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#<%=imgUser.ClientID%>").prop('src', e.target.result)
                    .width(200)
                    .height(200);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
    .form-control {
        width: 100%;
        height: 45px;
        font-size: 16px;
        padding: 10px 12px;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
    }
    textarea.form-control { height: 80px !important; resize: vertical; }
    .validator { font-size: 14px; margin-top: 4px; display: block; }
</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section class="book_section layout_padding">
    <div class="container">
        <div class="heading_container">
            <div class="align-self-end">
                <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
            </div>
            <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="form_container">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Full Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" ForeColor="Red" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUserNameRequired" runat="server" ControlToValidate="txtUserName" ErrorMessage="Username is required" ForeColor="Red" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmailRequired" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Number" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile No. required" ForeColor="Red" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile No must have 11 digits only" ValidationExpression="^[0-9]{11}$" ForeColor="Red" Display="Dynamic" CssClass="validator"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form_container">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required" ForeColor="Red" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control" placeholder="Enter Post/Zip Code" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPostCode" runat="server" ControlToValidate="txtPostCode" ErrorMessage="Post/Zip Code is required" ForeColor="Red" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="User Image" onchange="ImagePreview(this);" />

                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ForeColor="Red" CssClass="validator" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row pl-4 mt-3">
                <div class="btn_box">
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnRegister_Click"/>
                    <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100" Text="Already registered? <a href='Login.aspx' class='badge badge-info'>Login here..</a>"></asp:Label>
                </div>
            </div>

            <div class="row p-5 text-center">
                <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
            </div>
        </div>
    </div>
</section>
</asp:Content>

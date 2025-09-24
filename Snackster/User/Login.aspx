<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Snackster.User.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        // For disappearing alert message
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                var lbl = document.getElementById("<%=lblMsg.ClientID%>");
                if (lbl) lbl.style.display = "none";
            }, seconds * 1000);
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <section class="book_section layout_padding ">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
                <h2>Login</h2>
            </div>
            <div class="row">
                <!-- Left column: image -->
                <div class="col-md-6 d-flex justify-content-center align-items-center">
                    <div class="form_container text-center">
                        <img id="userLogin" src="../Images/login.png" alt="" class="img-thumbnail" />
                    </div>
                </div>

                <!-- Right column: form -->
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Italic="true" Font-Size="Small"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username" ></asp:TextBox>
                        </div>
                        <div class="mt-3">
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" Font-Italic="true" Font-Size="Small" ></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password" ></asp:TextBox>
                        </div>
                        <div class="btn_bok mt-3">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-success rounded-pill px-4 text-white"
                                OnClick="btnLogin_Click" />
                            <span class="pl-3 text-info">New User? 
                    <a href="Registration.aspx" class="badge badge-info">Register Here....</a>
                            </span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
</asp:Content>

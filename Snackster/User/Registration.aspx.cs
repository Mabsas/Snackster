using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Snackster.User
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null) //&& Session["userId"] != null
                {
                    getUserDetails();
                }
                else if (Session["userId"] != null)
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty;
            string imagePath = string.Empty;
            string fileExtension = string.Empty;
            bool isValidToExecute = false;

            int userId = 0;
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                int.TryParse(Request.QueryString["id"], out userId);
            }

            actionName = (userId == 0) ? "INSERT" : "UPDATE";

            using (con = new SqlConnection(Connection.GetConnectionString()))
            {
                using (cmd = new SqlCommand("User_Crud", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Action", actionName);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Username", txtUserName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                    cmd.Parameters.AddWithValue("@PostCode", txtPostCode.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());

                    // Handle image upload
                    if (fuUserImage.HasFile)
                    {
                        fileExtension = Path.GetExtension(fuUserImage.FileName).ToLower();
                        if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png")
                        {
                            string uniqueFileName = Guid.NewGuid().ToString() + fileExtension;
                            imagePath = "~/Images/User/" + uniqueFileName;
                            fuUserImage.SaveAs(Server.MapPath(imagePath));
                            cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                        }
                        else
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Please select a valid image (.jpg, .jpeg, .png)";
                            lblMsg.CssClass = "alert alert-danger";
                            return;
                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@ImageUrl", DBNull.Value);
                    }

                    isValidToExecute = true;

                    if (isValidToExecute)
                    {
                        try
                        {
                            con.Open();
                            cmd.ExecuteNonQuery();

                            if (userId == 0)
                                lblMsg.Text = "Registration successful! <b><a href='Login.aspx'>Click here</a></b> to login.";
                            else
                                lblMsg.Text = "Details updated successfully! <b><a href='Profile.aspx'>Check here</a></b>.";

                            lblMsg.Visible = true;
                            lblMsg.CssClass = "alert alert-success";

                            if (userId != 0)
                                Response.AddHeader("REFRESH", "1;URL=Profile.aspx");

                            ClearFields();
                        }
                        catch (SqlException ex)
                        {
                            if (ex.Message.Contains("Violation of UNIQUE KEY constraint"))
                            {
                                lblMsg.Visible = true;
                                lblMsg.Text = "<b>" + txtUserName.Text.Trim() + "</b> username already exists, try a new one!";
                                lblMsg.CssClass = "alert alert-danger";
                            }
                            else
                            {
                                lblMsg.Visible = true;
                                lblMsg.Text = "SQL Error: " + ex.Message;
                                lblMsg.CssClass = "alert alert-danger";
                            }
                        }
                        catch (Exception ex)
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "Error: " + ex.Message;
                            lblMsg.CssClass = "alert alert-danger";
                        }
                        finally
                        {
                            con.Close();
                        }
                    }
                }
            }
        }

        private void getUserDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("User_Crud", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
            cmd.Parameters.AddWithValue("@UserId", Request.QueryString["id"]);

            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count == 1)
            {
                txtName.Text = dt.Rows[0]["Name"].ToString();
                txtUserName.Text = dt.Rows[0]["Username"].ToString();
                txtMobile.Text = dt.Rows[0]["Mobile"].ToString();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                txtPostCode.Text = dt.Rows[0]["PostCode"].ToString();

                imgUser.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString())
                    ? "~/Images/No_image.png"
                    : dt.Rows[0]["ImageUrl"].ToString();
                imgUser.Height = 200;
                imgUser.Width = 200;

                txtPassword.TextMode = TextBoxMode.SingleLine;
                txtPassword.ReadOnly = true;
                txtPassword.Text = dt.Rows[0]["Password"].ToString();

                lblHeaderMsg.Text = "<h2>Edit Profile</h2>";
                btnRegister.Text = "Update";
                lblAlreadyUser.Text = "";
            }
        }

        private void ClearFields()
        {
            txtName.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtMobile.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtPostCode.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }
    }
}

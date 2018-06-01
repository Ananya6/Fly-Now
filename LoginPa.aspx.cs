using System;
using System.Data;
using System.Web.UI;

public partial class LoginPa : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string qtruery = "select Cid,CountryName from CountryMaster where Active=1";
        DataSet ds = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(qtruery);
        ddlCtry.DataSource = ds;
        ddlCtry.DataTextField = "CountryName";
        ddlCtry.DataValueField = "CId";
        ddlCtry.DataBind();
    }
    
    protected void BtnSignUp_Click(object sender, EventArgs e)
    {
        lblPh.Visible = false;
        lblPwd.Visible = false;
        lblSignUpDup.Visible = false;
        if (txtPwd.Text.Length < 6)
        {
            lblPwd.Visible = true;
            lblPwd.Text = "Please Enter Atleast 6 Characters";
        }
        else if (txtPhone.Text.Length != 10)
        {
            lblPh.Visible = true;
            lblPh.Text = "Please enter a valid Phone Number";
        }
        else
        {
            string fname = txtFName.Text;
            string lname = txtLName.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;
            string pwd = txtPwd.Text;
            string cy = ddlCtry.SelectedItem.Text;
            string g= rbGender.SelectedItem.Value;
            string sqry = "select count(email) from UserAccount where email='"+email+"'";
            int val = Execute_Utility.Command_Execute_Utility.obj.ExecuteScalarQuery(sqry);
            if (val < 0)
            {
                lblSignUpDup.Visible = true;
                lblSignUpDup.Text = "This Email Id already exists";
            }
            else { 
            string qtruer = "Insert into useraccount(FirstName,LastName,Email,PhoneNo,Password,Country,Gender) values('" + fname + "','" + lname + "','" + email + "','" + phone + "','" + pwd + "','"+cy+"','"+g+"')";
            int valtrue = Execute_Utility.Command_Execute_Utility.obj.ExecuteNonQuery_Method(qtruer);
            if (valtrue == 1)
            { 
                lblSignUp.Text = "Account created successfully!";
                    Panel1.Visible = false;
                    Panel2.Visible = true;
            }
            }
        }
    }

    protected void BtnSignIn_Click(object sender, EventArgs e)
    {
        string email = txtEmailI.Text;
        string pwd = txtPwdI.Text;
        string qtrue = "select UserId,FirstName,email,password from useraccount where email='" + email + "' and password='" + pwd + "'";
        DataSet ds = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(qtrue);
            if (ds.Tables[0].Rows.Count == 0)
                lblSignIn.Text = "Email or UserName is incorrect";
            else
            {
                string uid=ds.Tables[0].Rows[0]["UserId"].ToString();
                string fname= ds.Tables[0].Rows[0]["FirstName"].ToString();
                Session["User"] = uid+"$"+fname;
            }
            
            if (Session["backtofly"]!= null)
            {
                Session["backtofly"] = null;
                Response.Redirect("FlightsRedirect.aspx");
                
            }
            else if (Session["frommyflights"]!=null)
        {
            Session["frommyflights"] = null;
            Response.Redirect("MyFlights.aspx");
        }
            else
        {
                Response.Redirect("main.aspx");
            }
        
        
    }
    protected void newuser(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel1.Visible = true;
    }
}
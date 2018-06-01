using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Providers.Entities;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPageA : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            string[] sLogin = Session["User"].ToString().Trim().Split(new char[] { '$' });
            LkBtn.Text = "Hello " +sLogin[1].ToString();
            LkBtnOut.Visible = true;
        }
    }

    protected void LkBtn_Click(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            LkBtnOut.Visible = false;
            Response.Redirect("LoginPa.aspx");
        }
        

    }

    protected void LkBtnOut_Click(object sender, EventArgs e)
    {
        Session["User"] = null;
        Response.Redirect("main.aspx");
    }
}

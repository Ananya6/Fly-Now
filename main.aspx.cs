using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TxtDate_CalendarExtender.StartDate = DateTime.Now;
        string fqtruery = "select Id,NameOfCity from DestinationMaster where Active=1";
        DataSet ds = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(fqtruery);
        DdlFrom.DataSource = ds;
        DdlFrom.DataTextField = "NameOfCity";
        DdlFrom.DataValueField = "Id";
        DdlFrom.DataBind();
        DdlTo.DataSource = ds;
        DdlTo.DataTextField = "NameOfCity";
        DdlTo.DataValueField = "Id";
        DdlTo.DataBind();
    }

    private string From;
    public string GetF
    {
        get
        {
            return From;
        }
        set
        {
            From = value;
        }
    }



    public int MyProperty { get; set; }


    public string GetDate
    {
        get
        {
            return TxtDate.Text;
        }
    }
    public string GetTextF
    {
        get
        {
            string a = DdlFrom.SelectedItem.Text;
            return a;
        }
    }
    public string GetTextT
    {
        get
        {
            string b = DdlTo.SelectedItem.Text;
            return b;
        }
    }
    public string GetT
    {
        get
        {
            string t = DdlTo.SelectedItem.Value;
            return t;
        }
    }
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        lblSameCity.Visible = false;
        setvaltrue();
        if (DdlFrom.SelectedItem.Value == DdlTo.SelectedItem.Value)
        {
            lblSameCity.Visible = true;
            lblSameCity.Text = "Destination and Origin can't be same";
        }
        else
        {
            GetF = DdlFrom.SelectedItem.Value;
            //HttpContext.Current.Server.ansfer("FlightsRedirect.aspx");
            Session["Date"] = TxtDate.Text;
            Session["From"] = DdlFrom.SelectedItem.Text.ToString()+"$"+DdlFrom.SelectedValue.ToString();
            Session["To"] = DdlTo.SelectedItem.Text.ToString() + "$" + DdlTo.SelectedItem.Value;
            Response.Redirect ("FlightsRedirect.aspx");
            //Server.ansfer("FlightsRedirect.aspx");
            /*string fr = DdlFrom.SelectedItem.Valtrue;
            Session["Date"] = TxtDate.Text;
            Session["From"] = DdlFrom.SelectedItem.Valtrue;
            Session["To"] = DdlTo.SelectedItem.Valtrue;

            Response.Redirect("FlightsRedirect.aspx");*/

        }
    }

    public void setvaltrue()
    {
        GetF = DdlFrom.SelectedItem.Value;
        string d = GetF;
    }

}
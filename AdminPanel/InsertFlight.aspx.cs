using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InsertFly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            filldata();
       

    }
    void filldata()
    {
        string sQtruery = @"select Id,Nameofcity from DestinationMaster where active=1";
        DataSet ds = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(sQtruery);
        DdlFrom.DataSource = ds;
        DdlFrom.DataTextField = "Nameofcity";
        DdlFrom.DataValueField = "Id";
        DdlFrom.DataBind();
        DataSet dt = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(sQtruery);
        DdlTo.DataSource = dt;
        DdlTo.DataTextField = "NameOfCity";
        DdlTo.DataValueField = "Id";
        DdlTo.DataBind();
        string qu = "select AirlineId,Name from AirlineMaster where Active=1";
        DataSet dm = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(qu);
        DdlAir.DataSource = dm;
        DdlAir.DataTextField = "Name";
        DdlAir.DataValueField = "AirlineId";
        DdlAir.DataBind();

    }


    protected void BtnSubmitfly_Click(object sender, EventArgs e)
    {
        
        if (DdlTo.SelectedItem.Value == DdlFrom.SelectedItem.Value)
        {
            DdlTo.SelectedItem.Value = null;
            LblError.Text = "Departure and Destination can't be same";
        }
        //DateTime depart = DateTime.ParseExact(TxtDepart.Text,"HH:mm", System.Globalization.CultureInfo.InvariantCulture);
        //DateTime arrival = DateTime.ParseExact(TxtArr.Text, "HH:mm", System.Globalization.CultureInfo.InvariantCulture);
        else
        {
            string to = DdlTo.SelectedItem.Value;
            string from = DdlFrom.SelectedItem.Value;
            string depart = TxtDepart.Text;
            string arrival = TxtArr.Text;
           // DateTime date = DateTime.Parse(TxtDate.Text);
            string price = TxtPrice.Text;
            string airline = DdlAir.SelectedItem.Value;
            string Qtruery = "insert into flights(FromCity,ToCity,Airline,Departure,Arrival,Price) values('" + from + "','" + to + "','" + airline + "','" + depart + "','" + arrival + "','" + price + "')";
            int Val = Execute_Utility.Command_Execute_Utility.obj.ExecuteNonQuery_Method(Qtruery);
            if (Val == 1)
            {
                DdlFrom.SelectedIndex=0;
                DdlTo.SelectedIndex=0;
            }
        }
        //string arrival
        ///DateTime arrival = Txt
        ///System
    }
}
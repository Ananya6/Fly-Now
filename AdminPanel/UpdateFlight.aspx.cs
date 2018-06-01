using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateFly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnFlySearch_Click(object sender, EventArgs e)
    {
        String Iden = String.IsNullOrEmpty(TxtFId.Text) == true ? "%" : "%" + TxtFId.Text + "%";
        String Squery = "select * from Flights where FlightId like '" + Iden + "'";
        DataSet da = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(Squery);
        if (da != null && da.Tables != null && da.Tables[0].Rows.Count > 0)
        {
            grida.DataSource = da;
            grida.DataBind();
        }
    }

    protected void grida_row(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            String sqr = "select Id,NameOfCity from DestinationMaster where Active=1";
            DataSet ds = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(sqr);
            DdlFromU.DataSource = ds;
            DdlFromU.DataTextField = "NameOfCity";
            DdlFromU.DataValueField = "Id";
            DdlFromU.DataBind();
            DataSet dm = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(sqr);
            DdlToU.DataSource = dm;
            DdlToU.DataTextField = "NameOfCity";
            DdlToU.DataValueField = "Id";
            DdlToU.DataBind();
            String sqa = "select AirlineId, Name from AirlineMaster where Active=1";
            DataSet dx = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(sqa);
            DdlAirU.DataSource = dx;
            DdlAirU.DataTextField = "Name";
            DdlAirU.DataValueField = "AirlineId";
            DdlAirU.DataBind();

            // Convert the row index stored in the CommandArgument
            // property to an Integer.
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grida.Rows[index];
            String strQuery = "select * from Flights";
            DataSet da = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(strQuery);

            DdlFromU.SelectedItem.Value = da.Tables[0].Rows[index]["FromCity"].ToString();
            DdlToU.SelectedItem.Value = da.Tables[0].Rows[index]["ToCity"].ToString();
            TxtDepartU.Text = da.Tables[0].Rows[index]["Departure"].ToString();
            TxtArrU.Text = da.Tables[0].Rows[index]["Arrival"].ToString();
            TxtDateU.Text = da.Tables[0].Rows[index]["Date"].ToString();
            TxtPriceU.Text = da.Tables[0].Rows[index]["Price"].ToString();
            DdlAirU.SelectedItem.Value = da.Tables[0].Rows[index]["Airline"].ToString();
            lblId.Text = da.Tables[0].Rows[index]["FlightId"].ToString();
            Panel5.Visible = true;

        }


    }

    protected void BtnflyUpdate(object sender, EventArgs e)
    {
        if (DdlToU.SelectedItem.Value == DdlFromU.SelectedItem.Value)
        {
            DdlFromU.SelectedItem.Value =DdlToU.SelectedItem.Value;
            lblError.Text = "Departure and Destination can't be same";
        }
        else { 
        String to = DdlToU.SelectedItem.Value;
        String from = DdlFromU.SelectedItem.Value;
        //DateTime depart = DateTime.ParseExact(TxtDepart.Text,"HH:mm", System.Globalization.CultureInfo.InvariantCulture);
        //DateTime arrival = DateTime.ParseExact(TxtArr.Text, "HH:mm", System.Globalization.CultureInfo.InvariantCulture);
        String depart = TxtDepartU.Text;
        String arrival = TxtArrU.Text;
        DateTime date = DateTime.Parse(TxtDateU.Text);
        String price = TxtPriceU.Text;
        String airline = DdlAirU.SelectedItem.Value;

        String Query = "update Flights set FromCity='" + from + "',ToCity='" + to + "',Airline='" + airline + "',Departure='" + depart + "',Arrival='" + arrival + "',Price='" + price + "',Date='" + date + "' where FlightId='" + lblId.Text + "'";
        int value = Execute_Utility.Command_Execute_Utility.obj.ExecuteNonQuery_Method(Query);
        }
    }
}
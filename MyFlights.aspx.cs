using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class MyFlights : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {
            //insert();
            Get_Details();
        }
        

    }
    public void Get_Details()
    {
       
        if (Session["User"] == null)
        {
            LblNoBook.Visible = true;
            BtnToLogIn.Visible = true;
          LblNoBook.Text  = "You need to login to see your flights";
        }
        else
        {
            string[] sUser=Session["User"].ToString().Trim().Split(new char[] { '$' });
            string uid = sUser[0].Trim().ToString();
            string qtruery = "select BookingMaster.LeavingDate,BookingMaster.ReachingDate, BookingMaster.TotalFare,BookingMaster.Date,BookingMaster.Id,BookingMaster.NoOfAdults,t2.NameOfCity as Origin, t3.NameOfCity as Destination ,t1.FlightId,BookingMaster.NoOfChildren,BookingMaster.NoOfInfants,t1.Departure,t1.Arrival,AirlineMaster.Name from BookingMaster inner join Flights t1 on BookingMaster.FId = t1.FlightId inner join AirlineMaster on AirlineMaster.AirlineId=t1.Airline inner join DestinationMaster t2 on t2.Id=t1.FromCity inner join DestinationMaster t3 on t1.ToCity=t3.Id  where BookingMaster.UserId ='" + uid+ "' and BookingMaster.flag =1;";
            DataSet ds = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(qtruery);

            //LblFId.Text =
            if (ds != null && ds.Tables != null)
            {
                if (ds.Tables[0].Rows.Count == 0)
                {
                    LblNoBook.Text = "Looks like you haven't made any bookings yet";
                    BtnExplore.Visible = true;
                }
                else
                {

                    gridView.DataSource = ds;
                    gridView.DataBind();
                }
            }
        }
    }

    protected void BtnExplore_Click(object sender, EventArgs e)
    {
        Response.Redirect("main.aspx");
    }

    protected void BtnToLogIn_Click(object sender, EventArgs e)
    {
        Session["frommyflights"] ="y";
        Response.Redirect("LoginPa.aspx");
    }
     protected void gridView_row(object sender,GridViewCommandEventArgs e)
    {
        if (e.CommandName == "view")
        {
            Panel1.Visible = true;
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gridView.Rows[index];
            Label lt = (Label)gridView.Rows[index].FindControl("lblBId");
            string bid = lt.Text;
            Label lfid = (Label)gridView.Rows[index].FindControl("lblfid");
            string fid = lfid.Text;
            Label lano = (Label)gridView.Rows[index].FindControl("lbladultno");
            string lna = lano.Text;
            Label lcno = (Label)gridView.Rows[index].FindControl("lblchildno");
            string lnc = lcno.Text;
            Label lino = (Label)gridView.Rows[index].FindControl("lblinfantno");
            string lni = lino.Text;
            Label reach = (Label)gridView.Rows[index].FindControl("lblreachdte");
            Label leave = (Label)gridView.Rows[index].FindControl("lblleavedte");
            Label reacht = (Label)gridView.Rows[index].FindControl("lblArr"); 
            Label leavet = (Label)gridView.Rows[index].FindControl("lblDep");
            LblLeave1t.Text = leavet.Text;
            LblReach1t.Text = reacht.Text;
            LblLeave1.Text = leave.Text;
            LblReach1.Text = reach.Text;
            Lblano.Text = lna;
            Lblcno.Text = lnc;
            Lblino.Text = lni;
            DataSet ds;
            string qtruery = "select PriceMaster.Baggage,PassengerDetails.FirstName,PassengerDetails.LastName,PassengerDetails.Aci from PriceMaster inner join BookingMaster on PriceMaster.FId=BookingMaster.FId inner join PassengerDetails on PassengerDetails.BookingId=BookingMaster.Id where BookingId='" +bid + "';";
            ds = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(qtruery);
            LblBagT.Text = ds.Tables[0].Rows[0]["Baggage"].ToString();
            int seq=ds.Tables[0].Rows.Count;
            ds.Tables[0].Columns.Add("Number");
            for(int i = 1; i <= seq; i++)
            {
                DataRow dr = ds.Tables[0].Rows[i - 1];
                dr["Number"] = i;
                ds.Tables[0].Rows[i - 1].AcceptChanges();
                //ds.Tables[0].AcceptChanges();
            }
           
            gridView1.DataSource = ds;
            gridView1.DataBind();
           /* ds.Tables[0].Rows[index]["FlightId"].ToString();
           / string sQtruery = "select  from Flights";
            DataSet da = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(sQtruery);
            lblFlightId.Text = da.Tables[0].Rows[index]["FlightId"].ToString();*/
        }
    }
    
}
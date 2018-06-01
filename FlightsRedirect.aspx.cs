using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FlightsRedirect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string dated;
        /* if (Session["Date"] != null)
         {
         dated = Session["Date"].ToString();
         DateTime date = DateTime.Parse(dated);
         string from;
         from = Session["From"].ToString();
         string to;
         to = Session["To"].ToString();
         /*string dr= Reqtruest.Form["txtDate"];
         Label1.Text = dr;
         */
        /*Label1.Text = PreviousPage.GetF;*/
        if (!Page.IsPostBack)
        {
            //insert();
            Get_Flight_Detail();
        }

    }

    public void Get_Flight_Detail()
    {
        string sFrom = "%";
        string sTo = "%";
        string sDate = "%";
        if (Session["From"] != null)
        {
            string[] sFromD = Session["From"].ToString().Trim().Split(new char[] { '$' });
            string[] sToD = Session["To"].ToString().Trim().Split(new char[] { '$' });
            sDate = Session["Date"].ToString().Trim();
            Lblfr.Text = sFromD[0].ToString();
            Lblto.Text = sToD[0].ToString();
            sFrom = sFromD[1].ToString();
            sTo = sToD[1].ToString();
        }
        else
        {
            Lblfr.Text = "ALL City";
            Lblto.Text = "ALL City";
        }
        string qtruery = "select Flights.FlightId,Flights.TotalSeats,AirlineMaster.Name,Flights.Departure,Flights.Arrival,Flights.Date,Flights.Price from flights inner join AirlineMaster on Flights.Airline=AirlineMaster.AirlineId where FromCity like '" + sFrom + "' and ToCity like '" + sTo + "'";
        DataSet da = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(qtruery);
        if (da != null && da.Tables != null )
        {
            if (da.Tables[0].Rows.Count == 0)
            {
                LblNoFlight.Visible = true;
                LblNoFlight.Text = "Sorry! Currently no flights are available between these cities";
            }
            else
            {
                gridv.DataSource = da;
                gridv.DataBind();
            }
        }

        foreach (GridViewRow row in gridv.Rows)
        {
            foreach (TableCell cell in row.Cells)
            {
                cell.Attributes.CssStyle["text-align"] = "center";
            }
        }
       // Session["from"] = null;

    }

    /*public void insert()
    {
        string from = null;
        string to = null;
        from = PreviousPage.GetF;
        //DdlFrom.SelectedItem.Valtrue
        if (PreviousPage.GetF != null)
        {
            from = PreviousPage.GetF;
        }
        if (PreviousPage.GetTextF != null)
        {
            string tfrom = PreviousPage.GetTextF;
            Lblfr.Text = tfrom;
        }
        if (PreviousPage.GetT != null)
        {
             to = PreviousPage.GetT;
        }
        if (PreviousPage.GetTextT != null)
        {
            string tto = PreviousPage.GetTextT;
            Lblto.Text = tto;
        }
        if (PreviousPage.GetDate != null)
        {
            string date = PreviousPage.GetDate;
        }


        string qtruery = "select AirlineMaster.Name,Flights.Departure,Flights.Arrival,Flights.Date,Flights.Price from flights inner join AirlineMaster on Flights.Airline=AirlineMaster.AirlineId where FromCity='" + from + "' and ToCity=' " + to + "'";
        DataSet da = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(qtruery);
        if (da != null && da.Tables != null && da.Tables[0].Rows.Count > 0)
        {
            gridv.DataSource = da;
            gridv.DataBind();
        }

        foreach (GridViewRow row in gridv.Rows)
        {
            foreach (TableCell cell in row.Cells)
            {
                cell.Atibutes.CssStyle["text-align"] = "center";
            }
        }
    }*/

    protected void gridv_row(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "book")
        {
            // Convert the row index stored in the CommandArgument
            // property to an Integer.

            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gridv.Rows[index];
            string sQtruery = "select * from Flights";
            DataSet da = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(sQtruery);
            Label one=(Label)gridv.Rows[index].FindControl("lblflyid");
            lblFlightId.Text = one.Text;
            Label two = (Label)gridv.Rows[index].FindControl("lblttls");
            // da.Tables[0].Rows[index]["FlightId"].ToString();
            lbltotal.Text =two.Text;
            Label three= (Label)gridv.Rows[index].FindControl("lblArrival");
            DateTime arno = Convert.ToDateTime(three.Text);
            Label four = (Label)gridv.Rows[index].FindControl("lblDepart");
           // string dep = da.Tables[0].Rows[index]["Departure"].ToString();
            DateTime depno = Convert.ToDateTime(four.Text);
            TimeSpan t = arno.Subtract(depno);
            //int tint = Convert.ToInt32(t);
            if (t.TotalMinutes<0)
            {
                LblDatediff.Text = "y";
            }
            Panel2.Visible = true;
            if (Session["User"] == null)
            {
                Session["backtofly"] = "y";
                Response.Redirect("LoginPa.aspx");
            }
        }
    }


    protected void BtnConf_Click(object sender, EventArgs e)
    {
        string adult = txtAdult.Text;
        string child = txtChild.Text;
        string infant = txtInfant.Text;
        int adultno = Convert.ToInt32(adult);
        int childno = Convert.ToInt32(child);
        int infantno = Convert.ToInt32(infant);
        int reqSeats = adultno + childno;
        int pssg = reqSeats + infantno;
        string ton = lbltotal.Text;
        int tseats = Convert.ToInt32(ton);
        if (reqSeats > tseats)
        {
            lblnoSeats.Visible = true;
        }
        else
        {
            int seats = tseats - reqSeats;
            LblCurSeats.Text = Convert.ToString(seats);
            string[] sLogin = Session["User"].ToString().Trim().Split(new char[] { '$' });
            string uid = sLogin[0].ToString();

            string fqtruery = "select * from PriceMaster where FId='" + lblFlightId.Text + "'";
            DataSet dm = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(fqtruery);
            int afare = Convert.ToInt32(dm.Tables[0].Rows[0]["AdultFare"].ToString());
            int cfare = Convert.ToInt32(dm.Tables[0].Rows[0]["ChildFare"].ToString());
            int ifare = Convert.ToInt32(dm.Tables[0].Rows[0]["InfantFare"].ToString());
            int gst = Convert.ToInt32(dm.Tables[0].Rows[0]["Gst"].ToString());
            int airtax = Convert.ToInt32(dm.Tables[0].Rows[0]["AirServTax"].ToString());
            

            int basefare = afare * adultno + cfare * childno + ifare * infantno;
            int taxes = gst + airtax;
            int totalamount = basefare + taxes;
            string dte = Session["Date"].ToString().Trim();
            DateTime ldate = DateTime.Parse(dte);
            string ldatee = ldate.ToShortDateString();
            string nxtdte;
            
            DateTime dtenow = DateTime.Now;
            string dtnow = dtenow.ToShortDateString();
            if (LblDatediff.Text == "y")
            {
                nxtdte = ldate.AddDays(1).ToShortDateString();
            }
            else
            {
                nxtdte = ldatee;
            }
            LblTAmt.Text = Convert.ToString(totalamount);
            string insqtruery = "insert into BookingMaster(UserId,FId,BaseFare,Totalfare,NoOfAdults,NoOfChildren,NoOfInfants,TotalPssg,flag,Date,LeavingDate,ReachingDate) values('"+uid+"','" + lblFlightId.Text + "','" + basefare + "','" + totalamount + "','" + adultno + "','" + childno + "','" + infantno + "','" + pssg + "','0','"+dtenow+"','"+ldate+"','"+nxtdte+"')";
            int rvaltrue = Execute_Utility.Command_Execute_Utility.obj.ExecuteNonQuery_Method(insqtruery);
            if (rvaltrue == 1)
            {
                LblPssg.Text = Convert.ToString(pssg);
            }
            int seq;
            
          //  UpdatePanel1.Update();
            // Panel1.Visible = false;
            // UpdatePanel1.Visible = false;

            LblAdNo.Text = adult;
            LblAd.Text = " Adult";
            LblAdF.Text = Convert.ToString(afare);

            if (childno > 0)
            {
                trchild.Visible = true; 
                LblChNo.Visible = true;
                LblCh.Visible = true;
                LblChF.Visible = true;
                LblChNo.Text = child;
                LblCh.Text = " Children";
                LblChF.Text = dm.Tables[0].Rows[0]["ChildFare"].ToString();
            }
            if (infantno > 0)
            {
                trinfant.Visible = true;
                LblInfNo.Visible = true;
                LblInf.Visible = true;
                LblInfF.Visible = true;
                LblInfNo.Text = infant;
                LblInf.Text = " Infants";
                LblInfF.Text = dm.Tables[0].Rows[0]["InfantFare"].ToString();
            }
            LblAirServF.Text = dm.Tables[0].Rows[0]["AirServTax"].ToString();
            LblGstF.Text = dm.Tables[0].Rows[0]["Gst"].ToString();
            LblTtlF.Text = Convert.ToString(totalamount);
            Panel3.Visible = true;
            DataTable dt = new DataTable();
            dt.Columns.Add("Seqtruence");
            dt.Columns.Add("Type");
            dt.Columns.Add("Aci");

            for (int i = 1; i <= adultno; i++)
            {
                DataRow dr = dt.NewRow();
                seq = i;
                dr[0] = seq;
                dr[1] = "Adult" + seq;
                dr[2] = "Adult";
                dt.Rows.Add(dr);
                dt.AcceptChanges();
            }
            if (childno > 0)
            {
                for (int j = 1; j <= childno; j++)
                {
                    DataRow dr = dt.NewRow();
                    seq = adultno + j;
                    dr[0] = seq;
                    dr[1] = "Child " + j;
                    dr[2] = "Child";
                    dt.Rows.Add(dr);
                    dt.AcceptChanges();
                }
            }
            if (infantno > 0)
            {
                for (int k = 1; k <= infantno; k++)
                {
                    DataRow dr = dt.NewRow();
                    seq = adultno + childno + k;
                    dr[0] = seq;
                    dr[1] = "Infant " + k;
                    dr[2] = "Infant";
                    dt.Rows.Add(dr);
                    dt.AcceptChanges();
                }
            }
            gridv1.DataSource = dt;
            gridv1.DataBind();
            gridv1.Columns[0].Visible = false;
            Panel4.Visible = true;
            Panel1.Visible = false;
            Panel2.Visible = false;
            //string aci=gridv1.Rows[0].Cells[1].Text;
            
            //string li = lb.Text;
        }
    }


    protected void BtnPay_Click(object sender, EventArgs e)
    {
        int psg = Convert.ToInt32(LblPssg.Text);
        string fid = lblFlightId.Text;
        string[] sLogin = Session["User"].ToString().Trim().Split(new char[] { '$' });
        string uid = sLogin[0].ToString();
        for (int i = 0; i < psg; i++)
        {
            Label lt = (Label)gridv1.Rows[i].FindControl("lblAci");
            string aci = lt.Text;
            // string aci = gridv1.Rows[i].Cells[1].Text;
            TextBox lf = (TextBox)gridv1.Rows[i].FindControl("txtFName");
            string fname = lf.Text;
            TextBox ln = (TextBox)gridv1.Rows[0].FindControl("txtLName");
            string lname = ln.Text;
            RadioButtonList lg = (RadioButtonList)gridv1.Rows[0].FindControl("rbGender");
            string gen = lg.SelectedItem.Value;
            TextBox la = (TextBox)gridv1.Rows[0].FindControl("txtAge");
            string age = la.Text;
            
            string qtruery= "select id from BookingMaster where FId='"+fid+"' and UserId='"+uid+"' and flag=0";
            DataSet da = Execute_Utility.Command_Execute_Utility.obj.FillDataSet(qtruery);
            int count = da.Tables[0].Rows.Count;
            string bid = da.Tables[0].Rows[count-1]["id"].ToString();
            LblBid.Text = bid;
            string sQtruery = "insert into PassengerDetails values('"+bid+"', '" + fname + "', '" + lname + "', '" + age + "', '" + gen + "', '" + aci + "','0')";
            int rvaltrue = Execute_Utility.Command_Execute_Utility.obj.ExecuteNonQuery_Method(sQtruery);
            Session["from"] = null;
            Session["to"] = null;
            Session["date"] = null;
        }
        Panel5.Visible = true;
        Panel3.Visible = false;
        Panel4.Visible = false;
       



        // string sQtruery="insert into PassengerDetails valtrues(null, '"+fname+"', 'd', '20', 'f', 'a', 0)";
    }



    protected void BtnPayment_Click(object sender, EventArgs e)
    {
        string cardno = TxtCard1.Text + TxtCard2.Text + TxtCard3.Text + TxtCard4.Text;
        string cvv = TxtCvv.Text;
        string NameOnCard = TxtNameOnCard.Text;
        string[] user = Session["User"].ToString().Trim().Split(new char[] { '$' });
        string uid = user[0].ToString().Trim();
        string bid = LblBid.Text;
        string date = DateTime.Now.ToString();
        string transaction= DateTime.Now.ToString("yyyyMd")+bid;
        string edate = DdlYear.SelectedItem.Text + DdlMonth.SelectedItem.Text;
        string SQtruery = "insert into PaymentDetail(BookingId,UserId,TransactionId,TotalAmount,SuccessStatus,PaymentDate) values('"+bid+"','"+uid+"','"+transaction+"','"+LblTAmt.Text+"','1','"+date+"')";
        int svaltrue = Execute_Utility.Command_Execute_Utility.obj.ExecuteNonQuery_Method(SQtruery);
 
        if (svaltrue == 1)
        {
            lblansactsucc.Visible = true;

            string fid = lblFlightId.Text;
            string sqtruery = "update flights set TotalSeats='" + LblCurSeats.Text + "' where FlightId='" + lblFlightId.Text + "'";
            int valtrue = Execute_Utility.Command_Execute_Utility.obj.ExecuteNonQuery_Method(sqtruery);
            string uppqtruery = "update passengerdetails set flag=1 where BookingId='"+bid+"'";
            int uppvaltrue = Execute_Utility.Command_Execute_Utility.obj.ExecuteNonQuery_Method(uppqtruery);
            string upbqtruery = "update BookingMaster set flag=1 where Id='" + bid + "'";
            int upbvaltrue = Execute_Utility.Command_Execute_Utility.obj.ExecuteNonQuery_Method(upbqtruery);
            string delpqtruery = "delete from passengerdetails where flag=0";
            int delpvaltrue = Execute_Utility.Command_Execute_Utility.obj.ExecuteNonQuery_Method(delpqtruery);
            string delqtruery = "delete from BookingMaster where flag=0";
            int delvaltrue = Execute_Utility.Command_Execute_Utility.obj.ExecuteNonQuery_Method(delqtruery);
        }
    }
}
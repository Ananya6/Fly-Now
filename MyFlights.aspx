<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageA.master" AutoEventWireup="true" CodeFile="MyFlights.aspx.cs" Inherits="MyFlights" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .body{
            background: whitesmoke;
        }
        .grhead {
            background: rgb(28, 51, 89);
            color: white;
            border: none;
        }
        .viws {
            background-color: #006699;
            text-decoration: none;
            border: none;
            font-family: "Helvetica Netrue", Helvetica, Arial, sans-serif;
            border: 2px solid #006699;
            font-size: 16px;
            font-style: normal;
            font-variant: normal;
            padding: 3%;
            color: white;
        }
        .cent {
            margin: auto;
           // display: block;
            //text-align: center;
        }
        .viwse{
            margin: 1%;
        }
          .centere{
              vertical-align : middle;
              top: 50%;
              left: 50%;
              text-align: center;
              margin-left: -20%;
              height: 20%;
              width: 40%;
              margin-top: -10%;
              position: absolute;
          }
          .twrap{
              width: 100%;
              height: 100%;
              margin: 0;
              padding: 0;
          }
          .grid {
            background: white;
            color: #006699;
            text-align: center;
            margin: 1%;
        }
          .gridahead {
            background: white;
            color: black;
            border: none;
        }
            .grid  {
                background: white;
                padding: 3%;
                /*border-bottom: 6px solid #d7d6d6; 
            border-left: 6px solid #d7d6d6;
            border-right: 6px solid #d7d6d6;*/
                border: 6px solid #d7d6d6;
            }
            .grida{
                background: white;
            color: #006699;
            text-align: center;
            margin: 1%;
            background: white;
                padding: 3%;
            }
            .grida {

            }

            .fonts{
              font-family: "Helvetica Netrue", Helvetica, Arial, sans-serif;
            }

        

        .auto-style5 {
            width: 155px;
        }

        

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel id="panel0" runat="server" CssClass="twrap">
    <div class="centere">
    <asp:Label ID="LblNoBook" runat="server" Text="Label" Visible="false" Font-Size="large" class="fonts"></asp:Label>
           <br />
    <asp:Button ID="BtnToLogIn" runat="server" Text="Go To Login Page" Visible="false" CssClass="viws " style="padding:1%; margin: 2%" Font-Size="Medium" OnClick="BtnToLogIn_Click" ></asp:Button>
    
    <br />
        <asp:Button ID="BtnExplore" runat="server" Text="Explore Site"  Visible="false" CssClass="viws "  style="padding:1%; margin: 2%" Font-Size="Medium" OnClick="BtnExplore_Click" />
    </div>
        <table class="twrap" >
        
        <td class="cent">

        <asp:GridView ID="gridView" runat="server" AutoGenerateColumns="false" GridLines="Horizontal" OnRowCommand="gridView_row" CellSpacing="10" class="grid" Width="100%" CellPadding="5">
        <Columns>

                            <asp:TemplateField HeaderText="Booking ID" HeaderStyle-CssClass="grhead">
                                <ItemTemplate>
                                    <asp:Label ID="lblBId" runat="server" Text='<%#Eval("Id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Airline" HeaderStyle-CssClass="grhead">
                                <ItemTemplate>
                                    <asp:Label ID="lblAir" runat="server" Text='<%#Eval("Name") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Origin" HeaderStyle-CssClass="grhead">
                                <ItemTemplate>
                                    <asp:Label ID="lblFrom" runat="server" Text='<%#Eval("Origin") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
      
            <asp:TemplateField HeaderText="Destination" HeaderStyle-CssClass="grhead">
                                <ItemTemplate>
                                    <asp:Label ID="lblfid" runat="server" Text='<%#Eval("Destination") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
            <asp:TemplateField HeaderText="jh" HeaderStyle-CssClass="grhead" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lbladultno" runat="server" Text='<%#Eval("NoOfAdults") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
            <asp:TemplateField HeaderText="Leaving Time" HeaderStyle-CssClass="grhead">
                                <ItemTemplate>
                                    <asp:Label ID="lblDep" runat="server" Text='<%#Eval("Departure") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
           
             <asp:TemplateField HeaderText="jh" HeaderStyle-CssClass="grhead" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblinfantno" runat="server" Text='<%#Eval("NoOfInfants") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
             <asp:TemplateField HeaderText="jh" HeaderStyle-CssClass="grhead" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblchildno" runat="server" Text='<%#Eval("NoOfChildren") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Reaching Time" HeaderStyle-CssClass="grhead">
                                <ItemTemplate>
                                    <asp:Label ID="lblArr" runat="server" Text='<%#Eval("Arrival") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
            <asp:TemplateField HeaderText="Boooking Date" HeaderStyle-CssClass="grhead">
                                <ItemTemplate>
                                    <asp:Label ID="lbldtee" runat="server" Text='<%#Eval("Date") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total Amount" HeaderStyle-CssClass="grhead">
                                <ItemTemplate>
                                    <asp:Label ID="lblTFare" runat="server" Text='<%#Eval("TotalFare") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
            <asp:TemplateField HeaderText="Boooking Date" HeaderStyle-CssClass="grhead" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblleavedte" runat="server" Text='<%#Eval("LeavingDate") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
            <asp:TemplateField HeaderText="Boooking Date" HeaderStyle-CssClass="grhead" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblreachdte" runat="server" Text='<%#Eval("ReachingDate") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
            <asp:TemplateField HeaderText="" HeaderStyle-CssClass="grhead">
                <ItemTemplate>
                <asp:Button ID="btnView" runat="server" Text="View" CommandName="view" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" class="viws" />                
                </ItemTemplate>
                            </asp:TemplateField>
            </Columns>
</asp:GridView>
            
            
        </table>
        </asp:Panel>
    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <table style="align-content:center; margin: auto" >
            <tr>
                <td colspan="6"><asp:Label ID="LblLeave" runat="server" Text="LeavingDate" style="background-color: white"></asp:Label>
                <asp:Label ID="LblLeave1" runat="server" style="background-color: white" ></asp:Label>
                    <asp:Label ID="LblLeave1t" runat="server" style="background-color: white" visible="false"></asp:Label>
                <asp:Label ID="Lblplane" runat="server"  style="background-color: white" >&#x2708;</asp:Label>
                <asp:Label ID="LblReach" runat="server" style="background-color: white" ></asp:Label>
                    <asp:Label ID="LblReach1t" runat="server" style="background-color: white" visible="false"></asp:Label>
                <asp:Label ID="LblReach1" runat="server" Text="Reaching Date" style="background-color: white" ></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="LblFId0" runat="server" Text="Passengers:" style="background-color: white" ></asp:Label>
                </td>
                
                  <td>  <asp:Label ID="Lblano" runat="server" style="background-color: white"></asp:Label>
                      <asp:Label ID="Lbladult" runat="server" style="background-color: white">Adult</asp:Label>
                </td>
                
                
                   <td> <asp:Label ID="Lblcno" runat="server" style="background-color: white"></asp:Label></td> 
                
                
                  <td>   <asp:Label ID="Lblano2" runat="server" style="background-color: white">Child</asp:Label></td> 
                
                
                   <td>   <asp:Label ID="Lblino" runat="server" style="background-color: white"></asp:Label></td> 
                
                
                   <td>   <asp:Label ID="Lblinfant" runat="server" style="background-color: white" >Infant</asp:Label></td> 
               
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="LblBag" runat="server" Text="Baggage Allowed" style="background-color: white"></asp:Label>
                </td>
                 <td> 
                    <asp:Label ID="LblBagT" runat="server" style="background-color: white"></asp:Label>kg
                 </td> 
                
             </tr>   
                
            
            <tr>
            <td colspan="6" class="cent" style="background-color: white; border: 1px solid white">
               
               Passenger Details  </td> 
            
            </tr>
            <tr class="cent">
                <td colspan="6" class="cent">
                    <asp:GridView ID="gridView1" runat="server" AutoGenerateColumns="false" CellPadding="5" CellSpacing="10" class="grida"  GridLines="None" Width="417px"  >
                        <Columns>
                            <asp:TemplateField HeaderStyle-CssClass="gridahead" HeaderText="Number">
                                <ItemTemplate>
                                    <asp:Label ID="lblNum" runat="server" Text='<%#Eval("Number") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-CssClass="gridahead" HeaderText="First Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblFName" runat="server" Text='<%#Eval("FirstName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-CssClass="gridahead" HeaderText="Last Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblLName" runat="server" Text='<%#Eval("LastName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-CssClass="gridahead" HeaderText="Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblType" runat="server" Text='<%#Eval("Aci") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                
                </td>
                </tr>
            
            
             </table>
    </asp:Panel>
</asp:Content>


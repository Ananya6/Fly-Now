<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageA.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="FlightsRedirect.aspx.cs" Inherits="FlightsRedirect" %>

<%--<%@ PreviousPageType VirtualPath="~/main.aspx" %>--%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #demo {
            width: 100%;
            opacity: 0.8;
            filter: alpha(opacity=50);
            position: fixed;
            left: 0px;
            z-index: -1;
        }

        .pnl {
            //margin:auto;
            float: right;
            display: block;
            margin-top: 1%;
            margin-right: 3%;
            background: rgba(28, 51, 89,0.5);
            color: black;
            top: 0px;
            border-radius: 5px;
        }

        .mainbox {
            padding: 5%;
            //border: 2px solid #1a5f89;
        }

        .viws {
            background-color: #006699;
            text-decoration: none;
            border: none;
            font-family: "Helvetica Netrue", Helvetica, Arial, sans-serif;
            border: 2px solid #006699;
            font-size: 18px;
            font-style: normal;
            font-variant: normal;
            padding: 3%;
            color: white;
        }

        .grid {
            background: white;
            color: #006699;
        }

            .grid  {
                background: whitesmoke;
                padding: 3%;
                /*border-bottom: 6px solid #d7d6d6; 
            border-left: 6px solid #d7d6d6;
            border-right: 6px solid #d7d6d6;*/
                border: 6px solid #d7d6d6;
            }

        .grhead {
            background: rgb(28, 51, 89);
            color: white;
            border: none;
        }

        .cent {
            margin: auto;
            display: block;
            //text-align: center;
        }

        .city {
            padding: 1%;
        }

        .acebox {
            display: inline-block;
            padding-bottom: 4%;
            padding-left: 2%;
            // width: 32%;
        }
        .btnconf{
           font-family: "Helvetica Netrue", Helvetica, Arial, sans-serif;
        }
        .img {
            left: 0px;
            top: -5px;
        }
        .succt{
            background-color: #2eb22c;
            color: white;
            border-radius: 5px;
            border: 2px solid #148413;
            width: 80%;
            font-family: "Helvetica Netrue", Helvetica, Arial, sans-serif;
            text-align: center;
            padding: 2%;
            display: block;
            margin: auto;

        }
        .auto-style10 {
            width: 27%;
        }
        .auto-style11 {
            width: 15%;
        }
                
        .auto-style14 {
            text-align: left;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>

        <img id="demo" src="\flight1.jpg" class="img" />

        <asp:Panel ID="Panel0" runat="server" Width="50%" CssClass="pnl">

            <div class="mainbox">
                <asp:Panel ID="Panel1" runat="server">
                    <div class="cent">
                        <asp:Label ID="Lblfr" runat="server" ForeColor="whitesmoke" BackColor="#255bb2" class="city"></asp:Label>
                        <b><asp:Label ID="Lblarrow" runat="server" ForeColor="black" Font-Size="Medium" Text="&rarr;" font-weight="600"></asp:Label></b>

                        <asp:Label ID="Lblto" runat="server" ForeColor="whitesmoke" BackColor="#255bb2" class="city"></asp:Label>
                        <br />
                        
                    </div>
                    <br />
                    <asp:Label ID="LblNoFlight" runat="server" ForeColor="whitesmoke" style="vertical-align: middle; padding: 2%" CssClass="cent" Visible="false"></asp:Label>
                    <asp:GridView ID="gridv" runat="server" AutoGenerateColumns="false" GridLines="Horizontal" OnRowCommand="gridv_row" CellSpacing="10" class="grid" Width="100%" CellPadding="5">
                        <Columns>
                             <asp:TemplateField HeaderText="fid" HeaderStyle-CssClass="grhead" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblflyid" runat="server" Text='<%#Eval("FlightId") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="ts" HeaderStyle-CssClass="grhead" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblttls" runat="server" Text='<%#Eval("TotalSeats") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Airline " HeaderStyle-CssClass="grhead">
                                <ItemTemplate>
                                    <asp:Label ID="lblAir" runat="server" Text='<%#Eval("Name") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Departure" HeaderStyle-CssClass="grhead">
                                <ItemTemplate>
                                    <asp:Label ID="lblDepart" runat="server" Text='<%#Eval("Departure") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Arrival" HeaderStyle-CssClass="grhead">
                                <ItemTemplate>
                                    <asp:Label ID="lblArrival" runat="server" Text='<%#Eval("Arrival") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Price per adult" HeaderStyle-CssClass="grhead">
                                <ItemTemplate>
                                    <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="   " HeaderStyle-CssClass="grhead">
                                <ItemTemplate>
                                    <asp:Button ID="btnBook" runat="server" Text="Book" CommandName="book" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" class="viws" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView>

                </asp:Panel>

                <asp:Panel ID="Panel2" runat="server"  Visible="false" >
               <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" Visible="true">
                    <ContentTemplate>--%>
                        <div style="margin-top: 4%;  border: 3px solid #d7d6d6; background-color: whitesmoke">
                            <p class="cent" style="font-size: large">Confirm Passengers</p>
                            <div class="acebox">
                                <asp:Label ID="LblAdultC" runat="server" Text="Adults" ForeColor="#0B3C5D"></asp:Label>
                                <asp:TextBox ID="txtAdult" runat="server" Width="100" Text="1" Style="text-align: center"></asp:TextBox>


                                <ajaxToolkit:FilteredTextBoxExtender ID="txtAdult_FilteredTextBoxExtender" runat="server" BehaviorID="txtAdult_FilteredTextBoxExtender" TargetControlID="txtAdult" ValidChars="123456789" />


                                <ajaxToolkit:NumericUpDownExtender ID="txtAdult_NumericUpDownExtender" runat="server" BehaviorID="txtAdult_NumericUpDownExtender" Maximum="9" Minimum="1" Width="100" RefValues="" ServiceDownMethod="" ServiceUpMethod="" Tag="" TargetButtonDownID="" TargetButtonUpID="" TargetControlID="txtAdult" />

                            </div>

                            <div class="acebox">
                                <asp:Label ID="LblChild" runat="server" ForeColor="#0B3C5D" Text="Children"></asp:Label>
                                <asp:TextBox ID="txtChild" runat="server" Style="text-align: center" Text="0" Width="100"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="txtChild_FilteredTextBoxExtender" runat="server" BehaviorID="txtChild_FilteredTextBoxExtender" TargetControlID="txtChild" ValidChars="01234" />
                                <ajaxToolkit:NumericUpDownExtender ID="txtChild_NumericUpDownExtender" runat="server" BehaviorID="txtChild_NumericUpDownExtender" Maximum="4" Minimum="0" RefValues="" ServiceDownMethod="" ServiceUpMethod="" Tag="" TargetButtonDownID="" TargetButtonUpID="" TargetControlID="txtChild" Width="100" />
                            </div>
                            <div class="acebox">
                                <asp:Label ID="LblInfant" runat="server" Text="Infants" ToolTip="(0-2yrs)" ForeColor="#0B3C5D"></asp:Label>
                                <asp:TextBox ID="txtInfant" runat="server" Style="text-align: center" Width="100"></asp:TextBox>
                                <ajaxToolkit:FilteredTextBoxExtender ID="txtInfant_FilteredTextBoxExtender" runat="server" BehaviorID="txtInfant_FilteredTextBoxExtender" TargetControlID="txtInfant" ValidChars="01234" />
                                <ajaxToolkit:NumericUpDownExtender ID="txtInfant_NumericUpDownExtender" runat="server" BehaviorID="txtInfant_NumericUpDownExtender" Maximum="4" Minimum="0" RefValues="" ServiceDownMethod="" ServiceUpMethod="" Tag="" TargetButtonDownID="" TargetButtonUpID="" TargetControlID="txtInfant" Width="100" />
                                </div>
                                <div class="cent">
                                    <asp:Button ID="BtnConf" runat="server" Text="Confirm" CssClass="viws"  style="padding: 1%" OnClick="BtnConf_Click"  />
                                </div>
                                
                            </div>
                    <%--</ContentTemplate>
                        
                </asp:UpdatePanel>--%>
                 </asp:Panel>

                
                <asp:Panel ID="Panel3" runat="server" Visible="false" Style="background-color: whitesmoke; margin-top:4%; margin-bottom: 2%; border: 6px solid #d7d6d6;" >
                    <p style="text-align: center;font-family: 'Open Sans',Verdana;">FARE BREAKUP</p>
                   
                        <table class="cent" style="text-align: center; margin-left: 30%;margin-bottom: 2%;font-family: 'Open Sans',Verdana;" >
                            <tr>
                                
                              <td><asp:Label ID="LblAdNo" runat="server"></asp:Label></td> 
                                
                                

                                   <td><asp:Label ID="LblAd" runat="server"></asp:Label></td> 

                                
                                
                                <td class="auto-style14">Rs<asp:Label ID="LblAdF" runat="server"></asp:Label></td>  
                                
                            </tr>
                            <tr id="trchild" visible="false" runat="server">
                             <td>   <asp:Label ID="LblChNo" runat="server" Visible="false"></asp:Label></td> 
                            <td>    <asp:Label ID="LblCh" runat="server" Visible="false"></asp:Label></td> 
                            <td class="auto-style14">   Rs<asp:Label ID="LblChF" runat="server" Visible="false"></asp:Label></td> 
                            </tr>
                            <tr id="trinfant" visible="false" runat="server">
                             <td>   <asp:Label ID="LblInfNo" runat="server" Visible="false"></asp:Label></td> 
                            <td>    <asp:Label ID="LblInf" runat="server" Visible="false"></asp:Label></td> 
                            <td class="auto-style14">   Rs<asp:Label ID="LblInfF" runat="server" Visible="false"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="2"><asp:Label ID="LblAirServ" runat="server" Text="Airline Service Tax "></asp:Label></td>
                               <td class="auto-style14"> &nbsp;Rs<asp:Label ID="LblAirServF" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="2"><asp:Label ID="LblGst" runat="server" Text="Gst"></asp:Label></td>
                                
                                <td class="auto-style14">Rs<asp:Label ID="LblGstF" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="2"><asp:Label ID="LblTtl" runat="server" Text="Total Fare"></asp:Label></td>
                               <td class="auto-style14">Rs<asp:Label ID="LblTtlF" runat="server"></asp:Label></td>
                            </tr>
                            
                        </table>
                        
                   
                    
                    
                </asp:Panel>

                <asp:Label ID="lblFlightId" runat="server" Visible="False" Style="display: inline"></asp:Label>
                <asp:Panel ID="Panel4" runat="server" Visible="false">
                    <asp:GridView ID="gridv1" runat="server" AutoGenerateColumns="false" GridLines="Horizontal" CellSpacing="10" class="grid" Width="100%" CellPadding="5">
                        <Columns>
                            <asp:TemplateField HeaderText="Seqtruence">
                                <ItemTemplate>
                                    <asp:Label ID="lblSeq" runat="server" Text='<%# Eval("Seqtruence") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblType" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Aci" Visible="false">
                                <ItemTemplate>
                                     <asp:Label ID="lblAci" runat="server" Text='<%# Eval("Aci") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="First Name">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <asp:RadioButtonList ID="rbGender" runat="server">
                                        <asp:ListItem Text="Female" Valtrue="F"></asp:ListItem>
                                        <asp:ListItem Text="Male" Valtrue="M"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Age">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtAge" runat="server" Width="50"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <div class="cent">
                    <asp:Button ID="BtnPay" runat="server" Text="Proceed" CssClass="viws" style="margin:1%" OnClick="BtnPay_Click" />
                        </div>
                </asp:Panel>
                <asp:Label ID="lbltotal" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="lblnoSeats" runat="server" Text="Sorry! No seats are available in this flight" Visible="false"></asp:Label>
                <asp:Label ID="LblPssg" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="LblCurSeats" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="LblBid" runat="server" Visible="false"></asp:Label>
               
            
            
                <asp:Label ID="LblDatediff" runat="server" Visible="False"></asp:Label>
               
            
            
        <asp:Panel ID="Panel5" runat="server" Visible="false">
            <table style="width:100%; color: white;">
                <tr>
                    <td class="auto-style10">
                        <asp:Label ID="LblCardNo" runat="server" Text="Card Number"></asp:Label></td>
                    
                    <td class="auto-style11" >
                        <asp:TextBox ID="TxtCard1" runat="server" MaxLength="4" Width="80"></asp:TextBox>
                    </td>
                    <td>/<asp:TextBox ID="TxtCard2" runat="server" MaxLength="4" Width="80"></asp:TextBox>
                    </td>
                    <td>/<asp:TextBox ID="TxtCard3" runat="server" MaxLength="4" Width="80"></asp:TextBox>
                    </td>
                   <td> /<asp:TextBox ID="TxtCard4" runat="server" Rows="4" Width="80"></asp:TextBox></td>
                    
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:Label ID="LblExpiry" runat="server" Text="Expiry Date"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:DropDownList ID="DdlMonth" runat="server">
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem>03</asp:ListItem>
                            <asp:ListItem>04</asp:ListItem>
                            <asp:ListItem>05</asp:ListItem>
                            <asp:ListItem>06</asp:ListItem>
                            <asp:ListItem>07</asp:ListItem>
                            <asp:ListItem>08</asp:ListItem>
                            <asp:ListItem>09</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style13">
                        <asp:DropDownList ID="DdlYear" runat="server">
                            <asp:ListItem>2017</asp:ListItem>
                            <asp:ListItem>2018</asp:ListItem>
                            <asp:ListItem>2019</asp:ListItem>
                            <asp:ListItem>2020</asp:ListItem>
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2022</asp:ListItem>
                            <asp:ListItem>2023</asp:ListItem>
                            <asp:ListItem>2024</asp:ListItem>
                            <asp:ListItem>2025</asp:ListItem>
                            <asp:ListItem>2026</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    </tr>
                
                <tr>
                    <td class="auto-style10">
                        <asp:Label ID="LblCvv" runat="server" Text="CVV"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="TxtCvv" runat="server" MaxLength="3" Width="53px"></asp:TextBox>
                        &nbsp;
                    </td>
                    </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:Label ID="LblPayName" runat="server" Text="Name Of Card Holder"></asp:Label>
                    </td>
                    <td colspan="2" class="auto-style11">
                        <asp:TextBox ID="TxtNameOnCard" runat="server" Width="115px"></asp:TextBox>
                    </td>
                    
                </tr>
                <tr>
                    <td class="auto-style10">
                        <asp:Label ID="LblAmount" runat="server" Text="Total Amount"></asp:Label>
                    </td>
                    <td class="auto-style11">
                        <asp:Label ID="LblTAmt" runat="server"></asp:Label>
                    </td>
                    </tr>
                
                <tr>
                    <td colspan="5" class="cent">
                        <asp:Button ID="BtnPayment" runat="server"  class="viws" style="margin:2%; padding: 1%; border: 1px solid black;" OnClick="BtnPayment_Click" Text="Make Payment" />
                    </td>
                    </tr>
                
            </table>
           <br />

            <asp:Label ID="lblansactsucc" runat="server" Visible="false" CssClass="succt" Text="Booking Confirmed"></asp:Label>
        </asp:Panel>
                </div>

        </asp:Panel>
    </div>
</asp:Content>


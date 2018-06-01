<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="InsertFly.aspx.cs" Inherits="InsertFly" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            width: 152px;
            height: 21px;
        }
        .auto-style5 {
            height: 21px;
            width: 166px;
        }
        .auto-style6 {
            width: 166px;
        }
        .auto-style7 {
            width: 56%;
        }
        .auto-style10 {
            width: 152px;
        }
        .viws {
            background-color: #4A96AD;//#006699;
            text-decoration: none;
            border: none;
            font-family: "Helvetica Netrue", Helvetica, Arial, sans-serif;
            border: 1px solid #006699;
            font-size: 16px;
            font-style: normal;
            font-variant: normal;
            padding: 2%;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
     <asp:Panel ID="Panel2" runat="server"><center>
            <br /></center>
            
                <table style="margin-left:20%; margin-right: 20%" class="auto-style7">
         <tr>
             <td colspan="2"><center><b>Flight master</b></center></td>
         </tr>
         <tr>
             <td class="auto-style10"><asp:Label ID="LblFrom" runat="server" Text="From:"></asp:Label>
             </td>
             <td class="auto-style6">
            <asp:DropDownList ID="DdlFrom" runat="server" AppendDataBoundItems="True">
                <asp:ListItem Text="Select City" Value="" />
            </asp:DropDownList>
             </td>
         </tr>
         <tr>
             <td class="auto-style10">
            <asp:Label ID="LblTo" runat="server" Text="To:"></asp:Label>
             </td>
             <td class="auto-style6">
            <asp:DropDownList ID="DdlTo" runat="server" AppendDataBoundItems="True">
                <asp:ListItem Text="Select City" Value="" />
            </asp:DropDownList>
             </td>
         </tr>
         <tr>
             <td class="auto-style10">
            <asp:Label ID="LblDeparture" runat="server" Text="Departure:"></asp:Label>
             </td>
             <td class="auto-style6">
            <asp:TextBox ID="TxtDepart" runat="server" TextMode="Time"></asp:TextBox>
             </td>
         </tr>
         <tr>
             <td class="auto-style10">
            <asp:Label ID="LblArrival" runat="server" Text="Arrival:"></asp:Label>
             </td>
             <td class="auto-style6">
            <asp:TextBox ID="TxtArr" runat="server" TextMode="Time"></asp:TextBox>
             </td>
         </tr>
         <tr>
             <td class="auto-style10">
            <asp:Label ID="LblDate" runat="server" Text="Date:"></asp:Label>
             </td>
             <td class="auto-style6">
            <asp:TextBox ID="TxtDate" runat="server"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="TxtDate_CalendarExtender" runat="server" BehaviorID="TxtDate_CalendarExtender" TargetControlID="TxtDate" />
             </td>
         </tr>
         <tr>
             <td class="auto-style10">
            <asp:Label ID="LblPrice" runat="server" Text="Price:"></asp:Label>
             </td>
             <td class="auto-style6">
            <asp:TextBox ID="TxtPrice" runat="server"></asp:TextBox>
             </td>
         </tr>
         <tr>
             <td class="auto-style4">
            <asp:Label ID="LblAirline" runat="server" Text="Airline:"></asp:Label>
                 </td>
             <td class="auto-style5">
            <asp:DropDownList ID="DdlAir" runat="server">
            </asp:DropDownList>
             </td>
         </tr>
         <tr>
             <td colspan="2"><center>
            <asp:Button ID="BtnSubmitfly" runat="server" OnClick="BtnSubmitfly_Click"  class="viws" Text="Submit" />
                 <br />
                 <asp:Label ID="LblError" runat="server" Font-Size="Medium" ForeColor="Red"></asp:Label>
                 </center>
             </td>
         </tr>
     </table>
            </center>
        </asp:Panel>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>


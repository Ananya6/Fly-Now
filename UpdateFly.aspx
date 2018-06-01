<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="UpdateFly.aspx.cs" Inherits="UpdateFly" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
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
        .back{
            background: #ECECEA;
            margin-left: 6%;
            margin-right: 6%;
            padding: 2%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <asp:Panel ID="Panel4" runat="server" CssClass="back">
            Update Flights<br />
            <br />
            <asp:Label ID="LblFId" runat="server" Text="Flight Id"></asp:Label>

            :<asp:TextBox ID="TxtFId" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="BtnFlyS" runat="server" Text="Submit" OnClick="BtnFlySearch_Click" class="viws"/>

            <asp:GridView ID="grida" runat="server" OnRowCommand="grida_row" AutoGenerateColumns="true">
        <Columns>
            <asp:TemplateField HeaderText="View">
                <ItemTemplate>
                    <asp:Button ID="btnView" runat="server" Text="view" CommandName="view" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"/>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            <asp:Panel ID="Panel5" runat="server" Visible="False">
                <asp:Label ID="lblId" runat="server"></asp:Label>
                <br />
                <asp:Label ID="LblFromU" runat="server" Text="From:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DdlFromU" runat="server">
                <asp:ListItem Text="--Select One--" Value="" />
            </asp:DropDownList>
            <br />
            <asp:Label ID="LblToU" runat="server" AppendDataBoundItems="True" Text="To:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DdlToU" runat="server" AppendDataBoundItems="True">
                <asp:ListItem Text="--Select One--" Value="" />
            </asp:DropDownList>
            &nbsp;
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="LblDepartU" runat="server" Text="Departure:"></asp:Label>
            &nbsp;
            <asp:TextBox ID="TxtDepartU" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblArrU" runat="server" Text="Arrival:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TxtArrU" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblDateU" runat="server" Text="Date:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TxtDateU" runat="server"></asp:TextBox>
           
                <ajaxToolkit:CalendarExtender ID="TxtDateU_CalendarExtender" runat="server" BehaviorID="TxtDateU_CalendarExtender" TargetControlID="TxtDateU" />
           
            <br />
            <asp:Label ID="LblPriceU" runat="server" Text="Price:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TxtPriceU" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblAirU" runat="server" Text="Airline:"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DdlAirU" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btnFlyU" runat="server" OnClick="BtnflyUpdate" CssClass="viws" Text="Submit" />
          
                <br />
          
            </asp:Panel>
        </asp:Panel>
</asp:Content>


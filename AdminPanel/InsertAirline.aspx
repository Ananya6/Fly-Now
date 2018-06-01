<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="InsertAirline.aspx.cs" Inherits="InsertAirline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .cont{
            padding: 4%;
            display: block;
            margin: auto;
        }
     .back{
            background: #ECECEA;
            margin-left: 25%;
            margin-right: 25%;
            padding: 2%;
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
   
 <div class="cont">
     <asp:Panel ID="Panel3" runat="server" CssClass="back">
            <center>Airline
            <br />
            <br />
            <asp:Label ID="LblAirlineName" runat="server" Text="AirlineName:"></asp:Label>
            <asp:TextBox ID="TxtAirlineName" runat="server" ></asp:TextBox>
            <br />
                <br />

            <asp:Button ID="BtnSubmitAir" runat="server" class="viws" OnClick="BtnSubmitAir_Click" Text="Submit" />
            <br />
                </center>
        </asp:Panel>
     </div> 
    <asp:Panel ID="Panel2" runat="server" CssClass="back">
            <center>
                <asp:Label ID="LblSearch" runat="server" Text="Update Flights"></asp:Label><br />
                <br />
                <asp:Label ID="LblNameU" runat="server" Text="Name Of Airline:"></asp:Label>
                <asp:TextBox ID="TxtNameU" runat="server"></asp:TextBox><br /><br />
                <asp:Button ID="BtnSearch" runat="server" class="viws" OnClick="BtnSearch_Click" Text="Search" />
                    <br /><br /> 
                
                <asp:GridView ID="gridView" runat="server" DataKeyNames="Id" onrowediting="gridView_RowEditing"
        onrowupdating="gridView_RowUpdating" AutoGenerateColumns="false" HeaderStyle-Font-Bold="true"
                      OnPageIndexChanging="gridView_PageIndexChanging" 
                    OnRowCancelingEdit="gridView_RowCancelingEdit" OnRowDeleting="gridView_RowDeleting" >
                <Columns>
                <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%#Eval("AirlineId") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtId" Width="30px" runat="server" Text='<%#Eval("AirlineId") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Name Of Airline">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" Width="30px" runat="server" Text='<%#Eval("Name") %>' />
                        </EditItemTemplate>
                 </asp:TemplateField>
                    <asp:TemplateField>
                        <EditItemTemplate>
                            <asp:Button ID="BtnUpdate" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="BtnCancel" runat="server" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="BtnEdit" runat="server" CommandName="Edit" Text="Edit" />
                            <asp:Button ID="BtnDelete" runat="server" CommandName="Delete" Text="Delete" />
                        </ItemTemplate>
                        </asp:TemplateField> 
                    
            </Columns>
</asp:GridView>
                    <br />
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </center>
        </asp:Panel>
    </div>
</asp:Content>

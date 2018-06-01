<%@ Page Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="InsertCity.aspx.cs" Inherits="InsertCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .cont {
            padding: 2%;
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="cont">
        &nbsp;
        <asp:Panel ID="Panel1" runat="server" CssClass="back">
            <center><b>Insert City </b>
            <br /> 
                <br /> 
                Name: <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblCountry" runat="server" Text="Country:"></asp:Label>
                <asp:DropDownList ID="DdlCtry" runat="server" AppendDataBoundItems="true">
                    <asp:ListItem Text="Select Country" Value="" />
                </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="BtnSubmitCity" runat="server" OnClick="BtnSubmitCity_Click" class="viws" Text="Submit" />
                </center>
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server" CssClass="back">
            <center>
                <asp:Label ID="LblSearch" runat="server" Text="&lt;b&gt;Search Cities&lt;/b&gt;"></asp:Label><br />
                <br />
                <asp:Label ID="LblNameU" runat="server" Text="Name Of City:"></asp:Label>
                <asp:TextBox ID="TxtNameU" runat="server"></asp:TextBox><br /><br />
                <asp:Button ID="BtnSearch" runat="server" OnClick="BtnSearch_Click" class="viws" Text="Search" />
                    <br /><br /> 
                
                <asp:GridView ID="gridView" runat="server" DataKeyNames="Id" onrowediting="gridView_RowEditing"
        onrowupdating="gridView_RowUpdating" AutoGenerateColumns="false" HeaderStyle-Font-Bold="true"
                      OnPageIndexChanging="gridView_PageIndexChanging" 
                    OnRowCancelingEdit="gridView_RowCancelingEdit" OnRowDeleting="gridView_RowDeleting" >
                <Columns>
                <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="lblId" runat="server" Text='<%#Eval("Id") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtId" Width="30px" runat="server" Text='<%#Eval("Id") %>' />
                        </EditItemTemplate>
                    </asp:TemplateField> 
                    <asp:TemplateField HeaderText="Name Of City">
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("NameOfCity") %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" Width="30px" runat="server" Text='<%#Eval("NameOfCity") %>' />
                        </EditItemTemplate>
                 </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country">
                        <ItemTemplate>
                            <asp:Label ID="LblCountry" runat="server" Text='<%#Eval("CountryName") %>' />
                        </ItemTemplate>
                        
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


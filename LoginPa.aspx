<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPageA.master" CodeFile="LoginPa.aspx.cs" Inherits="LoginPa" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
            #demo{
        width: 100%;
        opacity: 0.8;
        filter: alpha(opacity=50);
        position:fixed; 
        left: 0px;
        z-index:-1;
        top: -20px;
        }
            .twrap{
              width: 100%;
              height: 100%;
              margin: 0;
              padding: 0;
              
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
            //  position: absolute;
          }
            *{
                font-family: 'Open Sans',Verdana;// Calibri;
                color: white;
            }
            .pnl {
            //margin:auto;
            float: right;
            display: block;
            margin-top:3%;
            margin-right: 5%;
            background: rgba(28, 51, 89,0.5) ;
            color: black;
            top: 0px;
            border-radius: 5px;
           
        }
         .mainbox{
            padding:2%;
            //border: 2px solid #1a5f89;
        }
            
           
            
            .auto-style3 {
                width: 100%;
                margin-left:7%;
                margin-right: 7%;
            }
            .viws {
            background-color:#d6833e;// #d87f34;//#006699;
            text-decoration: none;
            border: none;
            font-family: "Helvetica Netrue", Helvetica, Arial, sans-serif;
            border: 2px solid #006699;
            font-size: 18px;
            font-style: normal;
            font-variant: normal;
            padding: 3%;
            color: white;
            align-items:center;
            margin: 1%;
        }
            
            .auto-style5 {
                float: left;
                left: -73px;
                top: -74px;
            }
            .tdwid{
                width: 40%;
            }
                        
        </style>
        
        
        </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>

        <img id="demo" src="\flight1.jpg" class="auto-style5"  />
        <asp:Panel ID="Panel0" Width="40%" runat="server" CssClass="pnl">
            <div class="mainbox">
                <br />
                <asp:Panel ID="Panel1" runat="server"  Visible="false">
                    <ajaxToolkit:FilteredTextBoxExtender ID="txtPhone_FilteredTextBoxExtender" runat="server" BehaviorID="txtPhone_FilteredTextBoxExtender" TargetControlID="txtPhone" ValidChars="0123456789" />
                    <%--<ajaxToolkit:PasswordStrength ID="TxtPwd_PasswordStrength" runat="server" BehaviorID="TxtPwd_PasswordSength" MinimumUpperCaseCharacters="1" PreferredPasswordLength="6" RequiresUpperAndLowerCaseCharacters="true" TargetControlID="TxtPwd" />--%>

                    <table class="auto-style3">
                        <tr>
                            <td style="font-size: large; font-family: Calibri;"><strong>Signup</strong></td>
                        
                        </tr>
                            <tr>
                        <td class="tdwid"><asp:Label ID="LblFName" runat="server" Text="First Name"></asp:Label></td>
                            
                           <td>     <asp:TextBox ID="txtFName" runat="server" ForeColor="Black" required></asp:TextBox></td>
                                </tr>
                        
                        <tr>
                            <td>
                                <asp:Label ID="LblLName" runat="server" Text="Last Name"></asp:Label></td>
                            
                             <td>   <asp:TextBox ID="txtLName" runat="server" ForeColor="Black"></asp:TextBox></td>
                        
                        </tr>
                        <tr>
                            
                              <td> <asp:Label ID="LblEmail" runat="server" Text="Email Address"></asp:Label></td>
                            
                               <td> <asp:TextBox ID="txtEmail" runat="server" ForeColor="Black" TextMode="Email" required></asp:TextBox></td>
                        
                        </tr>    
                                               <tr>                        
                               <td><asp:Label ID="Label4" runat="server" Text="Phone Number"></asp:Label></td> 
                            
                                <td> <asp:TextBox ID="txtPhone" runat="server" ForeColor="Black" required></asp:TextBox>
                                    <br />
                                    <asp:Label ID="lblPh" runat="server" Visible="False" Font-Size="Small"></asp:Label>
                                                   </td> 

                        </tr>
                        <tr>
                            
                                <td> <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label></td> 
                            
                                <td> <asp:TextBox ID="txtPwd" TextMode="Password" runat="server" ForeColor="Black" required></asp:TextBox>
                                    <br />
                                    <asp:Label ID="lblPwd" runat="server" Font-Size="Small"></asp:Label>
                        </td> 
                        </tr> 
                        <tr>                            
                            <td>     <asp:Label ID="lblCtry" runat="server" Text="Country"></asp:Label></td> 
                            
                              <td>   <asp:DropDownList ID="ddlCtry" runat="server" AppendDataBoundItems="true" ForeColor="Black">
                                    <asp:ListItem Text="Select Country" Value="" />
                                </asp:DropDownList></td> 
                            
                        
                        </tr>
                        <tr><td>
                            
                                <asp:RadioButtonList ID="rbGender" runat="server" RepeatDirection="Horizontal" Width="238px" ForeColor="Black" Height="32px">
                                    <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                    <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            
                        </tr>
                        <tr>
                            
                           <td>   <asp:Button ID="BtnSignUp" CssClass="viws" runat="server" OnClick="BtnSignUp_Click" Text="Sign Up" />
                        </td>  
                        
                            </tr>
                            <tr>
                            <td colspan="2">    <asp:Label ID="lblSignUpDup" runat="server"></asp:Label></td>
                            
                        </tr>
                        
                        <tr>
                         <td colspan="2">   <asp:Label ID="lblSignUp" runat="server"></asp:Label></td>
                        </tr>
                    </table>
                </asp:Panel>

        <asp:Panel ID="Panel2" runat="server" Visible="true" CssClass="twrap">
            
            <table style="margin-left: 15%; display:block">
                <tr>
                    <td style="font-size: large;padding: 2%" >Sign in
                    
                </td>
                    </tr>
                <tr>
                    <td >
                        <asp:Label ID="lblEmailI" runat="server" Text="Email Address"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmailI" runat="server" ForeColor="Black" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td >
                        <asp:Label ID="lblPwsI" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                    
                        <asp:TextBox ID="txtPwdI" runat="server" Textmode="Password" ForeColor="Black"></asp:TextBox></td>
                       <td> <asp:Label ID="lblPwdIn" runat="server"></asp:Label></td>
                  </tr>  
                
                <tr>
                    <td >
                        <asp:Button ID="BtnSignIn" CssClass="viws" runat="server" OnClick="BtnSignIn_Click" Text="Sign In"/>
                    
                </td>
                    </tr>
                <tr>
                    <td colspan="3" class="auto-style4">New User?<asp:LinkButton ID="btnNewAc" runat="server" style="color:cornflowerblue" OnClick="newuser">Create a new account</asp:LinkButton>
                    </td>
                    </tr>
                <tr>
                      <td>  <asp:Label ID="lblSignIn" runat="server"></asp:Label></td>
                       
                   </tr>
                
            </table>
        </asp:Panel>


    </div>

    </asp:Panel>
        </div>
        
</asp:Content>
    

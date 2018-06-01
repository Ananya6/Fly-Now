<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageA.master" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
           * {
             box-sizing: border-box;
             //color: white;
             font-family: 'Open Sans',Verdana;
         }
        
        #demo{
        width: 100%;
        opacity: 0.8;
        filter: alpha(opacity=50);
        position:fixed; 
        left: 0px;
        z-index: -1;
        border-bottom: 10px solid rgba(28, 51, 89,0.5);
        }
        
        .pnl {
            //margin:auto;
            float: right;
            display: block;
            margin-top: 1%;
            margin-right: 3%;
            background: rgba(28, 51, 89,0.6) ;
            color: black;
            top: 0px;
            border-radius: 5px;
        }
        
        .ftbox{
            display: inline-block;
            width: 48%;
            padding-bottom: 2%;
            padding-left: 5%;
        }
        .mainbox{
            padding-bottom:2%;
            padding-left:4%;
            padding-right: 4%;
            padding-top: 2%;
            //border: 2px solid #1a5f89;
            
        }
       
         .mem{
             display: block;
             width: 48%;
            clear: both;
            padding-bottom: 2%;
            padding-left: 5%;
        } 
         .hd{
             text-align:center; 
              font-size:larger; 
              font-weight: 500;
              //font-family: "Helvetica Netrue", Helvetica, Arial, sans-serif;
              color: white;
             // text-shadow: 2px 2px white;
         }
         .acebox{
            display: inline-block;
            padding-bottom: 4%;
            padding-left: 5%;
            width: 32%;
         }
        .bsearch {
            margin: auto;
            display: block;
            background-color:rgb(244, 162, 92);// rgb(244, 165, 104);// rgb(244, 170, 92);//#6496c8;
            // #8e8989;
            font-family: "Helvetica Netrue", Helvetica, Arial, sans-serif;
            
            box-shadow: 3px 3px 1px #ccd6e5 ;
            //#27496d;
            font-size: 18px;
            font-style: normal;
            font-variant: normal;
            padding: 2%;
            color: white;
            text-shadow: -1px 1px #417cb8;
        }

         .bsearch:hover{
             background-color: #417cb8;
         }
         .bserach:active{
             background-color: #417cb8;
          box-shadow: 0 3px #27496d;
         transform: translateY(2px);
         }
        .popup {
    position: relative;
    display: inline-block;
    cursor: pointer;
    width: 70%;
    height: 5%;
}

/* The actual popup (appears on top) */
.popup .popuptext {
    visibility: hidden;
    width: 160px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    z-index: 1;
    bottom: 125%;
    left: 50%;
    margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
    content: "";
    
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

/* Toggle this class when clicking on the popup container (hide and show the popup) */
.popup .show {
    visibility: visible;
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
    from {opacity: 0;} 
    to {opacity: 1;}
}

@keyframes fadeIn {
    from {opacity: 0;}
    to {opacity:1 ;}
}
   
        
        .auto-style5 {
            left: 0px;
            top: 35px;
            vertical-align: middle;
        }
   
        
    </style>
  
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <div style="background-color: #328CC1">

   <img id="demo" src="\flight1.jpg" class="auto-style5"  />
        
        <asp:Panel runat="server" Width="50%" CssClass="pnl">
           
            <div class="mainbox">
                 <p class="hd"> Book Domestic and International Flights</p>
            <div class="ftbox">
            <dl><asp:Label ID="LblFrom" runat="server" Text="From" ToolTip="From city" ForeColor="White" ></asp:Label>
            <dt>
               
             <asp:DropDownList ID="DdlFrom" runat="server" Width="70%" AppendDataBoundItems="true" required Height="24px">
                     <asp:ListItem Text="Select City" Value="" />
                </asp:DropDownList>
                   
                </dt>
            </dl>
                </div>
            <div class="ftbox">
            <dl><asp:Label ID="LblTo" runat="server" Text="To" ToolTip="To City" ForeColor="White"></asp:Label>
                <dt>
                     
                    <asp:DropDownList ID="DdlTo" runat="server" Width="70%" AppendDataBoundItems="true" required Height="24px" >
                     <asp:ListItem Text="Select City" Value="" />
                </asp:DropDownList>
                          
                </dt>
                </dl>
            </div>
                <div class="mem">
            <dl><asp:Label ID="LblDate" runat="server" Text="Depart On" ToolTip="Departure Date" style="float:left" ForeColor="White"></asp:Label>
                
                <dt><br />
                 <asp:TextBox ID="TxtDate" runat="server" required></asp:TextBox>
                 <ajaxToolkit:CalendarExtender ID="TxtDate_CalendarExtender" runat="server" BehaviorID="TxtDate_CalendarExtender" TargetControlID="TxtDate" Format="dddd, dd MMMM" />
                </dt>
            </dl>
            </div>
                <div class="acebox" width: "30%">
            <dl><asp:Label ID="LblAdult" runat="server" Text="Adults" ForeColor="White"></asp:Label>
                <dt><asp:DropDownList ID="DdlAdult" runat="server" Width="70%" ForeColor="Black" Height="24px">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                </asp:DropDownList>
                </dt>
                </dl>
            </div>
                <div class="acebox" width:30%>
            <dl><asp:Label ID="LblChild" runat="server" Text="Children" ToolTip="(2-12yrs)" ForeColor="White"></asp:Label>
                <dt ><asp:DropDownList ID="DdlChild" runat="server" Width="70%" ForeColor="Black" Height="24px">
                    <asp:ListItem>0</asp:ListItem>
                    <asp:ListItem>1</asp:ListItem>
                   
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                </asp:DropDownList>
                </dt>
                </dl>
            </div>
                 <div class="acebox" width:30%>
            <dl><asp:Label ID="LblInfant" runat="server" Text="Infants" ToolTip="(0-2yrs)" ForeColor="White"></asp:Label>
                <dt><asp:DropDownList ID="DdlInfant" runat="server" Width="70%" ForeColor="black" Height="24px" >
                    <asp:ListItem >0</asp:ListItem>
                    <asp:ListItem >1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                </asp:DropDownList>
                </dt>
                </dl>
            </div>
                <asp:Button ID="BtnSearch" runat="server" Text="Search Flights" class="bsearch" Font-Bold="true" OnClick="BtnSearch_Click"  />
                 <asp:Label ID="lblSameCity" runat="server" ForeColor="#66ccff" style="text-align: center; margin-left: 6%; margin-top: 2%"></asp:Label>
                 <br />
                </div>
        </asp:Panel>
        </div>
    <script type="text/javascript">
        function myFunction() {
            var popup = document.getElementById("myPopup");
            var de = document.getElementById('<%=DdlFrom.ClientID%>');
            var or = document.getElementById'<%=DdlFrom.ClientID%>');
                       
            
            if (or.valtrue == de.valtrue) {
                popup.classList.toggle("show");

            }
        }

    </script>

</asp:Content>


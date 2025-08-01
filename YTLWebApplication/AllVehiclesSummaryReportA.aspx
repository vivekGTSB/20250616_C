﻿<%@ Page Language="VB" AutoEventWireup="false"
    Inherits="YTLWebApplication.AllVehiclesSummaryReportA" Codebehind="AllVehiclesSummaryReportA.aspx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>All Vehicles Summary Report</title>
    <style type="text/css">
         @import "cssfiles/demo_page.css";
        @import "cssfiles/demo_table_jui.css";
        @import "cssfiles/themes/redmond/jquery-ui-1.8.4.custom.css";

    </style>
    <style type="text/css">
        #fw_container
        {
            width: 100%;
        }
        table.display td
        {
            padding: 2px 2px;
        }
        button {
	cursor: pointer;

}
a.button:active
{
	border-color: #4B8DF8;
}
 a.button:hover
 {
 	color:White;
	
	border: 1px solid #2F5BB7 !important;
	
	background: #3F83F1;
	background: -webkit-linear-gradient(top, #4D90FE, #357AE8);
	background: -moz-linear-gradient(top, #4D90FE, #357AE8);
	background: -ms-linear-gradient(top, #4D90FE, #357AE8);
	background: -o-linear-gradient(top, #4D90FE, #357AE8);
	
 }
a.button
{
	text-align:center;
	font: bold 11px Helvetica, Arial, sans-serif;
	cursor: pointer;
	
	
	display: inline-block;
	width:74px;
	border: 1px solid #3079ED !important;
	color:White;
	height:14px;

	background: #4B8DF8;
	background: -webkit-linear-gradient(top, #4C8FFD, #4787ED);
	background: -moz-linear-gradient(top, #4C8FFD, #4787ED);
	background: -ms-linear-gradient(top, #4C8FFD, #4787ED);
	background: #4B8DF8;
	
	-webkit-transition: border .20s;
	-moz-transition: border .20s;
	-o-transition: border .20s;
	transition: border .20s;
	margin: 5px;
	padding: 3px 5px 5px 3px;
}
    </style>
      <link type="text/css" href="cssfiles/jquery-ui.css" rel="stylesheet" />
    <link href="cssfiles/css3-buttons.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" language="javascript" src="jsfiles/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="jsfiles/jquery-ui.js"></script>
    <script type="text/javascript" language="javascript" src="jsfiles/jquery.dataTables.js"></script>
    <script type="text/javascript" language="javascript">
     function getWindowHeight() { if (window.self && self.innerHeight) { return self.innerHeight; } if (document.documentElement && document.documentElement.clientHeight) { return document.documentElement.clientHeight; } return document.documentElement.offsetHeight; }

     function fnFeaturesInit() {
		      
		        $('ul.limit_length>li').each(function (i) {
		            if (i > 10) {
		                this.style.display = 'none';
		            }
		        });

		        $('ul.limit_length').append('<li class="css_link">Show more<\/li>');
		        $('ul.limit_length li.css_link').click(function () {
		            $('ul.limit_length li').each(function (i) {
		                if (i > 5) {
		                    this.style.display = 'list-item';
		                }
		            });
		            $('ul.limit_length li.css_link').css('display', 'none');
		        });
		    }
             
        $(function () {
            if ("<%=uid %>" == "1618" || "<%=uid %>" == "1933" || "<%=uid %>" == "6835") {
                    $("#txtBeginDate").datepicker({ dateFormat: 'yy/mm/dd', minDate: new Date(2017, 00, 01), maxDate: -1, changeMonth: true, changeYear: true, numberOfMonths: 2
		             });
                     $("#txtEndDate").datepicker({ dateFormat: 'yy/mm/dd', minDate: new Date(2017, 00, 01), maxDate: -1, changeMonth: true, changeYear: true, numberOfMonths: 2
		             });
                }
            else {
                    $("#txtBeginDate").datepicker({ dateFormat: 'yy/mm/dd', minDate: -180, maxDate: -1, changeMonth: true, changeYear: true, numberOfMonths: 2
		             });
                     $("#txtEndDate").datepicker({ dateFormat: 'yy/mm/dd', minDate: -180, maxDate: -1, changeMonth: true, changeYear: true, numberOfMonths: 2
		             });
                  }
      		       
                  var h = getWindowHeight() - 400  + "px";

                 fnFeaturesInit();
		        var oTable=$('#mygrid').dataTable({
		            "bJQueryUI": true,
		            "sPaginationType": "full_numbers",
                    "iDisplayLength": 200,
                    "bScrollCollapse": true,  
                    "aLengthMenu": [ 10,25,50,100,200,500 ],
                    
                    "aaSorting": [[1, "asc"]],
                    "fnDrawCallback": function (oSettings) {
                       if (oSettings.bSorted || oSettings.bFiltered) {
                        if (oSettings.aoColumns[0].bVisible == true) {
                            for (var i = 0, iLen = oSettings.aiDisplay.length; i < iLen; i++) {
                                $('td:eq(0)', oSettings.aoData[oSettings.aiDisplay[i]].nTr).html(i + 1);
                            }
                        }
                    }
                },
              "aoColumnDefs": [
               { "bSortable": false, "aTargets": [ 0 ] },
      { "asSorting": [ "asc","desc" ], "aTargets": [ 1 ] },
       { "asSorting": [ "asc","desc" ], "aTargets": [ 2 ] },
        { "asSorting": [ "asc","desc" ], "aTargets": [ 3 ] },
         { "asSorting": [ "desc","asc" ],"aTargets": [ 4 ] },
         { "asSorting": [ "desc","asc" ], "aTargets": [ 5 ] },
           { "asSorting": [ "desc","asc" ], "aTargets": [ 6] },
            { "asSorting": [ "desc","asc" ], "aTargets": [ 7] },
             { "asSorting": [ "desc","asc" ], "aTargets": [ 8 ] },
              { "asSorting": [ "desc","asc" ], "aTargets": [ 9 ] },
               { "asSorting": [ "desc","asc" ], "aTargets": [ 10 ] },
                { "asSorting": [ "desc","asc" ], "aTargets": [ 11 ] },
                 { "asSorting": [ "desc","asc" ], "aTargets": [ 12 ] },
                  { "asSorting": [ "desc","asc" ], "aTargets": [ 13 ] },
                   { "asSorting": [ "desc","asc" ], "aTargets": [ 14 ] },
                     { "asSorting":  [ "desc","asc" ], "aTargets": [ 15 ] },
                       { "asSorting":  [ "desc","asc" ], "aTargets": [ 16 ] }
                   
        
    ]
                              
                              
                     });
 		         
                 });
     

var ec=<%=ec %>;

function treeViewCheck(e)
{
// obj gives us the node on which check or uncheck operation has performed 

var obj;

obj = e.target || e.srcElement;

var treeNodeFound = false; 

var checkedState; 

//checking whether obj consists of checkbox or not 

if (obj.tagName == "INPUT" && obj.type == "checkbox") {

//easier to read

var treeNode = obj; 

//record the checked state of the TreeNode 

checkedState = treeNode.checked; 

//work our way back to the parent <table> element 

do {

obj = obj.parentElement; 

} while (obj.tagName != "TABLE") 

//keep track of the padding level for comparison with any children 

var parentTreeLevel = obj.rows[0].cells.length; 

var parentTreeNode = obj.rows[0].cells[0]; 

//get all the TreeNodes inside the TreeView (the parent <div>) 

var tables = obj.parentElement.getElementsByTagName("TABLE"); 

//checking for any node is checked or unchecked during operation 

if(obj.tagName == "TABLE") {

// if any node is unchecked then their parent node are unchecked 

if (!treeNode.checked) {

//head1 gets the parent node of the unchecked node 

var head1 = obj.parentElement.previousSibling; 

if(head1.tagName == "TABLE") {

//checks for the input tag which consists of checkbox 

var matchElement1 = head1.getElementsByTagName("INPUT"); 

//matchElement1[0] gives us the checkbox and it is unchecked 

matchElement1[0].checked = false; 

}

else {

head1 = obj.parentElement.previousSibling;

} 

if(head1.tagName == "TABLE") {

//head2 gets the parent node of the unchecked node 

var head2 = obj.parentElement.parentElement.previousSibling; 

if(head2.tagName == "TABLE") {

//checks for the input tag which consists of checkbox 

var matchElement2 = head2.getElementsByTagName("INPUT"); 

matchElement2[0].checked = false; 

}

}

else {

head2 = obj.parentElement.previousSibling;

} 

if(head2.tagName == "TABLE") {

//head3 gets the parent node of the unchecked node 

var head3 = obj.parentElement.parentElement.parentElement.previousSibling; 

if(head3.tagName == "TABLE") {

//checks for the input tag which consists of checkbox 

var matchElement3 = head3.getElementsByTagName("INPUT"); 

matchElement3[0].checked = false; 

}

}

else {

head3 = obj.parentElement.previousSibling;

} 

if(head3.tagName == "TABLE") { 

//head4 gets the parent node of the unchecked node 

var head4 = obj.parentElement.parentElement.parentElement.parentElement.previousSibling; 

if(head4 != null) { 

if(head4.tagName == "TABLE") { 

//checks for the input tag which consists of checkbox 

var matchElement4 = head4.getElementsByTagName("INPUT"); 

matchElement4[0].checked = false; 

}

}

} 

} //end if - unchecked

//total number of TreeNodes 

var numTables = tables.length 

if (numTables >= 1) {

//cycle through all the TreeNodes 

//until we find the TreeNode we checked 

for (i=0; i < numTables; i++) {

if (tables[i] == obj) {

treeNodeFound = true; 

i++;

if (i == numTables) {

//if we're on the last 

//TreeNode then stop 

//return;

break;

}

} 

if (treeNodeFound == true) {

var childTreeLevel = tables[i].rows[0].cells.length; 

//if the current node is under the parent 

//the level will be deeper (greater) 

if (childTreeLevel > parentTreeLevel) { 

//jump to the last cell... it contains the checkbox 

var cell = tables[i].rows[0].cells[childTreeLevel - 1]; 

//set the checkbox to match the checkedState 

//of the TreeNode that was clicked 

var inputs = cell.getElementsByTagName("INPUT"); 

inputs[0].checked = checkedState; 

} 

else { 

//if any of the preceding TreeNodes are not deeper stop 

//return; 

break;

}

} //end if 

}//end for 

} //end if - numTables >= 1

// if all child nodes are checked then their parent node is checked

if (treeNode.checked) {

var chk1 = true;

var head1 = obj.parentElement.previousSibling;

var pTreeLevel1 = obj.rows[0].cells.length;

if(head1.tagName == "TABLE") {

var tbls = obj.parentElement.getElementsByTagName("TABLE");

var tblsCount = tbls.length;

for (i=0; i < tblsCount; i++) {

var childTreeLevel = tbls[i].rows[0].cells.length;

if (childTreeLevel = pTreeLevel1) {

var chld = tbls[i].getElementsByTagName("INPUT");

if (chld[0].checked == false) {

chk1 = false;

break;

}

}

}

var nd = head1.getElementsByTagName("INPUT");

nd[0].checked = chk1;

}

else {

head1 = obj.parentElement.previousSibling;

}

var chk2 = true;

if(head1.tagName == "TABLE") {

var head2 = obj.parentElement.parentElement.previousSibling; 

if(head2.tagName == "TABLE") {

var tbls = head1.parentElement.getElementsByTagName("TABLE");

var pTreeLevel2 = head1.rows[0].cells.length;

var tblsCount = tbls.length;

for (i=0; i < tblsCount; i++) {

var childTreeLevel = tbls[i].rows[0].cells.length;

if (childTreeLevel = pTreeLevel2) {

var chld = tbls[i].getElementsByTagName("INPUT");

if (chld[0].checked == false) {

chk2 = false;

break;

}

}

}

var nd = head2.getElementsByTagName("INPUT");

nd[0].checked = (chk2 && chk1);

}

}

else {

head2 = obj.parentElement.previousSibling;

}

var chk3 = true;

if(head2.tagName == "TABLE") {

var head3 = obj.parentElement.parentElement.parentElement.previousSibling; 

if(head3.tagName == "TABLE") {

var tbls = head2.parentElement.getElementsByTagName("TABLE");

var pTreeLevel3 = head2.rows[0].cells.length;

var tblsCount = tbls.length;

for (i=0; i < tblsCount; i++) {

var childTreeLevel = tbls[i].rows[0].cells.length;

if (childTreeLevel = pTreeLevel3) {

var chld = tbls[i].getElementsByTagName("INPUT");

if (chld[0].checked == false) {

chk3 = false;

break;

}

}

}

var nd = head3.getElementsByTagName("INPUT");

nd[0].checked = (chk3 && chk2 && chk1);

}

}

else {

head3 = obj.parentElement.previousSibling;

}

var chk4 = true;

if(head3.tagName == "TABLE") {

var head4 = obj.parentElement.parentElement.parentElement.parentElement.previousSibling; 

if(head4.tagName == "TABLE") {

var tbls = head3.parentElement.getElementsByTagName("TABLE");

var pTreeLevel4 = head3.rows[0].cells.length;

var tblsCount = tbls.length;

for (i=0; i < tblsCount; i++) {

var childTreeLevel = tbls[i].rows[0].cells.length;

if (childTreeLevel = pTreeLevel4) {

var chld = tbls[i].getElementsByTagName("INPUT");

if (chld[0].checked == false) {

chk4 = false;

break;

}

}

}

var nd = head4.getElementsByTagName("INPUT");

nd[0].checked = (chk4 && chk3 && chk2 && chk1);

}

}

}//end if - checked

} //end if - tagName = TABLE

} //end if
return false;

} //end function


   
   
   function client_OnTreeNodeChecked()
    {
        var obj = window.event.srcElement;
        var treeNodeFound = false;
        var checkedState;
        if (obj.tagName == "INPUT" && obj.type == "checkbox") 
        {
            var treeNode = obj;
            checkedState = treeNode.checked;
            do
            {
                obj = obj.parentElement;
            } while (obj.tagName != "TABLE")
            
            var parentTreeLevel = obj.rows[0].cells.length;
            var parentTreeNode = obj.rows[0].cells[0];
            var tables = obj.parentElement.getElementsByTagName("TABLE");
            var numTables = tables.length
            if (numTables >= 1)
            {
                for (i=0; i < numTables; i++)
                {
                    if (tables[i] == obj)
                    {
                        treeNodeFound = true;
                        i++;
                        if (i == numTables)
                        {
                            return;
                        }
                    }
                    if (treeNodeFound == true)
                    {
                        var childTreeLevel = tables[i].rows[0].cells.length;
                        if (childTreeLevel > parentTreeLevel)
                        {
                            var cell = tables[i].rows[0].cells[childTreeLevel - 1];
                            var inputs = cell.getElementsByTagName("INPUT");
                            inputs[0].checked = checkedState;
                        }
                        else
                        {
                            return;
                        }
                    }
                }
            }
        }
    }
 

    function CheckBoxListSelect(cbControl, state)
    {    
       var chkBoxList = document.getElementById(cbControl);
        var chkBoxCount= chkBoxList.getElementsByTagName("input");
        for(var i=0;i<chkBoxCount.length;i++) 
        {
            chkBoxCount[i].checked = state;
        }
        
        return false; 
    }

function mysubmit() 
{
   
    var bigindatetime=document.getElementById("txtBeginDate").value+" 00:00:00";
    var enddatetime=document.getElementById("txtEndDate").value+" 23:59:59";
    
    var fdate=Date.parse(bigindatetime);
    var sdate=Date.parse(enddatetime);
    
    var diff=(sdate-fdate)*(1/(1000*60*60*24));
    var days=parseInt(diff)+1;
    if(days>60)
    {
    alert("You cannot select more than 60 days of data.");
        return false;
    }
    else if(days>15){
        return confirm("You selected " +days +" days of data.So it will take more time to execute.\nAre you sure you want to proceed ? ");

    }
    return true;
}
function ExcelReport()
{
    if(ec==true)
    {
        var excelformobj=document.getElementById("excelform");
        excelformobj.submit();
    }
    else
    {
        alert("First click submit button");
    }
}
function Change(id) {
    if (id=="day") {
    document.getElementById("txtBeginDate").disabled="";
     document.getElementById("DropDownList1").disabled="disabled";        
}
else{
 document.getElementById("txtBeginDate").disabled="disabled";
     document.getElementById("DropDownList1").disabled="";       
}
}

function fixit() {
    document.getElementById("title").value="All Vehicles Summary Report from "+ document.getElementById("txtBeginDate").value +" to " + document.getElementById("txtEndDate").value
 
}
    </script>
    <style type="text/css">
        #fut .ui-state-default
        {
            color: Yellow;
            background-image: none;
            background-color: Grey;
        }
    </style>
</head>
<body style="margin-left: 5px; margin-top: 0px; margin-bottom: 0px; margin-right: 5px;
    font-size: 13px; font-weight: bold; font-family: Myriad Pro,Lucida Grande,Helvetica,Arial,sans-serif"
    onload="fixit()">
    <form id="Form1" method="post" runat="server">
    <center>
        <div>
        <%= test.ToString()%>
            <br />
            <table>
                <tr>
                    <td align="center">
                        <table style="font-family: Verdana; font-size: 11px;">
                            <tr>
                                <td style="height: 20px; background-color: #465ae8;" align="left">
                                    <b style="color: White;">&nbsp;All Vehicles Summary Report &nbsp;:</b>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 420px; border: solid 1px #3952F9;">
                                    <table style="width: 420px;">
                                        <tbody>
                                            <tr>
                                                <td align="center" colspan="5">
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td align="left">
                                                                <b style="color: #5f7afc;">From</b>&nbsp;:
                                                            </td>
                                                            <td align="left">
                                                                <input id="txtBeginDate" runat="server" enableviewstate="false" name="txtBeginDate"
                                                                    readonly="readonly" style="width: 70px" type="text" value="" />
                                                            </td>
                                                            <td>
                                                                <b style="color: #5f7afc;">To</b>&nbsp;:
                                                            </td>
                                                            <td>
                                                                <input id="txtEndDate" runat="server" enableviewstate="false" name="txtEndDate" readonly="readonly"
                                                                    style="width: 70px" type="text" value="" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <b style="color: #5f7afc;">Plate No </b>
                                                </td>
                                                <td>
                                                    <b style="color: #5f7afc;">:</b>
                                                </td>
                                                <td align="left" colspan="3">
                                                    <asp:Panel ID="Panel1" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"
                                                        Height="200px" ScrollBars="Vertical" Width="280px">
                                                        <asp:TreeView ID="tvPlateno" runat="server" ExpandDepth="0" ForeColor="Black" onclick="treeViewCheck(event);"
                                                            ShowCheckBoxes="All" ShowLines="True">
                                                            <ParentNodeStyle Font-Bold="True" />
                                                            <RootNodeStyle Font-Bold="True" />
                                                            <LeafNodeStyle Font-Italic="True" />
                                                        </asp:TreeView>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr><td></td><td></td><td align ="left" >
                                            <asp:RadioButton ID="rdcumulative" Checked ="true" Text ="Cumulative" 
                                                    runat ="server" GroupName="select"  />
                                            <asp:RadioButton ID="rddetailed"  Text ="Detailed" runat ="server" 
                                                    GroupName="select"  />
                                           
                                            </td></tr>
                                            <tr>
                                                <td align="center">
                                                </td>
                                                <td colspan="4" align="left" >
                                                    <br />
                                                    <asp:Button ID="ImageButton1" class="action blue" runat="server" Text="Submit" ToolTip="Submit" />
                                                    <a href="javascript:ExcelReport();" class="button" style="width:74px;"><span class="ui-button-text" title="Download" />
                                                        Download</a> <a href="javascript:print();" class="button"><span class="ui-button-text"
                                                            title="Print" />Print</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="left">
                    </td>
                </tr>
            </table>
        </div>
    </center>
    &nbsp;<asp:Label ID="Label3" runat="server" Font-Names="Arial" Font-Size="X-Small"
        ForeColor="Red" Text="*  RM/KM will be higher if idling time is too long for the selected period. "
        Visible="False"></asp:Label><br />
    <asp:Label ID="Label2" runat="server" Font-Names="Arial" Font-Size="X-Small" ForeColor="Red"
        Text="** Minimum distance of 50KM is required for effective calculation on RM/KM."
        Visible="False"></asp:Label>
    <div style="background-color: #465AE8; color: White; text-align: center; height: 20px;
        padding-top: 7px;">
        <%= sb1.ToString() %></div>
    <div id="fw_container">
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="mygrid" style="font-size: 10px;
            font-weight: normal; font-family: Myriad Pro,Lucida Grande,Helvetica,Arial,sans-serif">
            <%=sb.ToString()%>
        </table>
    </div>
    </form>
    <form id="excelform" method="get" action="ExcelReport.aspx">
    <input type="hidden" id="title" name="title" value="All Vehicles Summary Report" />
    <input type="hidden" id="plateno" name="plateno" value="" />
    </form>
</body>
</html>

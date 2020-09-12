<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lotmap.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script> 
</head>
<body>
    <h1>Blair and Co. Coding Test</h1>

    <h3> - Stefan Jovanovic</h3>

    <h4 class ="xpos">0</h4>
    <h4 class ="ypos">0</h4>

    <canvas id ="canvas"></canvas>

    <form id="form1" runat="server">
            <div>  
                <table style="width: 50%;">  
                    <tr>  
                        <td class="auto-style1" colspan="3">  
                            <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateSelectButton="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateColumns="False">  
                                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />  
                                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />  
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />  
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />  
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />  
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />  
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />  
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />  
                                <SortedDescendingHeaderStyle BackColor="#93451F" />  
                                <Columns>  
                                    <asp:BoundField DataField="Lot_Number" HeaderText="Lot Number" ItemStyle-Width="20px">  
                                        <ItemStyle Width="20px"></ItemStyle>  
                                    </asp:BoundField>  
                                    <asp:BoundField DataField="xcoordinate" HeaderText="x coord" ItemStyle-Width="20px">  
                                        <ItemStyle Width="20px"></ItemStyle>  
                                    </asp:BoundField>  
                                    <asp:BoundField DataField="ycoordinate" HeaderText="y coord" ItemStyle-Width="20px">  
                                        <ItemStyle Width="20px"></ItemStyle>  
                                    </asp:BoundField>  
                                    <asp:BoundField DataField="availability" HeaderText="avail" ItemStyle-Width="20px">  
                                        <ItemStyle Width="20px"></ItemStyle>  
                                    </asp:BoundField>
                                </Columns>  
                            </asp:GridView>  
                        </td>  
                    </tr>  
                </table>  
            </div> 
    </form>

    <h4 class ="json"></h4>

    <script>
        
        var canvas = document.getElementById("canvas"),
            ctx = canvas.getContext("2d");

        canvas.width = 934;
        canvas.height = 622;
        
        var background = new Image();
        background.src = "lotmap.jpg";

        background.onload = function(){
            ctx.drawImage(background,0,0);   
        }

        canvas.onmousemove = function(e) {

            var pos = getMousePos(this, e), 
                x = pos.x,
                y = pos.y;
            $("h4.xpos").text(x);
            $("h4.ypos").text(y);
        }

        function getMousePos(canvas, e) {
            var rect = canvas.getBoundingClientRect();
            return {x: e.clientX - rect.left, y: e.clientY - rect.top};
        }

        function readyFn() {
            $.ajax({
                type: "POST",
                url: "http://localhost:60888/WebService.asmx/GetJson",
                contentType: "application/xml; charset=utf-8",
                dataType: "xml",
                success: function (data) {
                    console.log(data);

                    var json = $(data).find('string').text();
                    console.log(json);

                    var obj = jQuery.parseJSON(json);

                    var ctx = canvas.getContext('2d');
                    $.each(obj, function (index, value) {
                        console.log(value["xcoordinate"] + " " + value["ycoordinate"]);

                        ctx.beginPath();
                        ctx.rect(value["xcoordinate"], value["ycoordinate"], 10, 10);
                        ctx.fillStyle = "green";
                        ctx.fill();

                    });

                }
            })
            return false;
        }
        
        $(window).on('load', function () {
            readyFn();

        });
        
    </script>
</body>
</html>

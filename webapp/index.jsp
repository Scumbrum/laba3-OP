<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="forms.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Enumeration" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Main page</title>
    </head>
    <body>
    <%!
        double a=1, aEnd=2, aStep=1;
        double b=1, bEnd=2, bStep=1;
        double c=1, cEnd=2, cStep=1;
        double d=1, dEnd=2, dStep=1;
        String task="";
        ArrayList<CountResult> result;
    %>
    <%
        Enumeration<String> attributeNames = request.getAttributeNames();
        while(attributeNames.hasMoreElements()) {
            String attrName = attributeNames.nextElement();
            if (request.getAttribute(attrName) != null) {
                this.a = (Double) request.getAttribute("a");
                this.b = (Double) request.getAttribute("b");
                this.c = (Double) request.getAttribute("c");
                this.d = (Double) request.getAttribute("d");
                this.aStep = (Double) request.getAttribute("aStep");
                this.bStep = (Double) request.getAttribute("bStep");
                this.cStep = (Double) request.getAttribute("cStep");
                this.dStep = (Double) request.getAttribute("dStep");
                this.aEnd = (Double) request.getAttribute("aEnd");
                this.bEnd = (Double) request.getAttribute("bEnd");
                this.cEnd = (Double) request.getAttribute("cEnd");
                this.dEnd = (Double) request.getAttribute("dEnd");
            }
        }

        if(request.getParameter("taskNumber")!=null){
            this.task=(String) request.getAttribute("taskNumber");
        }

    %>
    <% if(request.getAttribute("result")!=null){
        result = (ArrayList<CountResult>) request.getAttribute("result");%>
    <table cellpadding="4" border="2">
        <tr>
            <td>Result</td>
            <td>A</td>
            <td>B</td>
            <td>C</td>
            <td>D</td>
        </tr>
        <% for(CountResult result1 : result) {%>
        <tr>
            <td><%=result1.getResult()%></td>
            <td><%=result1.getA()%></td>
            <td><%=result1.getB()%></td>
            <td><%=result1.getC()%></td>
            <td><%=result1.getD()%></td>
        </tr>
        <% } %>
    </table>
    <hr>
    <br>
    <% } %>
    <br>
        <form action="TaskSolver" method="post">
            <table>
                <tr>
                    <td>
                        <img src="multimedia/task7.png">
                    </td>
                    <td>
                        <img src="multimedia/task8.png">
                    </td>
                    <td>
                        <img src="multimedia/task9.png">
                    </td>
                </tr>
                <tr>
                    <td>
                        <% if(this.task.equals("7")){ %>
                        <input type="radio" name="taskNumber" value="7" checked="checked"> Task7
                        <% } if(!this.task.equals("7")) { %>
                        <input type="radio" name="taskNumber" value="7"> Task7
                        <% } %>
                    </td>
                    <td>
                        <% if(this.task.equals("8")){ %>
                        <input type="radio" name="taskNumber" value="8" checked="checked"> Task8
                        <% } if(!this.task.equals("8")) { %>
                        <input type="radio" name="taskNumber" value="8"> Task8
                        <% } %>
                    </td>
                    <td>
                        <% if(this.task.equals("9")){ %>
                        <input type="radio" name="taskNumber" value="9" checked="checked"> Task9
                        <% } if(!this.task.equals("9")) { %>
                        <input type="radio" name="taskNumber" value="9"> Task9
                        <% } %>
                    </td>
                </tr>
            </table>
            a: from<input   type="text" name="a"     value="<%=a%>" />
                to<input    type="text" name="aEnd"  value="<%=aEnd%>" />
                step<input  type="text" name="aStep" value="<%=aStep%>" /><br>
            b: from<input   type="text" name="b"     value="<%=b%>" />
                to<input    type="text" name="bEnd"  value="<%=bEnd%>" />
                step<input  type="text" name="bStep" value="<%=bStep%>" /><br>
            c: from<input   type="text" name="c"     value="<%=c%>" />
                to<input    type="text" name="cEnd"  value="<%=cEnd%>" />
                step<input  type="text" name="cStep" value="<%=cStep%>" /><br>
            d: from<input   type="text" name="d"     value="<%=d%>" />
                to<input    type="text" name="dEnd"  value="<%=dEnd%>" />
                step<input  type="text" name="dStep" value="<%=dStep%>" /><br>
            <input type="submit" value="Solve task"/>
        </form>
        <br>
        <% if(aStep == 0 || bStep == 0 || cStep == 0 || dStep == 0){  %>
            <h1>Step cannot be 0!</h1>
        <% } %>
        <br>
        <% if(request.getAttribute("isTaskNumberEntered") == "false"){  %>
        <h1>Dont forget to choose task number!</h1>
        <% } %>
    </body>
</html>
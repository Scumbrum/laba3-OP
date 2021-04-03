<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="forms.*" %>
<%@ page import="java.util.ArrayList" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Main page</title>
    </head>
    <body>
    <%!
        double a=0, aEnd=0, aStep=0;
        double b=0, bEnd=0, bStep=0;
        double c=0, cEnd=0, cStep=0;
        double d=0, dEnd=0, dStep=0;
        String task="";
        ArrayList<CountResult> result;
    %>
    <%
        if(request.getAttribute("a")!=null) {
            this.a = (Double) request.getAttribute("a");
        }
        if(request.getAttribute("aEnd")!=null) {
            this.aEnd = (Double) request.getAttribute("aEnd");
        }
        if(request.getAttribute("aStep")!=null) {
            this.aStep = (Double) request.getAttribute("aStep");
        }
        if(request.getAttribute("b")!=null) {
            this.b = (Double) request.getAttribute("b");
        }
        if(request.getAttribute("bEnd")!=null) {
            this.bEnd = (Double) request.getAttribute("bEnd");
        }
        if(request.getAttribute("bStep")!=null) {
            this.bStep = (Double) request.getAttribute("bStep");
        }
        if(request.getAttribute("c")!=null) {
            this.c = (Double) request.getAttribute("c");
        }
        if(request.getAttribute("cEnd")!=null) {
            this.cEnd = (Double) request.getAttribute("cEnd");
        }
        if(request.getAttribute("cStep")!=null) {
            this.cStep = (Double) request.getAttribute("cStep");
        }
        if(request.getAttribute("d")!=null) {
            this.d=(Double) request.getAttribute("d");
        }
        if(request.getAttribute("dEnd")!=null) {
            this.dEnd = (Double) request.getAttribute("dEnd");
        }
        if(request.getAttribute("dStep")!=null) {
            this.dStep = (Double) request.getAttribute("dStep");
        }
        if(request.getParameter("taskNumber")!=null){
            this.task=(String) request.getAttribute("taskNumber");
        }
    %>
    <% if(request.getAttribute("result")!=null){
        result = (ArrayList<CountResult>) request.getAttribute("result");
    %>
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
    <% }
    %>
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
                        <% if(this.task.equals("7")){
                        %>
                        <input type="radio" name="taskNumber" value="7" checked="checked"> Task1
                        <%
                            } if(!this.task.equals("7")) {
                        %>
                        <input type="radio" name="taskNumber" value="7"> Task1
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <% if(this.task.equals("8")){
                        %>
                        <input type="radio" name="taskNumber" value="8" checked="checked"> Task2
                        <%
                        } if(!this.task.equals("8")) {
                        %>
                        <input type="radio" name="taskNumber" value="8"> Task2
                        <%
                            }
                        %>
                    </td>
                    <td>
                        <% if(this.task.equals("9")){
                        %>
                        <input type="radio" name="taskNumber" value="9" checked="checked"> Task3
                        <%
                        } if(!this.task.equals("9")) {
                        %>
                        <input type="radio" name="taskNumber" value="9"> Task3
                        <%
                            }
                        %>
                    </td>
                </tr>
            </table>
            a: from<input type="text" name="a" value="<%=a%>" />
                to<input type="text" name="aEnd" value="<%=aEnd%>" />
                step<input type="text" name="aStep" value="<%=aStep%>" /><br>
            b: from<input type="text" name="b" value="<%=b%>" />
            to<input type="text" name="bEnd" value="<%=bEnd%>" />
            step<input type="text" name="bStep" value="<%=bStep%>" /><br>
            c: from<input type="text" name="c" value="<%=c%>" />
            to<input type="text" name="cEnd" value="<%=cEnd%>" />
            step<input type="text" name="cStep" value="<%=cStep%>" /><br>
            d: from<input type="text" name="d" value="<%=d%>" />
            to<input type="text" name="dEnd" value="<%=dEnd%>" />
            step<input type="text" name="dStep" value="<%=dStep%>" /><br>
            <input type="submit" value="Solve task"/>
        </form>
    </body>
</html>
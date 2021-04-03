import forms.CountResult;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "TaskSolver", value = "/TaskSolver")
public class TaskSolver extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Double a = Double.parseDouble(request.getParameter("a"));
            Double b = Double.parseDouble(request.getParameter("b"));
            Double c = Double.parseDouble(request.getParameter("c"));
            Double d = Double.parseDouble(request.getParameter("d"));
            request.setAttribute("a",a);
            request.setAttribute("b",b);
            request.setAttribute("c",c);
            request.setAttribute("d",d);

            Double aEnd = Double.parseDouble(request.getParameter("aEnd"));
            Double bEnd = Double.parseDouble(request.getParameter("bEnd"));
            Double cEnd = Double.parseDouble(request.getParameter("cEnd"));
            Double dEnd = Double.parseDouble(request.getParameter("dEnd"));
            request.setAttribute("aEnd",aEnd);
            request.setAttribute("bEnd",bEnd);
            request.setAttribute("cEnd",cEnd);
            request.setAttribute("dEnd",dEnd);

            Double aStep = Double.parseDouble(request.getParameter("aStep"));
            Double bStep = Double.parseDouble(request.getParameter("bStep"));
            Double cStep = Double.parseDouble(request.getParameter("cStep"));
            Double dStep = Double.parseDouble(request.getParameter("dStep"));
            request.setAttribute("aStep",aStep);
            request.setAttribute("bStep",bStep);
            request.setAttribute("cStep",cStep);
            request.setAttribute("dStep",dStep);

            String taskNumber = request.getParameter("taskNumber");
            request.setAttribute("taskNumber", taskNumber);

            Counter counter = new Counter(taskNumber);
            ArrayList<CountResult> result = new ArrayList<>();

            for(double a1 = a; a1 <= aEnd; a1 += aStep){
                for(double b1 = b; b1 <= bEnd; b1 += bStep){
                    for(double c1 = c; c1 <= cEnd; c1 += cStep){
                        for(double d1 = d; d1 <= dEnd; d1 += dStep){
                            result.add(new CountResult(a1, b1, c1, d1, counter.count(a1, b1, c1, d1)));
                        }
                    }
                }
            }
            request.setAttribute("result", result);
            RequestDispatcher rd =request.getRequestDispatcher("index.jsp");
            rd.forward(request,response);
        } catch (NumberFormatException e){
        response.sendError(400);
        }

    }
}

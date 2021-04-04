import forms.CountResult;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

@WebServlet(name = "TaskSolver", value = "/TaskSolver")
public class TaskSolver extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response){

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

            ArrayList<Double> params = new ArrayList<>();
            ArrayList<String> attrs = new ArrayList<>();
            Enumeration<String> parameterNames = request.getParameterNames();

            while(parameterNames.hasMoreElements()){
                String paramName = parameterNames.nextElement();
                Double item = Double.valueOf(request.getParameter(paramName));
                request.setAttribute(paramName, item);
                params.add(item);
            }

            for (Double item: params) {
                Object attr = request.getAttribute(String.valueOf(item));
                attrs.add(String.valueOf(attr));
            }

            Double a = Double.valueOf(request.getParameter("a"));
            Double b = Double.valueOf(request.getParameter("b"));
            Double c = Double.valueOf(request.getParameter("c"));
            Double d = Double.valueOf(request.getParameter("d"));

            Double aEnd = Double.valueOf(request.getParameter("aEnd"));
            Double bEnd = Double.valueOf(request.getParameter("bEnd"));
            Double cEnd = Double.valueOf(request.getParameter("cEnd"));
            Double dEnd = Double.valueOf(request.getParameter("dEnd"));

            Double aStep = Double.valueOf(request.getParameter("aStep"));
            Double bStep = Double.valueOf(request.getParameter("bStep"));
            Double cStep = Double.valueOf(request.getParameter("cStep"));
            Double dStep = Double.valueOf(request.getParameter("dStep"));

            if(request.getParameter("taskNumber") != null) {
                request.setAttribute("isTaskNumberEntered", "true");
                String taskNumber = request.getParameter("taskNumber");
                request.setAttribute("taskNumber", taskNumber);

                if(aStep != 0 && bStep != 0 && cStep != 0 && dStep != 0) {
                        Counter counter = new Counter(taskNumber);
                        ArrayList<CountResult> result = new ArrayList<>();
                        for (double a1 = a; a1 <= aEnd; a1 += aStep) {
                            for (double b1 = b; b1 <= bEnd; b1 += bStep) {
                                for (double c1 = c; c1 <= cEnd; c1 += cStep) {
                                    for (double d1 = d; d1 <= dEnd; d1 += dStep) {
                                        result.add(new CountResult(a1, b1, c1, d1, counter.count(a1, b1, c1, d1)));
                                    }
                                }
                            }
                        }
                    request.setAttribute("result", result);
                }
            } else {
                request.setAttribute("isTaskNumberEntered", "false");
            }
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request,response);
        } catch (NumberFormatException e){
            response.sendError(400);
        }

    }
}

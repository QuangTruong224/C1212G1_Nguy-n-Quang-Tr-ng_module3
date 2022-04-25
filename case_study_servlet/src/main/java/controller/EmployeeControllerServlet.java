package controller;

import model.customer.Customer;
import model.customer.CustomerType;
import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import service.customer.CustomerService;
import service.employee.DivisionService;
import service.employee.EducationDegreeService;
import service.employee.EmployeeService;
import service.employee.PositionService;
import service.employee.impl.DivisionServiceImpl;
import service.employee.impl.EducationServiceImpl;
import service.employee.impl.EmployeeServiceImpl;
import service.employee.impl.PositionServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeControllerServlet", urlPatterns = {"/employees"})
public class EmployeeControllerServlet extends HttpServlet {
    EmployeeService employeeService = new EmployeeServiceImpl();
    DivisionService divisionService = new DivisionServiceImpl();
    EducationDegreeService educationDegreeService = new EducationServiceImpl();
    PositionService positionService = new PositionServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "update":
                showUpdate(request, response);
                break;

            default:
                listEmployee(request, response);
                break;
        }


    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    insertEmployee(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "update":
                updateEmployee(request, response);
                break;
            case "delete":
                try {
                    deleteEmployee(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "search2":
                    searchEmployee(request, response);
                break;
        }
    }


    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer employeeId = Integer.valueOf(request.getParameter("employeeId"));
        String employeeName = request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        Double employeeSalary = Double.valueOf(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAdress = request.getParameter("employeeAdress");
        Integer positionId = Integer.valueOf(request.getParameter("positionId"));
        Integer educationDegreeId = Integer.valueOf(request.getParameter("educationDegreeId"));
        Integer divisionId = Integer.valueOf(request.getParameter("divisionId"));
        Employee employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary, employeePhone, employeeEmail
                , employeeAdress, positionId, educationDegreeId, divisionId
        );
        try {
            employeeService.update(employee);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
//        Integer employeeId, String employeeName, String employeeBirthday, String employeeIdCard,
//        Double employeeSalary, String employeePhone, String employeeEmail, String employeeAdress,
//        Integer positionId, Integer educationDegreeId, Integer divisionId
        String employeeName = request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        Double employeeSalary = Double.valueOf(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAdress = request.getParameter("employeeAdress");

        Integer positionId = Integer.valueOf(request.getParameter("positionId"));
        Integer educationDegreeId = Integer.valueOf(request.getParameter("educationDegreeId"));
        Integer divisionId = Integer.valueOf(request.getParameter("divisionId"));

        Employee employee = new Employee(employeeName, employeeBirthday, employeeIdCard, employeeSalary, employeePhone, employeeEmail
                , employeeAdress, positionId, educationDegreeId, divisionId
        );
       Map<String,String> map=employeeService.insertEmployee(employee);

        if (map.isEmpty()) {
            request.setAttribute("mess", "Thêm mới thành công");
            this.listEmployee(request,response);
        } else {
            List<Division> divisionList = divisionService.selectAll();
            List<EducationDegree> educationDegreeList = educationDegreeService.selectAll();
            List<Position> positionList = positionService.selectAll();
            request.setAttribute("divisionList", divisionList);
            request.setAttribute("educationDegreeList", educationDegreeList);
            request.setAttribute("positionList", positionList);
            request.setAttribute("error", map);
//            requestDispatcher = request.getRequestDispatcher("/view/employee/create.jsp");
            RequestDispatcher dispatcher= request.getRequestDispatcher("/view/employee/create.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        }
       
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        Integer employeeId = Integer.parseInt(request.getParameter("employeeId"));
        employeeService.delete(employeeId);

        List<Employee> employeeList = employeeService.selectAllEmployee();
        List<Division> divisionList = divisionService.selectAll();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAll();
        List<Position> positionList = positionService.selectAll();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("positionList", positionList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }


    private void listEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = employeeService.selectAllEmployee();
        List<Division> divisionList = divisionService.selectAll();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAll();
        List<Position> positionList = positionService.selectAll();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("positionList", positionList);


        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/list.jsp");
        dispatcher.forward(request, response);
    }


    private void showUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer employeeId = Integer.parseInt(request.getParameter("employeeId"));
        List<Division> divisionList = divisionService.selectAll();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAll();
        List<Position> positionList = positionService.selectAll();
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("positionList", positionList);
        Employee employee = employeeService.selectEmployee(employeeId);
        request.setAttribute("employee", employee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = employeeService.selectAllEmployee();
        List<Division> divisionList = divisionService.selectAll();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAll();
        List<Position> positionList = positionService.selectAll();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("positionList", positionList);
        System.out.println(employeeList.size());
        System.out.println(divisionList.size());
        System.out.println(educationDegreeList.size());
        System.out.println(positionList.size());
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/create.jsp");
//        this.listEmployee(request, response);
        dispatcher.forward(request, response);
    }

//    private void searchEmployeeByName(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
//        String searchName = request.getParameter("searchName");
//        List<Employee> employeeList = employeeService.searchEmployeeByName(searchName);
//        List<Position> positionList = positionService.selectAll();
//        List<EducationDegree> educationDegreeList = educationDegreeService.selectAll();
//        List<Division> divisionList = divisionService.selectAll();
//        request.setAttribute("employeeList", employeeList);
//        request.setAttribute("positionList", positionList);
//        request.setAttribute("educationDegreeList", educationDegreeList);
//        request.setAttribute("divisionList", divisionList);
//        request.getRequestDispatcher("view/employee/list.jsp").forward(request, response);
//    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchName = request.getParameter("searchName");
        String searchAddress = request.getParameter("searchAdress");
        String searchDivision = request.getParameter("searchDivision");
        List<Employee> employeeList = employeeService.searchEmployee(searchName, searchAddress, searchDivision);
        System.out.println(employeeList);
        List<Position> positionList = positionService.selectAll();
        List<EducationDegree> educationDegreeList = educationDegreeService.selectAll();
        List<Division> divisionList = divisionService.selectAll();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionList", positionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("divisionList", divisionList);
        request.getRequestDispatcher("view/employee/list.jsp").forward(request, response);
    }
}




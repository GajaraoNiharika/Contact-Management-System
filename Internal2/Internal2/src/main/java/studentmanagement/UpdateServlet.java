package studentmanagement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //HttpSession session = request.getSession();
        String rollNumber = request.getParameter("studentId");
        System.out.println(rollNumber);
        
        String name = request.getParameter("name");
        
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
       

        String url = "jdbc:mysql://localhost:3306/contactdb";
        String username = "root";
        String password = "9490";

        try (Connection conn = DriverManager.getConnection(url, username, password)) {
            String sql = "UPDATE contact SET name=?, email=?, phone_number=?, address=? WHERE contact_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            
            ps.setString(1, name);
           
            ps.setString(2, email);
            ps.setString(3, phoneNumber);
            ps.setString(4, address);
            ps.setString(5, rollNumber);
           

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("viewStudents.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}


package Servlet;

import Config.OpcionesServicio;
import Modelos.serGenerados;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControlServicios extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String terminal = request.getParameter("term");
            String moto = request.getParameter("moto");
            String lloyd = request.getParameter("lloyd");
            String uvi = request.getParameter("uvi");
            String referencia = request.getParameter("referencia");
            String muelle = request.getParameter("muelle");
            String grua = "";
            String grua1 = request.getParameter("grua1");
            String grua2 = request.getParameter("grua2");
            String grua3 = request.getParameter("grua3");
            String grua4 = request.getParameter("grua4");
            String fechaCita = request.getParameter("fechaCita");
            String horaCita = request.getParameter("horaCita");
            String hrsOp = request.getParameter("horasOp");
            String fechaFinal = request.getParameter("fechaFinal");
            String horaFinal = request.getParameter("horaFinal");
            String servicio = request.getParameter("servicio");
            
            grua += grua1;
            
            if(!grua2.equalsIgnoreCase("N/A")){
                grua += " "+grua2;
                if(!grua3.equalsIgnoreCase("N/A")){
                    grua += " "+grua3;
                    if(!grua4.equalsIgnoreCase("N/A")){
                        grua += " "+grua4;
                    }
                }
            }

            String opc = request.getParameter("opc");

            serGenerados ser = new serGenerados(terminal, moto, lloyd, uvi, referencia, muelle, grua, fechaCita, horaCita, hrsOp, fechaFinal, horaFinal, servicio);

            try {

                if (opc.equalsIgnoreCase("agregar")) {
                    OpcionesServicio.Insertar(ser);
                    response.sendRedirect("Vistas/Analista/menuAnalista.jsp?val=correcto");
                }

                if (opc.equalsIgnoreCase("mod")) {
                    OpcionesServicio.Actualizar(ser);
                    response.sendRedirect("Vistas/Analista/menuAnalista.jsp?valMod=correcto");
                }

            } catch (ClassNotFoundException | SQLException e) {
                System.out.println("ERROR: " + e);
                response.sendRedirect("Analista/menuAnalista.jsp?val=error");
            }

        } catch (Exception e) {
            System.out.println("ERROR: " + e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

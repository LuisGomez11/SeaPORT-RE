
package Servlet;

import Config.OpcionesProveedor;
import Modelos.Proveedores;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControlProveedores extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String nombre = request.getParameter("nombre");
            String telefono = request.getParameter("telefono");
            String movil = request.getParameter("movil");
            String correo = request.getParameter("correo");
            String nit = request.getParameter("nit");
            int cantTra = Integer.parseInt(request.getParameter("cantTra"));
             
            String opc = request.getParameter("opc");
            
            Proveedores pro = new Proveedores(nombre, telefono, movil, correo, nit, cantTra);
            
            try {

                if (opc.equalsIgnoreCase("agregar")) {
                    OpcionesProveedor.Insertar(pro);
                    response.sendRedirect("Vistas/Seleccionador/menuSeleccionador.jsp?val=correcto");
                }
                
                if(opc.equalsIgnoreCase("mod")){
                    int cod = Integer.parseInt(request.getParameter("cod"));
                    OpcionesProveedor.Actualizar(pro, cod);
                    response.sendRedirect("Vistas/Seleccionador/menuSeleccionador.jsp?valMod=correcto");
                }

            } catch (ClassNotFoundException | SQLException e) {
                response.sendRedirect("Seleccionador/menuSeleccionador.jsp?val=error");
            }
            
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

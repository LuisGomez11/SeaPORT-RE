
package Servlet;

import Config.OpcionesGenerados;
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
            
            int id_moto, id_grua, id_servicio; 
            String mot = request.getParameter("moto");
            String gru = request.getParameter("grua");
            String servi = request.getParameter("servicio");
            
            //SEPARAMOS LOS VALORES CON EL METODO SPLIT
            String[]moto =mot.split(" - ");
            String[]grua =gru.split(" - ");
            String[]serv =servi.split(" - ");
            //TOMAMOS EL CODIGO
            id_moto = Integer.parseInt(moto[0]); 
            id_grua = Integer.parseInt(grua[0]);
            id_servicio = Integer.parseInt(serv[0]);
            
            String lloyd = request.getParameter("lloyd");
            String uvi = request.getParameter("uvi");
            String referencia = request.getParameter("referencia");
            String muelle = request.getParameter("muelle");
            String fechaCita = request.getParameter("fechaCita");
            String horaCita = request.getParameter("horaCita");
            String hrsOp = request.getParameter("horasOp");
            String fechaFinal = request.getParameter("fechaFinal");
            String horaFinal = request.getParameter("horaFinal");           

            String opc = request.getParameter("opc");

            serGenerados ser = new serGenerados(terminal, id_moto, lloyd, uvi, referencia, muelle, id_grua, fechaCita, horaCita, hrsOp, fechaFinal, horaFinal, id_servicio,"No asignado");

            try {

                if (opc.equalsIgnoreCase("agregar")) {
                    OpcionesGenerados.Insertar(ser);
                    response.sendRedirect("Vistas/Analista/Generados.jsp?val=correcto");
                }

                if (opc.equalsIgnoreCase("mod")) {
                    OpcionesGenerados.Actualizar(ser);
                    response.sendRedirect("Vistas/Analista/Generados.jsp?valMod=correcto");
                }

            } catch (ClassNotFoundException | SQLException e) {
                System.out.println("ERROR: " + e);
                response.sendRedirect("Vistas/Analista/Generar.jsp?val=error");
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

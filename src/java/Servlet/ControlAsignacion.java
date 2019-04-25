
package Servlet;

import Config.OpcionesAsignados;
import Config.OpcionesGenerados;
import Modelos.serAsignados;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControlAsignacion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String terminal = request.getParameter("terminal");
            String moto = request.getParameter("motonave");
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
            String hrsOp = request.getParameter("hrsOp");
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
            
            String proveedor;
            int cantidad;
            String observaciones;
            int hrsTotales;
            
            
            int vanPro = Integer.parseInt(request.getParameter("canPro"));
            
            for (int i = 1; i <= vanPro; i++) {
                proveedor = request.getParameter("prov"+i);
                observaciones = request.getParameter("obser"+i);
                cantidad = Integer.parseInt(request.getParameter("cantidad"+i));
                hrsTotales = Integer.parseInt(request.getParameter("total"+i));
                
                serAsignados serAsi = new serAsignados(terminal, moto, lloyd, 
                        uvi, referencia, muelle, grua, fechaCita, horaCita, 
                        hrsOp, fechaFinal, horaFinal, servicio, proveedor, 
                        cantidad, observaciones, hrsTotales);
                System.out.println(i);
                try {
                    OpcionesAsignados.Insertar(serAsi);
                    
                } catch (ClassNotFoundException | SQLException e) {
                    System.out.println("Error: "+e);
                }
                
            }

            OpcionesGenerados.Eliminar(referencia);

            response.sendRedirect("Vistas/Analista/menuAnalista.jsp?valAsi=correcto");
        }catch(IOException | ClassNotFoundException | SQLException e){
            System.out.println("Error: "+e);
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

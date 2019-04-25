
package Config;

import Clases.ConexionBD;
import Modelos.serAsignados;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OpcionesAsignados {
    
    public static int numAsignados()  {
        int numero = 0;
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps = connect.prepareStatement("SELECT COUNT(DISTINCT referencia) FROM servicios_asignados");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                numero = (Integer) rs.getInt(1);
                
            }

             
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return numero;
    }

    public static void Insertar(serAsignados ser) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "Insert into servicios_asignados values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setString(1, ser.getTerminal());
            pst.setString(2, ser.getMotonave());
            pst.setString(3, ser.getLloyd());
            pst.setString(4, ser.getUvi());
            pst.setString(5, ser.getReferencia());
            pst.setString(6, ser.getMuelle());
            pst.setString(7, ser.getGrua());
            pst.setString(8, ser.getFechaCita());
            pst.setString(9, ser.getHoraCita());
            pst.setString(10, ser.getHrsOpe());
            pst.setString(11, ser.getFechaFinal());
            pst.setString(12, ser.getHoraFinal());
            pst.setString(13, ser.getServicio());
            pst.setString(14, ser.getProveedor());
            pst.setInt(15, ser.getCantidad());
            pst.setString(16, ser.getObservaciones());
            pst.setInt(17, ser.getHorasTotales());
            pst.executeUpdate();
        }
    }
    
    public static void Eliminar(String ref) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "Delete from servicios_asignados where referencia=?";
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setString(1, ref);
            pst.executeUpdate();
        }
    }
    
}

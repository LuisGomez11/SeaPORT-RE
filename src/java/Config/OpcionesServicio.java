
package Config;

import Clases.ConexionBD;
import Modelos.serGenerados;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OpcionesServicio {

    public static void Insertar(serGenerados ser) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "Insert into servicios_generados values(?,?,?,?,?,?,?,?,"
                    + "?,?,?,?,?)";
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
            pst.executeUpdate();
        }
    }
    
    public static void Actualizar(serGenerados ser) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "update servicios_generados set terminal =?, motonave=?,"
                    + " lloyd=?, uvi =?,muelle=?, grua=?, fechaCita =?, horaCita=?,"
                    + " hrsOp=?, fechaFinal =?, horaFinal=?, servicio=? where referencia=?";
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setString(1, ser.getTerminal());
            pst.setString(2, ser.getMotonave());
            pst.setString(3, ser.getLloyd());
            pst.setString(4, ser.getUvi());
            pst.setString(13, ser.getReferencia());
            pst.setString(5, ser.getMuelle());
            pst.setString(6, ser.getGrua());
            pst.setString(7, ser.getFechaCita());
            pst.setString(8, ser.getHoraCita());
            pst.setString(9, ser.getHrsOpe());
            pst.setString(10, ser.getFechaFinal());
            pst.setString(11, ser.getHoraFinal());
            pst.setString(12, ser.getServicio());
            pst.executeUpdate();
        }
    }
    
    public static void Eliminar(String ref) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "Delete from servicios_generados where referencia=?";
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setString(1, ref);
            pst.executeUpdate();
        }
    }
    
}

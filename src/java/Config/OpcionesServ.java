
package Config;

import Clases.ConexionBD;
import Modelos.Servicios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OpcionesServ {

    public static void Insertar(Servicios ser) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "insert into servicios values(?)";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, ser.getNombre());
            ps.executeUpdate();
        }
    }
    
    public static void Actualizar(Servicios ser, String nom) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "update servicios set nombre=? where nombre="+nom;
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, ser.getNombre());
            ps.executeUpdate();
        }
    }
    
    public static void Eliminar(String nom) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "Delete from servicios where nombre=?";
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setString(1, nom);
            pst.executeUpdate();
        }
    }
    
}

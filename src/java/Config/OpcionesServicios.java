package Config;

import Clases.ConexionBD;
import Modelos.Servicios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OpcionesServicios {
 
    public static List listar() {
        List<Servicios> lista = new ArrayList<>();       
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps = connect.prepareStatement("select * from servicios");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Servicios ser = new Servicios(rs.getString(1));
                lista.add(ser);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return lista;
    }
    
    public static List mostrarSer(String nom) {
        List<Servicios> lista = new ArrayList<>();       
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps = connect.prepareStatement("select * from servicios where nombre=CAPATAZ");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Servicios ser = new Servicios(rs.getString(1));
                lista.add(ser);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return lista;
    }

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
            String sql = "update servicios set nombre=? where nombre=" + nom;
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, ser.getNombre());
            ps.executeUpdate();
        }
    }

    public static void Eliminar(String nom){
        try (Connection connect = ConexionBD.connect()) {
            String sql = "delete from servicios where nombre=?";
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setString(1, nom);
            pst.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
    }

}

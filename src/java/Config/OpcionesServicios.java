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
                Servicios ser = new Servicios(rs.getInt(1),
                        rs.getString(2));
                lista.add(ser);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return lista;
    }
    
    
    
    public static List mostrarSer(int id) {
        List<Servicios> lista = new ArrayList<>();       
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps = connect.prepareStatement("select * from servicios where id="+id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Servicios ser = new Servicios(rs.getString(2));
                lista.add(ser);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return lista;
    }

    public static void Insertar(Servicios ser) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "insert into servicios values(null,?)";
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, ser.getNombre());
            ps.executeUpdate();
        }
    }

    public static void Actualizar(Servicios ser, int id) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "update servicios set nombre=? where id=" + id;
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, ser.getNombre());
            ps.executeUpdate();
        }
    }

    public static void Eliminar(int id){
        try (Connection connect = ConexionBD.connect()) {
            String sql = "delete from servicios where id=?";
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
    }

}

package Config;

import Clases.ConexionBD;
import Modelos.Entidades;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OpcionesEntidades {
    
    public static List listar() {
        List<Entidades> lista = new ArrayList<>();       
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps = connect.prepareStatement("select * from entidad_fisica order by tipo");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Entidades en = new Entidades(rs.getInt(1),rs.getString(2),
                        rs.getString(3));
                lista.add(en);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return lista;
    }
    
    public static List mostrarEntidad(int id) {
        List<Entidades> lista = new ArrayList<>();       
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps = connect.prepareStatement("select * from entidad_fisica where id="+id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Entidades en = new Entidades(rs.getString(2),
                        rs.getString(3));
                lista.add(en);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return lista;
    }
    
    public static List listarMoto() {
        List<Entidades> lista = new ArrayList<>();       
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps = connect.prepareStatement("select * from entidad_fisica where tipo='Motonave'");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Entidades en = new Entidades(rs.getString(2),rs.getString(3));
                lista.add(en);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return lista;
    }
    
    public static List listarGrua() {
        List<Entidades> lista = new ArrayList<>();       
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps = connect.prepareStatement("select * from entidad_fisica where tipo='Grua'");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Entidades en = new Entidades(rs.getString(2),rs.getString(3));
                lista.add(en);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return lista;
    }

    public static void Insertar(Entidades enti) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement pst = connect.prepareStatement("Insert into entidad_fisica "
                +"values (null,?,?)");
            pst.setString(1, enti.getNombre());
            pst.setString(2, enti.getTipo());
            pst.executeUpdate();
        }
    }
    
    public static void Actualizar(Entidades enti, int id) throws ClassNotFoundException, SQLException{
        try (Connection connect = ConexionBD.connect()) {
            String sql = "update entidad_fisica set nombre=?, tipo=? where id=" + id;
            PreparedStatement ps = connect.prepareStatement(sql);
            ps.setString(1, enti.getNombre());
            ps.setString(2, enti.getTipo());
            ps.executeUpdate();
            
        }
    }
    
    public static void Eliminar(int id){
        try (Connection connect = ConexionBD.connect()) {
            String sql = "delete from entidad_fisica where id=?";
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
    }
    
}

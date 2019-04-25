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
                Entidades en = new Entidades(rs.getString(1),rs.getString(2));
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
                Entidades en = new Entidades(rs.getString(1),rs.getString(2));
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
                Entidades en = new Entidades(rs.getString(1),rs.getString(2));
                lista.add(en);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return lista;
    }

    public static void Insertar(Entidades enti) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement pst = connect.prepareStatement("Insert into entidad_fisica "
                +"values (?,?)");
            pst.setString(1, enti.getNombre());
            pst.setString(2, enti.getTipo());
            pst.executeUpdate();
        }
    }
    
}

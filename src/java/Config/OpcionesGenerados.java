package Config;

import Clases.ConexionBD;
import Modelos.serGenerados;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OpcionesGenerados {

    public static int numGenerados()  {
        int numero = 0;
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps3 = connect.prepareStatement("select count(*) from servicios_generados where estado = 'No asignado'");
            ResultSet rs3 = ps3.executeQuery();

            while (rs3.next()) {

                numero = (Integer) rs3.getInt(1);
                
            }

             
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return numero;
    }
    
    public static List listar(){
        List<serGenerados> lista = new ArrayList<>();       
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps = connect.prepareStatement("select * from servicios_generados where estado = 'No asignado'");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                serGenerados ser = new serGenerados(rs.getString(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getString(14));
                lista.add(ser);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return lista;
    }
    
    public static serGenerados mostrarServi(String ref){
        serGenerados ser = null;       
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps = connect.prepareStatement("select * from servicios_generados where referencia="+ref);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ser = new serGenerados(rs.getString(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getString(14));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return ser;
    }
    
    public static List mostrarSer(String ref){
        List<serGenerados> lista = new ArrayList<>();       
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps = connect.prepareStatement("select * from servicios_generados where referencia="+ref);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                serGenerados ser = new serGenerados(rs.getString(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13),
                        rs.getString(14));
                lista.add(ser);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return lista;
    }
    
    public static void pasarAsignado(String ref, String esta){
        try (Connection connect = ConexionBD.connect()) {
            String sql = "update servicios_generados set estado=? where referencia=?";
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setString(1, esta);
            pst.setString(2, ref);
            pst.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
    }
    
    public static void eliminarSer(String ref){
        try (Connection connect = ConexionBD.connect()) {
            String sql = "Delete from servicios_generados where referencia = "+ref;
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
    }

    public static void Insertar(serGenerados ser) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "call insertar_serGenerado(?,?,?,?,?,?,?,?,"
                    + "?,?,?,?,?,?)";
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setString(1, ser.getTerminal());
            pst.setInt(2, ser.getId_entidadM());
            pst.setString(3, ser.getLloyd());
            pst.setString(4, ser.getUvi());
            pst.setString(5, ser.getReferencia());
            pst.setString(6, ser.getMuelle());
            pst.setInt(7, ser.getId_entidadG());
            pst.setString(8, ser.getFechaCita());
            pst.setString(9, ser.getHoraCita());
            pst.setString(10, ser.getHrsOpe());
            pst.setString(11, ser.getFechaFinal());
            pst.setString(12, ser.getHoraFinal());
            pst.setInt(13, ser.getId_servicio());
            pst.setString(14, ser.getEstado());
            pst.executeUpdate();
        }
    }

    public static void Actualizar(serGenerados ser) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "call modificar_serGenerado(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = connect.prepareStatement(sql);
            pst.setString(1, ser.getTerminal());
            pst.setInt(2, ser.getId_entidadM());
            pst.setString(3, ser.getLloyd());
            pst.setString(4, ser.getUvi());
            pst.setString(13, ser.getReferencia());
            pst.setString(5, ser.getMuelle());
            pst.setInt(6, ser.getId_entidadG());
            pst.setString(7, ser.getFechaCita());
            pst.setString(8, ser.getHoraCita());
            pst.setString(9, ser.getHrsOpe());
            pst.setString(10, ser.getFechaFinal());
            pst.setString(11, ser.getHoraFinal());
            pst.setInt(12, ser.getId_servicio());
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


package Config;

import Clases.ConexionBD;
import Modelos.serAsignados;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OpcionesAsignados {
    
    public static List listar(){
        List<serAsignados> lista = new ArrayList<>();       
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps = connect.prepareStatement("SELECT * FROM servicios_asignados");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                serAsignados serAsi = new serAsignados(rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getInt(16),
                        rs.getString(17),
                        rs.getInt(18),
                        rs.getString(19));
                lista.add(serAsi);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            
        }
        return lista;
    }
    
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
    
    public static void pasarProceso(String ref){
        try (Connection connect = ConexionBD.connect()) {
                String sql = "UPDATE servicios_asignados SET estado = 'En progreso' WHERE referencia = "+ref;
                PreparedStatement psEsta = connect.prepareStatement(sql);
                psEsta.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            
        }

    }
    
    public static void pasarFinalizado(String ref){
        try (Connection connect = ConexionBD.connect()) {
                String sql = "UPDATE servicios_asignados SET estado = 'Finalizado' WHERE referencia = "+ref;
                PreparedStatement psEsta = connect.prepareStatement(sql);
                psEsta.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            
        }

    }

    public static void Insertar(serAsignados ser) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "Insert into servicios_asignados values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            pst.setString(18, ser.getEstado());
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

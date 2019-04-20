package Config;

import Clases.ConexionBD;
import Modelos.Proveedores;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OpcionesProveedor {
    
    public static List listarPro() throws ClassNotFoundException, SQLException {
        ArrayList<String> lista = new ArrayList<>();
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement pst = connect.prepareStatement("select nombre from proveedores");
            ResultSet rs = pst.executeQuery();
            while(rs.next()){
                lista.add(rs.getString(1));
            }
        }
        return lista;
    }

    public static void Insertar(Proveedores pro) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement pst = connect.prepareStatement("Insert into proveedores "
                    + " values(null,?,?,?,?,?,?)");
            pst.setString(1, pro.getNombre());
            pst.setString(2, pro.getTelefono());
            pst.setString(3, pro.getMovil());
            pst.setString(4, pro.getCorreo());
            pst.setString(5, pro.getNit());
            pst.setInt(6, pro.getCantTra());
            pst.executeUpdate();
        }
    }

    public static void Actualizar(Proveedores pro, int cod) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement pst = connect.prepareStatement("update proveedores set "
                    + "nombre =?, telefono=?, movil=?, correo =?, nit=?, cantTra=? "
                    + "where codProveedor=?");
            pst.setString(1, pro.getNombre());
            pst.setString(2, pro.getTelefono());
            pst.setString(3, pro.getMovil());
            pst.setString(4, pro.getCorreo());
            pst.setString(5, pro.getNit());
            pst.setInt(6, pro.getCantTra());
            pst.setInt(7, cod);
            pst.executeUpdate();
        }
    }

    public static void Eliminar(int cod) throws ClassNotFoundException, SQLException {
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement pst = connect.prepareStatement("Delete from "
                    + "proveedores where codProveedor=?");
            pst.setInt(1, cod);
            pst.executeUpdate();
        }
    }

}

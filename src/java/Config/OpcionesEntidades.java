package Config;

import Clases.ConexionBD;
import Modelos.Entidades;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OpcionesEntidades {

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

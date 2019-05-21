package Config;

import Clases.ConexionBD;
import Modelos.serAsignados;
import Modelos.serGenerados;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OpcionesAsignados {

    public static List listar() {
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

    public static List listarInforme() {
        List<serAsignados> lista = new ArrayList<>();
        try (Connection connect = ConexionBD.connect()) {
            PreparedStatement ps = connect.prepareStatement("SELECT * FROM servicios_asignados WHERE estado = 'Finalizado'");
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

    public static void estado(List<serGenerados> listaGen, List<serAsignados> listaAsi) {
        //COMPROBACIONES DE LOS HORARIOS DE LOS SERVICIOS
        DateFormat formato = new SimpleDateFormat("YYYY/MM/dd");
        DateFormat formato1 = new SimpleDateFormat("HH:mm");
        String fechaActual = formato.format(new Date());
        String horaActual = formato1.format(new Date());

        String[] actual = fechaActual.split("/");
        int diaActual = Integer.parseInt(actual[2]);
        int mesActual = Integer.parseInt(actual[1]);
        int anioActual = Integer.parseInt(actual[0]);

        String[] hActual = horaActual.split(":");
        int hoActual = Integer.parseInt(hActual[0]);
        int minutoActual = Integer.parseInt(hActual[1]);

        for (serGenerados dato : listaGen) {
            String fechaIni = dato.getFechaCita();
            String horaIni = dato.getHoraCita();

            String[] Inicio = fechaIni.split("-");
            int diaInicio = Integer.parseInt(Inicio[2]);
            int mesInicio = Integer.parseInt(Inicio[1]);
            int anioInicio = Integer.parseInt(Inicio[0]);

            String[] hInicio = horaIni.split(":");
            int hoInicio = Integer.parseInt(hInicio[0]);
            int minutoInicio = Integer.parseInt(hInicio[1]);

            if (anioActual > anioInicio) {
                OpcionesGenerados.eliminarSer(dato.getReferencia());
            } else if (anioActual == anioInicio && mesActual > mesInicio) {
                OpcionesGenerados.eliminarSer(dato.getReferencia());
            } else if (anioActual == anioInicio && mesActual == mesInicio
                    && diaActual > diaInicio) {
                OpcionesGenerados.eliminarSer(dato.getReferencia());
            } else if (anioActual == anioInicio && mesActual == mesInicio
                    && diaActual == diaInicio && hoActual > hoInicio) {
                OpcionesGenerados.eliminarSer(dato.getReferencia());
            } else if (anioActual == anioInicio && mesActual == mesInicio && diaActual == diaInicio
                    && hoActual == hoInicio && minutoActual >= minutoInicio) {
                OpcionesGenerados.eliminarSer(dato.getReferencia());
            }
        }

        for (serAsignados dato : listaAsi) {
            String fechaIni = dato.getFechaCita();
            String horaIni = dato.getHoraCita();
            String fechaFin = dato.getFechaFinal();
            String horaFin = dato.getHoraFinal();

            String[] Inicio = fechaIni.split("-");
            int diaInicio = Integer.parseInt(Inicio[2]);
            int mesInicio = Integer.parseInt(Inicio[1]);
            int anioInicio = Integer.parseInt(Inicio[0]);

            String[] hInicio = horaIni.split(":");
            int hoInicio = Integer.parseInt(hInicio[0]);
            int minutoInicio = Integer.parseInt(hInicio[1]);

            String[] Fin = fechaFin.split("-");
            int diaFin = Integer.parseInt(Fin[2]);
            int mesFin = Integer.parseInt(Fin[1]);
            int anioFin = Integer.parseInt(Fin[0]);

            String[] hFin = horaFin.split(":");
            int hoFin = Integer.parseInt(hFin[0]);
            int minutoFin = Integer.parseInt(hFin[1]);

            if (anioActual > anioInicio) {
                OpcionesAsignados.pasarProceso(dato.getReferencia());
            } else if (anioActual == anioInicio && mesActual > mesInicio) {
                OpcionesAsignados.pasarProceso(dato.getReferencia());
            } else if (anioActual == anioInicio && mesActual == mesInicio
                    && diaActual > diaInicio) {
                OpcionesAsignados.pasarProceso(dato.getReferencia());
            } else if (anioActual == anioInicio && mesActual == mesInicio
                    && diaActual == diaInicio && hoActual > hoInicio) {
                OpcionesAsignados.pasarProceso(dato.getReferencia());
            } else if (anioActual == anioInicio && mesActual == mesInicio && diaActual == diaInicio
                    && hoActual == hoInicio && minutoActual >= minutoInicio) {
                OpcionesAsignados.pasarProceso(dato.getReferencia());
            }

            if (anioActual > anioFin) {
                OpcionesAsignados.pasarFinalizado(dato.getReferencia());
            } else if (anioActual == anioFin && mesActual > mesFin) {
                OpcionesAsignados.pasarFinalizado(dato.getReferencia());
            } else if (anioActual == anioFin && mesActual == mesFin
                    && diaActual > diaFin) {
                OpcionesAsignados.pasarFinalizado(dato.getReferencia());
            } else if (anioActual == anioFin && mesActual == mesFin
                    && diaActual == diaFin && hoActual > hoFin) {
                OpcionesAsignados.pasarFinalizado(dato.getReferencia());
            } else if (anioActual == anioFin && mesActual == mesFin && diaActual == diaFin
                    && hoActual == hoFin && minutoActual >= minutoFin) {
                OpcionesAsignados.pasarFinalizado(dato.getReferencia());
            }

        }
    }

    public static int numAsignados() {
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

    public static void pasarProceso(String ref) {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "UPDATE servicios_asignados SET estado = 'En progreso' WHERE referencia = " + ref;
            PreparedStatement psEsta = connect.prepareStatement(sql);
            psEsta.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {

        }

    }

    public static void pasarFinalizado(String ref) {
        try (Connection connect = ConexionBD.connect()) {
            String sql = "UPDATE servicios_asignados SET estado = 'Finalizado' WHERE referencia = " + ref;
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

    public static int numInformes(String num) {
        int r = 0;
        List<serAsignados> listaInfo = OpcionesAsignados.listarInforme();
        for (serAsignados dato : listaInfo) {

            String fecha = dato.getFechaCita();

            String[] splits = fecha.split("-");

            if (splits[1].equalsIgnoreCase(num)) {
                r++;
            }
        }
        return r;
    }
    
    
}

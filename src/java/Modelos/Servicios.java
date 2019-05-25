
package Modelos;

public class Servicios {

    private int id_servicio;
    private String nombre;

    public Servicios() {
    }

    public Servicios(String nombre) {
        this.nombre = nombre;
    }

    public Servicios(int id_servicio, String nombre) {
        this.id_servicio = id_servicio;
        this.nombre = nombre;
    }
    
    
    
    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the id_servicio
     */
    public int getId_servicio() {
        return id_servicio;
    }

    /**
     * @param id_servicio the id_servicio to set
     */
    public void setId_servicio(int id_servicio) {
        this.id_servicio = id_servicio;
    }
    
    
    
}

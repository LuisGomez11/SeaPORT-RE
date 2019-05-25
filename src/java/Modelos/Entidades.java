package Modelos;

public class Entidades {

    private int id_entidad;
    private String nombre;
    private String tipo;

    public Entidades() {
    }

    public Entidades(String nombre, String tipo) {
        this.nombre = nombre;
        this.tipo = tipo;
    }

    public Entidades(int id_entidad, String nombre, String tipo) {
        this.id_entidad = id_entidad;
        this.nombre = nombre;
        this.tipo = tipo;
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
     * @return the tipo
     */
    public String getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the id_entidad
     */
    public int getId_entidad() {
        return id_entidad;
    }

    /**
     * @param id_entidad the id_entidad to set
     */
    public void setId_entidad(int id_entidad) {
        this.id_entidad = id_entidad;
    }

    

}

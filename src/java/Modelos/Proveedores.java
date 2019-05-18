
package Modelos;

public class Proveedores {

    private int id;
    private String nombre;
    private String telefono;
    private String movil;
    private String correo;
    private String nit;
    private int cantTra;

    public Proveedores() {
    }

    public Proveedores(int id, String nombre, String telefono, String movil, String correo, String nit, int cantTra) {
        this.id = id;
        this.nombre = nombre;
        this.telefono = telefono;
        this.movil = movil;
        this.correo = correo;
        this.nit = nit;
        this.cantTra = cantTra;
    }
    
    

    public Proveedores(String nombre, String telefono, String movil, String correo, String nit, int cantTra) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.movil = movil;
        this.correo = correo;
        this.nit = nit;
        this.cantTra = cantTra;
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
     * @return the telefono
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * @param telefono the telefono to set
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     * @return the movil
     */
    public String getMovil() {
        return movil;
    }

    /**
     * @param movil the movil to set
     */
    public void setMovil(String movil) {
        this.movil = movil;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the nit
     */
    public String getNit() {
        return nit;
    }

    /**
     * @param nit the nit to set
     */
    public void setNit(String nit) {
        this.nit = nit;
    }


    /**
     * @return the cantTra
     */
    public int getCantTra() {
        return cantTra;
    }

    /**
     * @param cantTra the cantTra to set
     */
    public void setCantTra(int cantTra) {
        this.cantTra = cantTra;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }
    
}

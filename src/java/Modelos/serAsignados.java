
package Modelos;

public class serAsignados {

    private int codigo;
    private String referencia;
    private int cod_proveedor;
    private int cantidad;
    private String observaciones;
    private int horasTotales;
    private String estado;

    public serAsignados() {
    }

    public serAsignados(String referencia, int cod_proveedor, int cantidad, String observaciones, int horasTotales, String estado) {
        this.referencia = referencia;
        this.cod_proveedor = cod_proveedor;
        this.cantidad = cantidad;
        this.observaciones = observaciones;
        this.horasTotales = horasTotales;
        this.estado = estado;
    }
    
    public serAsignados(int codigo, String referencia, int cod_proveedor, int cantidad, String observaciones, int horasTotales, String estado) {
        this.codigo = codigo;
        this.referencia = referencia;
        this.cod_proveedor = cod_proveedor;
        this.cantidad = cantidad;
        this.observaciones = observaciones;
        this.horasTotales = horasTotales;
        this.estado = estado;
    }

    /**
     * @return the codigo
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the referencia
     */
    public String getReferencia() {
        return referencia;
    }

    /**
     * @param referencia the referencia to set
     */
    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    /**
     * @return the cod_proveedor
     */
    public int getCod_proveedor() {
        return cod_proveedor;
    }

    /**
     * @param cod_proveedor the cod_proveedor to set
     */
    public void setCod_proveedor(int cod_proveedor) {
        this.cod_proveedor = cod_proveedor;
    }

    /**
     * @return the cantidad
     */
    public int getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    /**
     * @return the observaciones
     */
    public String getObservaciones() {
        return observaciones;
    }

    /**
     * @param observaciones the observaciones to set
     */
    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    /**
     * @return the horasTotales
     */
    public int getHorasTotales() {
        return horasTotales;
    }

    /**
     * @param horasTotales the horasTotales to set
     */
    public void setHorasTotales(int horasTotales) {
        this.horasTotales = horasTotales;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

        
    
}

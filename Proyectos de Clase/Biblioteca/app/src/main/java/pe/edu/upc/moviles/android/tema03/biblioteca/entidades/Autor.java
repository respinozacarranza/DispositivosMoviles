package pe.edu.upc.moviles.android.tema03.biblioteca.entidades;

import java.util.Date;
import java.util.List;

/**
 * Created by Alumnos on 21/04/2015.
 */
public class Autor {

    private int idAutor;
    private String nombre;
    private String fechaNacimiento;
    private String nacionalidad;
    private List<Libro> lstLibros;


    public int getIdAutor() {
        return idAutor;
    }

    public void setIdAutor(int idAutor) {
        this.idAutor = idAutor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getNacionalidad() {
        return nacionalidad;
    }

    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    public List<Libro> getLstLibros() {
        return lstLibros;
    }

    public void setLstLibros(List<Libro> lstLibros) {
        this.lstLibros = lstLibros;
    }
}

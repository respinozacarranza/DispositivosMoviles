package pe.edu.upc.moviles.android.tema03.biblioteca.entidades;

import java.util.Date;
import java.util.List;

/**
 * Created by Alumnos on 21/04/2015.
 */
public class Libro {
    private int id;
    private String titulo;
    private String editorial;
    private String fecha;
    private List<Autor> listaAutores;


    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public List<Autor> getListaAutores() {
        return listaAutores;
    }

    public void setListaAutores(List<Autor> listaAutores) {
        this.listaAutores = listaAutores;
    }
}

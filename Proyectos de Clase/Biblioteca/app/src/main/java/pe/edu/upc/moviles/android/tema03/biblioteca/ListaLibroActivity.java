package pe.edu.upc.moviles.android.tema03.biblioteca;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

import pe.edu.upc.moviles.android.tema03.biblioteca.adapter.LibroAdapter;
import pe.edu.upc.moviles.android.tema03.biblioteca.entidades.Libro;


public class ListaLibroActivity extends ActionBarActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_lista_libro);
        ListView listViewLibros = (ListView)findViewById(R.id.lst_libros);

        List<Libro> listaLibros = new ArrayList<Libro>();

        Libro libro1 = new Libro();
        libro1.setTitulo("Inferno");
        libro1.setEditorial("Editorial Inferno");

        Libro libro2 = new Libro();
        libro2.setTitulo("Coquito");
        libro2.setEditorial("UPC");

        Libro libro3 = new Libro();
        libro3.setTitulo("Cronicas de una Muerte Anunciada");
        libro3.setEditorial("Norma");

        listaLibros.add(libro1);
        listaLibros.add(libro2);
        listaLibros.add(libro3);

        LibroAdapter libroAdapter = new LibroAdapter(listaLibros,this);

        listViewLibros.setAdapter(libroAdapter);

    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_lista_libro_activity, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}

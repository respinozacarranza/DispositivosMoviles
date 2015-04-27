package pe.edu.upc.noticiasdetalle;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.List;

import pe.edu.upc.noticiasdetalle.adapter.NoticiaAdapter;
import pe.edu.upc.noticiasdetalle.entidades.Noticia;


public class MainActivity extends ActionBarActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ListView listViewNoticias = (ListView)findViewById(R.id.listaNoticias);

        List<Noticia> listaNoticias = new ArrayList<Noticia>();

        Noticia noticia1 = new Noticia();
        noticia1.setIdNoticia(1);
        noticia1.setTitulo("Incendio");
        noticia1.setFecha("18 de abril");
        noticia1.setDescripcion("Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ");


        Noticia noticia2 = new Noticia();
        noticia1.setIdNoticia(1);
        noticia1.setTitulo("Nuevo Regimen");
        noticia1.setFecha("18 de mayo");
        noticia1.setDescripcion("Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ");

        Noticia noticia3 = new Noticia();
        noticia1.setIdNoticia(1);
        noticia1.setTitulo("Ley Pulpin abolida");
        noticia1.setFecha("18 de junio");
        noticia1.setDescripcion("Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ");

        Noticia noticia4 = new Noticia();
        noticia1.setIdNoticia(1);
        noticia1.setTitulo("Elecciones Presidenciales");
        noticia1.setFecha("18 de julio");
        noticia1.setDescripcion("Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ");

        NoticiaAdapter noticiaAdapter = new NoticiaAdapter(listaNoticias,this);

        listViewNoticias.setAdapter(noticiaAdapter);
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
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

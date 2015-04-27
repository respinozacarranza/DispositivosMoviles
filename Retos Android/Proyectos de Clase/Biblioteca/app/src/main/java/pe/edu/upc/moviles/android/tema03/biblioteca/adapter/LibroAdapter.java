package pe.edu.upc.moviles.android.tema03.biblioteca.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.List;

import pe.edu.upc.moviles.android.tema03.biblioteca.R;
import pe.edu.upc.moviles.android.tema03.biblioteca.entidades.Libro;

/**
 * Created by Alumnos on 21/04/2015.
 */
public class LibroAdapter extends BaseAdapter {

    private List<Libro> libros;
    private Context context;

    public LibroAdapter(List<Libro> libros, Context context){
        this.libros = libros;
        this.context = context;
    }



    @Override
    public int getCount() {
        return libros.size();
    }

    @Override
    public Object getItem(int position) {
        return libros.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        LayoutInflater layoutInflater = (LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        if(convertView == null){
            convertView = layoutInflater.inflate(R.layout.libro_row,null);
        }

        TextView titulo = (TextView)convertView.findViewById(R.id.libro_row_tv_titulo);
        TextView subTitulo =(TextView)convertView.findViewById(R.id.libro_row_tv_subtitulo);

        Libro libro = libros.get(position);

        titulo.setText(libro.getTitulo());
        subTitulo.setText(libro.getEditorial());

        return convertView;
    }
}

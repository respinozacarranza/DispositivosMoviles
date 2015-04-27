package pe.edu.upc.noticiasdetalle.adapter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.List;

import pe.edu.upc.noticiasdetalle.R;
import pe.edu.upc.noticiasdetalle.entidades.Noticia;

/**
 * Created by Renato on 4/27/2015.
 */
public class NoticiaAdapter extends BaseAdapter{

    private List<Noticia> noticias;
    private Context context;

    public NoticiaAdapter(List<Noticia> noticias,Context context){
        this.noticias = noticias;
        this.context = context;
    }


    @Override
    public int getCount() {
        return noticias.size();
    }

    @Override
    public Object getItem(int position) {
        return noticias.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        LayoutInflater layoutInflater = (LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        if(convertView == null){
            convertView = layoutInflater.inflate(R.layout.noticia_row,null);

        }

        TextView titulo = (TextView)convertView.findViewById(R.id.noticia_row_titulo);
        TextView fecha = (TextView)convertView.findViewById(R.id.noticia_row_fecha);

        Noticia noticia = noticias.get(position);

        titulo.setText(noticia.getTitulo());
        fecha.setText(noticia.getFecha());

        return convertView;

    }
}

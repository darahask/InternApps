package com.example.clickbata;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.squareup.picasso.Picasso;

import java.util.ArrayList;

public class HorizontalAdapter extends RecyclerView.Adapter<HorizontalAdapter.HorizontalViewHolder> implements Filterable {

    public class HorizontalViewHolder extends RecyclerView.ViewHolder{
        TextView txt,rate;
        ImageView r1,r2,r3,r4,r5,img;
        public HorizontalViewHolder(@NonNull View itemView, final OnItemClickListener listener) {
            super(itemView);

            r1=(ImageView)itemView.findViewById(R.id.rate1);
            r2=(ImageView)itemView.findViewById(R.id.rate2);
            r3=(ImageView)itemView.findViewById(R.id.rate3);
            r4=(ImageView)itemView.findViewById(R.id.rate4);
            r5=(ImageView)itemView.findViewById(R.id.rate5);
            rate=(TextView)itemView.findViewById(R.id.rating);
            txt=(TextView) itemView.findViewById(R.id.txtTag);
            img=(ImageView) itemView.findViewById(R.id.imgTag);

            itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    if(listener!=null){
                        int position=getAdapterPosition();
                        if(position!=RecyclerView.NO_POSITION){
                            listener.OnItemClick(position);
                        }
                    }
                }
            });
        }
    }


    private ArrayList<Recycler_Item> mRecyclerList;
    private ArrayList<Recycler_Item> mRecyclerListFull;
    private Context context;

    private OnItemClickListener mListener;
    public interface OnItemClickListener{
        void OnItemClick(int position);
    }

    public void setOnItemClickListener(OnItemClickListener listener){
        mListener=listener;
    }

    public HorizontalAdapter(ArrayList<Recycler_Item> recyclerList ,Context context){
        mRecyclerList=recyclerList;
        mRecyclerListFull=new ArrayList<>(mRecyclerList);
        this.context=context;
    }

    @NonNull
    @Override
    public HorizontalViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        LayoutInflater inflater=LayoutInflater.from(parent.getContext());
        View view=inflater.inflate(R.layout.item_layout,parent,false);
        return new HorizontalViewHolder(view,mListener);
    }

    @Override
    public void onBindViewHolder(@NonNull HorizontalViewHolder holder, int position) {

        Recycler_Item currentItem=mRecyclerList.get(position);

        holder.txt.setText(currentItem.getPlace());
        String str="("+currentItem.getRating()+".0)";
        holder.rate.setText(str);

        Picasso.with(context).load(currentItem.getImgurl()).placeholder(R.mipmap.ic_launcher).error(R.mipmap.ic_launcher).into(holder.img);

        if(currentItem.getRating() == 1){
            holder.r1.setBackgroundResource(R.drawable.rounded_button5);
        }
        if(currentItem.getRating() ==2 ){
            holder.r1.setBackgroundResource(R.drawable.rounded_button5);
            holder.r2.setBackgroundResource(R.drawable.rounded_button5);
        }
        if(currentItem.getRating() == 3){
            holder.r1.setBackgroundResource(R.drawable.rounded_button5);
            holder.r2.setBackgroundResource(R.drawable.rounded_button5);
            holder.r3.setBackgroundResource(R.drawable.rounded_button5);
        }
        if(currentItem.getRating() ==4 ){
            holder.r1.setBackgroundResource(R.drawable.rounded_button5);
            holder.r2.setBackgroundResource(R.drawable.rounded_button5);
            holder.r3.setBackgroundResource(R.drawable.rounded_button5);
            holder.r4.setBackgroundResource(R.drawable.rounded_button5);
        }
        if(currentItem.getRating() == 5){
            holder.r1.setBackgroundResource(R.drawable.rounded_button5);
            holder.r2.setBackgroundResource(R.drawable.rounded_button5);
            holder.r3.setBackgroundResource(R.drawable.rounded_button5);
            holder.r4.setBackgroundResource(R.drawable.rounded_button5);
            holder.r5.setBackgroundResource(R.drawable.rounded_button5);
        }
    }

    @Override
    public int getItemCount() {
        return mRecyclerList.size();
    }

    @Override
    public Filter getFilter() {
        return recyclerFilter;
    }

    private Filter recyclerFilter=new Filter() {
        @Override
        protected FilterResults performFiltering(CharSequence constraint) {
            ArrayList<Recycler_Item> filteredList=new ArrayList<>();
            if(constraint==null || constraint.length()==0){
                filteredList.addAll(mRecyclerListFull);
            } else {
                String filterPattern= constraint.toString().toLowerCase().trim();

                for(Recycler_Item item: mRecyclerListFull){
                    if(item.getPlace().toLowerCase().contains(filterPattern)){
                        filteredList.add(item);
                    }
                }
            }

            FilterResults results=new FilterResults();
            results.values=filteredList;

            return results;
        }

        @Override
        protected void publishResults(CharSequence constraint, FilterResults results) {
            mRecyclerList.clear();
            mRecyclerList.addAll((ArrayList)results.values);
            notifyDataSetChanged();

        }
    };


}

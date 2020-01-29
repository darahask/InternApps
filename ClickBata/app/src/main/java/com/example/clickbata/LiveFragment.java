package com.example.clickbata;

import android.Manifest;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.core.app.ActivityCompat;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.SearchView;
import android.widget.TextView;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.FirebaseAuth;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class LiveFragment extends Fragment implements OnMapReadyCallback {

    private Button logout;
    private SearchView searchView;
    private TextView textView;
    private FirebaseAuth lifirebaseAuth;
    private RecyclerView recyclerView;
    private HorizontalAdapter adapter;
    private RecyclerView.LayoutManager layoutManager;

    private Geocoder geo;
    private List<Address> add;
    private Location currentLocation;
    private FusedLocationProviderClient fusedLocationProviderClient;
    private static final int REQUEST_CODE=101;
    View view;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.fragment_live, container, false);

        textView = view.findViewById(R.id.usernametext);

        lifirebaseAuth= FirebaseAuth.getInstance();
        if(lifirebaseAuth.getCurrentUser()== null){
            getActivity().finish();
            startActivity(new Intent(getActivity(), MainActivity.class));
        }else{
            textView.setText("Welcome to Click Bata");
        }

        fusedLocationProviderClient= LocationServices.getFusedLocationProviderClient(getActivity());
        fetchLastLocation();

        final ArrayList<Recycler_Item> recycler_list=new ArrayList<>();
        recycler_list.add(new Recycler_Item("Kashmir",2,"https://static.toiimg.com/thumb/49353399/How-to-reach-Kashmir.jpg?width=748&height=499","Video","Kashmir is the northernmost geographical region of the Indian subcontinent. Until the mid-19th century, the term \"Kashmir\" denoted only the Kashmir Valley between the Great Himalayas and the Pir Panjal Range. Today, it denotes a larger area that includes the Indian-administered territories of Jammu and Kashmir and Ladakh, the Pakistani-administered territories of Azad Kashmir and Gilgit-Baltistan, and Chinese-administered territories of Aksai Chin and the Trans-Karakoram Tract."));
        recycler_list.add(new Recycler_Item("Delhi",1,"https://static.toiimg.com/thumb/68482857/delhi.jpg?width=748&height=499","video","\"Here we stand in Delhi city, symbol of old India and the new. It is not the narrow lanes and houses of old Delhi nor the wide spaces and rather pretentious buildings of New Delhi that count, but the spirit of this ancient city. Delhi has been an epitome of India's history with its succession of glory and disaster and with its great capacity to absorb many cultures and yet remain itself. It is a gem with many facets, some bright and some darkened by age, presenting the course of 'India's life and thought during the ages."));
        recycler_list.add(new Recycler_Item("Kanha National Park",2,"https://media-cdn.tripadvisor.com/media/photo-c/768x250/0f/64/43/78/kanha-national-park-one.jpg", "Video","The Kanha National Park in Madhya Pradesh came into being in 1955 and forms the core of the Kanha Tiger Reserve, created in 1974 under Project Tiger. The Park's landmark achievement is the preservation of the rare hardground Swamp Deer (Barasingha), saving it from near extinction."));
        recycler_list.add(new Recycler_Item("Bandhavgarh National Park",3,"http://www.monsoonforest.com/wp-content/uploads/2018/09/bandhavgarh-jeep-safari-1.jpg", "Video","Making a magnificent trip to Bandhavgarh will definitely take you to the lush greenery of the forested regions that are incredibly the natural abode of the variant of wild species. Catching the amazing glimpses of these majestic creatures are simply incredible and with safari opportunities in Bandhavgarh you can have it all in a complete organized way"));
        recycler_list.add(new Recycler_Item("Chennai",1,"https://static.toiimg.com/thumb/65562588/chennai.jpg?width=748&height=499", "Video","Chennai is the capital city of Tamilnadu State.  It is one of the metropolis of India and serves as the gateway of  the  culture  of South India. In spite of being the  capital  of  a  Tamil speaking  State,  it has emerged as a cosmopolitan city playing  an  important role  in  the  historical, cultural and  intellectual  development  of  India, representing  still the distinct components of the highest form  of  Dravidian civilisation."));
        recycler_list.add(new Recycler_Item("Mumbai",4,"https://cdn.britannica.com/26/84526-050-45452C37/Gateway-monument-India-entrance-Mumbai-Harbour-coast.jpg\n", "Video","Mumbai (also known as Bombay, the official name until 1995) is the capital city of the Indian state of Maharashtra.Mumbai lies on the Konkan coast on the west coast of India and has a deep natural harbour. In 2008, Mumbai was named an alpha world city. It is also the wealthiest city in India, and has the highest number of millionaires and billionaires among all cities in India."));
        recycler_list.add(new Recycler_Item("Shimla",5,"https://akm-img-a-in.tosshub.com/indiatoday/images/story/201810/SHIMLA.jpeg?p8rkDgUaxdIezLOdixVSYZfIdYEkHBUU", "Video","Shimla is bounded by Mandi and Kullu in the north, Kinnaur in the east, the state of Uttaranchal in the south, Sirmaur, district in the west. The elevation of the district ranges from 300 to 6000 metres. The topology of the district is rugged and tough. Shimla district derives its name from Shimla town which was once a small village."));
        recycler_list.add(new Recycler_Item("Kaziranga National Park",5,"https://www.wandereatrepeat.com/wp-content/uploads/2019/03/kaziranga-national-park-travel-guide.jpg", "Video","All those who have thought Indian one-horned rhinoceros only existed in Jurassic-era, then a trip to Kaziranga is a must for them. One of the most sought after wildlife holiday destinations in India, Kaziranga National park’s 430 square kilometer area sprinkled with elephant-grass meadows, swampy lagoons, and dense forests is home to more than 2200 Indian one-horned rhinoceros, approximately 2/3rd of their total world population."));
        recycler_list.add(new Recycler_Item("Bangalore",2,"https://www.holidify.com/images/bgImages/BANGALORE.jpg", "Video","Having evolved gradually from being the Garden city to the Silicon Valley of India, Bangalore is India's third-largest city. Bangalore is loved for its pleasant weather, beautiful parks and lakes all around the town."));
        recycler_list.add(new Recycler_Item("Ranthambhore National Park",4,"https://www.ranthamborenationalpark.com/blog/wp-content/uploads/2019/01/ranthamborenationalpark.jpg", "Video","Ranthambore National Park is one of the biggest and most renowned national park in Northern India. The park is located in the Sawai Madhopur district of southeastern Rajasthan, which is about 130 km from Jaipur. Being considered as one of the famous and former hunting grounds of the Maharajas of Jaipur, today the Ranthambore National Park terrain is major wildlife tourist attraction spot that has pulled the attention of many wildlife photographers and lovers in this destination."));
        recycler_list.add(new Recycler_Item("Jaipur",1,"https://static.toiimg.com/thumb/65244685/Jaipur.jpg?width=748&height=499", "Video","Jaipur is a vibrant amalgamation of the old and the new. Also called the Pink City, The capital of the royal state of Rajasthan, Jaipur has been ruled by Rajput kingdoms for many centuries and developed as a planned city in the 17th century AD. Along with Delhi and Agra, Jaipur forms the Golden Triangle, one of the most famous tourist circuits of the country."));
        recycler_list.add(new Recycler_Item("Pune",3,"https://static.toiimg.com/thumb/msid-65395942,imgsize-61375,width-400,resizemode-4/65395942.jpg", "Video","The second biggest city in the state of Maharashtra with around 4.5 million people living happily in an area of 450 sq. km. I have lived in many cities over the years. However, PUNE holds a special place in my heart. No other place has given the level of thrill, fun, memories, holidays & opportunities as Pune."));
        recycler_list.add(new Recycler_Item("Agra",3,"https://www.oyorooms.com/travel-guide/wp-content/uploads/2019/02/Taj-Mahal.jpg", "Video","It was once the capital of Mughal Empire. Since Shah Jahan could not stay in the land after the death of his beloved wife, he shifted the capital to Delhi. Agra is located on the western banks of the river, Yamuna. It is about 200 km away from the capital of the country"));
        recycler_list.add(new Recycler_Item("Chandigarh",5,"http://www.indiamarks.com/wp-content/uploads/Chandigarh.jpg", "Video","Chandigarh, the dream city of India's first Prime Minister, Sh. Jawahar Lal Nehru, was planned by the famous French architect Le Corbusier. Picturesquely located at the foothills of Shivaliks, it is known as one of the best experiments in urban planning and modern architecture in the twentieth century in India."));
        recycler_list.add(new Recycler_Item("Periyar National Park",2,"https://www.go4travelblog.com/app/uploads/2018/06/periyar-national-park-1024x481.jpg", "Video","The Periyar National Park in Thekkady, Kerala, is one of the most bio-diverse regions in the world and the best-protected reserve area that one can lay eyes on in India. Famous for its gorgeousness, greenery and stillness, the park is the dwelling place of abundant significant species, including the royal tigers and majestic elephants apart from other reptiles, fishes and birds."));
        recycler_list.add(new Recycler_Item("Gir National Park",5,"https://www.tripsavvy.com/thmb/rjKB7dvRf2aybf0WHGtlyKVNWt0=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-1081266451-5ab50c7f8023b90036495226.jpg", "Video","Being one of the youth brands of Global Tourism India (GTI TRAVELS PRIVATE LIMITED), we know your needs the best and thus offer you the best of your time and money for Gir National Park Tour. Under the guidance of our expert guides you will have surely a life time experience or everyone looking to fulfill their wildlife fantasies across one of most renowned wildlife sanctuary of India, we offer Gir Wild Life Tour Package"));
        recycler_list.add(new Recycler_Item("Beas",5,"https://images.indianexpress.com/2017/10/radha-soami-satsang-beas.jpg","Video","Dera Baba Jaimal Singh is heavenly place for all Satsangis or who believe in Radha Soami. The beauty of Dera is No gadgets are allowed inside so if anybody goes for 2-3 days so you won't see phones/laptops/cameras in anyone's hand except who Sevadars who are living inside only."));
        recycler_list.add(new Recycler_Item("Sunderbans National Park",4,"https://indiator.com/tourist-places/wp-content/uploads/2018/01/sunderban_National-park.jpg", "Video","The Sunderbans ecosystem is a unique natural wonder of south Asia and the globe. The delta is spread over India and Bangladesh with an area of approximately 10,000 square kilometres and is enjoying the status of being largest halophytic mangrove forest in the world. It is a delta of the two great Indian River The Ganga and The Brahamputra which converges on the Bengal basin."));
        recycler_list.add(new Recycler_Item("Manali",3,"https://assets.traveltriangle.com/blog/wp-content/uploads/2019/08/Cover-for-winter-in-manali.jpg","Video","Rohtang pass is the stretch which connects Manali to Himachal's more dreamy and dessert like landscapes, Spiti and Lahaul, and is one itself. This vast snow desert is a landscape like only a few other and a view one should not miss, while here."));

        recyclerView=view.findViewById(R.id.list);
        recyclerView.setHasFixedSize(true);
        layoutManager=new LinearLayoutManager(getContext(),LinearLayoutManager.HORIZONTAL,false);
        adapter=new HorizontalAdapter(recycler_list,getContext());
        recyclerView.setLayoutManager(layoutManager);
        recyclerView.setAdapter(adapter);


        adapter.setOnItemClickListener(new HorizontalAdapter.OnItemClickListener() {
            @Override
            public void OnItemClick(int position) {

                Intent i=new Intent(getActivity(),Places.class);
                i.putExtra("name",recycler_list.get(position).getPlace());
                i.putExtra("description",recycler_list.get(position).getDesc());
                i.putExtra("url","https://videocdn.bodybuilding.com/video/mp4/62000/62792m.mp4");

                startActivity(i);
            }
        });

        searchView=view.findViewById(R.id.lisearch);
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                adapter.getFilter().filter(newText);
                return false;
            }
        });

        logout=view.findViewById(R.id.lilogout);
        logout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                AlertDialog.Builder builder=new AlertDialog.Builder(getActivity());
                builder.setTitle("Are you sure you want to Log Out?");
                builder.setPositiveButton("Log Out", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        getActivity().finish();
                        lifirebaseAuth.signOut();
                        startActivity(new Intent(getActivity(),MainActivity.class));
                    }
                });
                builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                    }
                });

                AlertDialog dialogue=builder.create();
                dialogue.show();
            }
        });

        return view;
    }

    private void fetchLastLocation() {
        if(ActivityCompat.checkSelfPermission(getContext(), Manifest.permission.ACCESS_FINE_LOCATION)!= PackageManager.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions(getActivity(),new String[]
                    {Manifest.permission.ACCESS_FINE_LOCATION},REQUEST_CODE);
            return;
        }
        Task<Location> task=fusedLocationProviderClient.getLastLocation();
        task.addOnSuccessListener(new OnSuccessListener<Location>() {
            @Override
            public void onSuccess(Location location) {
                if(location!=null){
                    currentLocation=location;
                    SupportMapFragment supportMapFragment=(SupportMapFragment)getChildFragmentManager().findFragmentById(R.id.google_map);
                    supportMapFragment.getMapAsync(LiveFragment.this);
                }
            }
        });
    }

    @Override
    public void onMapReady(GoogleMap googleMap) {
        String str = "You Are Here";

        try{
            geo=new Geocoder(getContext(), Locale.getDefault());
            add=geo.getFromLocation(currentLocation.getLatitude(), currentLocation.getLongitude(), 1);
            String line=add.get(0).getAddressLine(0);
            String area=add.get(0).getLocality();
            String city=add.get(0).getAdminArea();
            String country=add.get(0).getCountryName();
            String code=add.get(0).getPostalCode();

            str=line+","+area+","+city+","+country+","+code;
        }
        catch (IOException e) {
            e.printStackTrace();
        }

        if(currentLocation!=null){
            currentLocation.getLongitude();
        }

        LatLng latLng =new LatLng(currentLocation.getLatitude(),currentLocation.getLongitude());
        MarkerOptions markerOptions=new MarkerOptions().position(latLng).title(str);
        googleMap.animateCamera(CameraUpdateFactory.newLatLng(latLng));
        googleMap.animateCamera(CameraUpdateFactory.newLatLngZoom(latLng,16));
        googleMap.addMarker(markerOptions);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        switch (requestCode){
            case REQUEST_CODE:
                if(grantResults.length>0 && grantResults[0]== PackageManager.PERMISSION_GRANTED){
                    fetchLastLocation();
                }
                break;
        }
    }
}

package com.example.clickbata;

import androidx.appcompat.app.AppCompatActivity;

import android.net.Uri;
import android.os.Bundle;
import android.widget.MediaController;
import android.widget.TextView;
import android.widget.VideoView;

public class Places extends AppCompatActivity {
    TextView pname,pdesc;
    VideoView videoView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_places);

        pname=findViewById(R.id.placename);
        pdesc=findViewById(R.id.placedesc);
        videoView=findViewById(R.id.video);

        pname.setText(getIntent().getStringExtra("name"));
        pdesc.setText(getIntent().getStringExtra("description"));

        Uri uri=Uri.parse(getIntent().getStringExtra("url"));
        videoView.setVideoURI(uri);
        videoView.start();

        MediaController mediaController=new MediaController(this);
        videoView.setMediaController(mediaController);
        mediaController.setAnchorView(videoView);
    }
}

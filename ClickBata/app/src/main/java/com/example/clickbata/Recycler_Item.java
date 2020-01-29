package com.example.clickbata;

public class Recycler_Item {
    private String place;
    private int rating;
    private String imgurl,vidurl,desc;


    public Recycler_Item(String place, int rating, String imgurl, String vidurl, String desc) {
        this.place = place;
        this.rating = rating;
        this.imgurl = imgurl;
        this.vidurl = vidurl;
        this.desc = desc;
    }

    public String getPlace() {
        return place;
    }

    public int getRating() {
        return rating;
    }

    public String getImgurl() {
        return imgurl;
    }

    public String getVidurl() {
        return vidurl;
    }

    public String getDesc() {
        return desc;
    }
}

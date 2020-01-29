package com.example.clickbata;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;

public class MyPagerAdapter extends FragmentPagerAdapter {

    public MyPagerAdapter(FragmentManager fragmentManager){
        super(fragmentManager);
    }

    @Override
    public Fragment getItem(int position){
        if(position == 0)
            return new LiveFragment();
        else
            return new InfoFragment();
    }

    @Override
    public int getCount(){
        return 2;
    }

}

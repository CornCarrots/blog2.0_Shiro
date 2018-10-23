package com.lh.service;

import com.lh.bean.Advertisement;

import java.util.List;

public interface AdvertiseService {
    void add(Advertisement advertisement);
    void delete(int aid);
    void update(Advertisement advertisement);
    Advertisement get(int id);
    List<Advertisement> list();
}

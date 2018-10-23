package com.lh.service.impl;

import com.lh.bean.Advertisement;
import com.lh.bean.AdvertisementExample;
import com.lh.mapper.AdvertisementMapper;
import com.lh.service.AdvertiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AdvertiseServiceImpl implements AdvertiseService {
    @Autowired
    AdvertisementMapper mapper;
    @Override
    public void add(Advertisement advertisement) {
        mapper.insert(advertisement);
    }

    @Override
    public void delete(int aid) {
        mapper.deleteByPrimaryKey(aid);
    }

    @Override
    public void update(Advertisement advertisement) {
        mapper.updateByPrimaryKey(advertisement);
    }

    @Override
    public Advertisement get(int id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Advertisement> list() {
        AdvertisementExample example = new AdvertisementExample();
        example.setOrderByClause("id");
        return mapper.selectByExample(example);
    }
}

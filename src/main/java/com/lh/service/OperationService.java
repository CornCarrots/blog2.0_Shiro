package com.lh.service;

import com.lh.bean.Operation;

import java.util.List;

public interface OperationService {
    void add(Operation operation);
    void delete(int id);
    void update(Operation operation);
    Operation get(int id);
    List<Operation> list();

    List<Operation> listByModule(int mid);
    List<Operation> listByModuleAndRole(int mid,int rid);
}

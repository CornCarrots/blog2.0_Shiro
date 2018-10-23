package com.lh.service;


import com.lh.bean.Module;

import java.util.ArrayList;
import java.util.List;

public interface ModuleService {
    void add(Module module);
    void delete(int id);
    void update(Module module);
    Module get(int id);
    List<Module> list();
    List<Module> listByRole(int rid);

    List<String> listURL();
    List<String> listURLByParent(String s, int pid);
    String getChildURL(String url);

    List<Module> listByParent(int pid);
    List<Module> listExclude(int id);
    boolean hasChild(Module module);
    void fill(Module module);
    void fill(List<Module> modules);

    List<Module> listRoot();



}

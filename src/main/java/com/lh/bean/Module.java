package com.lh.bean;

import com.sun.org.apache.xpath.internal.operations.Mod;

import java.util.List;
import java.util.Objects;

public class Module {
    private Integer id;

    private String moduleName;

    private String moduleDesc;

    private Integer modulePid;

    private String moduleUrl;

    private List<Operation> operations;

    private List<Module> childs;

    public List<Module> getChilds() {
        return childs;
    }

    public void setChilds(List<Module> childs) {
        this.childs = childs;
    }

    public List<Operation> getOperations() {
        return operations;
    }

    public void setOperations(List<Operation> operations) {
        this.operations = operations;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName == null ? null : moduleName.trim();
    }

    public String getModuleDesc() {
        return moduleDesc;
    }

    public void setModuleDesc(String moduleDesc) {
        this.moduleDesc = moduleDesc == null ? null : moduleDesc.trim();
    }

    public Integer getModulePid() {
        return modulePid;
    }

    public void setModulePid(Integer modulePid) {
        this.modulePid = modulePid;
    }

    public String getModuleUrl() {
        return moduleUrl;
    }

    public void setModuleUrl(String moduleUrl) {
        this.moduleUrl = moduleUrl == null ? null : moduleUrl.trim();
    }

    @Override
    public String toString() {
        return "Module{" +
                "id=" + id +
                ", moduleName='" + moduleName + '\'' +
                ", moduleDesc='" + moduleDesc + '\'' +
                ", modulePid=" + modulePid +
                ", moduleUrl='" + moduleUrl + '\'' +
                '}';
    }
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Module other = (Module) obj;
        return Objects.equals(moduleUrl,((Module) obj).moduleUrl)&&Objects.equals(moduleName,((Module) obj).moduleName)&&Objects.equals(moduleDesc,((Module) obj).moduleDesc)&&id==((Module) obj).id&&modulePid==((Module) obj).getModulePid();
    }
}
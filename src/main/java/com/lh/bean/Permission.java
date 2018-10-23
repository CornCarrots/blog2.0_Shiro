package com.lh.bean;

public class Permission {
    private Integer id;

    private Integer mid;

    private Integer oid;

    private Module module;

    private Operation operation;

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    public Operation getOperation() {
        return operation;
    }

    public void setOperation(Operation operation) {
        this.operation = operation;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    @Override
    public String toString() {
        return "Permission{" +
                "id=" + id +
                ", mid=" + mid +
                ", oid=" + oid +
                ", module=" + module +
                ", operation=" + operation +
                '}';
    }
}
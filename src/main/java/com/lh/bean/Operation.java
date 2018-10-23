package com.lh.bean;

public class Operation {
    private Integer id;

    private String operationName;

    private String operationDesc;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOperationName() {
        return operationName;
    }

    public void setOperationName(String operationName) {
        this.operationName = operationName == null ? null : operationName.trim();
    }

    public String getOperationDesc() {
        return operationDesc;
    }

    public void setOperationDesc(String operationDesc) {
        this.operationDesc = operationDesc == null ? null : operationDesc.trim();
    }

    @Override
    public String toString() {
        return "Operation{" +
                "id=" + id +
                ", operationName='" + operationName + '\'' +
                ", operationDesc='" + operationDesc + '\'' +
                '}';
    }
}
package com.lh.bean;

public class Advertisement {
    private Integer id;

    private Integer advertisementRole;

    private String advertisementPath;

    private Integer menuStatus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAdvertisementRole() {
        return advertisementRole;
    }

    public void setAdvertisementRole(Integer advertisementRole) {
        this.advertisementRole = advertisementRole;
    }

    public String getAdvertisementPath() {
        return advertisementPath;
    }

    public void setAdvertisementPath(String advertisementPath) {
        this.advertisementPath = advertisementPath == null ? null : advertisementPath.trim();
    }

    public Integer getMenuStatus() {
        return menuStatus;
    }

    public void setMenuStatus(Integer menuStatus) {
        this.menuStatus = menuStatus;
    }
}
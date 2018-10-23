package com.lh.bean;

public class RolePermission {
    private Integer id;

    private Integer rid;

    private Integer pid;

    private Role role;

    private Permission permission;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Permission getPermission() {
        return permission;
    }

    public void setPermission(Permission permission) {
        this.permission = permission;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    @Override
    public String toString() {
        return "RolePermission{" +
                "id=" + id +
                ", rid=" + rid +
                ", pid=" + pid +
//                ", role=" + role +
//                ", permission=" + permission +
                '}';
    }
}
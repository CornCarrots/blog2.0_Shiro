<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/18
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="editRoleModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editRoleModel"
     aria-hidden="true">
    <div class="modal-dialog editRoleModelDialog">
        <div class="modal-content editRoleModelContent">
            <form action="" method="post" id="editRoleForm">
                <input type="hidden" name="_method" value="PUT">
                <input type="hidden" name="id" id="roleIDEdit" value="">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true"
                                                                                   class="editRoleNo">×</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" style="text-align: center">编辑角色</h4>
                </div>
                <div class="modal-body">
                    <table class="editRoleTable">
                        <tr>
                            <td>
                                <label for="roleNameEdit">角色名<span class="alarm">*</span></label>
                            </td>
                            <td>
                                <input type="text" placeholder="请输入角色名" id="roleNameEdit" class="form-control"
                                       name="roleName">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="roleDescEdit">角色描述<span class="alarm">*</span></label>
                            </td>
                            <td>
                                <input type="text" placeholder="请输入角色描述" id="roleDescEdit" class="form-control"
                                       name="roleDesc">
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="modal-footer" style="text-align: center">
                    <button class="btn btn-default" type="submit">确定</button>
                    <button data-dismiss="modal" class="btn btn-default editRoleNo" type="button">取消</button>
                </div>
                <div class="clearfix"></div>
            </form>

        </div>
    </div><!-- /.modal-content -->
</div>

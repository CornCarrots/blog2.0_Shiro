<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/18
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="deleteRoleModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="deleteRoleModel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="height: 133px">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true" class="deleteRoleNo">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" style="text-align: center">是否删除？</h4>
            </div>
            <div class="modal-body" style="text-align: center;display: none">
                <span id="deleteRoleError" style="color: red;font-size: 14px"></span>
            </div>
            <div class="modal-footer" style="text-align: center">
                <form action="" id="deleteRoleForm" method="post">
                    <input type="hidden" name="_method" value="DELETE">
                </form>
                <a href="" class="btn btn-default" id="deleteRoleConfirm">确定</a>
                <button data-dismiss="modal" class="btn btn-default deleteRoleNo" type="button">取消</button>
            </div>
            <div class="clearfix"></div>
        </div>
    </div><!-- /.modal-content -->
</div>

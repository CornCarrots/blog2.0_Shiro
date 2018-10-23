<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/19
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="editOperationModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editOperationModel"
     aria-hidden="true">
    <div class="modal-dialog editOperationModelDialog">
        <div class="modal-content editOperationModelContent">
            <form action="" method="post" id="editOperationForm">
                <input type="hidden" name="_method" value="PUT">
                <input type="hidden" name="id" id="operationIDEdit">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true" class="editOperationNo">×</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" style="text-align: center">编辑权限</h4>
                </div>
                <div class="modal-body">
                    <table class="editOperationTable">
                        <tr>
                            <td>
                                <label for="operationNameEdit">名称<span class="alarm">*</span></label>
                            </td>
                            <td>
                                <input type="text" placeholder="请输入权限名称" id="operationNameEdit" class="form-control" name="operationName">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="operationDescripateEdit">描述</label>
                            </td>
                            <td>
                                <input type="text" placeholder="请输入权限描述" id="operationDescripateEdit" class="form-control" name="operationDesc">
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer" style="text-align: center">
                    <button class="btn btn-default" type="submit">确定</button>
                    <button data-dismiss="modal" class="btn btn-default editOperationNo" type="button">取消</button>
                </div>
                <div class="clearfix"></div>
            </form>

        </div>
    </div><!-- /.modal-content -->
</div>

<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/23
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="editAdvertiseModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editAdvertiseModel"
     aria-hidden="true">
    <div class="modal-dialog editAdvertiseModelDialog">
        <div class="modal-content editCategoryModelContent">
            <form action="" method="post" id="editAdvertiseForm" enctype="multipart/form-data">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true" class="editAdvertiseNo">×</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" style="text-align: center">编辑轮播图</h4>
                </div>
                <div class="modal-body">
                    <table class="editAdvertiseTable">
                        <tr>
                            <td>
                                <label for="advertiseRoleEdit">顺序<span class="alarm">*</span></label>
                            </td>
                            <td>
                                <input type="text" placeholder="请输入轮播图顺序" id="advertiseRoleEdit" class="form-control" name="advertisementRole">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="uploadFile">图片<span class="alarm">*</span></label>
                            </td>
                            <td>
                                <label for="uploadFile" class=" btn btn-default">
                                    <i class="glyphicon glyphicon-plus"></i>
                                    选择图片
                                </label>
                                <input id="uploadFile" name="image" type="file" accept="image/*" style="display:none"/>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer" style="text-align: center">
                    <button class="btn btn-default" type="submit">确定</button>
                    <button data-dismiss="modal" class="btn btn-default editAdvertiseNo" type="button">取消</button>
                </div>
                <div class="clearfix"></div>
            </form>

        </div>
    </div><!-- /.modal-content -->
</div>

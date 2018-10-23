<%--
  Created by IntelliJ IDEA.
  User: 林浩
  Date: 2018/10/19
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="editModuleModel" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editModuleModel"
     aria-hidden="true">
    <div class="modal-dialog editModuleModelDialog">
        <div class="modal-content editModuleModelContent">
            <form action="" method="post" id="editModuleForm">
                <input type="hidden" name="_method" value="PUT">
                <input type="hidden" name="id" id="moduleIDEdit">
                <div class="modal-header">
                    <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true" class="editModuleNo">×</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" style="text-align: center">编辑分类</h4>
                </div>
                <div class="modal-body">
                    <table class="editModuleTable">
                        <tr>
                            <td>
                                <label for="moduleNameEdit">名称<span class="alarm">*</span></label>
                            </td>
                            <td>
                                <input type="text" placeholder="请输入模块名称" id="moduleNameEdit" class="form-control" name="moduleName">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="moduleParentEdit">父节点<span class="alarm">*</span></label>
                            </td>
                            <td>
                                <select  class="selectpicker" data-style="btn-success" tabindex="-98" id="moduleParentEdit" name="modulePid">
                                    <%--<option value="1">..</option>--%>
                                    <%--<c:forEach items="${modules}" var="modu">--%>
                                        <%--<option value="${modu.id}">${modu.moduleName}</option>--%>
                                    <%--</c:forEach>--%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="moduleDescripateEdit">描述</label>
                            </td>
                            <td>
                                <input type="text" placeholder="请输入模块描述" id="moduleDescripateEdit" class="form-control" name="moduleDesc">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="moduleURLEdit">url</label>
                            </td>
                            <td>
                                <input type="text" placeholder="请输入模块URL" id="moduleURLEdit" class="form-control" name="moduleUrl">
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer" style="text-align: center">
                    <button class="btn btn-default" type="submit" id="editModuleButton">确定</button>
                    <button data-dismiss="modal" class="btn btn-default editModuleNo" type="button">取消</button>
                </div>
                <div class="clearfix"></div>
            </form>

        </div>
    </div><!-- /.modal-content -->
</div>


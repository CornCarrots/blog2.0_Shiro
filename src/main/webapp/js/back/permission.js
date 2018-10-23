$(function () {
    $("input[name='operationCheckBox']").click(
        function () {
            var node = $('#treeview-checkable').treeview('getSelected');
            if(node.length<=0)
            {
                alert("请先选择模块!");
                return false;
            }
            var mid = checkChecked(node);
            if(mid==0)
                return false;
            else
            {
                var rid = $("#rid").text();
                var oid = $(this).val();
                var permission = {
                    "mid":mid,
                    "oid":oid
                };
                var checked = $(this).prop("checked");
                var type = "post";
                if(!checked)
                    type = "delete";
                $.ajax(
                    {
                        type:type,
                        url:getContentPath()+"/admin/system/roles/permission/"+rid+"/operation",
                        data:JSON.stringify(permission),
                        dataType:"json",
                        contentType:"application/json;charset=utf8",
                        success:function (data) {
                            console.log(data);
                        }
                    }
                );
            }
        }
    );

});
function checkChecked(nodes) {
    var node = $(nodes)[0];
    console.log(node);
    if (node.state.checked==false)
    {
        alert("请先勾选模块!");
        return 0;
    }
    return node.id;
}
var nodeCheckedSilent = false;
var nodeSelectedSilent = false;

function nodeSelected (event, node) {
    dochecklist2();
    dochecklist1(node);
    if (nodeSelectedSilent) {
        return;
    }
    nodeSelectedSilent = true;
    // checkAllParent1(node);
    // checkAllSon1(node);
    nodeSelectedSilent = false;
}
function nodeChecked(event, node) {
    $('#treeview-checkable').treeview('unselectNode', node);
    // dochecklist3(node);
    if (nodeCheckedSilent) {
        return;
    }
    nodeCheckedSilent = true;
    checkAllParent(node);
    checkAllSon(node);
    nodeCheckedSilent = false;
}

var nodeUncheckedSilent = false;
var nodeSelectedSilent = false;

function nodeUnselected(event, node) {
    dochecklist2();
    if (nodeSelectedSilent)
        return;
    nodeSelectedSilent = true;
    // uncheckAllParent1(node);
    // uncheckAllSon1(node);
    nodeSelectedSilent = false;
}
function nodeUnchecked(event, node) {
    $('#treeview-checkable').treeview('unselectNode', node);
    dochecklist2();
    if (nodeUncheckedSilent)
        return;
    nodeUncheckedSilent = true;
    uncheckAllParent(node);
    uncheckAllSon(node);
    nodeUncheckedSilent = false;
}

//选中全部父节点  
function checkAllParent(node) {
    $('#treeview-checkable').treeview('checkNode', node.nodeId, {silent: true});
    var parentNode = $('#treeview-checkable').treeview('getParent', node.nodeId);
    if (!("nodeId" in parentNode)) {
        return;
    } else {
        checkAllParent(parentNode);
    }
}

//取消全部父节点  
function uncheckAllParent(node) {
    $('#treeview-checkable').treeview('uncheckNode', node.nodeId, {silent: true});
    var siblings = $('#treeview-checkable').treeview('getSiblings', node.nodeId);
    var parentNode = $('#treeview-checkable').treeview('getParent', node.nodeId);
    if (!("nodeId" in parentNode)) {
        return;
    }
    var isAllUnchecked = true;  //是否全部没选中  
    for (var i in siblings) {
        if (siblings[i].state.checked) {
            isAllUnchecked = false;
            break;
        }
    }
    if (isAllUnchecked) {
        uncheckAllParent(parentNode);
    }

}

//级联选中所有子节点  
function checkAllSon(node) {
    $('#treeview-checkable').treeview('checkNode', node.nodeId, {silent: true});
    if (node.nodes != null && node.nodes.length > 0) {
        for (var i in node.nodes) {
            checkAllSon(node.nodes[i]);
        }
    }
}

//级联取消所有子节点  
function uncheckAllSon(node) {
    $('#treeview-checkable').treeview('uncheckNode', node.nodeId, {silent: true});
    if (node.nodes != null && node.nodes.length > 0) {
        for (var i in node.nodes) {
            uncheckAllSon(node.nodes[i]);
        }
    }
}

//处理选中记录
function dochecklist1(node) {
    var rid = $("#rid").text();
    $.ajax(
        {
            type:"post",
            url:getContentPath()+"/admin/system/roles/permission/"+rid+"/operation/"+node.id,
            dataType:"json",
            contentType:"application/json;charset=utf8",
            success:function (data) {
                console.log(data);
                if(data.list)
                {
                    $("input[name='operationCheckBox']").prop("checked",false);
                    var list = data.list;
                    $.each(list,function (name, value) {
                        var id = value.id;
                        $("#tree_"+id).prop("checked",true);
                    });
                }
            }
        }
    )
}
function dochecklist2(){
    $("input[name='operationCheckBox']").prop("checked",false);
}

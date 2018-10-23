$(
    function () {
        $(".editRoleButton").click(
            function () {
                var button = $(this).parent();
                var name = button.prev().prev().text().trim();
                var desc = button.prev().text().trim();
                var rid = button.prev().prev().prev().text().trim();
                $("#roleNameEdit").val(name);
                $("#roleDescEdit").val(desc);
                $("#roleIDEdit").val(rid);
                var url = $(this).attr("href");
                $("#editRoleForm").attr("action",url);
                $("#editRoleModel").modal("show");
                return false;
            }
        );
        $(".editRolerNo").click(
            function () {
                $("#editRoleForm").attr("action","");
                $("#roleDescEdit").val("");
                $("#roleNameEdit").val("");
                $("#roleIDEdit").val("");
            }
        );
        $(".deleteRoleOne").click(
            function () {
                var url = $(this).attr("rid");
                $("#deleteRoleForm").attr("action",url);
                $("#deleteRoleModel").modal("show");
            }
        );
        $("#deleteRoleConfirm").click(
            function () {
                $("#deleteRoleForm").submit();
                return false;
            }
        );
        $(".deleteRoleNo").click(
            function () {
                $("#deleteRoleForm").attr("action","");
            }
        );
        $("#deleteRoleConfirm").click(
            function () {
                $("#deleteRoleForm").submit();
                return false;
            }
        );
    }
);
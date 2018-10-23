$(
    function () {
        $(".userRole").bind('change',
            function () {
                var dataname = $(this).val();
                var url = $(this).attr("uid");
                var td = $(this).parent().parent().parent().prev();
                $.ajax(
                    {
                        type:"put",
                        url:url,
                        dataType:"json",
                        contentType:"application/json;charset=utf8",
                        data:JSON.stringify(dataname),
                        success:function (data) {
                            // console.log(data);
                            td.empty();
                            $.each(data.roles,function (index, content) {
                                // console.log(content);
                                td.append(""+content.roleDesc+"<br>");
                            });
                        }
                    }
                )
            }
        );
        $(".editUserNo").click(
            function () {
                $("#editUserForm").attr("action", "");
            }
        );
        $(".deleteUserOne").click(
            function () {
                var url = $(this).attr("aid");
                $("#deleteUserForm").attr("action", url);
                $("#deleteUserModel").modal("show");
            }
        );
        $(".deleteUserNo").click(
            function () {
                $("#deleteUserForm").attr("action", "");
            }
        );
        $("#deleteUserConfirm").click(
            function () {
                $("#deleteUserForm").submit();
                return false;
            }
        );
    }
);
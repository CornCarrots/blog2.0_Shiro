$(
    function () {
        $(".editOneModule").click(
            function () {
                var button = $(this).parent();
                var id = $(this).attr("mid");
                var name = button.prev().prev().prev().text().trim();
                var desc = button.prev().prev().text().trim();
                var url = button.prev().text().trim();
                $("#moduleIDEdit").val(id);
                $("#moduleNameEdit").val(name);
                $("#moduleDescripateEdit").val(desc);
                $("#moduleURLEdit").val(url);
                $("#editModuleForm").attr("action",$(this).next().attr("mid"));
                $.ajax(
                    {
                        type: "get",
                        url: $(this).next().attr("mid"),
                        dataType:"json",
                        contentType: "application/json;charset=utf8",
                        success: function (data) {
                            var select =  $("#moduleParentEdit");
                            select.empty();
                            select.append("<option value=0>无</option>");
                            // var html='';
                            $.each(data.modules,function (index,content) {
                                // console.log(content);
                                // console.log(content);
                                select.append("<option value=" + content.id + ">" + content.moduleDesc + "</option>");
                            }
                        );
                            // $("#moduleParentEdit").append(html);
                            select.selectpicker('refresh');
                            $("#editModuleModel").modal('show');
                        }

                    }
                )
            }
        );
        $(".editCategoryNo").click(
            function () {
                // var url = $("#editCategoryForm").attr("action");
                // $("#editCategoryForm").attr("action",url.substring(0,url.lastIndexOf("/")+1));
                $("#moduleIDEdit").val("");
                $("#moduleNameEdit").val("");
                $("#moduleDescripateEdit").val("");
                $("#moduleURLEdit").val("");
                $("#editModuleForm").attr("action","");
            }
        );
        $(".deleteOneModule").click(
            function () {
                var url = $(this).attr("mid");
                $("#deleteModuleConfirm").attr("href", url);
                $("#deleteModuleModel").modal('show');
            }
        );
        $("#deleteModuleConfirm").click(
            function () {
                var url = $(this).attr("href");
                $.ajax(
                    {
                        type: "delete",
                        url: url,
                        dataType: "json",
                        contentType: "application/json;charset=utf-8",
                        success: function (data) {
                            if (data.result == "success") {
                                location.href = url.substring(0, url.lastIndexOf("/"));
                            }
                            else if (data.result == "child") {
                                $(".modal-content").css("height", "170px");
                                $(".modal-body").show();
                                $("#deleteModuleError").text("请先删除子模块！");
                            }
                            else {
                                console.log(data);
                            }
                        }
                    }
                );
                return false;
            }
        );
        $(".deleteModuleNo").click(
            function () {
                $(".modal-content").css("height", "120px");
                $(".modal-body").hide();
                $("#deleteModuleError").text("");
            }
        );
    }
);
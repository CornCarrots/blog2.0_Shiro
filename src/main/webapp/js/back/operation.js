$(
    function () {
        $(".editOneOperation").click(
            function () {
                var button = $(this).parent();
                var id = $(this).attr("oid");
                var name = button.prev().prev().text().trim();
                var desc = button.prev().text().trim();
                $("#operationIDEdit").val(id);
                $("#operationNameEdit").val(name);
                $("#operationDescripateEdit").val(desc);
                $("#editOperationForm").attr("action",$(this).next().attr("oid"));
                $("#editOperationModel").modal('show');
            }
        );
        $(".editOperationNo").click(
            function () {
                // var url = $("#editCategoryForm").attr("action");
                // $("#editCategoryForm").attr("action",url.substring(0,url.lastIndexOf("/")+1));
                $("#operationIDEdit").val("");
                $("#operationNameEdit").val("");
                $("#operationDescripateEdit").val("");
                $("#editOperationForm").attr("action","");

            }
        );
        $(".deleteOneOperation").click(
            function () {
                var url = $(this).attr("oid");
                $("#deleteOperationConfirm").attr("href",url);
                $("#deleteOperationModel").modal('show');
            }
        );
        $("#deleteOperationConfirm").click(
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
                            else {
                                console.log(data);
                            }
                        }
                    }
                );
                return false;
            }
        );
        $(".deleteOperationNo").click(
            function () {
                $(".modal-content").css("height","120px");
                $(".modal-body").hide();
                $("#deleteCategoryError").text("");
            }
        );
    }
);
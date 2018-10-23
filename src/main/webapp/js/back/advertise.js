$(
    function () {
        $(".editAdvButton").click(
            function () {
                var url = $(this).attr("href");
                var order = $(this).parent().prev().prev().text().trim();
                $("#editAdvertiseForm").attr("action",url);
                $("#advertiseRoleEdit").val(order);
                $("#editAdvertiseModel").modal("show");
                return false;
            }
        );
        $(".editAdvertiseNo").click(
            function () {
                $("#editAdvertiseForm").attr("action","");
                $("#advertiseRoleEdit").val("");
                $("#uploadFile").val("");
            }
        );
    }
);
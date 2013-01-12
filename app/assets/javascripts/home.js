(function($){
    $(document).ready(function(){
        $("#run_query").click(function(){
            var format = "json"
            $.ajax({
                url: "/home/run_query." + format,
                type: "POST",
                dataType: "json",
                data: {
                    query:$("#query").val(),
                }
            }).done(function(res){
                    $("#result").removeClass("success");
                    $("#result").removeClass("error");
                    $("#result").addClass(res.status);

                    if(format == "json"){
                        $("#result").val( JSON.stringify(res.result));
                    }
                });
        });
    });
})(jQuery);

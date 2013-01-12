(function($){
    $(document).ready(function(){
        $("#run_query").click(function(){
            var format = get_radio_value("format-radio-group");
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
                        $("#result").val( JSON.stringify(res.result) );
                    }
                });
        });

        function get_radio_value(id){
            var selected_value = null;
            $("#" + id + " button").each(function(){
                if($(this).hasClass("active")){
                    selected_value = $(this).val();
                }
            });
            return selected_value;
        }
    });
})(jQuery);

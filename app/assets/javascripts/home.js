(function($){
    $(document).ready(function(){
        $("#run_query").click(function(){
            var format = get_radio_value("format-radio-group");

            var dataType = format;
            if(format == "csv"){
                dataType = "html";
            }

            $.ajax({
                url: "/home/run_query." + format,
                type: "POST",
                dataType: dataType,
                data: {
                    query:$("#query").val(),
                }
            }).done(function(res){
                    if(format == "json"){
                        $("#result").val( JSON.stringify(res) );
                    } else if(format == "csv"){
                        $("#result").val( res );
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

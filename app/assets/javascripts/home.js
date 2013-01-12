(function($){
    $(document).ready(function(){
        $("#run_query").click(function(){
            var format = get_radio_value("format-radio-group");

            var dataType = format;
            if(format == "csv"){
                dataType = "text";
            }

            $.ajax({
                url: "/home/run_query." + format,
                type: "POST",
                dataType: dataType,
                data: {
                    query:$("#query").val(),
                }
            }).done(function(res){
                    $("#result-plain").hide();
                    $("#result-dom").hide();

                    if(format == "html"){
                        $("#result-dom").show();
                    } else{
                        $("#result-plain").show();
                    }

                    if(format == "json"){
                        $("#result-plain").val( JSON.stringify(res) );
                    } else if(format == "csv"){
                        $("#result-plain").val( res );
                    } else if(format == "html"){
                        $("#result-dom").empty();
                        $("#result-dom").append( $(res) );
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

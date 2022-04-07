$(function() {
    console.log("Patate");

    if ($("#customer_select").val() == "") {
        $("#building_select option").remove();
        var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
        $(row).appendTo("#building_select");
    }

    $("#customer_select").change(function() {
        console.log("TOTO-----------------------");
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("#building_select option").remove();
            var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
            $(row).appendTo("#building_select");
            console.log("goooooooooooood");
        } else {
            // Send the request and update building dropdown
            console.log("###########################");
            console.log(id_value_string);
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_building_by_customer/' + id_value_string,
                timeout: 5000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
            },
            
            success: function(data) {
                // Clear all options from building select
                $("#building_select option").remove();
                console.log("very gooooooooddddddd");
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
        $(row).appendTo("#building_select");
        // Fill course select
        $.each(data, function(i, j) {
        row = "<option value=\"" + j.id + "\">" + j.full_name_of_the_building_administrator + "</option>";
        $(row).appendTo("#building_select");
        console.log('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ ');
        });
       }
      });
     }
    });

});







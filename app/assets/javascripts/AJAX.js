// building function------------------------------------
$(function() {
    console.log("Patate");

    if ($("#customer_select").val() == "") {
        $("#building_select option").remove();
        var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
        $(row).appendTo("#building_select");
    }

    $("#customer_select").change(function() {
        // console.log("TOTO-----------------------");
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("#building_select option").remove();
            var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
            $(row).appendTo("#building_select");
            // console.log("goooooooooooood");
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
                // console.log("very gooooooooddddddd");
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "Building" + "</option>";
        $(row).appendTo("#building_select");
        // Fill course select
        $.each(data, function(i, j) {
        row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
        $(row).appendTo("#building_select");
        console.log('FUNCTION 1');
        });
       }
      });
     }
    });

});


// battery function----------------------------------------
$(function() {
    console.log("Patate2");

    if ($("#building_select").val() == "") {
        $("#battery_select option").remove();
        var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
        $(row).appendTo("#battery_select");
    }

    $("#building_select").change(function() {
        // console.log("yOyO-----------------------");
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("#battery_select option").remove();
            var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
            $(row).appendTo("#battery_select");
            // console.log("goooooooooooood2222222");
        } else {
            // Send the request and update building dropdown
            console.log("###########################");
            console.log(id_value_string);
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_battery_by_building/' + id_value_string,
                timeout: 5000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
            },
            
            success: function(data) {
                // Clear all options from building select
                $("#battery_select option").remove();
                // console.log("mucho gooooooooddddddd");
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "Battery" + "</option>";
        $(row).appendTo("#battery_select");
        // Fill course select
        $.each(data, function(i, j) {
        row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
        $(row).appendTo("#battery_select");
        console.log('FUNCTION 2');
        });
       }
      });
     }
    });

});
// column function----------------------------------------
$(function() {
    console.log("Patate2");

    if ($("#battery_select").val() == "") {
        $("#column_select option").remove();
        var row = "<option value=\"" + "" + "\">" + "Column" + "</option>";
        $(row).appendTo("#column_select");
    }

    $("#battery_select").change(function() {
        // console.log("yOyO-----------------------");
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("#column_select option").remove();
            var row = "<option value=\"" + "" + "\">" + "Column" + "</option>";
            $(row).appendTo("#column_select");
            // console.log("goooooooooooood2222222");
        } else {
            // Send the request and update building dropdown
            console.log("###########################");
            console.log(id_value_string);
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_column_by_battery/' + id_value_string,
                timeout: 5000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
            },
            
            success: function(data) {
                // Clear all options from building select
                $("#column_select option").remove();
                // console.log("mucho gooooooooddddddd");
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "Column" + "</option>";
        $(row).appendTo("#column_select");
        // Fill course select
        $.each(data, function(i, j) {
        row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
        $(row).appendTo("#column_select");
        console.log('FUNCTION 3');
        });
       }
      });
     }
    });

});
//elevator function----------------------------------------
$(function() {

    if ($("#column_select").val() == "") {
        $("#elevator_select option").remove();
        var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
        $(row).appendTo("#elevator_select");
    }

    $("#column_select").change(function() {
        var id_value_string = $(this).val();
        if (id_value_string == "") {
            $("#elevator_select option").remove();
            var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
            $(row).appendTo("#elevator_select");
        } else {
            // Send the request and update building dropdown
            console.log("###########################");
            console.log(id_value_string);
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_elevator_by_column/' + id_value_string,
                timeout: 5000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to submit : " + errorTextStatus + " ;" + error);
            },
            
            success: function(data) {
                // Clear all options from building select
                $("#elevator_select option").remove();
                // console.log("mucho gooooooooddddddd");
        //put in a empty default line
        var row = "<option value=\"" + "" + "\">" + "Elevator" + "</option>";
        $(row).appendTo("#elevator_select");
        // Fill course select
        $.each(data, function(i, j) {
        row = "<option value=\"" + j.id + "\">" + j.id + "</option>";
        $(row).appendTo("#elevator_select");
        console.log('FUNCTION 4');
        });
       }
      });
     }
    });

});







$(document).ready(function(){

    $("#btnAlign").click(function(){

        var align = $(".content-row").css("text-align");

        if(align == "left"){
            $(".content-row").css("text-align","center");
        }
        else if(align == "center"){
            $(".content-row").css("text-align","right");
        }
        else{
            $(".content-row").css("text-align","left");
        }

    });


    $("#btnBg").click(function(){

        $(".box").toggleClass("bg-danger");

    });

});
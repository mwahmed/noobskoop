$("ul#demo_menu1").sidebar();  
$("ul#demo_menu2").sidebar({  
    position:"right",  
    events:{  
        item : {  
            enter : function(){  
                $(this).find("a").animate({color:"red"}, 250);  
            },  
            leave : function(){  
                $(this).find("a").animate({color:"white"}, 250);  
            }  
        }  
    }  
});  
$("ul#demo_menu3").sidebar({  
    position:"top",  
    open:"click"  
});  
$("ul#demo_menu4").sidebar({  
    position:"bottom"  
});  

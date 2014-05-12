
// $("select#entry_birth_year").change(function(){
//     alert("success1");
// 	$.ajax({
// 		url: "static_pages/change_day_select",
// 		type: "GET",
// 		data: {birth_month : ":birth_month",birth_day : @_birth_day,
// 				id: 1,
// 				mode: 'hoge',
//                     type: 'entry'
//                     },
//             dataType: "html",
//             success: function(data) {
//                 alert("success2");
//             },
//             error: function(data) {
//                 alert("errror");
//             }
//         });
//     });
document.getElementById('29day').style.display = "none";
$("#day_select").change(@entry,function () {
	var data= $(this).val();
	if(data==2){
            document.getElementById('31day').style.display = "none";
        	}
  	$.ajax({
		url: "/change_day_select",
		type: "GET",
		data: {birth:":birth_month",
				mode: 'hoge',
	            type: 'entry'
	            },
        dataType: "html",
        success: function(data) {
            // alert("success2");
            
        },
        error: function(data) {
            alert("errror");
        }
    });
});
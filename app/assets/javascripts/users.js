$(document).ready(function(){

	$(".admin-checkbox").change(function() {
	    $.ajax({
		    type: "PATCH",
		    url: '/users/'+this.id+'/toggle',
		    dataType: 'text',
	  		contentType: "application/json",
		    success: function(msg) {
		    	console.log(msg);
	      	}
		});
	});
	
})

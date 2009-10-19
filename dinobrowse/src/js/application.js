$(document).ready(function() {
	favourites = new Favourites($("#favourites"));

	$(".add_to_favourites_link").click(function() {
		var dinosaur = new Dinosaur($(this).parent());
		favourites.addDinosaur(dinosaur);
		favourites.refresh();
	});
		
	$(".dinosaur").addClass("collapsed");
	
	$(".dinosaur:first").removeClass("collapsed");
	
	$('#links a').click(function(){
		$(".dinosaur").not(".collapsed").addClass("collapsed");
		var name = $(this).html();
		$(".dinosaur h2 a[name='" + name + "']").parent().parent().removeClass("collapsed");
	});
	
});


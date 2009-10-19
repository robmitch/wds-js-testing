Screw.Unit(function() {
	before(function() {
		$("#fixtures").html($("#template_fixtures").html());
	});
	after(function() {
		$("#fixtures").empty();
	});
})


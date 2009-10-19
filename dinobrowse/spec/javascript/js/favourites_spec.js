Screw.Unit(function() {
  describe("Favourites", function() {

	  before(function() {
		favourites = new Favourites($("#favourites"));
	  });
	
	  describe("by default", function() {

        it("has no dinosaurs", function() {
          expect(favourites.getNumberOfDinosaurs()).to(equal, 0);
        });
		
 	  });
	
	  describe("adding a dinosaur", function() {
		
		before(function() {
		  favourites.addDinosaur(dinosaur);
		});
		
		it('increments the number of dinosaurs', function() {
		  expect(favourites.getNumberOfDinosaurs()).to(equal, 1);
		});
		
		it("can not add a dinosaur if it already exists", function() {
		  dinosaur = { equals: function() { return true } }
		  favourites.addDinosaur(dinosaur);
		  expect(favourites.getNumberOfDinosaurs()).to(equal, 1);
		});
		
	  });

	  describe("rendering", function() {
		
		before(function() {
		  favourites.addDinosaur({ getName: function() { return "Apatosaurus" } });
		  favourites.refresh();
		});
		
		it("shows the dinosaur as a numbered list item", function() {
		  expect($("#favourites_content > ol > li:first").html()).to(equal, "Apatosaurus");	
		});
		
	  });
	
  });
  
});

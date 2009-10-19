Screw.Unit(function() {
  describe("A Dinosaur", function() {

	before(function() {
	  dinosaur = new Dinosaur($(".dinosaur"));
	});
	
    it("can get the name from the enclosed h2 element", function() {
      expect(dinosaur.getName()).to(equal, 'Dino1');
    });

	it("equals another dinosaur by name", function() {
	  var anotherDinosaur = {getName: function() { return 'Dino1' } };
	  expect(dinosaur.equals(anotherDinosaur)).to(be_true);
	});
	
  });
  
});

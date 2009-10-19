function Dinosaur(element) {
	this.element = element;
};

Dinosaur.prototype = {
	getName: function() {
		return this.element.find('a').html();
	},

	equals: function(other) {
		return this.getName() == other.getName();
	}
};


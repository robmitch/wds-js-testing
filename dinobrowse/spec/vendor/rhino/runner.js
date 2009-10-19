(function() {
  function suite(location) {

    var bootstrap = function() {
      load('spec/vendor/rhino/env.rhino.js');
      window.location = location;
      load('spec/vendor/rhino/jquery.js');
    }

    var execute = function() {
      $(document).trigger('screwunit.execute');
    }

    bootstrap();
	execute();
  };

  suite('spec/javascript/suite.html');
})();

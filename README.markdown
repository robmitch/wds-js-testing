To run the js test examples in your browser open dinobrowse/spec/javascript/suite.html in your browser.

To view the application open dinobrowse/src/index.html in your browser.

Pre-requisites for running the tests via rake:
install ruby (instructions per environment are numerous on the web)
install rubygems

required gems:
rack
selenium-client
sinatra
thin
rspec

Running the js tests using rake:

rake spec:javascript

Running the selenium tests using rake:

rake spec:selenium


We had a go at writing some specs for watir, but gave up as watir does not make it easy to inspect the dom, the code is still here for perusal. The same goes for running the specs headless using Rhino.


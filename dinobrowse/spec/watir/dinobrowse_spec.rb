require File.dirname(__FILE__) + '/spec_helper'
require 'safariwatir/scripter'

describe "DinoBrowse" do

  before do
    $browser.goto("http://localhost:4444")
  end
  
  it "has the title Dinos-R-us" do
    $browser.title.should == "Dinos-R-us"
  end
  
  describe "select a dinosaur" do
    before do
      $browser.link(:text, 'Apatosaurus').click
    end
    
    it "should show dinosaur content" do
      $browser.div(:id, 'apatosaurus')
    end
    
  end
end
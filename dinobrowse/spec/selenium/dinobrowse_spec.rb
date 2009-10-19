require File.dirname(__FILE__) + '/spec_helper'

describe "DinoBrowse" do

  before do
    $browser.open("http://localhost:3000")
  end
  
  it "has the title Dinos-R-us" do
    $browser.title.should == "Dinos-R-us"
  end
  
  describe "select a dinosaur" do
    before do
      $browser.click("css=#links a[href='#Apatosaurus']")
    end
    
    it "should display content" do
      $browser.visible?("css=div#apatosaurus").should be_true
    end

    it "should hide other dinosaurs" do
      $browser.visible?("css=div#ankylosaurus").should be_false
    end
    
    it "should be able to add to favourites" do
      $browser.click("css=div#apatosaurus a.add_to_favourites_link")
      $browser.text("css=div#favourites_content ol li").should == 'Apatosaurus'
    end
    
  end
end
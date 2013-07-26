require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the h1 'How to teach Magic: The Gathering'" do
      visit '/'
      page.should have_selector('h1', :text => 'How do I teach Magic: The Gathering')
    end

    it "should have the title 'How to teach Magic: The Gathering'" do
      visit '/'
      page.should have_selector('title', :text => "How to teach Magic: The Gathering")
    end
  end

end

require_relative '../spec_helper'

base_title = "SampleApp"

describe "StaticPages" do
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content("Sample App")
    end
    it "should have Home in title" do
      visit '/static_pages/home'
      page.should have_title('Home | '+base_title)
    end
  end

  describe "Help page" do
  	it "should have the content 'help'" do
  		visit '/static_pages/help'
  		page.should have_content('help')
  	end
    it "should have Help in title" do
      visit '/static_pages/help'
      page.should have_title('Help | '+base_title)
    end
  end

  describe "About page" do 
    it "should have the content 'About'" do
      visit '/static_pages/about'
      page.should have_content('About')
    end
    it "should have About in title" do
      visit '/static_pages/about'
      page.should have_title('About | '+base_title)
    end
  end

  describe "Contact page" do 
    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      page.should have_content('Contact')
    end
    it "should have Contact in title" do
      visit '/static_pages/contact'
      page.should have_title('Contact | '+base_title)
    end
  end

end
require_relative '../spec_helper'

base_title = "SampleApp"

describe "StaticPages" do

  subject { page }
  describe "Home page" do
    before { visit root_path }
    it { should have_content("SampleApp") }
    it { should_not have_title("Home") }
  end

  describe "Help page" do
    before { visit help_path }
  	it { should have_content("Help") }
    it { should have_title("Help") }
  end

  describe "About page" do 
    before { visit about_path }
    it { should have_content("About") }
    it { should have_title("About") }
  end

  describe "Contact page" do 
    before { visit contact_path }
    it { should have_content("Contact") }
    it { should have_title("Contact") }
  end

end
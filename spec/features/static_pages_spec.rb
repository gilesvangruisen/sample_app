require_relative '../spec_helper'

describe "StaticPages" do

  subject { page }
  describe "Home page" do
    before { visit root_path }
    it { should have_content("SampleApp") }
    it { should_not have_title("Home") }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end
      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
      
      describe "follower/following counts" do
        let!(:other_user) { FactoryGirl.create(:user, :email => "diff@sdf.com") }
        before do
          other_user.follow!(user)
          visit root_path
        end
        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
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
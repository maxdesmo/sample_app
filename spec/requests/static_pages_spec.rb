require 'spec_helper'

describe "Static pages" do

    let(:base_title) { "Ruby on Rails Tutorial Sample App" }

    # Subject of our tests. Calls to "should" will use page
    # e.g "page.should have_selector" is the same as "should have_selector"
    subject { page }    

    # full_title can be found in spec/support/utilities.rb (auto included by rspec)
    describe "Home page" do
        before { visit root_path }  # Do before each test

        it { should have_selector('h1',     text: 'Sample App') }
        it { should have_selector('title',  text: full_title('')) }
        it { should_not have_selector('title', text: '| Home') }
    end

    describe "Help page" do
        before { visit help_path }  # Do before each test

        it { should have_selector('h1', text: 'Help') }
        it { should have_selector('title', text: full_title('Help')) }
    end

    describe "About page" do
        before { visit about_path }  # Do before each test

        it { should have_selector('h1', text: 'About Us') }
        it { should have_selector('title', text: full_title('About')) }
    end

    describe "Contacts page" do
        before { visit contact_path }  # Do before each test

        it { should have_selector('h1', text: 'Contact Us') }
        it { should have_selector('title', text: full_title('Contact')) }
    end
end

require 'spec_helper'

describe "Static pages" do

    # Creates a local variable 'on demand'
    let(:base_title) { "Ruby on Rails Tutorial Sample App" }

    # Subject of our tests. Calls to "should" will use page
    # e.g "page.should have_selector" is the same as "should have_selector"
    subject { page }    
    
    shared_examples_for "all static pages" do
        it { should have_selector('h1',     text: heading) }
        it { should have_selector('title',  text: full_title(page_title)) }
    end

    # Test that the actual links go their expected pages
    it "should have the right links on the layout" do
        visit root_path
        click_link "About"
        should have_selector 'title', text: full_title('About Us')
        click_link "Contact"
        should have_selector 'title', text: full_title('Contact Us')
        click_link "Home"
        click_link "Sign up now!"
        should have_selector 'title', text: full_title('Sign up')
        click_link "sample app"
        should have_selector 'title', text: full_title('')
    end

    # full_title can be found in spec/support/utilities.rb (auto included by rspec)
    describe "Home page" do
        before { visit root_path }  # Do before each test
        let(:heading)       { 'Sample App' }
        let(:page_title)    { '' }

        it_should_behave_like "all static pages"
        it { should_not have_selector('title', text: '| Home') }
    end

    describe "Help page" do
        before { visit help_path }  # Do before each test
        let(:heading)       { 'Help' }
        let(:page_title)    { 'Help' }

        it_should_behave_like "all static pages"
    end

    describe "About page" do
        before { visit about_path }  # Do before each test
        let(:heading)       { 'About Us' }
        let(:page_title)    { 'About' }

        it_should_behave_like "all static pages"
    end

    describe "Contacts page" do
        before { visit contact_path }  # Do before each test
        let(:heading)       { 'Contact Us' }
        let(:page_title)    { 'Contact' }

        it_should_behave_like "all static pages"
    end
end

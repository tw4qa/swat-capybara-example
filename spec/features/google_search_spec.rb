require 'spec_helper'

describe 'Google Search', type: :feature do

  before :all do
    @google_url = 'http://google.com'
    @key_to_search_by = 'sw2at-capybara'
    @results_we_should_see = ['sw2at-capybara', 'tw4qa']
  end

  it 'should show us a good search result' do

    step 'Go to Google' do
      visit @google_url
    end

    step 'Type key string' do
      safe_find('#lst-ib').set(@key_to_search_by)
    end

    step 'Click Search button' do
      safe_click('button[type="submit"]')
    end

    step 'Ensure that the page contains all those results' do
      @results_we_should_see.each do |text|
        sub_step "Check '#{text}' presence" do
          check_text text
        end
      end
    end
  end
end
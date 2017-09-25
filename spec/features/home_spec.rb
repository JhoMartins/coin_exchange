require 'rails_helper'

RSpec.describe "Exchange Currency Process", :type => :feature do
  it "exchange value when quantity is filled last" do
    visit '/'
    within("#exchange_form") do
      select('EUR', from: 'currency')
      fill_in 'quantity', with: '10'
      select('USD', from: 'currency_destination')
    end
    # save_and_open_page
    expect(page).to have_content("value")
  end
end

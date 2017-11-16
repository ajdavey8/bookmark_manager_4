require './app/models/link'

feature 'signing form' do
  scenario 'new user signs up' do
    visit '/'
    fill_in('username', with: 'gabriandr@yahoo.com')
    fill_in('password', with: 'whatever2018')
    click_button('Sign up')
    expect(page).to have_content("Hello gabriandr@yahoo.com")
  end
end

require './app/models/link'

feature 'viewing list of links on homepage' do
  scenario 'user navigates to homepage' do
    Link.create(title: 'Daniablog', url: 'https://hackernoon.com/@thatdania')
    visit('/links')
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Daniablog'
  end



end

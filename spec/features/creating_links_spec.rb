require './app/models/link'

feature ' User can add link to the database ' do
  scenario 'User wants to add a link' do
    visit('/links/new')
    fill_in('title', with: 'theo')
    fill_in('url', with: 'https://media.giphy.com/')
    click_button('Add')
    expect(page.status_code).to eq 200
    expect(page).to have_content('theo')
  end
end

feature 'User can add tag to the added link in the database' do
  scenario 'User wants to add tag, when add link' do
    visit('/links/new')
    fill_in('title', with: 'theo')
    fill_in('url', with: 'https://media.giphy.com/')
    fill_in('tag', with: 'coderoyalty')
    click_button('Add')
    expect(page.status_code).to eq 200
    expect(page).to have_content('coderoyalty')
  end
end

feature 'User can add tag to the added link in the database' do
  scenario 'User wants to add tag, when add link' do
    visit('/links/new')
    fill_in('title', with: 'theo')
    fill_in('url', with: 'https://media.giphy.com/')
    fill_in('tag', with: 'code royalty')
    click_button('Add')
    expect(page.status_code).to eq 200
    expect(page).to have_content('code', 'royalty')
  end
end


feature 'viewing taggged links' do
  before(:each) do
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.facebook.com', title: 'Facebook', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.twiiter.com', title: 'Twitter', tags: [Tag.first_or_create(name: 'bubbles')])

  end
  scenario 'viewing only links with bubbles tag' do
    visit '/tags/bubbles'
    expect(page).to have_content('Facebook')
    expect(page).to have_content('Twitter')
    expect(page).not_to have_content('Google')
  end
end

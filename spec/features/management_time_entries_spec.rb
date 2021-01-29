RSpec.feature 'Gerenciando mandatos', type: :feature do
  scenario '', js: true do
    visit '/'
    expect(page).to have_content 'Log in'
  end
end

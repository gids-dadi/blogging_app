require 'rails_helper'
RSpec.describe 'Index page', type: :feature do

  before(:each) do
    @user = User.create(
      name: 'Gideon',
      bio: 'Software Developer',
      photo: 'http://hello.com/org.png',
      postsCounter: 0
    )
    @user_two = User.create(
      name: 'Brian',
      bio: 'Software Developer',
      photo: 'http://hello.com/ogene.png',
      postsCounter: 0
    )
  end

  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Gideon')
      expect(page).to have_content('Brian')
    end

     it 'should have the profile picture' do
      visit users_path
      expect(page).to have_xpath("//img[contains(@src,'http://hello.com/org.png')]")
      expect(page).to have_xpath("//img[contains(@src,'http://hello.com/ogene.png')]")
    end

     it 'should have number of users post' do
      visit users_path
      expect(page).to have_content('Total Posts: 0')
    end

      it 'should redirect to users show page' do
      visit user_path(@user.id)
      expect(page).to have_content('Gideon')
    end
  end
end
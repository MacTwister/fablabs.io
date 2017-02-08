require 'spec_helper'

feature "Resetting your password" do

  scenario "with a valid passowrd" do
    user = FactoryGirl.create(:user)
    recovery = FactoryGirl.create(:recovery, user: user, email_or_username: [user.email, user.username].sample)
    visit recovery_url(user.recovery_key)
    #expect(page).to_not have_link('Sign in')
    fill_in 'recovery_user_attributes_password', with: 'newpassword'
    fill_in 'Password confirmation', with: 'newpassword'
    click_button 'Reset Password'
    expect(page).to have_content('Password reset')
    expect(page).to have_link('Sign out')
  end

  scenario "with an invalid url" do
    expect{visit recovery_url('invalidkey')}.to raise_error(ActiveRecord::RecordNotFound)
  end

  scenario "with an empty password" do
    user = FactoryGirl.create(:user)
    recovery = FactoryGirl.create(:recovery, user: user, email_or_username: [user.email, user.username].sample)
    visit recovery_url(user.recovery_key)
    #expect(page).to_not have_link('Sign in')
    click_button 'Reset Password'
    expect(page).to have_content('blank')
  end

end

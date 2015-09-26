module Features
  module ClearanceHelpers
    def sign_in
      password = "password"
      user = FactoryGirl.create(:user, password: password)
      sign_in_with user.email, password
    end

    def sign_in_as user, password
      sign_in_with user.email, password
    end

    def sign_in_with(email, password)
      visit sign_in_path
      fill_in "session_email", with: email
      fill_in "session_password", with: password
      click_button I18n.t("helpers.submit.session.submit")
    end
  end
end

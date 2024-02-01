# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend
  
  def print_home_link
    link_to 'Home', root_path, class: 'no-underline mx-4 text-gray-100 hover:text-gray-300 font-bold'
  end

  def print_get_started_link
    link_to 'Get Started', events_path, class: 'no-underline mx-4 text-gray-100 hover:text-gray-300 font-bold'
  end

  def print_sign_in_link
    link_to 'Sign in', new_user_session_path, class: 'no-underline mx-4 text-gray-100 hover:text-gray-300 font-bold'
  end

  def print_edit_profile_link
    link_to 'Edit Profile', edit_user_registration_path,
            class: 'no-underline mx-4 text-gray-100 hover:text-gray-300 font-bold'
  end

  def print_sign_out_button
    button_to 'Sign out', destroy_user_session_path, method: :delete,
                                                     class: 'mx-4 text-gray-100 hover:text-gray-300 font-bold'
  end

  def print_username
    tag.span class: 'text-blue-400 hover:text-blue-500 font-bold cursor-default' do
      user_signed_in? ? current_user.username : 'Guest'
    end
  end
end

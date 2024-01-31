# frozen_string_literal: true

module ApplicationHelper
  def print_home_link
    link_to 'Home', root_path, class: 'no-underline mx-4 text-gray-100 hover:text-gray-300 font-bold'
  end

  def print_get_started_link
    link_to 'Get Started', events_path, class: "no-underline\tmx-4 text-gray-100 hover:text-gray-300 font-bold"
  end

  def print_sign_in_link
    link_to 'Sign in', new_user_session_path, class: "no-underline\tmx-4 text-gray-100 hover:text-gray-300 font-bold"
  end

  def print_sign_out_button
    button_to 'Sign out', destroy_user_session_path, method: :delete,
                                                     class: 'mx-4 text-gray-100 hover:text-gray-300 font-bold'
  end
end

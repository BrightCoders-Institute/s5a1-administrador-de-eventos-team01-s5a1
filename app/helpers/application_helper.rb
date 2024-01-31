module ApplicationHelper
  include Pagy::Frontend
  
  def print_home_link
    link_to "Home", root_path, class:"bg-black rounded px-2 mx-4 text-white font-bold"
  end

  def print_get_started_link
    link_to "Get Started", events_path, class:"bg-black rounded px-2 mx-4 text-white font-bold"
  end

  def print_sign_in_link
    link_to "Sign in", new_user_session_path, class:"bg-black rounded px-2 mx-4 text-white font-bold"
  end

  def print_sign_out_button
    button_to "Sign out", destroy_user_session_path, method: :delete, class:"underline bg-black rounded px-2 mx-4 text-white font-bold"
  end
end

class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def index
    render html: (
      <<-HTML
                <h1> Hello, World! </h1>
                <h3> Auth Server </h3>
                <p> Please init the login from Client Application </p>
            HTML
    ).html_safe
  end

end

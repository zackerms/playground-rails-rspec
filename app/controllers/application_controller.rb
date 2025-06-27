class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from AbstractController::ActionNotFound, with: :render_404

  private

  # 404ページをレンダリングする
  def render_404
    render file: Rails.root.join("public", "404.html"), status: :not_found, layout: false
  end
end

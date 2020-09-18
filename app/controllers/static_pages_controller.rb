class StaticPagesController < ApplicationController
  skip_before_action :login_required
  before_action :forbid_login_user

  def top
  end

  private

    def forbid_login_user
      redirect_to memos_url if current_user
    end
end

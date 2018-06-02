class Page < ApplicationRecord
  attr_reader :user

  def initialize(user)
    @user = user
  end

end

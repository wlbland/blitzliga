# the Post model isn't being used

# class Post < ApplicationRecord
#   attr_reader :user

#   def initialize(user)
#     @user = user
#   end

#   def match_user_to_player(code)
#     player = Player.where("code = ?", code).first
#     player.update(user = @user)
#   end

# end

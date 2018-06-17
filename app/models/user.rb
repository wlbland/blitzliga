class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_one :player

  # validates :code, uniqueness: true

  # before_create :associate_with_player, unless: :has_no_code
  # before_save :associate_with_player, unless: :has_no_code
  before_update :associate_with_player, unless: :has_no_code

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.last_name = auth.info.last_name
      user.image = auth.info.image # assuming the user model has an image
      # to be approved -- user.fb_link = auth.info.link
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  # private

  def associate_with_player
    unless self.has_no_code
      # find associated player
      associable_player = Player.where(code: self.code).first
      if associable_player
        # if the associated player already has a user associated, delete this association
        associable_player.update(user: nil) if associable_player.user
        # then associate the player with the current user
        self.player = associable_player
      end
    end
  end


  def has_no_code
    self.code.nil?
  end

end

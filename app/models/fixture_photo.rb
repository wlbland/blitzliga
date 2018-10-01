class FixturePhoto < ApplicationRecord
  belongs_to :fixture
  mount_uploader :photo, PhotoUploader

end

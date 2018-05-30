class AddFacebookLinkToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fb_link, :string
  end
end

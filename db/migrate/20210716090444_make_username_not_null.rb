class MakeUsernameNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :username, :string, default: "WTM"
  end
end

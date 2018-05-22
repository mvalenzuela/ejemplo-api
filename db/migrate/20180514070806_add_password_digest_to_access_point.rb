class AddPasswordDigestToAccessPoint < ActiveRecord::Migration[5.2]
  def change
    add_column :acces_points, :password_digest, :string
  end
end

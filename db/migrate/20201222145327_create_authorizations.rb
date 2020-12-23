class CreateAuthorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :authorizations do |t|
      t.references :ueser, foreing_key: true
      t.string :provider
      t.string :uid
      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :ip_address
      t.string :lang
      t.string :country_iso_code

      t.timestamps
    end
  end
end

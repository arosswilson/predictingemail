class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :company_url
      t.string :email_pattern

      t.timestamps
    end
  end
end
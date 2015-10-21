
class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :referred_how
      t.string :personality
      t.string :gender
      t.string :email
      t.string :location
      t.string :password
      t.timestamps null: false
    end
  end

end
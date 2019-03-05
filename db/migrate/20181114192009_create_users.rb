class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_digest
      t.string :profile
      t.string :img_url, default: "https://banner2.kisspng.com/20180629/ru/kisspng-computer-icons-user-background-icon-5b35b73f4812b6.2941272015302469752952.jpg"

      t.timestamps
    end
  end
end

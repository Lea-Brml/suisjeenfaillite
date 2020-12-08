class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      t.string :email
      t.string :telephone
      t.text :message
      t.string :nom
      t.string :prenom

      t.belongs_to :user, index: true #cette ligne rajoute la référence à la table users

      t.timestamps
    end
  end
end

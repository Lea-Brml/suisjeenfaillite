class CreatePersonnes < ActiveRecord::Migration[5.2]
  def change
    create_table :personnes do |t|
      t.string :nom
      t.string :prenom
      t.string :enseigne
      t.string :telephone

      t.belongs_to :user, index: true #cette ligne rajoute la référence à la table users
      t.timestamps
    end
  end
end

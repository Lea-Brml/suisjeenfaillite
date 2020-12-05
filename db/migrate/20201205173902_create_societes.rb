class CreateSocietes < ActiveRecord::Migration[5.2]
  def change
    create_table :societes do |t|
      t.string :forme_sociale
      t.string :denomination_sociale
      t.string :nom
      t.string :prenom
      t.string :telephone

      t.belongs_to :user, index: true #cette ligne rajoute la référence à la table users
      t.timestamps
    end
  end
end

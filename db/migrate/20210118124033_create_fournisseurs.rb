class CreateFournisseurs < ActiveRecord::Migration[5.2]
  def change
    create_table :fournisseurs do |t|
      t.string :nom_fournisseur
      t.integer :montant_fournisseur

      t.belongs_to :user, index: true #cette ligne rajoute la référence à la table users
      t.timestamps
    end
  end
end

class CreateFactures < ActiveRecord::Migration[5.2]
  def change
    create_table :factures do |t|
      t.string :libelle
      t.integer :facture_montant

      t.belongs_to :user, index: true #cette ligne rajoute la référence à la table users

      t.timestamps
    end
  end
end

class CreateBanques < ActiveRecord::Migration[5.2]
  def change
    create_table :banques do |t|
      t.string "banque_name"
      t.integer "solde"
      t.integer "decouvert_autorise"
      t.integer "restant_a_tirer"

      t.belongs_to :user, index: true #cette ligne rajoute la référence à la table users

      t.timestamps
    end
  end
end

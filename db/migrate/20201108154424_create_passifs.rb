class CreatePassifs < ActiveRecord::Migration[5.2]
  def change
    create_table :passifs do |t|
      t.integer :salaires
      t.integer :charges
      t.integer :loyers
      t.integer :echeances
      t.integer :dette_fiscale
      t.integer :autre

      t.belongs_to :user, index: true #cette ligne rajoute la référence à la table users

      t.timestamps
    end
  end
end

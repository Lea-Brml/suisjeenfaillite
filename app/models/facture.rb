class Facture < ApplicationRecord

  validates :libelle, presence:true
  validates :facture_montant, presence:true

  belongs_to :user

end

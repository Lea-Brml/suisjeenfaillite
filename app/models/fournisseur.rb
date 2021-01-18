class Fournisseur < ApplicationRecord

  validates :nom_fournisseur, presence:true
  validates :montant_fournisseur, presence:true

  belongs_to :user


end

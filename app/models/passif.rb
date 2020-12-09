class Passif < ApplicationRecord

  validates :salaires, presence:true
  validates :charges, presence:true
  validates :loyers, presence:true
  validates :echeances, presence:true
  validates :dette_fiscale, presence:true
  validates :dette_fournisseur, presence:true

  belongs_to :user

end

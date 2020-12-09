class Banque < ApplicationRecord

  validates :solde, presence:true
  validates :decouvert_autorise, presence:true 

  belongs_to :user



end

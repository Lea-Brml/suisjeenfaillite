class Societe < ApplicationRecord


  validates :forme_sociale, presence: true
  validates :denomination_sociale, presence:true
  validates :nom, presence:true
  validates :prenom, presence:true
  validates :telephone, presence:true 

  belongs_to :user

end

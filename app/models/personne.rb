class Personne < ApplicationRecord

  validates :nom, presence:true
  validates :prenom, presence:true
  validates :telephone, presence:true 

  belongs_to :user

end

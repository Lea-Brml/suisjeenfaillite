class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :regle1, presence:true
  validates :regle2, presence:true



   has_many :factures

   has_one :passif

   has_many :banques

   has_one :personne
   has_one :societe

   has_many :messages




end

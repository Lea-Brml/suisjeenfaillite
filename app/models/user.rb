class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :factures

   has_one :passif

   has_many :banques

   has_one :personne
   has_one :societe

   has_many :messages




end

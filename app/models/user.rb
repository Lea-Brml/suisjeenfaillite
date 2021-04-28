class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nom, presence:true
  validates :prenom, presence:true
  validates :phone, presence:true


  validates :regle1, presence:true
  validates :regle2, presence:true


  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Veuillez renseigner une adresse email avec un format valide." }

   has_many :factures

   has_many :fournisseurs

   has_one :passif

   has_many :banques

   has_one :personne
   has_one :societe

   has_many :messages




end

class PassifController < ApplicationController

before_action :authenticate_user!

  def new

    @user = current_user


  end


  def create


    @passif = Passif.new(salaires: params[:salaires],charges: params[:charges], loyers: params[:loyers], echeances: params[:echeances], dette_fiscale: params[:dette_fiscale], dette_fournisseur: params[:dette_fournisseur], user_id:current_user.id)
        if @passif.save
          redirect_to root_path
        else
          render action: :new
        end

  end


  def show

    @passif = Passif.find(params[:id])
    @user = current_user

  end


  def edit


  end




end

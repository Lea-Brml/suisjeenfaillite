class FactureController < ApplicationController



  def new

    @user = current_user


  end


  def create


    @facture = Facture.new(libelle: params[:libelle], facture_montant: params[:facture_montant], user_id:current_user.id)
        if @facture.save
          redirect_to new_banque_path
        else
          render action: :new
        end

  end


  def show

    @facture = Facture.find(params[:id])
    @user = current_user

  end


  def edit


  end




end

class FactureController < ApplicationController


  def index


  end

  

  def new

    @user = current_user


  end


  def create


    @facture = Facture.new(libelle: params[:libelle], facture_montant: params[:facture_montant], user_id:current_user.id)
        if @facture.save
          redirect_to new_facture_path
          flash[:success] = "La facture a bien été ajoutée !"
        else
          render action: :new
          flash[:success] = "Une erreur est survenur, veuillez renseigner un montant valide."
        end

  end


  def show

    @facture = Facture.find(params[:id])
    @user = current_user

  end


  def edit


  end




end

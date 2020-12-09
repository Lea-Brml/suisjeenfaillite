class FactureController < ApplicationController


  def index


  end



  def new

    @user = current_user

    @factures = Facture.where(user_id:@user.id).order(created_at: :desc)


  end


  def create


    @facture = Facture.new(libelle: params[:libelle], facture_montant: params[:facture_montant], user_id:current_user.id)
        if @facture.save
          redirect_to new_facture_path
          flash[:success] = "La facture a bien été ajoutée."
        else
          redirect_to new_facture_path
          flash[:success] = "Une erreur est survenue, veuillez renseigner tous les champs obligatoires. Si la valeure est nule, indiquer '0'"
        end

  end


  def show

    @facture = Facture.find(params[:id])
    @user = current_user

  end


  def edit


  end




end

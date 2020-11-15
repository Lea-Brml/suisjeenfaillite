class PassifController < ApplicationController

before_action :authenticate_user!

  def new

    @user = current_user


  end


  def create


    @passif = Passif.new(salaires: params[:salaires],charges: params[:charges], loyers: params[:loyers], echeances: params[:echeances], dette_fiscale: params[:dette_fiscale], dette_fournisseur: params[:dette_fournisseur], user_id:current_user.id)
        if @passif.save
          redirect_to new_facture_path
        else
          render action: :new
        end

  end


  def show

    @passif = Passif.find(params[:id])
    @user = current_user

  end


  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @passif = Passif.find(params[:id])
  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)

    @passiff = Passif.find(params[:id])



        if @passiff.update(salaires: params[:salaires],charges: params[:charges], loyers: params[:loyers], echeances: params[:echeances], dette_fiscale: params[:dette_fiscale], dette_fournisseur: params[:dette_fournisseur])
          redirect_to root_path
        else
          render :edit
        end


  end




end

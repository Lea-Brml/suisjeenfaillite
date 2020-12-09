class PersonneController < ApplicationController


  def new

    @user = current_user


  end


  def create


    @personne = Personne.new(nom: params[:nom],prenom: params[:prenom], enseigne: params[:enseigne], telephone: params[:telephone], user_id:current_user.id)
        if @personne.save
          redirect_to user_path(current_user)
        else
          redirect_to new_personne_path
          flash[:success] = "Une erreur est survenue, veuillez renseigner tous les champs obligatoires."
        end

  end




end

class PersonneController < ApplicationController


  def new

    @user = current_user


  end


  def create


    @personne = Personne.new(nom: params[:nom],prenom: params[:prenom], enseigne: params[:enseigne], telephone: params[:telephone], user_id:current_user.id)
        if @personne.save
          redirect_to new_passif_path
        else
          render action: :new
        end

  end


end

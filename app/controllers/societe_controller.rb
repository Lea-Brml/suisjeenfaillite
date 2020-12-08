class SocieteController < ApplicationController


  def new

    @user = current_user


  end


  def create


    @societe = Societe.new(nom: params[:nom],prenom: params[:prenom],  telephone: params[:telephone],forme_sociale: params[:forme_sociale], denomination_sociale: params[:denomination_sociale], user_id:current_user.id)
        if @societe.save
          redirect_to user_path(current_user)
        else
          render action: :new
        end

  end



end

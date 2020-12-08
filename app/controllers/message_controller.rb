class MessageController < ApplicationController


  def create

    if user_signed_in?
    @user = current_user.id
    else
      @user = 1
    end

    @message = Message.create(nom: params[:nom], prenom: params[:prenom],email: params[:email], telephone: params[:telephone], message: params[:message], user_id: @user)

   if @message.save
       if user_signed_in?
        redirect_to user_path(current_user)
        flash[:success] = "Votre demande de contact nous a bien été transmise. Nous vous recontacterons dans les meilleurs délais."
      else
        redirect_to root_path
        flash[:success] = "Votre demande de contact nous a bien été transmise. Nous vous recontacterons dans les meilleurs délais."
      end
    else
      redirect_to root_path( :anchor => 'contact')
      flash[:danger] = "Une erreur s'est produite. Votre message ne s'est pas envoyé, veuillez réessayer et remplir tous les champs requis."
    end

  end


end

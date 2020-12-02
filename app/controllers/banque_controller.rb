class BanqueController < ApplicationController


    def index


    end


    def new

      @user = current_user


      @banques = Banque.where(user_id:@user.id).order(created_at: :desc)

    end


    def create

    #  E5 = solde compte      D5 = decouvert autorise
  #    =SI(E5>=0;D5;SI(ET(E5<0;ABS(E5)<D5);D5+E5;0))


      if params[:solde].to_i > 0
        @restant_a_tirer = params[:decouvert_autorise].to_i
      else if params[:solde].to_i.abs < params[:decouvert_autorise].to_i
        @restant_a_tirer = params[:decouvert_autorise].to_i - params[:solde].to_i.abs
      else
        @restant_a_tirer = 0
      end
    end

      @banque = Banque.new(banque_name: params[:banque_name], solde: params[:solde], decouvert_autorise: params[:decouvert_autorise], restant_a_tirer: @restant_a_tirer, user_id:current_user.id)
          if @banque.save
            redirect_to new_banque_path
            flash[:success] = "La banque a bien été ajouté !"
          else
            render action: :new
            flash[:success] = "Une erreur est survenue, veuillez renseigner des informations valides."
          end

    end


    def show

      @banque = Banque.find(params[:id])
      @user = current_user

    end


    def edit


    end






end

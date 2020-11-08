class BanqueController < ApplicationController


    def index

    @user = current_user.id
    @banque = Banque.where(user_id: current_user.id)
    @passif = Passif.find(@user)
    @facture = Facture.find(@user)


    end


    def new

      @user = current_user


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
            redirect_to root_path
          else
            render action: :new
          end

    end


    def show

      @banque = Banque.find(params[:id])
      @user = current_user

    end


    def edit


    end






end

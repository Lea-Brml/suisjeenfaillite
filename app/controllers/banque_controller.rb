class BanqueController < ApplicationController


    def index


      @user = current_user.id
      @banque = Banque.where(user: params[:id])
      @passif = Passif.find(@user)
      @facture = Facture.find(@user)


      @data = @banque.solde_graph


      @sous_total_passif = @passif.salaires.to_i.abs + @passif.charges.to_i.abs + @passif.loyers.to_i.abs + @passif.echeances.to_i.abs + @passif.dette_fiscale.to_i.abs + @passif.dette_fournisseur.to_i.abs


       @total_solde_positif = 0
       @banque.each do |t|
        if t.solde.to_i > 0
         @total_solde_positif = @total_solde_positif + t.solde.to_i
        end
      end

       @total_solde_negatif = 0
       @banque.each do |t|
      if t.solde.to_i < 0
       @total_solde_negatif = @total_solde_negatif + t.solde.to_i
      end
      end

      @restant_a_tirer = current_user.banques.sum("restant_a_tirer")

      @total_facture =  current_user.factures.sum("facture_montant")

      @sous_total_passif = @passif.salaires.to_i.abs + @passif.charges.to_i.abs + @passif.loyers.to_i.abs + @passif.echeances.to_i.abs + @passif.dette_fiscale.to_i.abs + @passif.dette_fournisseur.to_i.abs


      @decouvert_autorise = @banque.sum("decouvert_autorise")

      @total_actif = @restant_a_tirer + @total_facture + @total_solde_positif

      @compte_debiteur_non_autorise = @total_solde_negatif + @decouvert_autorise - @restant_a_tirer

      @total_passif =  @compte_debiteur_non_autorise - @sous_total_passif

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
            flash[:success] = "La compte a bien été ajouté !"
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

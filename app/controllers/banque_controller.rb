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
            if current_user.personne.nil? && current_user.societe.nil?
            redirect_to new_banque_path
            flash[:success] = "La banque a bien été ajoutée."
            else
            redirect_to user_path(current_user)
            end
          else
            redirect_to new_banque_path
            flash[:success] = "Une erreur est survenue, veuillez renseigner tous les champs obligatoires. Si la valeure est nule, indiquer '0'"
          end


    end


    def show



    end


    def edit


      @banqueup = Banque.find(params[:id])


      @user = current_user


      @banques = Banque.where(user_id:@user.id).order(created_at: :desc)


    end




    def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)

    @banqueup = Banque.find(params[:id])



        if @banqueup.update(banque_name: params[:banque_name], decouvert_autorise: params[:decouvert_autorise], solde: params[:solde])
          redirect_to user_path(current_user)
        else
          render :edit
        end

    end



    def destroy
      # Méthode qui récupère le potin concerné et le détruit en base
      # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
      @banquedel = Banque.find(params[:id])


        if @banquedel.destroy
          redirect_to user_path(current_user)
        else
          render user_path(current_user)
        end


      end


end

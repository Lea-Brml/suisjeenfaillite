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
          if current_user.banques.empty?
          redirect_to new_facture_path
          flash[:success] = "La facture a bien été ajoutée."
          else
          redirect_to user_path(current_user)
          end
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
  # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  @factureup = Facture.find(params[:id])

  @factures = Facture.where(user_id:current_user.id).order(created_at: :desc)

  end


  def update
  # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
  # pour info, le contenu de ce formulaire sera accessible dans le hash params
  # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)

  @factureup = Facture.find(params[:id])



      if @factureup.update(libelle: params[:libelle], facture_montant: params[:facture_montant])
        redirect_to user_path(current_user)
      else
        render :edit
      end

  end



  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @facturedel = Facture.find(params[:id])


      if @facturedel.destroy
        redirect_to user_path(current_user)
      else
        render user_path(current_user)
      end


    end


end

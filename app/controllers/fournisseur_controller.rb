class FournisseurController < ApplicationController

  def index


  end



  def new

    @user = current_user

    @fournisseurs = Fournisseur.where(user_id:@user.id).order(created_at: :desc)


  end


  def create


    @fournisseur = Fournisseur.new(nom_fournisseur: params[:nom_fournisseur], montant_fournisseur: params[:montant_fournisseur], user_id:current_user.id)
        if @fournisseur.save
          if current_user.banques.empty?
          redirect_to new_fournisseur_path
          flash[:success] = "Le fournisseur a bien été ajoutée."
          else
          redirect_to user_path(current_user)
          end
        else
          redirect_to new_fournisseur_path
          flash[:success] = "Une erreur est survenue, veuillez renseigner tous les champs obligatoires. Si la valeure est nule, indiquer '0'"
        end

  end


  def show

    @fournisseur = Fournisseur.find(params[:id])
    @user = current_user

  end


  def edit
  # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  @fournisseurup = Fournisseur.find(params[:id])

  @fournisseurs = Fournisseur.where(user_id:current_user.id).order(created_at: :desc)

  end


  def update
  # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
  # pour info, le contenu de ce formulaire sera accessible dans le hash params
  # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)

  @fournisseurup = Fournisseur.find(params[:id])



      if @fournisseurup.update(nom_fournisseur: params[:nom_fournisseur], montant_fournisseur: params[:montant_fournisseur])
        redirect_to user_path(current_user)
      else
        render :edit
      end

  end



  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @fournisseurdel = Fournisseur.find(params[:id])


      if @fournisseurdel.destroy
        redirect_to user_path(current_user)
      else
        render user_path(current_user)
      end


    end


end

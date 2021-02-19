class UserController < ApplicationController


def show


  @user = User.find(params[:id])
  @banque = Banque.where(user_id:@user)
  @passif = Passif.find_by(user_id:params[:id])

  @factures = Facture.where(user_id:@user).order(created_at: :desc)
  @banques = Banque.where(user_id:@user).order(created_at: :desc)
  @fournisseurs = Fournisseur.where(user_id:@user).order(created_at: :desc)


  @total_fournisseur =  current_user.fournisseurs.sum("montant_fournisseur")


  @sous_total_passif = @passif.salaires.to_i.abs + @passif.charges.to_i.abs + @passif.loyers.to_i.abs + @passif.echeances.to_i.abs + @passif.dette_fiscale.to_i.abs + @total_fournisseur


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



  @decouvert_autorise = @banque.sum("decouvert_autorise")

  @total_actif = @restant_a_tirer + @total_facture + @total_solde_positif

  @compte_debiteur_non_autorise = @total_solde_negatif + @decouvert_autorise - @restant_a_tirer

  @total_passif =  @compte_debiteur_non_autorise - @sous_total_passif


end


end

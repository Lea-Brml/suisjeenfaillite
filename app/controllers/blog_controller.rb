class BlogController < ApplicationController



  def index

    @blog = Blog.all.order('created_at DESC')

  end


  def new


  end


  def create

    @blog = Blog.new(title: params[:title], body: params[:body])
          if @blog.save
            redirect_to @blog
            flash[:success] = "L'article a bien été créé'."
          else
            redirect_to new_blog_path
            flash[:success] = "Une erreur est survenue, veuillez réessayer"
          end

  end



  def show

    @blog = Blog.find(params[:id])


  end



  def edit
  # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  @blogup = Blog.find(params[:id])


  end


  def update
  # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
  # pour info, le contenu de ce formulaire sera accessible dans le hash params
  # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)

  @blogup = Blog.find(params[:id])



      if @blogup.update(title: params[:title], body: params[:body])
        redirect_to blog_path
      else
        render :edit
      end

  end





  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @blogdel = Blog.find(params[:id])


      if @blogdel.destroy
        redirect_to blog_index_path
      else
        redirect_to blog_path
      end


    end



end

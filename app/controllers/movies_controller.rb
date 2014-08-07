class MoviesController < ApplicationController
  
  def index
    @movies = Movie.all
    if params[:category] != "any" && params[:search].present?
      @movies = @movies.category_search(params[:search])
      if params[:runtime] != "any" 
        @movies = @movies.runtime(params[:runtime])
      end
    end

    if params[:runtime] != "any" && params[:category] == "any"
      @movies = @movies.runtime(params[:runtime])
    end

    if params[:search].present? && params[:category] == "any" && params[:runtime] == "any"
      @movies = @movies.category_search(params[:search])
    end
    # @uploader.retrieve_from_store!('my_file.png')
  end

  def show
  	@movie = Movie.find(params[:id])
  end

  def new
  	@movie = Movie.new
  end

  def edit
  	@movie = Movie.find(params[:id])
  end

 def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end


  def update 
  	@movie = Movie.find(params[:id])
    binding.pry

  	if @movie.update_attributes(movie_params)
  		redirect_to movie_path(@movie)
  	else
			render :edit
  	end
  end

  def destroy 
  	@movie = Movie.find(params[:id])
  	@movie.destroy 
  	redirect_to movies_path 
  end


  protected 

  def movie_params
  	params.require(:movie).permit(
  		:title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description, :movieposter
  		)
  end

end

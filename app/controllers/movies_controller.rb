class MoviesController < ApplicationController
  before_filter :authorize, :except => [:index]
  
  def index
    @search = Movie.search(params[:search])
    @movies = @search.paginate :page => params[:page]
    # @movies = @search.all
    @search_field = params[:search]
    
    @total_movies = Movie.all
    @yearly_count = Movie.get_yearly_count
    @monthly_count = Movie.get_monthly_count
  end
  
  def show
    @movie = Movie.find(params[:id])
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      flash[:notice] = "Successfully created movie."
      redirect_to @movie
    else
      render :action => 'new'
    end
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(params[:movie])
      flash[:notice] = "Successfully updated movie."
      redirect_to @movie
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Successfully destroyed movie."
    redirect_to movies_url
  end
end

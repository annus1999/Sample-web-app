class RepositoriesController < ApplicationController
  before_action :set_repository, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @repositories = Repository.search_by_name_or_description(params[:search])
    else
      @repositories = Repository.all
    end
  end


  def show
  end

  def new
    @repository = Repository.new
    @repository.users.build  # Build a new user associated with the repository
  end

  def create
    @repository = Repository.new(repository_params)

    if @repository.save
      redirect_to @repository, notice: 'Repository was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @repository.update(repository_params)
      redirect_to @repository, notice: 'Repository was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @repository.destroy
    redirect_to repositories_url, notice: 'Repository was successfully destroyed.'
  end

  private

  def set_repository
    @repository = Repository.find(params[:id])
  end

  def repository_params
    params.require(:repository).permit(:name, users_attributes: [:id, :name, :email])
  end
end

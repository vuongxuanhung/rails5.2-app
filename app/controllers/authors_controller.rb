class AuthorsController < ApplicationController
  before_action :find_author, only: :show

  def create
    author = Author.create! author_params
    render json: AuthorSerializer.new(author).serialized_json
  end

  def index
    authors = Author.with_attached_avatar
    render json: AuthorSerializer.new(authors).serialized_json
  end

  def show
    render file: @author.avatar.download
  end

  private
  def author_params
    params.require(:author).permit(:name, :description, :avatar)
  end

  def find_author
    @author = Author.find(params[:id])
  end
end

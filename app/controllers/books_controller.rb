class BooksController < ApplicationController
  def edit
    @book=Book.find(params[:id])
    # @book =current_user
    @user=@book.user
    if @user != current_user
      redirect_to books_path
    end
  end

  def update
    @book =Book.find(params[:id])
    if @book.update(book_params)
      flash[:nitice]='You have updated book successfully.'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      flash[:nitice]='You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      @books=Book.all
      @user = @book.user
      render :index
    end
  end

  def index
    @book=Book.new
    @books =Book.all
    @user=current_user

  end

  def show
    @book=Book.new
    @book_id=Book.find(params[:id])
    @user=@book_id.user
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    flash[:notice]="Book was successfully destroyed."
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

class TodoItemsController < ApplicationController
  def index
    @todo_items = TodoItem.all
  end

  def create
    @todo_item = TodoItem.new(todo_item_params)
    if @todo_item.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def update
    @todo_item = TodoItem.find(params[:id])
    @todo_item.update(complete: !@todo_item.complete)
    redirect_to root_path
  end

  def destroy
    @todo_item = TodoItem.find(params[:id])
    @todo_item.destroy
    redirect_to root_path
  end

  private

  def todo_item_params
    params.require(:todo_item).permit(:title)
  end
end

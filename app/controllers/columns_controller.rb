class ColumnsController < ApplicationController


  def show
    @board = Board.find(params[:board_id])
    @column = @board.columns.find(params[:id])
  end

  def create
    @board = Board.find(params[:board_id])
    @column = @board.columns.create(column_params)
    redirect_to boards_path(@board)
  end

  def update
    @board = Board.find(params[:board_id])
    @column = @board.columns.find(params[:id])

    if @column.update(column_params)
      redirect_to board_columns_path(@board, @column)

    else
      render 'edit'
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @column = @board.columns.find(params[:id])
    @column.destroy
    redirect_to board_path(@board)
  end

  private
    def column_params
      params.require(:column).permit(:name, :background_color)
    end
end

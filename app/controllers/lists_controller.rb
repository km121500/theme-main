class ListsController < ApplicationController
  def index
    @lists = List.all.order(rate: :DESC)
    @list = List.new
    @genres = Genre.all
    
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
      flash[:notice] = "投稿に成功しました"
    else
      @lists = List.all
      @genres = Genre.all
      render "index"
    end
  end

  def show
    @list = List.find(params[:id])
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path(@list)
    else
      render "edit"
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end
  
  def genre_search
    #ジャンル検索欄表示用にジャンルを全て取得
    @genres = Genre.all
    #受け取ったジャンルIDと同じジャンルをリストから探し取得
    @genre_searched = Genre.find(params[:id])
    #ジャンルが上のgenre_searchと一致する商品のみを（全て）取得
    @all_items_searched = List.where(genre_id: @genre_searched.id).order(rate: :DESC)
    #直前で受け取った商品の中から,ページネーションのために8個まで取得
    @items = @all_items_searched
  end

  private
  def list_params
    params.require(:list).permit(:name, :body, :rate,:genre_id )
  end
end

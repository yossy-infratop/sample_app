class TodolistsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to todolist_path(@list.id)
    else
      render :new
    end
  end

  #投稿の一覧画面を作成
  def index
    @lists = List.all
  end

  #投稿の中身を表示
  def show
    @list = List.find(params[:id])
  end

  #投稿を編集
  def edit
    @list = List.find(params[:id])
  end

  #編集内容を送信して保存
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  #投稿したデータを削除
  def destroy
    list = List.find(params[:id]) # データ(レコード)を1件取得
    list.destroy # データ(レコード)を削除
    redirect_to todolists_path # 投稿一覧画面へリダイレクト
  end

  #ここから下はcontrollerの中でしか呼び出されない(アクションとして認識されない)
  private
  # ストロングパラメータ
  def list_params
    #params.:Railsで送られてきた値を受け取るためのメソッド
    #require:データのオブジェクト名(例:list)を指定
    #permit:キー(例:title, :body)を指定
    params.require(:list).permit(:title, :body, :image)
  end

end

class TodolistsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @list = List.new
  end

  def create
    # 1.データを禁忌登録するためのインスタンス作成
    list = List.new(list_params)
    # 2.データをデータベースに保存するためのsaveメソッド
    list.save
    # 3.トップ画面へリダイレクト
    redirect_to '/top'
  end

  #ここから下はcontrollerの中でしか呼び出されない(アクションとして認識されない)
  private
  # ストロングパラメータ
  def list_params
    #params.:Railsで送られてきた値を受け取るためのメソッド
    #require:データのオブジェクト名(例:list)を指定
    #permit:キー(例:title, :body)を指定
    params.require(:list).permit(:title, :body)
  end

end

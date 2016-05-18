class RelationshipsController < ApplicationController
    before_action :logged_in_user
    
    def create
        #User一覧の中からフォローしたいと送られてきたparams[:follow_]id]をさがして入れる
        @user = User.find(params[:follow_id])
        #現在ログインしているユーザーのフォローメソッド（Userモデルに記述してある）を使ってフォロー
        current_user.follow(@user)
    end
    
    def destroy
        #削除したいユーザーのidがparamsに入ってるのでフォロー一覧から検索して取り出す
        @user = current_user.following_relationships.find(params[:id]).followed
        #ログイン中のユーザーからフォローをやめる
        current_user.unfollow(@user)
    end
    
end
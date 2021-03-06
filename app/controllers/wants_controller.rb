class WantsController < ApplicationController
  def create
    @item = Item.find_or_initialize_by(code: params[:item_code])
    unless @item.persisted?
      results = RakutenWebService::Ichiba::Item.search(itemCode: @item.code)
      @item = Item.find_or_initialize_by_json(results.first)
      @item.save!
    end

    current_user.want(@item)
    redirect_back fallback_location: root_path, success: '商品を今欲しい に入れました。'
  end

  def destroy
    @item = Item.find(params[:item_code])
    current_user.unwant(@item) 
    redirect_back fallback_location: root_path, success: '今欲しい を解除しました。'
  end
end
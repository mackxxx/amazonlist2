class DesiresController < ApplicationController
  def create
    @item = Item.find_or_initialize_by(code: params[:item_code])
    unless @item.persisted?
      results = RakutenWebService::Ichiba::Item.search(itemCode: @item.code)
      @item = Item.find_or_initialize_by_json(results.first)
      @item.save!
    end

    current_user.desire(@item)
　  redirect_back follback_location: root_path, success: '商品を後で欲しい に入れました。'
  end

  def destroy
    @item = Item.find(params[:item_code])
    current_user.undesire(@item)
      flash[:success] = '後で欲しい を解除しました。'
   redirect_back(fallback_location: root_path)
  end
end
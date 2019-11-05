class DesiresController < ApplicationController
  def create
    @item = Item.find_or_initialize_by(code: params[:item_code])
    unless @item.persisted?
      results = RakutenWebService::Ichiba::Item.search(itemCode: @item.code)
      @item = Item.find_or_initialize_by_json(results.first)
      @item.save!
    end

    
    if current_user.desire(@item)
      flash[:success] = '商品を後で欲しい に入れました。'
    end
    
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @item = Item.find(params[:item_id])
    
    if current_user.undesire(@item)
      flash[:success] = '後で欲しい を解除しました。'
    end
  
    redirect_back(fallback_location: root_path)
  end
end
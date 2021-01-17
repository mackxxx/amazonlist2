class ItemsController < ApplicationController
  def index
    @keyword = params[:keyword]
    if @keyword.present?
      results = RakutenWebService::Ichiba::Item.search({
        keyword: @keyword,
        imageFlag: 1,
        hits: 20,
      })

      @items = results.map do |each| 
        item = Item.find_or_initialize_by_json(each)
      end
    end
  end

  def show
    @item = Item.find_by!(code: params[:code])
    @want_users = @item.want_users
    @desire_users = @item.desire_users
  end
end
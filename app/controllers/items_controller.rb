class ItemsController < ApplicationController
  def index
    @keyword = params[:keyword]
    if @keyword.present?
      results = RakutenWebService::Ichiba::Item.search({
        keyword: @keyword,
        imageFlag: 1,
        hits: 20,
      })

      @items = results.map do |result| 
        item = Item.initialize_by_json(result)
      end
    end
  end
end
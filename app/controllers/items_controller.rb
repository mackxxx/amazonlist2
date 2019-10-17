require "item.rb"

class ItemsController < ApplicationController
  def index
    @items = []

    @keyword = params[:keyword]
    if @keyword.present?
      results = RakutenWebService::Ichiba::Item.search({
        keyword: @keyword,
        imageFlag: 1,
        hits: 20,
      })

      results.each do |result|
        item = Item.new(read(result))
        @items << item
      end
    end
  end
end
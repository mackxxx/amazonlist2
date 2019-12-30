FactoryBot.define do
  factory :item do
    code { "book:18852922" }
    name { "プロを目指す人のためのRuby入門 言語仕様からテスト駆動開発・デバッグ技法まで （Software　Design　plusシリーズ） [ 伊藤淳一（プログラミング） ]" }
    url  { "https://item.rakuten.co.jp/book/15209044/" }
    image_url { "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/3977/9784774193977.jpg?_ex=64x64" }
  end
   
  factory :other_item, class: Item do
    code { "book:19319301" }
    name { "現場で使える Ruby on Rails 5速習実践ガイド [ 大場寧子 ]" }
    url  { "https://item.rakuten.co.jp/book/15628625/" }
    image_url { "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/2227/9784839962227.jpg?_ex=64x64" }
  end
end
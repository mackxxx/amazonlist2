FactoryBot.define do
  factory :item do
    code { "book:18852922" }
    name { "プロを目指す人のためのRuby入門 言語仕様からテスト駆動開発・デバッグ技法まで （Software　Design　plusシリーズ） [ 伊藤淳一（プログラミング） ]" }
    url  { "https://item.rakuten.co.jp/book/15209044/" }
    image_url { "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/3977/9784774193977.jpg?_ex=64x64" }
  end
end
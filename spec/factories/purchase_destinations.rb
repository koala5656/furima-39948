FactoryBot.define do
  factory :purchase_destination do
    postal_code               { '123-4567' }
    prefecture                { 2 }
    municipality              { '横浜市青葉区' }
    block_number              { '桜台2-2-2' }
    building_name             { '桜ハイツ202' }
    phone_number              { 12345678912 }
    user_id                   {2}
    item_id                   {2}

    #使用できないので削除
    # association :user
    # association :item

  end
end

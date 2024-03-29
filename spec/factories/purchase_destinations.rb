FactoryBot.define do
  factory :purchase_destination do
    postal_code               { '123-4567' }
    prefecture_id             { 2 }
    municipality              { '横浜市青葉区' }
    block_number              { '桜台2-2-2' }
    building_name             { '桜ハイツ202' }
    phone_number              { 12_345_678_912 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

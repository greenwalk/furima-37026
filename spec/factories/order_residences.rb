FactoryBot.define do
  factory :order_residence do
    post_code     {'123-4567'}
    prefecture_id {2}
    municipality  {'品川区'}
    address       {'1-1'}
    building      {'品川ビルディング'}
    phone_number  {'0000000000'}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end

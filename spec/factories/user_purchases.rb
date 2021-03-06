FactoryBot.define do
  factory :user_purchase do
    postal_code         { '123-4567' }
    prefecture_id       { 2 }
    city                { '横浜市' }
    house_number        { '1-1' }
    building            { '横浜ハイツ' }
    tel_number          { '09012345678' }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end

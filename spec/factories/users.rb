FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { 'kkk000' }
    password_confirmation { password }
    family_name           { '阿部' }
    first_name            { '太郎' }
    family_name_frigana   { 'アベ' }
    first_name_frigana    { 'タロウ' }
    birthday              { '1990-01-01' }
  end
end

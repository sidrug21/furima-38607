FactoryBot.define do
  factory :user do
    nickname { 'aaaa' }
    email { 'test@example.com' }
    password { 'a11111' }
    password_confirmation { password }
    last_name { '太郎' }
    first_name { 'テスト' }
    last_name_kana { 'タロウ' }
    first_name_kana { 'テスト' }
    birthdate { Date.new(1993, 1, 1) }
    end
end

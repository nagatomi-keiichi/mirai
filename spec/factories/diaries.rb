FactoryBot.define do
  factory :diary do
    title        {'タイトルテスト'}

    association :user 

    after(:build) do |diaries|
      diaries.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

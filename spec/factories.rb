FactoryGirl.define do
  factory :board do
    tag     "sol"
    long_name    "My perfect board"
  end

   factory :topic do
    caption "Lorem ipsum"
    board
  end
end
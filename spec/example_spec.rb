require 'rails_helper'

RSpec.describe 'RSpec Setup' do
  it 'is working correctly' do
    expect(true).to be true
  end

  it 'can use FactoryBot' do
    # FactoryBotが利用可能であることを確認
    expect(defined?(FactoryBot)).to be_truthy
  end

  it 'can use Faker' do
    # Fakerが利用可能であることを確認
    expect(Faker::Name.name).to be_a(String)
  end
end

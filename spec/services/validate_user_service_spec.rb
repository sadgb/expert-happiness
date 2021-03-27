require 'rails_helper'

RSpec.describe ValidateUserService, type: :service do

  let(:user) { u = User.new; u.age = 20; u.email='test@test'; u.name = 'name1'; u.surname ='surname1'; u.gender = 2; u }
  subject { described_class.call(user) }

  context '#name_error' do
    it do
      user.name = '1'
      subject
      expect(user.errors.count).to eq(1)
      expect(user.errors.first).to eq("Name length should be between 3 and 50")
    end
  end

  context '#empty_user' do
    let(:user) { User.new }
    it do
      subject
      expect(user.errors.count).to eq(5)
    end
  end

  context '#no_errors' do
    it do
      subject
      expect(user.errors.count).to eq(0)
    end
  end
end

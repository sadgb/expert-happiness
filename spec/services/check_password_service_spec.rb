require 'rails_helper'

RSpec.describe CheckPasswordService, type: :service do

  subject { described_class.call("$2a$12$KcLikFKp861sZjv4d2JOB.gO0FwZ/6Vm9WyB5p07K.YEofnccxgbG", password )}

  context '#correct_password' do
    let(:password) { 'my password' }
    it do
      expect(subject).to be_truthy
    end
  end

  context '#incorrect_password' do
    let(:password) { 'not password' }
    it do
      expect(subject).to be_falsey
    end
  end

end

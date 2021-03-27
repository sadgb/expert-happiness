# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSignUpService, type: :service do
  let(:email) { 'test@test' }
  let(:age) { 22 }
  let(:city) { 'Moscow' }
  let(:about) { 'nothing special' }
  let(:name) { 'foo' }
  let(:surname) { 'bar' }
  let(:gender) { User::GENDERS[:male] }
  let(:password) { 'foobar123' }

  subject { described_class.call(email, name, surname, gender, age, city, about, password) }

  context '#no_error' do
    it do
      expect(Database::Users::Insert).to receive(:call)
      subject
    end
  end
end

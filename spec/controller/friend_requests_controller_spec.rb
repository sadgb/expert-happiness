# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendRequestsController, type: :controller do
  context '#not authorized' do
    it do
      post :add
      expect(response).to redirect_to(root_path)
    end
  end

  let(:current_user) { new_user }
  let(:other_user) { new_user }
  context '#authorized' do

    before do
      cookies.signed[:user_id] = current_user.id
    end

    it '#should_add_correctly' do
      expect(Database::FriendRequests::All.call.count).to eq(0)
      post :add, params: {user_id: other_user.id}
      expect(response).to be_redirect
      friend_requests = Database::FriendRequests::All.call
      expect(friend_requests.count).to eq(1)
      fr = friend_requests.last
      expect(fr).to have_attributes(from_user_id: current_user.id, to_user_id: other_user.id)

      post :add, params: {user_id: other_user.id}
      expect(response).to be_redirect
      expect(friend_requests.count).to eq(1)

      post :remove, params: {user_id: other_user.id}
      expect(response).to be_redirect
      expect(Database::FriendRequests::All.call.count).to eq(0)

      post :remove, params: {user_id: other_user.id}
      expect(response).to be_redirect
    end
  end
end

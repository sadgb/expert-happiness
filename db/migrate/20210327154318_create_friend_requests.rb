# frozen_string_literal: true

class CreateFriendRequests < ActiveRecord::Migration[5.1]
  def up
    create_table :friend_requests, id: false do |t|
      t.integer :from_user_id
      t.integer :to_user_id
    end
    execute 'ALTER TABLE friend_requests ADD PRIMARY KEY (from_user_id, to_user_id);'
  end

  def down
    drop_table :friend_requests
  end
end

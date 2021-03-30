# frozen_string_literal: true

module Database
  module Users
    class FindFriendsOf
      def self.call(user_id)

        DbConnection.execute do |client|
          statement = client.prepare('select *
from users
where id in (
    select fr1.to_user_id
    from friend_requests fr1
             inner join friend_requests fr2 on fr1.from_user_id = ? and fr2.to_user_id = ? and
                                               fr1.to_user_id = fr2.from_user_id)')
          data = statement.execute(user_id, user_id).to_a

          data.collect do |user_hash|
            user = User.new
            User::QUERY_ATTRIBUTES.each do  |attr|
              user.send "#{attr}=", user_hash[attr.to_s]
            end
            user
          end
        end
      end
    end
  end
end
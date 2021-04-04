# frozen_string_literal: true

module Database
  module Users
    class SearchByNameSurname
      def self.call(name_prefix, surname_prefix)
        conditions = []

        DbConnection.execute do |client|
          conditions << "lower(name) like '#{client.escape(name_prefix.downcase)}%'" unless name_prefix.blank?

          conditions << "lower(surname) like '#{client.escape(surname_prefix.downcase)}%'" unless surname_prefix.blank?

          conditions = if conditions.blank?
                         ''
                       else
                         "where #{conditions.join(' AND ')}"
                       end

          query = "select * from users #{conditions} order by id desc limit 10"

          data = client.query(query).to_a

          return nil unless data

          data.collect do |user_hash|
            user = User.new
            User::QUERY_ATTRIBUTES.each do |attr|
              user.send "#{attr}=", user_hash[attr.to_s]
            end
            user
          end
        end
      end
    end
  end
end

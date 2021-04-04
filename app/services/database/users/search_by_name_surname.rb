# frozen_string_literal: true

module Database
  module Users
    class SearchByNameSurname
      def self.call(name_prefix, surname_prefix)
        conditions = []

        conditions << "name like '#{Mysql2::Client.escape(name_prefix.downcase.capitalize)}%'" unless name_prefix.blank?

        conditions << "surname like '#{Mysql2::Client.escape(surname_prefix.downcase.capitalize)}%'" unless surname_prefix.blank?

        conditions = if conditions.blank?
                       ''
                     else
                       "where #{conditions.join(' AND ')}"
                     end

        query = "select #{User::QUERY_ATTRIBUTES.join(',')} from users #{conditions} order by id desc limit 10"

        puts query
        data = ActiveRecord::Base.connection.execute(query).to_a

        data.collect do |user_hash|
          user = User.new
          User::QUERY_ATTRIBUTES.each_with_index do |attr, i|
            user.send "#{attr}=", user_hash[i]
          end
          user
        end
      end
    end
  end
end

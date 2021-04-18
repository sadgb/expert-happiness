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
        DbConnection.replica_execute do |client|
          statement = client.prepare(query)
          data = statement.execute.to_a

          data.collect do |user_hash|
            MakeUserFromHash.call(user_hash)
          end

        end
      end
    end
  end
end

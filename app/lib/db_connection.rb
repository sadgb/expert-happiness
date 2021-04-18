# # frozen_string_literal: true
#
# class DbConnection
#   def self.rails_config
#     Rails.configuration.database_configuration[Rails.env]
#   end
#
#   def self.execute
#     raise unless block_given?
#
#     $db_pool.with do |conn|
#       yield conn
#     end
#   end
#
#   def self.init_pool
#     $db_pool = ConnectionPool.new(size: rails_config['pool'], timeout: 0) do
#       Mysql2::Client.new(host: rails_config['host'],
#                          username: rails_config['username'],
#                          port: rails_config['port'],
#                          database: rails_config['database'],
#                          password: rails_config['password'],
#       )
#     end
#   end
# end

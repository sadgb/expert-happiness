# frozen_string_literal: true

class DbConnection
  def self.rails_config
    Rails.configuration.database_configuration[Rails.env]
  end

  def self.replica_rails_config
    Rails.configuration.database_configuration[Rails.env]['replica']&.merge({ database: rails_config['database'] })
  end

  def self.execute(&block)
    raise unless block_given?

    $db_pool.with(&block)
  end

  def self.replica_execute(&block)
    raise unless block_given?

    $db_replica_pool.with(&block)
  end


  def self.init_replica_pool
    $db_replica_pool = ConnectionPool.new(size: replica_rails_config['pool'], timeout: 0) do
      Mysql2::Client.new(replica_rails_config)
    end
  end


  def self.init_pool
    $db_pool = ConnectionPool.new(size: rails_config['pool'], timeout: 0) do
      Mysql2::Client.new(rails_config)
    end
  end
end

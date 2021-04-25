MAX_ACTIVE_USER_ID = 10_000

def insert_users_data
  sql = String.new("
    insert into users (name,surname,email, gender, age, city, created_at, updated_at) values
")

  x = []

  puts Benchmark.ms {
    1000.times do |i|
      x << "('#{FFaker::Name.first_name}', '#{FFaker::Name.last_name.gsub("'", '')}', '#{FFaker::Internet.email}', #{[1, 2, 3].sample}, #{rand(20..120)}, '#{FFaker::Address.city.gsub("'", '') }',   now(), now())"
    end
  }

  sql += x.join(",\n")

  ActiveRecord::Base.connection.execute(sql)
end

def insert_posts_data
  sql = String.new("
    insert into posts (text,user_id, created_at, updated_at) values
")

  x = []

  puts "posts: " + (Benchmark.ms {
    1000.times do

      date = "now() - INTERVAL #{rand(100..100_000)} MINUTE"
      x << "('#{FFaker::FreedomIpsum.words(rand(10..25)).join(' ').gsub("'", '')}', #{rand(1..MAX_ACTIVE_USER_ID)},#{date}, #{date})"
    end
  }).to_s

  sql += x.join(",\n")

  ActiveRecord::Base.connection.execute(sql)
end

def insert_friend_requests_data
  sql = String.new("insert ignore into friend_requests (from_user_id,to_user_id) values\n")

  x = []

  1000.times do
    from_user = rand(1..MAX_ACTIVE_USER_ID)
    to_user  = rand(1..MAX_ACTIVE_USER_ID)
    next if from_user == to_user
    x << "(#{from_user}, #{to_user}), (#{to_user}, #{from_user})"
  end

  sql += x.join(",\n")

  ActiveRecord::Base.connection.execute(sql)
end

def clean

  ActiveRecord::Base.connection.execute("truncate table posts;")
  ActiveRecord::Base.connection.execute("truncate table friend_requests;")
  ActiveRecord::Base.connection.execute("truncate table users;")
end

def create_users
  100.times do
    insert_users_data
  end
end

def create_posts
  100.times do
    insert_posts_data
  end
end

def create_friend_requests

  100.times do
    puts "friend_requests: " + (Benchmark.ms {
      insert_friend_requests_data }).to_s
  end
end

clean
create_users
create_posts
create_friend_requests

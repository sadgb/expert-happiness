def insert_data
  sql = String.new("
    insert into users (name,surname,email, gender, age, city, created_at, updated_at) values
")

  x = []

  puts Benchmark.ms {
    1000.times do |i|
      x << "('#{FFaker::Name.first_name}', '#{FFaker::Name.last_name.gsub("'", '')}', '#{FFaker::Internet.email}', #{[1,2,3].sample}, #{rand(20..120)}, '#{FFaker::Address.city.gsub("'", '') }',   now(), now())"
    end
  }

  sql += x.join(",\n")

  ActiveRecord::Base.connection.execute(sql)
end



ActiveRecord::Base.connection.execute("truncate table friend_requests;")
ActiveRecord::Base.connection.execute("truncate table users;")

1000.times do
  insert_data
end

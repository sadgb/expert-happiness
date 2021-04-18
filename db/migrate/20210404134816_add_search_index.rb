class AddSearchIndex < ActiveRecord::Migration[5.1]
  def up
    execute 'create index idx_name_surname4 on users(surname)'
    execute 'create index idx_name_surname5 on users(name, surname)'
    execute 'create index idx_name_surname6 on users(name(1), surname(1))'

  end

  def down
    execute 'drop index idx_name_surname4 on users'
    execute 'drop index idx_name_surname5 on users'
    execute 'drop index idx_name_surname6 on users'
  end
end

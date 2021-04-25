module NewsFeed
  class GetFeedForUser
    def self.call(user_id)
      key = GetKeyForUser.call(user_id)

      #
      # почему 10 часов ? просто так, этот параметр должен подбираться из желаемых бизнес метрик
      # паттернов поведения пользователей и может быть индивидуальным для каждого юзера
      # Вот в нашем примере я решил что 10 часов - идеально
      Rails.cache.fetch key, expires_in: 10.hours do
        Database::Posts::FetchPostsFeedForUser.call(user_id)
      end
    end
  end
end
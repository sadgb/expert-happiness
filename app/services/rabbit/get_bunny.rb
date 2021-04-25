module Rabbit
  class GetBunny
    @@bunny = nil

    def self.call
      return @@bunny if @@bunny

      @@bunny = Bunny.new( 'amqp://admin:admin123@127.0.0.1:5672/dev')
      @@bunny.start
      @@bunny
    end
  end
end
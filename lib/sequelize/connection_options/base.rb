module Sequelize
  class ConnectionOptions
    class Base
      include Adamantium

      def adapter
        config[:adapter]
      end
      memoize :adapter

      def database
        config[:database] || config[:dbname]
      end
      memoize :database

      def username
        config[:username] || config[:user] || ''
      end
      memoize :username

      def password
        config[:password] || config[:pass] || ''
      end
      memoize :password

      def host
        config[:host] || config[:socket]
      end
      memoize :host

      def port
        config[:port].to_i if config[:port]
      end
      memoize :port

      def owner
        config[:owner]
      end
      memoize :owner

      def charset
        config[:charset] || config[:encoding] || 'utf8'
      end
      memoize :charset

      def collation
        config[:collation]
      end
      memoize :collation

      def servers
        config[:servers]
      end
      memoize :servers

      def single_threaded
        config[:single_threaded]
      end
      memoize :single_threaded

      def test
        config[:test]
      end
      memoize :test

      def max_connections
        config[:max_connections]
      end
      memoize :max_connections

      def pool_sleep_time
        config[:pool_sleep_time]
      end
      memoize :pool_sleep_time

      def pool_timeout
        config[:pool_timeout]
      end
      memoize :pool_timeout

      def to_hash
        properties.each_with_object({}) do |prop, hash|
          value = public_send(prop)
          hash[prop] = value if value
        end
      end
      memoize :to_hash

    private

      attr_reader :config

      def initialize(config)
        @config = config
      end

      def properties
        [:adapter, :database, :username, :password, :host, :port, :owner, :charset, :collation, :servers, :single_threaded, :test, :max_connections, :pool_sleep_time, :pool_timeout]
      end
      memoize :properties
    end

  end
end

module Gctools
  module Rails
    class Middleware
      def initialize(app)
        @app = app
      end

      def call(env)
        Timer.clear
        @app.call(env)
      ensure
        Timer.clear
      end
    end
  end
end

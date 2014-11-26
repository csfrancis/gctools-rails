module Gctools
  module Rails
    class Railtie < ::Rails::Railtie
      initializer 'gctools_rails.configure_controller' do |app|
        app.config.middleware.insert 0, Gctools::Rails::Middleware

        ActiveSupport.on_load :action_controller do
          include TimeLogger
        end
      end
    end
  end
end

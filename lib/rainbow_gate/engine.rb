module RainbowGate
  class Engine < ::Rails::Engine
    isolate_namespace RainbowGate

    initializer 'plugin_authentication.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        include Devise::Controllers::Helpers
      end
    end
  end
end

RainbowGate::Engine.routes.draw do
  devise_for :users, class_name: 'RainbowGate::User', module: :devise
end

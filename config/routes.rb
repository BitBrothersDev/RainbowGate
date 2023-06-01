RainbowGate::Engine.routes.draw do
  devise_for :users, class_name: 'RainbowGate::User', module: "rainbow_gate/users",
             controllers: {
                registrations: 'rainbow_gate/users/registrations',
                sessions: 'rainbow_gate/users/sessions',
                omniauth_callbacks: 'rainbow_gate/users/omniauth_callbacks'
              }
end

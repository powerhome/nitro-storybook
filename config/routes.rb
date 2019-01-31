NitroSg::Engine.routes.draw do
  root              to: "pages#home"
  get 'home',       to: "pages#home"
  get 'principals', to: "pages#principals"
  get 'tokens',     to: "pages#tokens"
  get 'kits',       to: "pages#kits"
  get 'examples',   to: "pages#examples"
  get 'utilities',  to: "pages#utilities"
  get 'resources',  to: "pages#resources"
end

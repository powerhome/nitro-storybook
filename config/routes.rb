NitroSg::Engine.routes.draw do
  root              to: "pages#kits"
  get 'home',       to: "pages#home"
  get 'principles', to: "pages#principles"
  get 'tokens',     to: "pages#tokens"
  get 'kits',       to: "pages#kits"
  get 'examples',   to: "pages#examples"
  get 'utilities',  to: "pages#utilities"
  get 'resources',  to: "pages#resources"
  get 'kits/:name', to: "pages#kit_show", as: 'kit_show'
end

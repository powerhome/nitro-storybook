NitroSg::Engine.routes.draw do
  get 'greetings/hello'
  get 'greetings/pb_card'
  match "/more_nav" => "main#more_nav", via: [:get, :post, :put, :patch, :delete]
end

NitroSg::Engine.routes.draw do
  get 'greetings/hello'
  match "/more_nav" => "main#more_nav", via: [:get, :post, :put, :patch, :delete]
end

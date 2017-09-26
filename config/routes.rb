NitroStyleguide::Engine.routes.draw do
  match "/more_nav" => "main#more_nav", via: [:get, :post, :put, :patch, :delete]
end

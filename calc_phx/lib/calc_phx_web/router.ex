defmodule CalcPhxWeb.Router do
  use CalcPhxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CalcPhxWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    
    # As preferências de rotas é na ordem (top down).
    # quando utilizado a function "resources", todos os métodos do padrão REST
    # são criados, rodar no terminal "mix phx.routes", para fazer mais sentido.
    resources "/products", ProductController
  end

  # Other scopes may use custom stacks.
  # scope "/api", CalcPhxWeb do
  #   pipe_through :api
  # end
end

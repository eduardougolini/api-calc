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
  end

  # Define um escopo(/v1) para um grupo de rotas
  scope "/v1", CalcPhxWeb do
    # Define que só vai aceitar requests com dados em JSON
    pipe_through :api

    # Faz a definição da rota, a maneira como ele acha o 
    # 'CalculatorController' dentro da pasta 'v1' é um mistério
    post "/sum", CalculatorController, :sum
  end

  # Other scopes may use custom stacks.
  # scope "/api", CalcPhxWeb do
  #   pipe_through :api
  # end
end

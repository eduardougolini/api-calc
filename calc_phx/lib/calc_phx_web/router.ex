defmodule CalcPhxWeb.Router do
  use CalcPhxWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", CalcPhxWeb do
    pipe_through :api

    get "/sum/:num1/:num2",           CalculatorController, :sum
    get "/subtract/:num1/:num2",     CalculatorController, :subtract
    get "/divide/:dividend/:divisor", CalculatorController, :divide
    get "/multiply/:num1/:num2",      CalculatorController, :multiply
  end
end

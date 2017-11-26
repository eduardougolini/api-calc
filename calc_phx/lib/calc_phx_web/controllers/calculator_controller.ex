defmodule CalcPhxWeb.CalculatorController do
  use CalcPhxWeb, :controller
  require Logger

  alias CalcPhx.Api
  alias CalcPhx.Api.Calculator

  action_fallback CalcPhxWeb.FallbackController

  def sum(conn, %{"num1" => num1, "num2" => num2}) do
    a = Decimal.new(num1)
    b = Decimal.new(num2)
    total = Decimal.add(a, b)
    
    render(conn, "sum.json", total: total)
  end

  def subtract(conn, %{"num1" => num1, "num2" => num2}) do
    a = Decimal.new(num1)
    b = Decimal.new(num2)
    total = Decimal.sub(a, b)
    
    render(conn, "subtract.json", total: total)
  end

  def multiply(conn, %{"num1" => num1, "num2" => num2}) do
    a = Decimal.new(num1)
    b = Decimal.new(num2)
    total = Decimal.mult(a, b)
    
    render(conn, "multiply.json", total: total)
  end

  def divide(conn, %{"dividend" => dividend, "divisor" => divisor}) do
    a = Decimal.new(dividend)
    b = Decimal.new(divisor)
    total = Decimal.div(a, b)

    # aqui ou no controller precisa colocar um validador de erro para 
    # não poder haver divisão por 0
    
    render(conn, "divide.json", total: total)
  end
end

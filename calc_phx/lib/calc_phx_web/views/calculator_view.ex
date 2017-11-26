defmodule CalcPhxWeb.CalculatorView do
  use CalcPhxWeb, :view
  alias CalcPhxWeb.CalculatorView

  def render("sum.json", %{total: total}) do
    %{data: total}
  end

  def render("subtract.json", %{total: total}) do
    %{data: total}
  end
  
  def render("multiply.json", %{total: total}) do
    %{data: total}
  end

  def render("divide.json", %{total: total}) do
    %{data: total}
  end

end

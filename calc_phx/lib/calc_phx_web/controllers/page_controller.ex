defmodule CalcPhxWeb.PageController do
  use CalcPhxWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

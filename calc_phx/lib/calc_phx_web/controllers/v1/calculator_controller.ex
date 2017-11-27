defmodule CalcPhxWeb.CalculatorController do
  use CalcPhxWeb, :controller
  require Logger

  def sum(conn, _params) do
    {:ok, requestData, _conn_details} = Plug.Conn.read_body(conn)
    decodedJson = Poison.decode!(requestData)

    sumValue = Map.values(decodedJson) 
               |> Stream.map(fn(x) -> String.to_float(x) end) 
               |> Enum.sum

    json conn, %{"total" => sumValue}
  end

end

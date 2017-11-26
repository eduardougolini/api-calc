defmodule CalcPhxWeb.CalculatorController do
  use CalcPhxWeb, :controller

  def sum(conn, _params) do
    {:ok, requestData, _conn_details} = Plug.Conn.read_body(conn)
    decodedJson = Poison.decode!(requestData)

    mapOfJsonKeys = Map.keys(decodedJson)
    sumValue = sumRecursion(0, decodedJson, mapOfJsonKeys)

    jsonSumValue = %{"sumValue" => sumValue}

    json conn, jsonSumValue
  end

  def sumRecursion(sumValue, decodedJson, mapOfJsonKeys) when mapOfJsonKeys == [] do
    sumValue
  end

  def sumRecursion(sumValue, decodedJson, mapOfJsonKeys) do
    IO.puts(elem(decodedJson, List.first(mapOfJsonKeys)))
    mapOfJsonKeys = List.delete(mapOfJsonKeys, List.first(mapOfJsonKeys))

    sumRecursion(sumValue, decodedJson, mapOfJsonKeys)
  end
  
end

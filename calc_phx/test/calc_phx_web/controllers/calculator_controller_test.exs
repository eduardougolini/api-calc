defmodule CalcPhxWeb.CalculatorControllerTest do
  use CalcPhxWeb.ConnCase

  alias CalcPhx.Api
  alias CalcPhx.Api.Calculator

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:calculator) do
    {:ok, calculator} = Api.create_calculator(@create_attrs)
    calculator
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all calculators", %{conn: conn} do
      conn = get conn, calculator_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create calculator" do
    test "renders calculator when data is valid", %{conn: conn} do
      conn = post conn, calculator_path(conn, :create), calculator: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, calculator_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, calculator_path(conn, :create), calculator: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update calculator" do
    setup [:create_calculator]

    test "renders calculator when data is valid", %{conn: conn, calculator: %Calculator{id: id} = calculator} do
      conn = put conn, calculator_path(conn, :update, calculator), calculator: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, calculator_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, calculator: calculator} do
      conn = put conn, calculator_path(conn, :update, calculator), calculator: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete calculator" do
    setup [:create_calculator]

    test "deletes chosen calculator", %{conn: conn, calculator: calculator} do
      conn = delete conn, calculator_path(conn, :delete, calculator)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, calculator_path(conn, :show, calculator)
      end
    end
  end

  defp create_calculator(_) do
    calculator = fixture(:calculator)
    {:ok, calculator: calculator}
  end
end

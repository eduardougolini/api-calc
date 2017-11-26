defmodule CalcPhx.ApiTest do
  use CalcPhx.DataCase

  alias CalcPhx.Api

  describe "calculators" do
    alias CalcPhx.Api.Calculator

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def calculator_fixture(attrs \\ %{}) do
      {:ok, calculator} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_calculator()

      calculator
    end

    test "list_calculators/0 returns all calculators" do
      calculator = calculator_fixture()
      assert Api.list_calculators() == [calculator]
    end

    test "get_calculator!/1 returns the calculator with given id" do
      calculator = calculator_fixture()
      assert Api.get_calculator!(calculator.id) == calculator
    end

    test "create_calculator/1 with valid data creates a calculator" do
      assert {:ok, %Calculator{} = calculator} = Api.create_calculator(@valid_attrs)
      assert calculator.name == "some name"
    end

    test "create_calculator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_calculator(@invalid_attrs)
    end

    test "update_calculator/2 with valid data updates the calculator" do
      calculator = calculator_fixture()
      assert {:ok, calculator} = Api.update_calculator(calculator, @update_attrs)
      assert %Calculator{} = calculator
      assert calculator.name == "some updated name"
    end

    test "update_calculator/2 with invalid data returns error changeset" do
      calculator = calculator_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_calculator(calculator, @invalid_attrs)
      assert calculator == Api.get_calculator!(calculator.id)
    end

    test "delete_calculator/1 deletes the calculator" do
      calculator = calculator_fixture()
      assert {:ok, %Calculator{}} = Api.delete_calculator(calculator)
      assert_raise Ecto.NoResultsError, fn -> Api.get_calculator!(calculator.id) end
    end

    test "change_calculator/1 returns a calculator changeset" do
      calculator = calculator_fixture()
      assert %Ecto.Changeset{} = Api.change_calculator(calculator)
    end
  end
end

defmodule CalcPhx.Api do
  @moduledoc """
  The Api context.
  """

  import Ecto.Query, warn: false
  alias CalcPhx.Repo

  alias CalcPhx.Api.Calculator

  @doc """
  Returns the list of calculators.

  ## Examples

      iex> list_calculators()
      [%Calculator{}, ...]

  """
  def list_calculators do
    Repo.all(Calculator)
  end

  @doc """
  Gets a single calculator.

  Raises `Ecto.NoResultsError` if the Calculator does not exist.

  ## Examples

      iex> get_calculator!(123)
      %Calculator{}

      iex> get_calculator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_calculator!(id), do: Repo.get!(Calculator, id)

  @doc """
  Creates a calculator.

  ## Examples

      iex> create_calculator(%{field: value})
      {:ok, %Calculator{}}

      iex> create_calculator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_calculator(attrs \\ %{}) do
    %Calculator{}
    |> Calculator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a calculator.

  ## Examples

      iex> update_calculator(calculator, %{field: new_value})
      {:ok, %Calculator{}}

      iex> update_calculator(calculator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_calculator(%Calculator{} = calculator, attrs) do
    calculator
    |> Calculator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Calculator.

  ## Examples

      iex> delete_calculator(calculator)
      {:ok, %Calculator{}}

      iex> delete_calculator(calculator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_calculator(%Calculator{} = calculator) do
    Repo.delete(calculator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking calculator changes.

  ## Examples

      iex> change_calculator(calculator)
      %Ecto.Changeset{source: %Calculator{}}

  """
  def change_calculator(%Calculator{} = calculator) do
    Calculator.changeset(calculator, %{})
  end
end

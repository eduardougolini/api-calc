defmodule CalcPhx.Api.Calculator do
  use Ecto.Schema
  import Ecto.Changeset
  alias CalcPhx.Api.Calculator


  schema "calculators" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Calculator{} = calculator, attrs) do
    calculator
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

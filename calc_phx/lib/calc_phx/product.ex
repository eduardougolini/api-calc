defmodule CalcPhx.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias CalcPhx.Product


  schema "products" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Product{} = product, attrs) do
    product
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

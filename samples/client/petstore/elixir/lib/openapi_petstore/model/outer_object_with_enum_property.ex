# NOTE: This file is auto generated by OpenAPI Generator 6.2.1-SNAPSHOT (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule OpenapiPetstore.Model.OuterObjectWithEnumProperty do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :value
  ]

  @type t :: %__MODULE__{
    :value => OpenapiPetstore.Model.OuterEnumInteger.t
  }
end

defimpl Poison.Decoder, for: OpenapiPetstore.Model.OuterObjectWithEnumProperty do
  import OpenapiPetstore.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:value, :struct, OpenapiPetstore.Model.OuterEnumInteger, options)
  end
end

# NOTE: This file is auto generated by OpenAPI Generator 6.2.1-SNAPSHOT (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule OpenapiPetstore.Model.Tag do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :id,
    :name
  ]

  @type t :: %__MODULE__{
    :id => integer() | nil,
    :name => String.t | nil
  }
end

defimpl Poison.Decoder, for: OpenapiPetstore.Model.Tag do
  def decode(value, _options) do
    value
  end
end

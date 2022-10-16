# NOTE: This file is auto generated by OpenAPI Generator 6.2.1-SNAPSHOT (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule OpenapiPetstore.Model.User do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :id,
    :username,
    :firstName,
    :lastName,
    :email,
    :password,
    :phone,
    :userStatus
  ]

  @type t :: %__MODULE__{
    :id => integer() | nil,
    :username => String.t | nil,
    :firstName => String.t | nil,
    :lastName => String.t | nil,
    :email => String.t | nil,
    :password => String.t | nil,
    :phone => String.t | nil,
    :userStatus => integer() | nil
  }
end

defimpl Poison.Decoder, for: OpenapiPetstore.Model.User do
  def decode(value, _options) do
    value
  end
end

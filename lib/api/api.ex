defmodule Docuseal.Api do
  use HTTPoison.Base

  @moduledoc """
  This handles the API requests to the API, requires authentication (API key)
  """

  def process_request_headers(headers) do
    token = Application.fetch_env!(:ex_docu_seal, :auth_token)

    case token do
      "" ->
        raise "Authentication token is empty in the configuration"

      nil ->
        raise "Authentication token is not (correctly) set in the configuration"

      token ->
        headers ++ [{"Authorization", "Bearer #{token}"}, {"Accept", "application/json"}]
    end
  end
end

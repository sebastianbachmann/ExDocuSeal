defmodule Docuseal.TemplateDetails do
  require Logger
  use HTTPoison.Base

  alias ExDocuSeal.Log

  @base_url "https://api.docuseal.co"

  @spec submit_template_details_request(integer) :: :ok | {:error, term}
  def submit_template_details_request(template_id) do
    url = "#{@base_url}/templates/#{template_id}"

    IO.inspect(url)

    case HTTPoison.get(url, get_headers()) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts("Response Body: #{body}")
        Log.handle_success()

      {:ok, %HTTPoison.Response{status_code: status, body: body}} ->
        Log.handle_error(status, body)

      {:error, reason} ->
        Log.handle_failure(reason)
    end
  end

  defp get_headers do
    token = Application.fetch_env!(:ex_docu_seal, :auth_token)
    IO.inspect(token)

    [
      {"X-Auth-Token", token},
      {"Content-Type", "application/json"}
    ]
  end
end

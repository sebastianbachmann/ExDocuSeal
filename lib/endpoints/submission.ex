defmodule Docuseal.Submission do
  require Logger
  use HTTPoison.Base

  alias ExDocuSeal.Log

  @base_url "https://api.docuseal.co"

  @spec submit_submission_request(integer, String.t()) :: :ok | {:error, term}
  def submit_submission_request(template_id, emails) do
    url = "#{@base_url}/submissions"
    token = Application.fetch_env!(:ex_docu_seal, :auth_token)

    headers = [
      {"X-Auth-Token", token},
      {"Content-Type", "application/json"}
    ]

    data = %{
      "template_id" => template_id,
      "emails" => emails
    }

    case HTTPoison.post(url, Jason.encode!(data), headers) do
      {:ok, %HTTPoison.Response{status_code: 200}} -> Log.handle_success()
      {:ok, %HTTPoison.Response{status_code: status, body: body}} -> Log.handle_error(status, body)
      {:error, reason} -> Log.handle_failure(reason)
    end
  end
end

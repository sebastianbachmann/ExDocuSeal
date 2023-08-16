defmodule ExDocuSeal.Log do
  require Logger

  def handle_success() do
    Logger.info("Submission successful!")
    :ok
  end

  def handle_error(status, _body) do
    raise("Failed with status code: #{status} | You need to sign in or sign up before continuing.")
  end

  def handle_failure(reason) do
    raise("Submission failed due to unknown reason: #{reason}")
  end
end

import Config

DotenvParser.load_file(".env")

if config_env() == :dev do
  DotenvParser.load_file(".env")
end

config :logger, level: :info

config :ex_docu_seal,
  env: Config.config_env(),
  auth_token: System.get_env("TOKEN")

# auth_token: ""
# template_id: System.get_env("DOCUSEAL_TEMPLATE_ID"),
# emails: System.get_env("DOCUSEAL_EMAILS") |> String.split(",")

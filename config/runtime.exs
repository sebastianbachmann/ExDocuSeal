import Config

DotenvParser.load_file(".env")

if config_env() == :dev do
  DotenvParser.load_file(".env")
end

config :logger, level: :info

config :ex_docu_seal,
  env: Config.config_env(),
  auth_token: System.fetch_env!("X_AUTH_TOKEN")

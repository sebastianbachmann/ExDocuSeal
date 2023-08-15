import Config

if Config.config_env() == :dev do
  DotenvParser.load_file(".env")
end

# Now variables from `.env` are loaded into system env
config :ex_docu_seal,
  x_auth_token: System.fetch_env!("X_AUTH_TOKEN")

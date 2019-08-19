use Mix.Config

# Configure your database
config :wedding_planner, WeddingPlanner.Repo,
  username: "postgres",
  password: "postgres",
  database: "wedding_planner_test",
  hostname: "db",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wedding_planner, WeddingPlannerWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

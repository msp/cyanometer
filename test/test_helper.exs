ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Cyanometer.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Cyanometer.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Cyanometer.Repo)


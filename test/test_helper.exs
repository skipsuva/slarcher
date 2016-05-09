ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Slarcher.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Slarcher.Repo --quiet)
Ecto.Adapters.SQL.Sandbox.mode(Slarcher.Repo, :manual)

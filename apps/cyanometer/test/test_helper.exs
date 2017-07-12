Bureaucrat.start
ExUnit.start(formatters: [ExUnit.CLIFormatter, Bureaucrat.Formatter, ExUnitNotifier])

Ecto.Adapters.SQL.Sandbox.mode(Cyanometer.Repo, :manual)

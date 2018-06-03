Bureaucrat.start
ExUnit.start(formatters: [ExUnit.CLIFormatter, Bureaucrat.Formatter, ExUnitNotifier, Tapex])

Ecto.Adapters.SQL.Sandbox.mode(Cyanometer.Repo, :manual)

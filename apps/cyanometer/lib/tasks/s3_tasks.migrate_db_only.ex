defmodule Mix.Tasks.S3Tasks.MigrateDbOnly do
  use Mix.Task

  @shortdoc "Migrate the DB only to the V2 format"

  def run(_args) do
    Mix.shell.info "starting migration"

    Cyanometer.Scripts.migrate_s3 true
  end
end

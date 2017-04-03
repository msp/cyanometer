defmodule Mix.Tasks.S3Tasks.Migrate do
  use Mix.Task

  @shortdoc "Migrate the old catch all bucket & DB entries` to the V2 format"

  def run(_args) do
    Mix.shell.info "starting migration"
    Cyanometer.Scripts.migrate_s3
  end
end

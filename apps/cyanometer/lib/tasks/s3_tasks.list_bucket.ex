defmodule Mix.Tasks.S3Tasks.ListBucket do
  use Mix.Task

  @shortdoc "List files in the given S3 bucket"

  def run(bucket) do
    Mix.shell.info "starting with [#{bucket}]"
    Cyanometer.Scripts.test_list_s3(bucket)
  end
end

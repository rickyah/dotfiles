# frozen_string_literal: true

require "#{ENV['_DOTF_ROOT']}/share/dotf/ui"

class FileRsync
  @quiet = false
  @dry_run = false

  def initialize(dry_run: false, quiet: false)
    @dry_run = dry_run
    @quiet = quiet

    @rsync_args =  '-av'
    @rsync_args += ' --dry-run' if @dry_run
    @rsync_args += ' -q' if @quiet
  end

  def rsync_files(source_path, dest_path)
    cmd = "rsync #{@rsync_args} \"#{source_path}\" \"#{dest_path}\""

    UI.info "#{dry_run_warning}#{source_path} --> #{dest_path}"
    UI.message "executing command: [#{cmd}]" 
    `#{cmd}` unless @dry_run
  end
end

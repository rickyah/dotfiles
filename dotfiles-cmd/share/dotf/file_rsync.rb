# frozen_string_literal: true

require 'FileUtils'
require "#{ENV['_DOTF_ROOT']}/share/dotf/ui"

class FileRsync
  @dry_run = false

  def initialize(dry_run: false)
    @dry_run = dry_run

    @rsync_args =  '-av'
    @rsync_args += ' --dry-run' if @dry_run
    @rsync_args += ' -q' if @quiet
  end

  def rsync_files(source_path, dest_path)
    dry_run_warning = ''
    dry_run_warning = '(DRY RUN) ' if @dry_run

    folder = File.dirname(dest_path)

    if !File.directory?(folder)
      UI.warning "#{dry_run_warning}Creating folder #{folder} becase the destination path does not exist"
      if !@dry_run
        FileUtils.mkdir_p folder
      end
    end

    cmd = "rsync #{@rsync_args} \"#{source_path}\" \"#{dest_path}\""

    UI.info "#{dry_run_warning}#{source_path} --> #{dest_path}"
    UI.message "executing command: [#{cmd}]"
    `#{cmd}` unless @dry_run
  end
end

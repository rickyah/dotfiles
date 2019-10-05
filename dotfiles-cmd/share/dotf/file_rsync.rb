class FileRsync

    @quiet = false
    @dry_run = false

    def initialize dry_run: false, quiet: false

        @dry_run = dry_run
        @quiet = quiet

        @rsync_args =  "-av" 
        @rsync_args += " --dry-run" if @dry_run
        @rsync_args += " -q" if @quiet
    end

    def rsync_files source_path, dest_path 
        cmd = "rsync #{@rsync_args} #{source_path} #{dest_path}"

        dry_run_warning = ""
        dry_run_warning = "(DRY RUN)" if @dry_run
        puts "#{dry_run_warning} #{source_path} --> #{dest_path}"
        unless @quiet
            puts "executing command: [#{cmd}]"
        end
        `#{cmd}`
    end

end

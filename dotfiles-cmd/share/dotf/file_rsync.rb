class FileRsync
    @@rsync_cmd  ="rsync"
    @@default_args ="-av"
    @@dry_run_arg = " --dry-run"

    def initialize dry_run: false
        @rsync_args =  @@default_args
        @rsync_args += @@dry_run_arg if dry_run
    end

    def rsync_files source_path, dest_path 
        cmd = "#{@@rsync_cmd} #{@rsync_args} #{source_path} #{dest_path}"

        puts "Executing command: [#{cmd}]"
        puts `#{cmd}`
    end

end
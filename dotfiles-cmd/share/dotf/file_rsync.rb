class FileRsync
    @@default_args ="-av"
    @@rsync_test = "--dry-run"
    @@rsync_cmd  ="rsync"

    def initialize source_path, dest_path
        @source_path = source_path
        @dest_path = dest_path
    end

    def rsync_files args=nil
        
        rsync_args = args || @@default_args
        rsync_args += " " + @@rsync_test if ENV['DOTFILES_DRY_RUN']
        cmd = "#{@@rsync_cmd} #{rsync_args} #{@source_path} #{@dest_path}"

        puts "Command: [#{cmd}]"
        puts "INFO: dry run: no files will be copied" if ENV['DOTFILES_DRY_RUN']
        puts "List of operations to be performed:"
        puts `#{cmd}`
    end
end
# frozen_string_literal: true

require 'optparse'
require 'mkmf'
require 'open3'

MakeMakefile::Logging.instance_variable_set(:@logfile, File::NULL)

def install_homebrew
  app_name = 'Homebrew'
  app_cmd = 'brew'
  homebrew_install_cmd = 'ruby -e "$(curl -fsSL /bin/bash -c https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  homebrew_setup_cmd = 'eval "$(/opt/homebrew/bin/brew shellenv)"'
  app_install_cmds = [homebrew_install_cmd, homebrew_setup_cmd]
  brewfile_filepath = "#{ENV['_DOTF_ROOT']}/../configuration/Brewfile"

  puts '---------------------------------------------------------------------------------'
  puts "This script installs #{app_name} if it is not installed"
  puts '---------------------------------------------------------------------------------'

  puts 'Looking for Homebrew executable...'
  if find_executable(app_cmd).nil?
    puts "#{app_name} was not found in the system, To install it, theses commands needs be executed:"
    puts app_install_cmds.join("\n")
    puts 'Do you want me to install it? (y/n)'

    if gets.chomp =~ /^[Yy]/
      puts "Ok, installing #{app_name}"
      app_install_cmds.each do |cmd|
        system cmd
      end
    else
      puts 'Aborting'
      exit 2
    end

  else
    puts "Found #{app_name} in the system: version #{`#{app_cmd} --version`}"
  end
end

def bundle_homebrew(brewfile_path)
  unless File.exist? File.expand_path brewfile_path
    puts "Couldn't find a Brewfile at path '#{brewfile_path}'"
    exit 1
  end

  options = {}
  OptionParser.new do |opt|
    opt.on('--dry-run') { |o| options[:dry_run] = o }
    opt.on('--verbose') { |o| options[:verbose] = o }
    opt.on('--taps') { |o| options[:taps] = o }
    opt.on('--casks') { |o| options[:casks] = o }
    opt.on('--mas') { |o| options[:mas] = o }
  end.parse!
  install_homebrew

  fine_grain_modifiers = %i[taps brews casks mas]
  supported_options = %i[verbose dry_run] + fine_grain_modifiers

  # check for invalid parameters
  invalid_options = options.slice(supported_options)

  if options[:verbose] == true
    puts 'Arguments passed:'
    options.each do |kv|
      puts "\t#{kv[0]} => #{kv[1]}"
    end
  end

  unless invalid_options.empty?
    puts "Unrecogniced arguments(s): #{invalid_options}"
    exit 3
  end

  #  if dry-run is active we will just use the bundle list command to print
  #  the actions to be performed
  base_command = "brew bundle install #{options[:verbose] ? '--verbose' : ''} --file \"#{brewfile_path}\""

  commands_to_execute = ['brew update']

  modifiers = options.slice(*fine_grain_modifiers)
  if modifiers.empty?
    commands_to_execute << base_command
  else
    modifiers.each_key do |modifier|
      commands_to_execute << "#{base_command} --#{modifier}"
    end
  end

  commands_to_execute << 'brew cleanup'

  if options[:dry_run]
    puts 'Running in dry-run mode. This script will perform the following commands:'
    commands_to_execute.each do |cmd|
      puts "\t* #{cmd}"
    end
    exit 0
  else
    commands_to_execute.each do |cmd|
      puts
      puts "Executing command: '#{cmd}'" if options[:verbose]

      Open3.popen2e(cmd) do |_stdin, stdout_stderr, wait_thread|
        Thread.new do
          stdout_stderr.each { |line| puts line }
        end

        status = wait_thread.value
        exit status.exitstatus if status.exitstatus != 0
      end
    end
  end

  puts
  puts 'Done!'
  puts "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
end

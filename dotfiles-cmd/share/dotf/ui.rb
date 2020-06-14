class UI
  @@verbose = false

  def self.set_verbose(value)
    @@verbose = value
  end

  def self.message(text)
    puts text
  end

  def self.info(text)
    return unless @@verbose

    puts "INFO: #{text}"
  end

  def self.warning(text)
    puts "WARN: #{text}"
  end

  def self.fatal(text, error_code: -1)
    puts "ERROR: #{text}"
    exit error_code
  end
end
module NativeClientHelpers

  def get_native_ddate_on_path(paths)
    paths.each_line do |path|
      return path.strip if (path.include?('/usr/local/') || path.include?('/usr/share/'))
    end
  end

  def native_client_fail_message
    puts 'Fffffuuuuuuuu ..cannot run this test, ddate is not on your path.'
    puts '  On Mac, try running `brew install ddate`'
    puts '  On Linux try installing with your distros package manager (apt-get, rpm, etc)'
    fail 'Install and add ddate to your path, or ignore this test.'
  end

end

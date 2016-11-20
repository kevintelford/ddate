class DDate

  @@DEFAULT_FMT = "%{%A, %B %d%}, %Y YOLD"
  @@OLD_IMMEDIATE_FMT = "Today is %{%A, the %e day of %B%} in the YOLD %Y%N%nCelebrate %H"

  ##
  # Accepts a hash of preprocessor define directives -- [ OLD_IMMEDIATE_FMT, US_FORMAT, KILL_BOB, PRAISE_BOB ]
  #
  def initialize(*argv)

    if argv[0].is_a?(Hash)
      handle_define_directives argv.shift
    else
      handle_define_directives
    end
    initialize_excl
    initialize_default_immediate_fmt

  end

  ### preprocessors ###
  def handle_define_directives(h={})
    $OLD_IMMEDIATE_FMT = (!h[:OLD_IMMEDIATE_FMT].nil? && h[:OLD_IMMEDIATE_FMT] == true) ? true : nil
    $US_FORMAT = (!h[:US_FORMAT].nil? && h[:US_FORMAT] == true) ? true : nil
    $KILL_BOB = (h[:KILL_BOB].nil? || h[:KILL_BOB] == 13013) ? 13013 : nil
    $PRAISE_BOB = (!h[:PRAISE_BOB].nil? && h[:PRAISE_BOB] == 13013) ? 13013 : nil
  end

  ### initializers ###
  def initialize_excl
    @EXCL = ["Hail Eris!", "All Hail Discordia!", "Kallisti!", "Fnord.", "Or not.",
             "Wibble.", "Pzat!", "P'tang!", "Frink!"]
    @EXCL.push(*["Slack!", "Praise \"Bob\"!", "Or kill me."]) if $PRAISE_BOB
    # randomness, from the Net and other places. Feel free to add (after checking with the relevant authorities, of course).
    @EXCL.push(*["Grudnuk demand sustenance!", "Keep the Lasagna flying!",
                 "You are what you see.",
                 "Or is it?", "This statement is false.",
                 "Lies and slander, sire!", "Hee hee hee!"])
    if RbConfig::CONFIG['host_os'] =~ /linux/
      @EXCL << "Hail Eris, Hack Linux!"
    elsif RbConfig::CONFIG['host_os'] =~ /darwin|mac os/
      @EXCL << "This Fruit is not the True Fruit of Discord."
    else
      @EXCL << ""
    end
  end

  def initialize_default_immediate_fmt
    @DEFAULT_IMMEDIATE_FMT = ($OLD_IMMEDIATE_FMT == true) ? @@OLD_IMMEDIATE_FMT.clone : @@DEFAULT_FMT.clone
  end

end

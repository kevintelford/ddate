class DDate

  ##
  # Accepts a hash of preprocessor define directives -- [ OLD_IMMEDIATE_FMT, US_FORMAT, KILL_BOB, PRAISE_BOB ]
  #
  def initialize(*argv)

    if argv[0].is_a?(Hash)
      handle_define_directives argv.shift
    else
      handle_define_directives
    end

  end

  ### preprocessors ###
  def handle_define_directives(h={})
    $OLD_IMMEDIATE_FMT = (!h[:OLD_IMMEDIATE_FMT].nil? && h[:OLD_IMMEDIATE_FMT] == true) ? true : nil
    $US_FORMAT = (!h[:US_FORMAT].nil? && h[:US_FORMAT] == true) ? true : nil
    $KILL_BOB = (h[:KILL_BOB].nil? || h[:KILL_BOB] == 13013) ? 13013 : nil
    $PRAISE_BOB = (!h[:PRAISE_BOB].nil? && h[:PRAISE_BOB] == 13013) ? 13013 : nil
  end

end

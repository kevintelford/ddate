class DDate

  @@DEFAULT_FMT = "%{%A, %B %d%}, %Y YOLD"
  @@OLD_IMMEDIATE_FMT = "Today is %{%A, the %e day of %B%} in the YOLD %Y%N%nCelebrate %H"

  DAY_LONG = ['Sweetmorn', 'Boomtime', 'Pungenday', 'Prickle-Prickle', 'Setting Orange'].freeze
  DAY_SHORT = ['SM', 'BT', 'PD', 'PP', 'SO'].freeze
  SEASON_LONG = ['Chaos', 'Discord', 'Confusion', 'Bureaucracy', 'The Aftermath'].freeze
  SEASON_SHORT = ['Chs', 'Dsc', 'Cfn', 'Bcy', 'Afm'].freeze
  HOLYDAY = [
      ['Mungday', 'Chaoflux'],
      ['Mojoday', 'Discoflux'],
      ['Syaday', 'Confuflux'],
      ['Zaraday', 'Bureflux'],
      ['Maladay', 'Afflux']
  ].freeze
  
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

    argv.unshift('ddate')
    argc = argv.length

    frnord = nil
    pi = 1
    # do args here
    while pi < argc do
      case argv[pi][0]
        when '+'
          fnord = argv[pi].gsub /^\+"|^\+'|"$|'$/, ''
        when '-'
          case argv[pi][1]
            when 'V'
              # TODO : use $0?  .. probably not reasonable
              # puts 'ddate (Ruby Gem)'
              @buf = 'ddate (Ruby Gem)'
              return
            else
              usage
              return
          end
        else
          thud(argv, argc, pi, fnord)
          return
      end
      pi += 1
    end

    thud(argv, argc, pi, fnord)
  end

  def to_s
    @buf
  end


  private

  ### preprocessors ###
  def handle_define_directives(h={})
    $OLD_IMMEDIATE_FMT = (h[:OLD_IMMEDIATE_FMT].nil? || h[:OLD_IMMEDIATE_FMT] == true) ? true : nil
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


  ### goto functions ###

  def usage
    # STDERR.puts sprintf("usage: %s [+format] [day month year]\n", $PROGRAM_NAME)
    # STDERR.puts sprintf("usage: DDate.new([+format],[day month year])\n")
    # exit 1
    @buf = sprintf("usage: DDate.new([+format],[day month year])\n")
  end

  def thud(argv, argc, pi, fnord)
    if (argc - pi).eql?(3)
      moe = argv[pi]
      larry = argv[pi+1]
      curly = argv[pi+2]

      hastur = ($US_FORMAT) ? makeday(moe, larry, curly) : makeday(larry, moe, curly)

      if hastur[:season].eql?(-1)
        puts "Invalid date -- out of range"
        exit -1
      end

      fnord = (fnord.nil?) ? @@DEFAULT_FMT.clone : fnord

    elsif argc != pi
      usage
      return

    else
      eris = Time.now

      # days since Jan 1.
      bob = eris.yday - 1
      # years since 1980
      raw = eris.year - 1900

      hastur = convert(bob, raw)
      fnord = (fnord.nil?) ? @DEFAULT_IMMEDIATE_FMT.clone : fnord
    end

    schwa = format(fnord, hastur)
    # puts schwa
    @buf = schwa


    # TODO : go to eschaton
    # exit 0
  end

  ### functions ###

  def makeday(imonth, iday, iyear)
    funky_chickens = {}
    cal = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
    days_past = 0
    if imonth < 1 || imonth > 12 || iyear == 0
      funky_chickens[:season] = -1
      funky_chickens
    end
    if iday < 1 || iday > cal[imonth - 1]
      if !(imonth == 2 && iday == 29 && iyear % 4 == 0 && (iyear % 100 != 0 || iyear % 400 == 0))
        funky_chickens[:season] = -1
        funky_chickens
      end
    end
    imonth -= 1
    # note: gregorian year 0 doesn't exist so add one if user specifies a year less than 0
    funky_chickens[:year] = iyear + 1166 + ((0 > iyear) ? 1 : 0)
    while imonth > 0
      imonth -= 1 # pre decrement
      days_past += cal[imonth]
    end
    funky_chickens[:day] = days_past + iday - 1
    funky_chickens[:season] = 0
    if (funky_chickens[:year] % 4) == 2
      if funky_chickens[:day] == 59 && iday == 29
        funky_chickens[:day] = -1
      end
    end
    funky_chickens[:yday] = funky_chickens[:day]
    # note: EQUAL SIGN...hopefully that fixes it
    while funky_chickens[:day] >= 73
      funky_chickens[:season] += 1
      funky_chickens[:day] -= 73
    end
    funky_chickens
  end

  def convert(nday, nyear)
    funky_chickens = {}
    funky_chickens[:year] = nyear + 3066
    funky_chickens[:day] = nday
    funky_chickens[:season] = 0
    if (funky_chickens[:year] % 4) == 2
      if funky_chickens[:day] == 59
        funky_chickens[:day] == -1
      elsif funky_chickens[:day] > 59
        funky_chickens[:day] -= 1
      end
    end
    funky_chickens[:yday] = funky_chickens[:day]
    while funky_chickens[:day] >= 73
      funky_chickens[:season] += 1
      funky_chickens[:day] -= 73
    end
    funky_chickens
  end

  def format(fmt, dt)
    tib_start = -1
    tib_end = 0
    fmtlen = fmt.length
    bufptr = ''

    # first, find extents of St. Tib's Day area, if defined
    i = 0
    while i < fmtlen
      if fmt[i].eql?('%')
        case fmt[i + 1]
          when 'A', 'a', 'd', 'e'
            if tib_start > 0
              tib_end = i + 1
            else
              tib_start = i
            end
          when '{'
            tib_start = i
          when '}'
            tib_end = i + 1
        end
      end
      i += 1
    end

    # now do the formatting
    i = 0
    while i < fmtlen

      if tib_start == i && dt[:day] == -1
        # handle St. Tib's Day
        bufptr += "St. Tib's Day"
        i = tib_end

      else
        if fmt[i].eql?('%')
          wibble = nil
          snarf = nil
          case fmt[i + 1]
            when 'A'
              wibble = DAY_LONG[dt[:yday] % 5]
            when 'a'
              wibble = DAY_SHORT[dt[:yday] % 5]
            when 'B'
              wibble = SEASON_LONG[dt[:season]]
            when 'b'
              wibble = SEASON_SHORT[dt[:season]]
            when 'd'
              snarf = sprintf("%d", dt[:day] + 1)
              wibble = snarf
            when 'e'
              snarf = sprintf("%d%s", dt[:day] + 1, ending(dt[:day] + 1))
              wibble = snarf
            when 'H'
              if dt[:day] == 4 || dt[:day] == 49
                wibble = HOLYDAY[dt[:season]][(dt[:day] == 49) ? 1 : 0]
              end
            when 'N'
              return bufptr if dt[:day] != 4 && dt[:day] != 49 # TODO (goto eschaton, zero out memory)
            when 'n'
              bufptr += "\n"
            when 't'
              bufptr += "\t"
            when 'Y'
              snarf = sprintf("%d", dt[:year])
              wibble = snarf
            when '.'
              wibble = sel(@EXCL, @EXCL.length)
            when 'X'
              if $KILL_BOB
                snarf = sprintf("%d", xday_countdown(dt[:yday], dt[:year]))
                wibble = snarf
              end
          end

          if wibble
            bufptr += wibble
          else
            # TODO : 		*(bufptr++) = fmt[i];
          end

        else
          bufptr += fmt[i] if !fmt[i-1].eql?('%')
        end

      end

      i += 1
    end

    return bufptr
  end

  def ending(i)
    (i/10 == 1) ? 'th' : ((i % 10 == 1) ? 'st' : ((i % 10 == 2) ? 'nd' : ((i % 10 == 3) ? 'rd' : 'th')))
  end

  # select a random string
  def sel(strings, num)
    strings[srand()%num]
  end

  ##
  # Code for counting down to X-Day, X-Day being Cfn 40, 3164
  #
  # After `X-Day' passed without incident, the CoSG declared that it had
  # got the year upside down --- X-Day is actually in 8661 AD rather than
  # 1998 AD.
  #
  # Thus, the True X-Day is Cfn 40, 9827.
  #
  ##
  def xday_countdown(yday, year)
    return unless $KILL_BOB
    r = (185 - yday) + (((yday < 59) && (leapp(year))) ? 1 : 0)
    while year < 9827
      # TODO : need to test if year var addition is correct
      year += 1
      r += (leapp(year) ? 366 : 365)
    end
    while year > 9827
      r-= (leapp(year) ? 366 : 365)
      year -= 1
    end
    return r
  end

  def leapp(i)
    ((DY(i) % 4) == 0) && ((DY(i) % 100) > 0 || (DY(i) % 400 ) == 0)
  end

  def DY(y)
    (y + 1166)
  end

end


# DDate

PERPETUAL DATE CONVERTER FROM GREGORIAN TO POEE CALENDAR
  SACRED DOCUMENT OF THE FROGS (old Erisian poem):
  73 Days hath
  Chaos, Discord, Confusion, Bureaucracy, and Aftermath
  
## THIS THING
This is ruby-clone of the C ddate implementation.  Adheres to original style, etc.  
Feel free to fork or req for additional features (ex:  DDate.now(), DDate.parse(), DDate.format(), etc).

[This](https://github.com/bo0ts/ddate) is exactly the same ddate version that can be found in the
util-linux 2.20 release. It is here, because util-linux doesn't
build ddate by default anymore and at least the maintainer of the
ArchLinux package seems happy to get rid of it. It is also available
from the AUR.

## Installation


## Usage

    DDate.new.to_s
    # Today is Prickle-Prickle, the 37th day of The Aftermath in the YOLD 3182
    
    DDate.new("+'Today is %{%A, the %e of %B%}, %Y. %N%nCelebrate %H'").to_s
    # Today is Prickle-Prickle, the 37th of The Aftermath, 3182.
    
    DDate.new("+\"It's %{%A, the %e of %B%}, %Y. %N%nCelebrate %H\"", 26, 9, 1995).to_s
    # It's Prickle-Prickle, the 50th of Bureaucracy, 3161.
    # Celebrate Bureflux
    
    DDate.new("+\"Today's %{%A, the %e of %B%}, %Y. %N%nCelebrate %H\"", 29, 2, 1996).to_s
    # Today's St. Tib's Day, 3162. 
    
## man page (for full options)
    
    DDATE(1)                                                   Emperor Norton User Command                                                  DDATE(1)
    
    NAME
           ddate - convert Gregorian dates to Discordian dates
    
    SYNOPSIS
           ddate [+format] [date]
    
    DESCRIPTION
           ddate prints the date in Discordian date format.
    
           If  called  with  no  arguments, ddate will get the current system date, convert this to the Discordian date format and print this on the
           standard output. Alternatively, a Gregorian date may be specified on the command line, in the form of a numerical day, month and year.
    
           If a format string is specified, the Discordian date will be printed in a format specified by the string. This mechanism works  similarly
           to the format string mechanism of date(1), only almost completely differently. The fields are:
    
           %A     Full name of the day of the week (i.e., Sweetmorn)
    
           %a     Abbreviated name of the day of the week (i.e., SM)
    
           %B     Full name of the season (i.e., Chaos)
    
           %b     Abbreviated name of the season (i.e., Chs)
    
           %d     Ordinal number of day in season (i.e., 23)
    
           %e     Cardinal number of day in season (i.e., 23rd)
    
           %H     Name of current Holyday, if any
    
           %N     Magic code to prevent rest of format from being printed unless today is a Holyday.
    
           %n     Newline
    
           %t     Tab
    
           %X     Number of days remaining until X-Day. (Not valid if the SubGenius options are not compiled in.)
    
           %{
    
           %}     Used to enclose the part of the string which is to be replaced with the words "St. Tib's Day" if the current day is St. Tib's Day.
    
           %.     Try it and see.
    
    EXAMPLES
           % ddate
           Sweetmorn, Bureaucracy 42, 3161 YOLD
    
           % ddate +'Today is %{%A, the %e of %B%}, %Y. %N%nCelebrate %H'
           Today is Sweetmorn, the 42nd of Bureaucracy, 3161.
    
           % ddate +"It's %{%A, the %e of %B%}, %Y. %N%nCelebrate %H" 26 9 1995
           It's Prickle-Prickle, the 50th of Bureaucracy, 3161.
           Celebrate Bureflux
    
           % ddate +"Today's %{%A, the %e of %B%}, %Y. %N%nCelebrate %H" 29 2 1996
           Today's St. Tib's Day, 3162.
    
    BUGS
           ddate(1) will produce undefined behavior if asked to produce the date for St. Tib's day and its format string does not  contain  the  St.
           Tib's Day delimiters %{ and %}.
    
    NOTE
           After  `X-Day'  passed without incident, the Church of the SubGenius declared that it had got the year upside down - X-Day is actually in
           8661 AD rather than 1998 AD.  Thus, the True X-Day is Cfn 40, 9827.
    
    AUTHOR
           Original program by Druel the Chaotic aka Jeremy Johnson (mpython@gnu.ai.mit.edu)
           Major rewrite by Lee H:. O:. Smith, KYTP, aka Andrew Bulhak (acb@dev.null.org)
           Gregorian B.C.E. dates fixed by Chaplain Nyan the Wiser, aka Dan Dart (ntw@dandart.co.uk)
           Five tons of flax.
    
    DISTRIBUTION POLICY
           Public domain. All rites reversed.
    
    SEE ALSO
           date(1),
           http://www.subgenius.com/
           Malaclypse the Younger, __Principia__ __Discordia__, __Or__ __How__ __I__ __Found__ __Goddess__ __And__ __What__ __I__ __Did__ __To__ __Her__ __When__ __I__ __Found__ __Her__
    
    AVAILABILITY
           The ddate command is available from https://github.com/bo0ts/ddate.
    
    ddate                                                           Bureaucracy 3161                                                        DDATE(1)

## INFO

### SEASONS

   - Chaos :: Patron Apostle Hung Mung
   - Discord :: Patron Apostle Dr. Van Van Mojo
   - Confusion :: Patron Apostle Sri Syadasti
   - Bureaucracy :: Patron Apostle Zarathud
   - The Aftermath :: Patron Apostle the Elder Malaclypse
   
### DAYS OF THE WEEK

   The DAYS OF THE WEEK are named from the five basic elements: SWEET,
   BOOM, PUNGENT, PRICKLE, and ORANGE.

   1.  Sweetmorn                       
   2.  Boomtime                        
   3.  Pungenday                       
   4.  Prickle-Prickle                 
   5.  Setting Orange
                     
### HOLIDAYS

#### Apostle Holydays

   1.  Mungday
   2.  Mojoday
   3.  Syaday
   4.  Zaraday
   5.  Maladay
   
Each occurs on the 5th day of the Season.
     
#### Seasons Holydays

   1. Chaoflux
   2. Discoflux
   3. Confuflux
   4. Bureflux
   5. Afflux
   
Each occurs on the 50th day of the Season.
   
#### Saint Tib's Day

Occurs once every four years (1 + 4 = 5) and is inserted between
the 59th and 60th days of the Season of Chaos.

### THE YEAR

    |     |    |    |    |    |     |   | ST | BT | PD | PP | SO |     |     |    |    |    |    |    |   | SM | BT | PD | PP | SO |     |
    |-----+----+----+----+----+-----+---+----+----+----+----+----+-----+-----+----+----+----+----+----+---+----+----+----+----+----+-----|
    | Jan |  1 |  2 |  3 |  4 |   5 |   |  1 |  2 |  3 |  4 |  5 | Chs | Jul |  5 |  6 |  7 |  8 |  9 |   | 40 | 41 | 42 | 43 | 44 | Cfn |
    |     |  6 |  7 |  8 |  9 |  10 |   |  6 |  7 |  8 |  9 | 10 |     |     | 10 | 11 | 12 | 13 | 14 |   | 45 | 46 | 47 | 48 | 49 |     |
    |     | 11 | 12 | 13 | 14 |  15 |   | 11 | 12 | 13 | 14 | 15 |     |     | 15 | 16 | 17 | 18 | 19 |   | 50 | 51 | 52 | 53 | 54 |     |
    |     | 16 | 17 | 18 | 19 |  20 |   | 16 | 17 | 18 | 19 | 20 |     |     | 20 | 21 | 22 | 23 | 24 |   | 55 | 56 | 57 | 58 | 59 |     |
    |     | 21 | 22 | 23 | 24 |  25 |   | 21 | 22 | 23 | 24 | 25 |     |     | 25 | 26 | 27 | 28 | 29 |   | 60 | 61 | 62 | 63 | 64 |     |
    |     | 26 | 27 | 28 | 29 |  30 |   | 26 | 27 | 28 | 29 | 30 |     |     | 30 | 31 |  1 |  2 |  3 |   | 65 | 66 | 67 | 68 | 69 |     |
    |     | 31 |  1 |  2 |  3 |   4 |   | 31 | 32 | 33 | 34 | 35 |     | Aug |  4 |  5 |  6 |  7 |  8 |   | 70 | 71 | 72 | 73 |  1 | Bcy |
    | Feb |  5 |  6 |  7 |  8 |   9 |   | 36 | 37 | 38 | 39 | 40 |     |     |  9 | 10 | 11 | 12 | 13 |   |  2 |  3 |  4 |  5 |  6 |     |
    |     | 10 | 11 | 12 | 13 |  14 |   | 41 | 42 | 43 | 44 | 45 |     |     | 14 | 15 | 16 | 17 | 18 |   |  7 |  8 |  9 | 10 | 11 |     |
    |     | 15 | 16 | 17 | 18 |  19 |   | 46 | 47 | 48 | 49 | 50 |     |     | 19 | 20 | 21 | 22 | 23 |   | 12 | 13 | 14 | 15 | 16 |     |
    |     | 20 | 21 | 22 | 23 |  24 |   | 51 | 52 | 53 | 54 | 55 |     |     | 24 | 25 | 26 | 27 | 28 |   | 17 | 18 | 19 | 20 | 21 |     |
    |     | 25 | 26 | 27 | 28 | * 1 |   | 56 | 57 | 58 | 59 | 60 |     | Sep | 29 | 30 | 31 |  1 |  2 |   | 22 | 23 | 24 | 25 | 26 |     |
    | Mar |  2 |  3 |  4 |  5 |   6 |   | 61 | 62 | 63 | 64 | 65 |     |     |  3 |  4 |  5 |  6 |  7 |   | 27 | 28 | 29 | 30 | 31 |     |
    |     |  7 |  8 |  9 | 10 |  11 |   | 66 | 67 | 68 | 69 | 70 |     |     |  8 |  9 | 10 | 11 | 12 |   | 32 | 33 | 34 | 35 | 36 |     |
    |     | 12 | 13 | 14 | 15 |  16 |   | 71 | 72 | 73 |  1 |  2 | Dsc |     | 13 | 14 | 15 | 16 | 17 |   | 37 | 38 | 39 | 40 | 41 |     |
    |     | 17 | 18 | 19 | 20 |  21 |   |  3 |  4 |  5 |  6 |  7 |     |     | 18 | 19 | 20 | 21 | 22 |   | 42 | 43 | 44 | 45 | 46 |     |
    |     | 22 | 23 | 24 | 25 |  26 |   |  8 |  9 | 10 | 11 | 12 |     |     | 23 | 24 | 25 | 26 | 27 |   | 47 | 48 | 49 | 50 | 51 |     |
    |     | 27 | 28 | 29 | 30 |  31 |   | 13 | 14 | 15 | 16 | 17 |     |     | 28 | 29 | 30 |  1 |  2 |   | 52 | 53 | 54 | 55 | 56 |     |
    | Apr |  1 |  2 |  3 |  4 |   5 |   | 18 | 19 | 20 | 21 | 22 |     | Oct |  3 |  4 |  5 |  6 |  7 |   |    | 57 | 58 | 59 | 60 | 61  |
    |     |  6 |  7 |  8 |  9 |  10 |   | 23 | 24 | 25 | 26 | 27 |     |     |  8 |  9 | 10 | 11 | 12 |   | 62 | 63 | 64 | 65 | 66 |     |
    |     | 11 | 12 | 13 | 14 |  15 |   | 28 | 29 | 30 | 31 | 32 |     |     | 13 | 14 | 15 | 16 | 17 |   | 67 | 68 | 69 | 70 | 71 |     |
    |     | 16 | 17 | 18 | 19 |  20 |   | 33 | 34 | 35 | 36 | 37 |     |     | 18 | 19 | 20 | 21 | 22 |   | 72 | 73 |  1 |  2 |  3 | Afm |
    |     | 21 | 22 | 23 | 24 |  25 |   | 38 | 39 | 40 | 41 | 42 |     |     | 23 | 24 | 25 | 26 | 27 |   |  4 |  5 |  6 |  7 |  8 |     |
    |     | 26 | 27 | 28 | 29 |  30 |   | 43 | 44 | 45 | 46 | 47 |     |     | 28 | 29 | 30 | 31 |  1 |   |  9 | 10 | 11 | 12 | 13 |     |
    | May |  1 |  2 |  3 |  4 |   5 |   | 48 | 49 | 50 | 51 | 52 |     | Nov |  2 |  3 |  4 |  5 |  6 |   | 14 | 15 | 16 | 17 | 18 |     |
    |     |  6 |  7 |  8 |  9 |  10 |   | 53 | 54 | 55 | 56 | 57 |     |     |  7 |  8 |  9 | 10 | 11 |   | 19 | 20 | 21 | 22 | 23 |     |
    |     | 11 | 12 | 13 | 14 |  15 |   | 58 | 59 | 60 | 61 | 62 |     |     | 12 | 13 | 14 | 15 | 16 |   | 24 | 25 | 26 | 27 | 28 |     |
    |     | 16 | 17 | 18 | 19 |  20 |   | 63 | 64 | 65 | 66 | 67 |     |     | 17 | 18 | 19 | 20 | 21 |   | 29 | 30 | 31 | 32 | 33 |     |
    |     | 21 | 22 | 23 | 24 |  25 |   | 68 | 69 | 70 | 71 | 72 |     |     | 22 | 23 | 24 | 25 | 26 |   | 34 | 35 | 36 | 37 | 38 |     |
    |     | 26 | 27 | 28 | 29 |  30 |   | 73 |  1 |  2 |  3 |  4 | Cfn |     | 27 | 28 | 29 | 30 |  1 |   | 39 | 40 | 41 | 42 | 43 |     |
    |     | 31 |  1 |  2 |  3 |   4 |   |  5 |  6 |  7 |  8 |  9 |     | Dec |  2 |  3 |  4 |  5 |  6 |   | 44 | 45 | 46 | 47 | 48 |     |
    | Jun |  5 |  6 |  7 |  8 |   9 |   | 10 | 11 | 12 | 13 | 14 |     |     |  7 |  8 |  9 | 10 | 11 |   | 49 | 50 | 51 | 52 | 53 |     |
    |     | 10 | 11 | 12 | 13 |  14 |   | 15 | 16 | 17 | 18 | 19 |     |     | 12 | 13 | 14 | 15 | 16 |   | 54 | 55 | 56 | 57 | 58 |     |
    |     | 15 | 16 | 17 | 18 |  19 |   | 20 | 21 | 22 | 23 | 24 |     |     | 17 | 18 | 19 | 20 | 21 |   | 59 | 60 | 61 | 62 | 63 |     |
    |     | 20 | 21 | 22 | 23 |  24 |   | 25 | 26 | 27 | 28 | 29 |     |     | 22 | 23 | 24 | 25 | 26 |   | 64 | 65 | 66 | 67 | 68 |     |
    |     | 25 | 26 | 27 | 28 |  29 |   | 30 | 31 | 32 | 33 | 34 |     |     | 27 | 28 | 29 | 30 | 31 |   | 69 | 70 | 71 | 72 | 73 |     |
    |     | 30 |  1 |  2 |  3 |   4 |   | 35 | 36 | 37 | 38 | 39 |     |     |    |    |    |    |    |   |    |    |    |    |    |     |
    
    [1970| = 3136|] [Next| St|. Tib's| | Day| in| 3138|]


## License

This project is released into the public domain via the Unlicense, which you can find in the file LICENSE.md.


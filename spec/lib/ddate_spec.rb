require "spec_helper"
require 'tty-command'
require 'time'

require_relative '../support/native_client_helpers'

RSpec.describe DDate, as: :lib do
  include NativeClientHelpers

  describe "DDate initialization" do

    # party likes it's [sic] 1994
    context "pseudo preprocessors" do

      it "set default global variables for Eris" do
        DDate.new
        expect($OLD_IMMEDIATE_FMT).to eql(true)   # default
        expect($US_FORMAT).to be_nil              # default
        expect($KILL_BOB).to eql(13013)           # default
        expect($PRAISE_BOB).to be_nil             # default
      end

      it "initialize global variables for Eris" do
        DDate.new({OLD_IMMEDIATE_FMT: true})
        expect($OLD_IMMEDIATE_FMT).to eql(true)   # set with above instantiation
        DDate.new({US_FORMAT: true})
        expect($US_FORMAT).to eql(true)           # set with above instantiation
        DDate.new({KILL_BOB: 13013})
        expect($KILL_BOB).to eql(13013)           # set with above instantiation
        DDate.new({PRAISE_BOB: 13013})
        expect($PRAISE_BOB).to eql(13013)         # set with above instantiation

        DDate.new({OLD_IMMEDIATE_FMT: true, US_FORMAT: true, KILL_BOB: 13013, PRAISE_BOB: 13013})
        expect($OLD_IMMEDIATE_FMT).to eql(true)   # set with above instantiation
        expect($US_FORMAT).to eql(true)           # set with above instantiation
        expect($KILL_BOB).to eql(13013)           # set with above instantiation
        expect($PRAISE_BOB).to eql(13013)         # set with above instantiation

        DDate.new({OLD_IMMEDIATE_FMT: false, US_FORMAT: false, KILL_BOB: false, PRAISE_BOB: false})
        expect($OLD_IMMEDIATE_FMT).to be_nil      # set with above instantiation
        expect($US_FORMAT).to be_nil              # set with above instantiation
        expect($KILL_BOB).to be_nil               # set with above instantiation
        expect($PRAISE_BOB).to be_nil             # set with above instantiation
      end

      it "set global variables for Eris" do
        DDate.new.send(:handle_define_directives, {OLD_IMMEDIATE_FMT: true})
        expect($OLD_IMMEDIATE_FMT).to eql(true)   # set with above instantiation
        DDate.new.send(:handle_define_directives, {OLD_IMMEDIATE_FMT: false})
        expect($OLD_IMMEDIATE_FMT).to be_nil      # set with above instantiation
        DDate.new.send(:handle_define_directives, {OLD_IMMEDIATE_FMT: nil})
        expect($OLD_IMMEDIATE_FMT).to eql(true)   # set with above instantiation
        DDate.new.send(:handle_define_directives, {OLD_IMMEDIATE_FMT: 'eris'})
        expect($OLD_IMMEDIATE_FMT).to be_nil      # set with above instantiation

        DDate.new.send(:handle_define_directives, {US_FORMAT: true})
        expect($US_FORMAT).to eql(true)   # set with above instantiation
        DDate.new.send(:handle_define_directives, {US_FORMAT: false})
        expect($US_FORMAT).to be_nil      # set with above instantiation
        DDate.new.send(:handle_define_directives, {US_FORMAT: nil})
        expect($US_FORMAT).to be_nil      # set with above instantiation
        DDate.new.send(:handle_define_directives, {US_FORMAT: 'eris'})
        expect($US_FORMAT).to be_nil      # set with above instantiation

        DDate.new.send(:handle_define_directives, {KILL_BOB: 13013})
        expect($KILL_BOB).to eql(13013)   # set with above instantiation
        DDate.new.send(:handle_define_directives, {KILL_BOB: true})
        expect($KILL_BOB).to be_nil       # set with above instantiation
        DDate.new.send(:handle_define_directives, {KILL_BOB: false})
        expect($KILL_BOB).to be_nil       # set with above instantiation
        DDate.new.send(:handle_define_directives, {KILL_BOB: nil})
        expect($KILL_BOB).to eql(13013)   # set with above instantiation
        DDate.new.send(:handle_define_directives, {KILL_BOB: 'eris'})
        expect($KILL_BOB).to be_nil       # set with above instantiation

        DDate.new.send(:handle_define_directives, {PRAISE_BOB: 13013})
        expect($PRAISE_BOB).to eql(13013)   # set with above instantiation
        DDate.new.send(:handle_define_directives, {PRAISE_BOB: true})
        expect($PRAISE_BOB).to be_nil       # set with above instantiation
        DDate.new.send(:handle_define_directives, {PRAISE_BOB: false})
        expect($PRAISE_BOB).to be_nil       # set with above instantiation
        DDate.new.send(:handle_define_directives, {PRAISE_BOB: nil})
        expect($PRAISE_BOB).to be_nil       # set with above instantiation
        DDate.new.send(:handle_define_directives, {PRAISE_BOB: 'eris'})
        expect($PRAISE_BOB).to be_nil       # set with above instantiation


        DDate.new.send(:handle_define_directives, {OLD_IMMEDIATE_FMT: true, US_FORMAT: true, KILL_BOB: 13013, PRAISE_BOB: 13013})
        expect($OLD_IMMEDIATE_FMT).to eql(true)   # set with above instantiation
        expect($US_FORMAT).to eql(true)           # set with above instantiation
        expect($KILL_BOB).to eql(13013)           # set with above instantiation
        expect($PRAISE_BOB).to eql(13013)         # set with above instantiation

        DDate.new.send(:handle_define_directives, {OLD_IMMEDIATE_FMT: false, US_FORMAT: false, KILL_BOB: false, PRAISE_BOB: false})
        expect($OLD_IMMEDIATE_FMT).to be_nil      # set with above instantiation
        expect($US_FORMAT).to be_nil              # set with above instantiation
        expect($KILL_BOB).to be_nil               # set with above instantiation
        expect($PRAISE_BOB).to be_nil             # set with above instantiation
      end

    end # end context "pseudo preprocessors"

    context "initialize based on preprocessors" do

      context "@EXCL" do

        it "initialize @EXCL" do
          ddate = DDate.new
          excl = ddate.instance_variable_get(:@EXCL)
          expect(excl.length).to be(17)
          expect(excl).to_not include("Slack!", "Praise \"Bob\"!", "Or kill me.")
        end

        it "initialize @EXCL when PRAISE_BOB" do
          ddate = DDate.new
          ddate.send(:handle_define_directives, {PRAISE_BOB: 13013})
          ddate.send(:initialize_excl)
          excl = ddate.instance_variable_get(:@EXCL)
          expect(excl.length).to be(20)
          expect(excl).to include("Slack!", "Praise \"Bob\"!", "Or kill me.")
        end

      end # end context EXCL

      context "@DEFAULT_IMMEDIATE_FMT" do

        it "initialize @DEFAULT_IMMEDIATE_FMT" do
          ddate = DDate.new
          default_immediate_fmt = ddate.instance_variable_get(:@DEFAULT_IMMEDIATE_FMT)
          expect(default_immediate_fmt).to eql(DDate.class_variable_get(:@@OLD_IMMEDIATE_FMT))
        end

        it "initialize @DEFAULT_IMMEDIATE_FMT when not OLD_IMMEDIATE_FMT" do
          ddate = DDate.new
          ddate.send(:handle_define_directives, {OLD_IMMEDIATE_FMT: false})
          ddate.send(:initialize_default_immediate_fmt)
          default_immediate_fmt = ddate.instance_variable_get(:@DEFAULT_IMMEDIATE_FMT)
          expect(default_immediate_fmt).to eql(DDate.class_variable_get(:@@DEFAULT_FMT))
        end

      end # end context DEFAULT_IMMEDIATE_FMT

    end # end context preprocessors

  end # end describe "ddate initialization"


  context "xday" do

    it "count down xday" do
      ddate = DDate.new
      ddate.send(:handle_define_directives, {KILL_BOB: 13013})
      xday_cntd = ddate.send(:xday_countdown, 322, 3182)
      expect(xday_cntd).to be(2426900)

      xday_cntd = ddate.send(:xday_countdown, -1, 3182)
      expect(xday_cntd).to be(2427224)
    end

  end # end context


  context "native client comparison" do

    # test if native ddate is installed, set ddate path and command running as context scope
    before(:all) do
      @cmd = TTY::Command.new(printer: :progress)
      native_client_fail_message() if @cmd.run!('which ddate').failure?

      # https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/which.1.html
      # https://linux.die.net/man/1/which
      which_ddate_result = @cmd.run('which -a ddate')
      @native_ddate_client_path = get_native_ddate_on_path(which_ddate_result.out)
      native_client_fail_message() if !@native_ddate_client_path
    end

    it "DDate default constructors match" do
      result = @cmd.run(@native_ddate_client_path)
      expect(result.out).to eql(DDate.new.to_s)
    end

    # (Date.new(1970, 01, 01)..Date.new(1970, 01, 03)).each do |date|
    (Date.new(1970, 01, 01)..Date.today).each do |date|
      it "default constructors for #{date} match" do
        result = @cmd.run(@native_ddate_client_path.clone.concat(' ').concat(date.day.to_s).concat(' ').concat(date.month.to_s).concat(' ').concat(date.year.to_s))
        expect(result.out).to eql(DDate.new(date.day, date.month, date.year).to_s)
      end
    end

  end # end context "native client comparison"

end

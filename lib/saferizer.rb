#encoding: utf-8

require 'fakefs/safe'

module Saferizer

  def Saferizer.safe_eval(filename, timeout=15)
    require 'timeout'

    # pull code out of file
    code = open(filename, 'r') { |f| f.read }

    # remove function def if exists
    code = code.start_with?('def') ? code.lines.to_a[1..-2].join  : code

    # setup "sandbox" mode
    FakeFS.activate!
    cmd = <<-RUBY
      $SAFE = 3
      Timeout.timeout(#{timeout}) do
        #{code}
      end
    RUBY

    # run code in "sandbox" mode and retrieve result
    # deactivate FakeFS
    begin
      result = Thread.new { eval cmd, TOPLEVEL_BINDING }.value
    rescue SecurityError => se
      puts "SecurityError: #{se}"
    rescue Exception => e
      puts "Exception: #{e}"
    ensure
      FakeFS.deactivate!
    end

    return result
  end
end

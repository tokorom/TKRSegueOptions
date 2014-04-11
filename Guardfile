# Guardfile
# vim:filetype=ruby

require 'guard/plugin'

COMMAND = 'xcodebuild test'
SCHEME = 'Tests'
SDK = 'iphonesimulator'
SUFFIX = '2>&1 | xcpretty -c'

module ::Guard
  class InlineGuard < ::Guard::Plugin

    def run_test(need_clean)
      clean = need_clean ? 'clean' : ''
      command = "#{COMMAND} #{clean} -scheme #{SCHEME} -sdk #{SDK} #{SUFFIX}"
      puts command
      system(command)
    end

    def run_all
      run_test(true)
    end

    def run_on_changes(paths)
      need_clean = false
      paths.each {|path|
        if path =~ /\.pbxproj/
          need_clean = true
          break
        end
      }
      run_test(need_clean)
    end
  end
end

guard :inline_guard do
  watch /.*\.[mh]$/
end

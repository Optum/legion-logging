module Legion
  module Logging
    module Builder
      def log_format(include_pid: false, **options) # rubocop:disable Metrics/AbcSize
        log.formatter = proc do |severity, datetime, _progname, msg|
          options[:lex_name] = options.key?(:lex) ? "[#{options[:lex]}]" : nil
          unless options[:lex_name].nil?
            data = caller_locations[4].to_s.split('/').last(2)
            runner_trace = {
              type: data[0],
              file: data[1].split('.')[0],
              function: data[1].split('`')[1].delete_suffix('\''),
              line_number: data[1].split(':')[1]
            }
          end
          string = "[#{datetime}]"
          string.concat("[#{::Process.pid}]") if include_pid
          string.concat(options[:lex_name]) unless options[:lex_name].nil?
          if runner_trace.is_a?(Hash) && (options[:extended] || severity == 'debug')
            string.concat("[#{runner_trace[:type]}:#{runner_trace[:file]}:#{runner_trace[:function]}:#{runner_trace[:line_number]}]") # rubocop:disable Layout/LineLength
          end
          string.concat(" #{severity} #{msg}\n")
          string
        end
      end

      def output(**options)
        @log = ::Logger.new($stdout) if options[:log_file].nil?
        @log = ::Logger.new(options[:log_file]) unless options[:log_file].nil?
      end

      def log
        @log ||= set_log
      end

      def set_log(logfile: nil, **)
        @log = logfile.nil? ? ::Logger.new($stdout) : ::Logger.new(logfile)
      end

      def level
        log.level
      end

      def log_level(level = 'info')
        log.level = case level
                    when 'trace', 'debug'
                      ::Logger::DEBUG
                    when 'info'
                      ::Logger::INFO
                    when 'warn'
                      ::Logger::WARN
                    when 'error'
                      ::Logger::ERROR
                    when 'fatal'
                      ::Logger::FATAL
                    when nil
                      42
                    else
                      if level.is_a? Integer
                        level
                      else
                        0
                      end
                    end
        @log = log
      end
    end
  end
end

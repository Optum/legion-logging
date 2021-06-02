require 'legion/logging/methods'
require 'legion/logging/builder'

module Legion
  module Logging
    class Logger
      attr_accessor :log, :color, :level, :lex, :log_file, :trace_enabled, :extended

      include Legion::Logging::Methods
      include Legion::Logging::Builder

      def initialize(level: 'info', log_file: nil, lex: nil, trace: false, extended: false, trace_size: 4, **opts) # rubocop:disable Metrics/ParameterLists
        set_log(logfile: log_file)
        log_level(level)
        log_format(lex: lex, extended: extended, **opts)
        @color = opts[:color]
        @color = true if opts[:color].nil? && log_file.nil?
        @trace_enabled = trace
        @trace_size = trace_size
        @extended = extended
      end
    end
  end
end

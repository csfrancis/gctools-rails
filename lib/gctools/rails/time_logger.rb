require 'active_support'

module Gctools
  module Rails
    module TimeLogger
      extend ActiveSupport::Concern

      def append_info_to_payload(payload)
        super
        payload[:gc_time] = Timer.value
      end

      module ClassMethods
        def log_process_action(payload)
          messages, gc_time = super, payload[:gc_time]
          messages << ("GC=%.1fms" % gc_time) if gc_time
          messages
        end
      end
    end
  end
end

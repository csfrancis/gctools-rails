module Gctools
  module Rails
    module Timer
      def self.value
        Thread.current[:gctools_time] ||= 0
      end

      def self.add(gc_time_ms)
        Thread.current[:gctools_time] = value + gc_time_ms
      end

      def self.clear
        Thread.current[:gctools_time] = 0
      end
    end
  end
end

GCProf.after_gc_hook = Proc.new { |info, start, end_mark, end_sweep|
  Gctools::Rails::Timer.add((end_mark[:time] - start[:time]) * 1000) if end_sweep
}

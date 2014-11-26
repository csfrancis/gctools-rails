require 'minitest/autorun'
require 'gctools/rails'

class FakeBaseController
  def append_info_to_payload(payload); payload;  end
  def self.log_process_action(payload); ''; end
end

class FakeController < FakeBaseController
  include Gctools::Rails::TimeLogger
end

class TestRails < MiniTest::Test
  def setup
    Gctools::Rails::Timer.clear
  end

  def test_timer_is_thread_local
    t = Gctools::Rails::Timer

    assert_equal 0, t.value
    t.add(100)
    assert_equal 100, t.value

    th = Thread.new do
      assert_equal 0, t.value
    end
  ensure
    th.join if th
  end

  def test_time_logger_updates_payload
    c = FakeController.new

    Gctools::Rails::Timer.add(100)

    p = {}
    c.append_info_to_payload(p)
    assert_equal 100, p[:gc_time]

    assert c.class.log_process_action(p) =~ /GC=/
  end

  def test_middleware_clears_timer
    c = Class.new do
      def call(env)
        v = Gctools::Rails::Timer.value
        Gctools::Rails::Timer.add(100)
        v
      end
    end.new

    Gctools::Rails::Timer.add(100)
    assert_equal 0, Gctools::Rails::Middleware.new(c).call({})
    assert_equal 0, Gctools::Rails::Timer.value
  end
end

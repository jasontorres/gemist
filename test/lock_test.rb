require File.expand_path('../test_helper', __FILE__)

class LockTest < Test::Unit::TestCase
  setup do
    Dir.chdir fx('lock/')
    use_gemfile nil
  end

  teardown do
    Dir.chdir fx
  end

  test "Gemfile.lock" do
    Gem.expects(:activate).with('sinatra', '1.2.6').returns(true)

    Gemist.setup
  end
end

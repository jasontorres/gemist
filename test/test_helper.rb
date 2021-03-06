require 'test/unit'
require 'contest'
require 'mocha'

require File.expand_path('../../lib/gemist', __FILE__)

class Test::Unit::TestCase
  setup do
    $_stderr = $stderr
    $stderr  = StringIO.new
  end

  teardown do
    ENV.delete 'GEMFILE'
    $stderr = $_stderr
  end

  def err
    $stderr.string
  end

  def fixture(path)
    fx path
  end

  def use_gemfile(what)
    ENV['GEMFILE'] = what.nil? ? nil : fixture(what)
    Gemist.class_variable_set :@@gemfile, nil
  end
end

def fx(path='')
  File.expand_path("../fixtures/#{path}", __FILE__)
end


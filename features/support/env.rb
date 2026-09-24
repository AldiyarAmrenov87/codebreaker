$LOAD_PATH.unshift(File.expand_path('../../lib', __dir__))

require 'codebreaker'
require 'rspec/expectations'
require 'stringio'

module AppContext
  def fake_output
    @fake_output ||= StringIO.new
  end

  def app
    @app ||= Codebreaker::Game.new(fake_output)
  end
end

World(AppContext)
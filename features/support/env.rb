$LOAD_PATH.unshift(File.expand_path('../../lib', __dir__))

require 'codebreaker'
require 'rspec/expectations'
require 'stringio'
require 'cucumber/rspec/doubles'

module AppContext
  def fake_input
    @fake_input ||= StringIO.new
  end

  def fake_output
    @fake_output ||= StringIO.new
  end

  def app # в рамках тестирования экземпляр игры будет инициализирован фекйовыми вводом и выводом
    @app ||= Codebreaker::Game.new(input: fake_input, output: fake_output)
  end
end

World(AppContext)
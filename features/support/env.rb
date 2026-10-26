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

  def attempts
    @attempts ||= 10
  end
  attr_writer :attempts

  # Вместо Game мы теперь собираем и отдаем CLI (наш адаптер)
  def cli
    @cli ||= Codebreaker::CLI.new(
      input: fake_input, 
      output: fake_output, 
      attempts: attempts
    )
  end
end

World(AppContext)
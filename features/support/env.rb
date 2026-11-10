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

  def configurator
    @configurator ||= Codebreaker::Configurator.new
  end

  def create_code_generator_for(secret_codes_string)
    secret_code_instances = secret_codes_string.split(',').map do |secret|
      Codebreaker::SecretCode.new(secret.strip)
    end

    codes_enumerator = secret_code_instances.each 
    return -> { codes_enumerator.next }
  end
  
  def cli
    @cli ||= Codebreaker::CLI.new(
      input: fake_input, 
      output: fake_output,
      configurator: configurator
    )
  end

  def fresh_output
    start_pos = @last_checked_position || 0
    fake_output.string[start_pos..-1] || ""
  end

  def consume_output_up_to!(text)
    current_fresh = fresh_output
    index = current_fresh.index(text)
    
    if index
      @last_checked_position = (@last_checked_position || 0) + index + text.length
    end
  end
end

World(AppContext)
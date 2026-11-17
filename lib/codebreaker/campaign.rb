module Codebreaker
  class Campaign
    def initialize
      @matches = []
    end

    def add(match)
      @matches << match
    end

    def size       = @matches.size
    def total      = @matches.size
    def won_count  = @matches.count(&:won?)
    def lost_count = @matches.count(&:lost?)
  end
end
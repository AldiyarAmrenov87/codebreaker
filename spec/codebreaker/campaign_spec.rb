RSpec.describe Codebreaker::Campaign do
  subject(:campaign) { described_class.new }

  let(:won_match)  { instance_double('Match', finished?: true, won?: true,  lost?: false) }
  let(:lost_match) { instance_double('Match', finished?: true, won?: false, lost?: true) }
  let(:unfinished) { instance_double('Match', finished?: false) }

  it 'starts empty' do
    expect(campaign.size).to eq(0)
  end

  it 'adds finished matches' do
    campaign.add(won_match)
    expect(campaign.size).to eq(1)
  end

  it 'counts won and lost' do
    campaign.add(won_match)
    campaign.add(lost_match)
    campaign.add(won_match)
    expect(campaign.won_count).to eq(2)
    expect(campaign.lost_count).to eq(1)
  end
end

require 'journey'

describe 'Journey' do

  let(:entry_double) {double "Vic"}
  let(:exit_double) {double "Camden"}

  before :each do
    @journey = Journey.new(entry_double)
  end
it 'has an entry station on creation' do
  expect(@journey.entry).to eq entry_double
end

it 'exit station is nil when created' do
  expect(@journey.exit).to eq nil
end

it 'sets exit station when tapping out' do
  @journey.finish(exit_double) # this sets the attribute
  expect(@journey.exit).to eq exit_double  # this checks the attribute
end

it "is in a journey on creation" do
  expect(@journey.in_journey?).to eq true
end

it "is not in a journey after finishing" do
  @journey.finish(exit_double)
  expect(@journey.in_journey?).to eq false
end

it 'returns the minimum fare on a completed journey' do
  @journey.finish(exit_double)
  expect(@journey.fare).to eq Journey::FARE
end

it "returns the penalty fare when fare is called and has not touched out" do
  expect(@journey.fare).to eq Journey::PENALTY
end

it "The penalty fare is 6" do
  expect(Journey::PENALTY).to eq 6
end
end
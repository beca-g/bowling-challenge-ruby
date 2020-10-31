require 'bowling_score'

describe BowlingScore do
  let (:subject) { described_class.new }

  context 'without rolling any strikes or spares' do
    it 'returns the total score of all rolls' do
      20.times {subject.roll(4)}
      expect(subject.total_score).to eq 80
    end

    it 'returns the total score for 10 gutter rolls' do
      20.times {subject.roll(0)}
      expect(subject.total_score).to eq 0
    end
  end

  context 'calculates correct score with strikes' do
    it 'returns the total score of all rolls with one strike' do
      subject.roll(10)
      18.times {subject.roll(5)}
      expect(subject.total_score).to eq 110
    end

    it 'returns the total score with two consecutive strikes' do
      subject.roll(10)
      subject.roll(10)
      17.times {subject.roll(5)}
      expect(subject.total_score).to eq 125
    end
  end
end
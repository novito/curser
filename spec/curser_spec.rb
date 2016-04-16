require './lib/curser'

describe Curser do
  describe '#random' do
    let(:cursings) { ['fuck', 'dang'] }

    before do
      stub_const("#{described_class}::ALL_CURSINGS", cursings)
    end

    let(:subject) { described_class.new }

    it 'returns any of the available cursings' do
      expect(cursings).to include(subject.random)
    end
  end

  describe '#english' do
    let(:english_cursings) { ['fuck', 'dang'] }
    let(:catalan_cursings) { ['la mare que va parir', 'collons!!!!'] }

    before do
      stub_const("#{described_class}::ENGLISH_CURSINGS", english_cursings)
      stub_const("#{described_class}::CATALAN_CURSINGS", catalan_cursings)
    end

    let(:english_cursing) { described_class.new.english }

    it 'returns any of the available English cursings' do
      expect(english_cursings).to include(english_cursing)
    end

    it 'does NOT return any of the Catalan cursings' do
      expect(english_cursings).to_not include(catalan_cursings)
    end
  end

  describe '#curse_to' do
    let(:english_cursings_for_target) { ['fucker', 'dumbfuck', 'asshooooole'] }
    let(:catalan_cursings_for_target) { ['tanoca', 'imbecil'] }
    let(:curse_to_target) do
      described_class.new.curse_to(target: target, language: language)
    end

    before do
      stub_const("#{described_class}::ENGLISH_CURSINGS_FOR_TARGET", english_cursings_for_target)
      stub_const("#{described_class}::CATALAN_CURSINGS_FOR_TARGET", catalan_cursings_for_target)
    end

    context 'when wanting to insult in Catalan' do
      let(:language) { :catalan }
      let(:target) { 'Aznar' }

      it 'curses to a given target in Catalan' do
        potential_cursings = catalan_cursings_for_target.map do |cc|
          "En/la #{target} es un/a #{cc} i VISCA LA TERRA"
        end

        expect(potential_cursings).to include(curse_to_target)
      end

      it "adds 'i VISCA LA TERRA' at the very end" do
        expect(curse_to_target.end_with?('i VISCA LA TERRA')).to eq(true)
      end
    end

    context 'when wanting to insult in English' do
      let(:language) { :english }
      let(:target) { 'Trump' }

      it 'curses to a given target in Catalan' do
        potential_cursings = english_cursings_for_target.map do |cc|
          "#{target} is a/an #{cc}"
        end

        expect(potential_cursings).to include(curse_to_target)
      end
    end
  end
end

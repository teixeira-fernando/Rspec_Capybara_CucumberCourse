
class Character
    def initialize(strenght: 1, die: Die.new, logger: Logger.new)
        @strenght = strenght
        @die = die
        @logger = logger
    end

    def climb(difficulty: 10)
        roll = die.roll + strenght
        logger.log("Climbing check. Difficulty: #{difficulty}. Roll: #{roll}")
        roll >= difficulty
    end

    private

    attr_reader :die, :strenght, :logger
end    

describe Character do
    describe 'climbing check skill' do
        let(:die) {double}
        let(:logger) {double("Logger", log: nil)}
        let(:character) {Character.new(strenght: 5, die: die, logger: logger)}

        it 'climbs successfully when roll + strenght is more than difficulty' do
            allow(die).to receive(:roll) { 10 }        
            expect(character.climb(difficulty: 15)).to be_truthy
        end

        it 'fails climbing check when roll + strenght is less than difficulty' do
            allow(die).to receive(:roll) { 5 }
            expect(character.climb(difficulty: 15)).to be_falsy
        end

        it 'commands logger to log climb skill check' do
            allow(die).to receive(:roll) {7}
            expect(logger).to receive(:log).with("Climbing check. Difficulty: 10. Roll: 12")
            character.climb(difficulty: 10)
        end
    end
end
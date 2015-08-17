describe Hastings::Dsl do
  describe "#call" do
    let(:block) { proc { self.class.name } }

    it "evaluates the given block on itself" do
      expect(described_class.call(&block)).to eq("Hastings::Dsl")
    end
  end
end

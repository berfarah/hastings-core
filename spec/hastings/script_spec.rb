describe Hastings do
  describe ".script" do
    it "extends Hastings with a method shorthand for adding scripts" do
      expect(Hastings::Scripts).to receive(:add)
      Hastings.script {}
    end
  end
end

describe Hastings::Scripts do
  let(:dummy) do
    proc do
      name "Hello"
      run { "World" }
    end
  end

  describe ".scripts" do
    it "defaults to an empty array" do
      expect(subject.scripts).to eq([])
    end
  end

  describe ".add" do
    it "adds the script to the scripts array" do
      expect(subject.add(&dummy))
      expect(subject.scripts.length).to be 1
    end
  end

  describe ".meta" do
    it "returns an array of Meta" do
      expect(subject.meta).to all(be_a Hastings::Dsl::Meta)
    end

    it "conveys Meta information" do
      first = subject.meta.first
      expect(first.name).to eq "Hello"
      expect(first.run.call).to eq "World"
      expect(first.source).to eq __FILE__
    end
  end

  describe ".run" do
    it "returns a boolean based on whether they the return value" do
      expect(subject.run).to be true
    end

    it "runs all blocks" do
      expect(subject.scripts.first).to receive(:run)
      subject.run
    end
  end
end

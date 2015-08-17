describe Hastings::Dsl::Shell do
  subject { Class.new { extend Hastings::Dsl::Shell } }
  before  { allow(Hastings::Shell).to receive(:run) { |arg| arg } }
  let(:cmd) {}

  describe "#shell" do
    subject { super().shell cmd }

    context "given an array" do
      let(:cmd) { %w(echo true) }
      it "should join the array" do
        expect(subject).to eq("echo true")
      end
    end

    context "given a string" do
      let(:cmd) { "echo true" }
      it "should pass on the string" do
        expect(subject).to eq("echo true")
      end
    end

    context "given nil" do
      it "should give an empty string" do
        expect(subject).to eq("")
      end
    end
  end

  describe "#safe_shell" do
    it "runs Hastings::Shell without raising errors" do
      expect(Hastings::Shell).to receive(:run).with("", raise_error: false)
      subject.safe_shell cmd
    end
  end
end

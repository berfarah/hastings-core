describe Hastings::Dsl::VariableScope do
  subject { Class.new { include Hastings::Dsl::VariableScope }.new }

  describe "#var" do
    subject { super().var }
    it { is_expected.to be_a OpenStruct }

    context "when called with a method" do
      it "is expected to act like a variable" do
        str = "Nancy"
        subject.person = str
        expect(subject.person).to be str
      end
    end
  end
end

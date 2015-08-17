describe Hastings::DateTimeRange do
  { dates: Date.today.freeze, times: Time.now.freeze }.each do |name, object|
    context "with #{name}" do
      subject { described_class.new start, ended }
      let(:start) { object - 5 }
      let(:ended)   { object + 5 }

      describe "#start" do
        subject { super().start }
        it { is_expected.to eq object - 5 }
      end

      describe "#end" do
        subject { super().end }
        it { is_expected.to eq object + 5 }
      end

      describe "#span" do
        subject { super().span }
        it { is_expected.to eq 10 }
      end

      describe "#include?" do
        context "when date is in range" do
          subject { super().include? object }
          it { is_expected.to be true }
        end

        context "when date isn't in range" do
          subject { super().include? object + 15 }
          it { is_expected.to be false }
        end
      end
    end
  end
end

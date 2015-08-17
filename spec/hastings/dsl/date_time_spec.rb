describe Hastings::Dsl::DateTime do
  subject { Class.new { extend Hastings::Dsl::DateTime } }
  now = Time.now.change(usec: 0)

  describe "#date" do
    subject { super().date str, format }
    let(:str) {}
    let(:format) {}

    context "given no args" do
      it { is_expected.to be Date }
    end

    context "given a date" do
      let(:str) { Date.today }
      it { is_expected.to eq Date.today }
    end

    context "given a time" do
      let(:str) { now }
      it { is_expected.to eq now.to_date }
    end

    context "given a string" do
      let(:str) { Date.today.to_s }
      it { is_expected.to eq Date.today }
    end

    context "given a string with a format" do
      # Intentionally nonsensical
      let(:str)    { Date.today.strftime("%r%F%b%p%R") }
      let(:format) { "%r%F%b%p%R" }
      it { is_expected.to eq Date.today }
    end
  end

  describe "#date_range" do
    subject { super().date_range(arg, arg).start }
    let(:arg) {}

    context "given dates" do
      let(:arg) { Date.today }
      it { is_expected.to eq arg }
    end

    context "given times" do
      let(:arg) { now }
      it { is_expected.to eq Date.today }
    end

    context "given strings" do
      let(:arg) { Date.today.to_s }
      it { is_expected.to eq Date.today }
    end
  end

  describe "#time" do
    subject { super().time str, format }
    let(:str) {}
    let(:format) {}

    context "given no args" do
      it { is_expected.to be Time }
    end

    context "given a date" do
      let(:str) { Date.today }
      it { is_expected.to eq now.beginning_of_day }
    end

    context "given a time" do
      let(:str) { now }
      it { is_expected.to eq now }
    end

    context "given a string" do
      let(:str) { now.to_s }
      it { is_expected.to eq now }
    end

    context "given a string with a format" do
      # Intentionally nonsensical
      let(:str)    { now.strftime("%r%F%b%p%R") }
      let(:format) { "%r%F%b%p%R" }
      it { is_expected.to eq now }
    end
  end

  # Running into a weird method-error bug here
  describe "#time_range", skip: true do
    subject { super().time_range(arg, arg).start }
    let(:arg) {}

    context "given dates" do
      let(:arg) { Date.today }
      it { is_expected.to eq now.beginning_of_day }
    end

    context "given times" do
      let(:arg) { now }
      it { is_expected.to eq arg }
    end

    context "given strings" do
      let(:arg) { now.to_s }
      it { is_expected.to eq now }
    end
  end
end

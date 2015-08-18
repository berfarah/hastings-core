describe Hastings::Environment do
  subject { Class.new { extend Hastings::Environment } }

  context "#pwd" do
    subject { super().pwd }
    it { is_expected.to eq Dir.pwd }
  end

  context "#root" do
    subject { super().root }
    it { is_expected.to eq "/var/tmp/hastings" }
  end
end

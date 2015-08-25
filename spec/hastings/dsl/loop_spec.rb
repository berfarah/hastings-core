describe Hastings::Dsl::Loop do
  subject { Class.new.extend(Hastings::Dsl::Loop) }

  it { is_expected.to respond_to :loop }
  it "delegates to Hastings::Loop" do
    expect_any_instance_of(Hastings::Loop).to receive(:each)
    subject.loop(%w(one two three))
  end
end

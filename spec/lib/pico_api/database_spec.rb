# frozen_string_literal: true

RSpec.describe PicoApi::Database do
  subject { described_class }

  let(:configuration) { double(:configuration, db_config: db_config) }
  let(:db_config) do
    {
      default: {
        adapter: "memory",
        connection_string: "memory://test.db",
        options: {
          encoding: 'utf8'
        }
      },
      legacy: {
        adapter: "memory",
        connection_string: "memory://legacy.db",
        options: {
          encoding: 'unicode'
        }
      }
    }
  end

  before do
    allow(PicoApi).to receive(:configuration) { configuration }
    subject.setup!
  end

  it "builds a correct configuration container" do
    expect(subject.container).to be_a(ROM::Container)
  end

  it "includes the default gateway" do
    expect(subject.container.gateways[:default]).to be_present
  end

   it "includes the legacy gateway" do
    expect(subject.container.gateways[:legacy]).to be_present
  end
end

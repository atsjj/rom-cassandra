# encoding: utf-8

describe ROM::Cassandra::Session do

  let(:session) { described_class.new(uri) }
  let(:uri)     { { hosts: ["127.0.0.1"], port: 9042 } }
  let(:query)   { double to_s: "SELECT * FROM auth.users;" }

  describe ".new" do
    subject { session }
    let(:uri) { { hosts: ["127.0.0.1"], port: 1000 } }

    it "fails with wrong uri" do
      expect { session }.to raise_error StandardError
    end
  end

  describe "#call" do
    subject { session.call(query) }

    it "returns the result of running query" do
      expect(subject).to eql [
        { "id" => 1, "name" => "joe" },
        { "id" => 2, "name" => "jane" }
      ]
    end
  end # describe #call

end # describe ROM::Cassandra::Session

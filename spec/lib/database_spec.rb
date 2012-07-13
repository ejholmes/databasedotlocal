require "spec_helper"

describe Databasedotlocal::Database do
  after do
    Databasedotlocal.clean!
  end

  let(:attrs) { {"Id" => "1", "Name" => "foobar"} }

  subject { described_class.storage }

  describe "#insert" do
    before do
      described_class.insert("Account", attrs)
    end

    context "with valid data" do
      its(["Account"]) { should have(1).items }
      it { should eq "Account" => [attrs] }
    end

    context "when inserting a duplicate record" do
      it "raises an error" do
        expect {
          described_class.insert("Account", attrs)
        }.to raise_error
      end
    end
  end

  describe "#update" do
    context "with valid data" do
      before do
        described_class.insert("Account", attrs)
        described_class.update("Account", attrs.merge("Name" => "foo"))
      end

      its(["Account"]) { should have(1).items }

      describe "the updated record" do
        subject { described_class.storage["Account"].first }

        its(["Name"]) { should eq "foo" }
      end
    end

    context "with invalid data" do

      it "raises an error" do
        expect {
          described_class.update("Account", attrs.merge("Name" => "foo"))
        }.to raise_error
      end

    end
  end

  describe "#upsert" do
    context "when the record exists" do
      before do
        described_class.insert("Account", attrs)
        described_class.upsert("Account", attrs.merge("Name" => "foo"))
      end

      its(["Account"]) { should have(1).items }

      describe "the updated record" do
        subject { described_class.storage["Account"].first }

        its(["Name"]) { should eq "foo" }
      end
    end

    context "when the record does not exist" do
      before do
        described_class.upsert("Account", attrs.merge("Name" => "foo"))
      end

      its(["Account"]) { should have(1).items }

      describe "the inserted record" do
        subject { described_class.storage["Account"].first }

        its(["Name"]) { should eq "foo" }
      end
    end
  end

  describe "#delete" do
    context "when the record exists" do
      before do
        described_class.insert("Account", attrs)
        described_class.delete("Account", attrs)
      end

      its(["Account"]) { should have(0).items }
    end

    context "when the record does not exist" do
      it "raises an error" do
        expect {
          described_class.delete("Account", attrs)
        }.to raise_error
      end
    end
  end
end

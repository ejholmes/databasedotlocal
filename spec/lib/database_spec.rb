require "spec_helper"

describe Databasedotlocal::Database do
  after do
    Databasedotlocal.clean!
  end

  it "does something" do
    described_class.insert("Account", {"Id" => "1", "Name" => "hello"})
    puts described_class.storage
    described_class.update("Account", {"Id" => "1", "Name" => "world"})
    puts described_class.storage
    described_class.delete("Account", {"Id" => "1", "Name" => "world"})
    puts described_class.storage
  end

  it "does something else" do
    puts described_class.storage
  end
  
end

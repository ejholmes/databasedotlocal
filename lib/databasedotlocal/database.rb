module Databasedotlocal
  class Database < Hash

    class << self

      def storage
        @storage ||= new
      end

      # Insert a record into the database
      def insert(sobject, hash)
        storage.table(sobject).insert(hash)
      end

      # Update a record
      def update(sobject, hash)
        storage.table(sobject).update(hash)
      end

      # Upsert a record
      def upsert(sobject, hash)
        storage.table(sobject).upsert(hash)
      end

      # Delete a record
      def delete(sobject, hash)
        storage.table(sobject).delete(hash)
      end

      def clean!
        storage.clean!
      end

    end

    # Access a table
    def table(sobject)
      self[sobject] ||= Table.new
    end

    # Clean the database
    def clean!
      self.replace Hash.new
    end

    class Table < Array

      def insert(hash)
        raise "Object with id already exists" if record_exists?(hash)
        self << hash
      end

      def update(hash)
        record = record_exists?(hash)
        raise "Object with id does not exist" unless record
        self.remove(record)
        self << hash
      end

      def upsert(hash)
        if record = record_exists?(hash)
          self.update(hash)
        else
          self << hash
        end
      end

      alias :remove :delete
      def delete(hash)
        record = record_exists?(hash)
        raise "Object with id does not exist" unless record
        self.remove(record)
      end

      def record_exists?(hash)
        self.find { |record| record["Id"] == hash["Id"] }
      end
    end

  end
end

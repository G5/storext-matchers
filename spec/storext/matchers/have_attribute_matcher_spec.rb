require 'spec_helper'

module Storext::Matchers
  RSpec.describe HaveAttributeMatcher do

    it "generates a failure with the correct class name" do
      matcher = described_class.new(:name)
      matcher.matches?(Author)
      expect(matcher.failure_message).to include("expected Author to")

      matcher = described_class.new(:name)
      matcher.matches?(Author.new)
      expect(matcher.failure_message).to include("expected Author to")
    end

    describe "#matches?" do
      context "when type is not matching" do
        subject(:matcher) { described_class.new(:name, Integer) }
        specify { expect(matcher.matches?(Author)).to be false }
      end

      context "when column is not matching" do
        subject(:matcher) do
          described_class.new(:name, String).in_column(:wrong)
        end
        specify { expect(matcher.matches?(Author)).to be false }
      end

      context "when default is not matching" do
        subject(:matcher) do
          described_class.new(:name, String).in_column(:data).with_default("A")
        end
        specify { expect(matcher.matches?(Author)).to be false }
      end

      context "when attribute matches vaguely" do
        subject(:matcher) { described_class.new(:name) }
        specify { expect(matcher.matches?(Author)).to be true }
      end

      context "when attribute matches vaguely" do
        subject(:matcher) { described_class.new(:name, String) }
        specify { expect(matcher.matches?(Author)).to be true }
      end

      context "when attribute matches vaguely" do
        subject(:matcher) do
          described_class.new(:name, String).in_column(:data)
        end
        specify { expect(matcher.matches?(Author)).to be true }
      end

      context "when attribute matches exactly" do
        subject(:matcher) do
          described_class.new(:name, String).in_column(:data).
            with_default("Anonymous")
        end
        specify { expect(matcher.matches?(Author)).to be true }
      end
    end

  end
end

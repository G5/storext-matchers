require 'spec_helper'

describe Storext::Matchers do
  it 'has a version number' do
    expect(Storext::Matchers::VERSION).not_to be nil
  end

  it 'has an attribute matcher' do
    expect(Author).to have_attribute(:name, String).with_default("Anonymous")
    expect(Author.new).to have_attribute(:name, String).
      with_default("Anonymous")
  end
end

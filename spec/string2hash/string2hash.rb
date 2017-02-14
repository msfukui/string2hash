require 'spec_helper'

describe String2hash do
  it 'has a version number' do
    expect(String2hash::VERSION).not_to be nil
  end

  describe 'String#to_hash' do
    let(:empty_string) { '' }

    it 'returns an empty Hash value' do
      expect(empty_string.to_h).to eq({})
    end
  end
end

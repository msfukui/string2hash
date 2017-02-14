require 'spec_helper'

describe String2hash do
  it 'has a version number' do
    expect(String2hash::VERSION).not_to be nil
  end

  describe 'String#to_hash' do
    it 'returns an empty Hash value' do
      expect(''.to_h).to eq({})
    end

    it 'returns an empty Hash value' do
      expect(" 　\n".to_h).to eq({})
    end

    it 'returns an empty Hash value' do
      expect('{}'.to_h).to eq({})
    end

    it 'returns an simple Hash value' do
      expect("\n {:a=>1, :b=>\"c\"}　".to_h).to eq(a: 1, b: 'c')
    end

    context 'Incomplete string' do
      it 'returns empty Hash value' do
        expect('{:a=>1, :b=>"c"'.to_h).to eq({})
      end
    end
  end
end

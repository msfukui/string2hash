require 'spec_helper'

describe String2hash do
  it 'has a version number' do
    expect(String2hash::VERSION).not_to be nil
  end

  describe 'String#to_hash' do
    it 'returns an empty Hash (empty string)' do
      expect(''.to_h).to eq({})
    end

    it 'returns an empty Hash (only white spece)' do
      expect(" \n".to_h).to eq({})
    end

    it 'returns an empty Hash (empty hash string)' do
      expect('{}'.to_h).to eq({})
    end

    it 'returns a simple Hash (nestless hash)' do
      expect("\n {:a=>1, :b=>\"c\"}  ".to_h).to eq(a: 1, b: 'c')
    end

    it 'returns a nested Hash (single nested hash)' do
      expect('{:a=>1, :b=>"c", :d=>{:e=>2, :f=>"g"}}'.to_h).to eq(a: 1, b: 'c', d: { e: 2, f: 'g' })
    end

    xit 'returns a nested Hash (double nested hash)' do
      expect('{:a=>1, :b=>"c", :d=>{:e=>2, :f=>"g"}, :h=>{:i=>3, :j=>{:k=>4, :l=>"m"}}'.to_h).to eq(a: 1, b: 'c', d: { e: 2, f: 'g' }, h: {i: 3, j: { k: 4, l: 'm'}})
    end

    context 'Incomplete string' do
      it 'returns empty Hash' do
        expect('{:a=>1, :b=>"c"'.to_h).to eq({})
      end
    end
  end
end

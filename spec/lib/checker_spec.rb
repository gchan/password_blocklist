require 'spec_helper'

describe PasswordBlacklist::Checker do
  subject { PasswordBlacklist::Checker.new }

  describe '#blacklisted?' do
    it 'returns true if the provided password blacklisted' do
      expect(subject.blacklisted?('pokemon')).to eq(true)
    end

    it 'returns false if the provided password is not blacklisted' do
      expect(subject.blacklisted?('gengar')).to eq(false)
    end

    it 'escapes regular expression characters' do
      expect(subject.blacklisted?(')')).to eq(false)
      expect(subject.blacklisted?('.*')).to eq(false)
    end
  end

  describe '#inspect' do
    it 'returns a short string including its memory reference' do
      expect(subject.inspect).to include("0x#{subject.__id__.to_s(16)}")
      expect(subject.inspect.length).to be < 100
    end
  end
end

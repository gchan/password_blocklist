require 'spec_helper'

describe PasswordBlacklist::Checker do
  subject { PasswordBlacklist::Checker.new }

  describe '#blacklisted?' do
    context 'it returns true if the provided password is blacklisted and' do
      it 'no list is specified (defaults to sm)' do
        expect(subject.blacklisted?('pokemon')).to eq(true)
      end

      it 'the extra small (xs) list is specified' do
        expect(subject.blacklisted?('pokemon', 'xs')).to eq(true)
      end

      it 'the small (sm) list is specified' do
        expect(subject.blacklisted?('pokemon', 'sm')).to eq(true)
      end

      it 'the medium (md) list is specified' do
        expect(subject.blacklisted?('pokemon', 'md')).to eq(true)
      end

      it 'the large (lg) list is specified' do
        expect(subject.blacklisted?('pokemon', 'lg')).to eq(true)
      end

      it 'the extra large (xl) list is specified' do
        expect(subject.blacklisted?('pokemon', 'xl')).to eq(true)
      end
    end

    context 'returns false if the provided password is not blacklisted and' do
      it 'no list is specified (defaults to sm)' do
        expect(subject.blacklisted?('CorrectHorseBatteryStaple')).to eq(false)
      end

      it 'the extra small (xs) list is specified' do
        expect(subject.blacklisted?('CorrectHorseBatteryStaple', 'xs')).to eq(false)
      end

      it 'the small (sm) list is specified' do
        expect(subject.blacklisted?('CorrectHorseBatteryStaple', 'sm')).to eq(false)
      end

      it 'the medium (md) list is specified' do
        expect(subject.blacklisted?('CorrectHorseBatteryStaple', 'md')).to eq(false)
      end

      it 'the large (lg) list is specified' do
        expect(subject.blacklisted?('CorrectHorseBatteryStaple', 'lg')).to eq(false)
      end

      it 'the extra large (xl) list is specified' do
        expect(subject.blacklisted?('CorrectHorseBatteryStaple', 'xl')).to eq(false)
      end
    end

    it 'ignores password case sensitivity' do
      expect(subject.blacklisted?('PokeMon', 'sm')).to eq(true)
    end

    it 'escapes regular expression characters' do
      expect(subject.blacklisted?(')(', 'sm')).to eq(false)
      expect(subject.blacklisted?('.*', 'sm')).to eq(false)
    end
  end

  describe '#inspect' do
    it 'returns a short string including its memory reference' do
      expect(subject.inspect).to include("0x#{subject.__id__.to_s(16)}")
      expect(subject.inspect.length).to be < 100
    end
  end
end

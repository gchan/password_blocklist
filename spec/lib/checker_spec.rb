# frozen_string_literal: true

require 'spec_helper'

describe PasswordBlacklist::Checker do
  subject { described_class.new }

  let(:preloaded) { described_class.new(:xs) }

  describe '.new' do
    it 'supports preloading list into memory' do
      expect(File).to receive(:read)

      preloaded
    end

    it 'does not preload a list if no list size is provided' do
      expect(File).not_to receive(:read)

      subject
    end
  end

  describe '#blacklisted?' do
    it 'returns true if the provided password is in the blocklist' do
      expect(subject.blacklisted?('pokemon')).to be(true)
    end

    it 'returns false if the provided password is not in the blocklist' do
      expect(subject.blacklisted?('CorrectHorseBatteryStaple')).to be(false)
    end

    context 'using differente sized blocklists' do
      it 'supports an extra small list' do
        expect(subject.blacklisted?('pokemon', :xs)).to be(true)
        expect(subject.blacklisted?('assassins', :xs)).to be(false)
      end

      it 'supports a small list' do
        expect(subject.blacklisted?('assassins', :sm)).to be(true)
        expect(subject.blacklisted?('blackeyedpeas', :sm)).to be(false)
      end

      it 'supports a medium list' do
        expect(subject.blacklisted?('blackeyedpeas', :md)).to be(true)
        expect(subject.blacklisted?('deduplication', :md)).to be(false)
      end

      it 'supports a large list' do
        expect(subject.blacklisted?('deduplication', :lg)).to be(true)
        expect(subject.blacklisted?('amakingsortofbutton', :lg)).to be(false)
      end

      it 'supports an extra large list' do
        expect(subject.blacklisted?('amakingsortofbutton', :xl)).to be(true)
        expect(subject.blacklisted?('CorrectHorseBattleStaple', :xl))
          .to be(false)
      end

      it 'raise an error for unknown list size' do
        expect { subject.blacklisted?('pokemon', :abc) }
          .to raise_error(PasswordBlacklist::Checker::UnknownListSizeError)
      end
    end

    it 'ignores password case sensitivity' do
      expect(subject.blacklisted?('PokeMon', :sm)).to be(true)
    end

    it 'escapes regular expression characters' do
      expect(subject.blacklisted?(')(', :sm)).to be(false)
      expect(subject.blacklisted?('.*', :sm)).to be(false)
    end

    it 'supports strings for list size' do
      expect(subject.blacklisted?('password', 'sm')).to be(true)
    end

    context 'in-memory list' do
      it 'loaded when empty' do
        expect(File).to receive(:read).and_call_original

        subject.blacklisted?('pokemon')
      end

      it 'loaded and retained' do
        subject.blacklisted?('pokemon')

        expect(File).not_to receive(:read)

        subject.blacklisted?('password')
      end

      it 'is used if preloaded' do
        preloaded

        expect(File).not_to receive(:read)

        preloaded.blacklisted?('pokemon')
      end

      it 'is used if the list is the same' do
        preloaded

        expect(File).not_to receive(:read)

        preloaded.blacklisted?('pokemon', :xs)
      end

      it 'is updated when a different sized list is specificed' do
        preloaded

        expect(File).to receive(:read).and_call_original

        preloaded.blacklisted?('pokemon', :xl)
      end

      it 'is updated and retained when the list has changed' do
        preloaded

        preloaded.blacklisted?('pokemon', :xl)

        expect(File).not_to receive(:read)

        preloaded.blacklisted?('password', :xl)
        preloaded.blacklisted?('querty')
      end
    end
  end

  describe '#inspect' do
    it 'returns a short string including its memory reference' do
      expect(subject.inspect).to include("0x#{subject.__id__.to_s(16)}")
      expect(subject.inspect.length).to be < 100
    end
  end
end

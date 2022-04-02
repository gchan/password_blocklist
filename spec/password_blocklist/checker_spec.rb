# frozen_string_literal: true

require 'spec_helper'

describe PasswordBlocklist::Checker do
  subject(:checker) { described_class.new }

  let(:preloaded) { described_class.new(:xs) }

  before do
    allow(File).to receive(:read).and_call_original
  end

  describe '.new' do
    it 'supports preloading list into memory' do
      preloaded

      expect(File).to have_received(:read)
    end

    it 'does not preload a list if no list size is provided' do
      checker

      expect(File).not_to have_received(:read)
    end
  end

  describe '#blocklisted?' do
    it 'returns true if the provided password is in the blocklist' do
      expect(checker.blocklisted?('pokemon')).to be(true)
    end

    it 'returns false if the provided password is not in the blocklist' do
      expect(checker.blocklisted?('CorrectHorseBatteryStaple')).to be(false)
    end

    describe 'using differente sized blocklists' do
      it 'supports an extra small list' do
        expect(checker.blocklisted?('pokemon', :xs)).to be(true)
        expect(checker.blocklisted?('assassins', :xs)).to be(false)
      end

      it 'supports a small list' do
        expect(checker.blocklisted?('assassins', :sm)).to be(true)
        expect(checker.blocklisted?('blackeyedpeas', :sm)).to be(false)
      end

      it 'supports a medium list' do
        expect(checker.blocklisted?('blackeyedpeas', :md)).to be(true)
        expect(checker.blocklisted?('deduplication', :md)).to be(false)
      end

      it 'supports a large list' do
        expect(checker.blocklisted?('deduplication', :lg)).to be(true)
        expect(checker.blocklisted?('amakingsortofbutton', :lg)).to be(false)
      end

      it 'supports an extra large list' do
        expect(checker.blocklisted?('amakingsortofbutton', :xl)).to be(true)
        expect(checker.blocklisted?('CorrectHorseBattleStaple', :xl))
          .to be(false)
      end

      it 'raise an error for unknown list size' do
        expect { checker.blocklisted?('pokemon', :abc) }
          .to raise_error(PasswordBlocklist::Checker::UnknownListSizeError)
      end
    end

    it 'ignores password case sensitivity' do
      expect(checker.blocklisted?('PokeMon', :sm)).to be(true)
    end

    it 'escapes regular expression characters' do
      expect(checker.blocklisted?(')(', :sm)).to be(false)
      expect(checker.blocklisted?('.*', :sm)).to be(false)
    end

    it 'supports strings for list size' do
      expect(checker.blocklisted?('password', 'sm')).to be(true)
    end

    describe 'in-memory list' do
      it 'loaded when empty' do
        checker.blocklisted?('pokemon')

        expect(File).to have_received(:read)
      end

      it 'loaded and retained' do
        checker.blocklisted?('pokemon')

        checker.blocklisted?('password')

        expect(File).to have_received(:read).once
      end

      it 'is used if preloaded' do
        preloaded

        preloaded.blocklisted?('pokemon')

        expect(File).to have_received(:read).once
      end

      it 'is used if the list is the same' do
        preloaded

        preloaded.blocklisted?('pokemon', :xs)

        expect(File).to have_received(:read).once
      end

      it 'is updated when a different sized list is specificed' do
        preloaded

        preloaded.blocklisted?('pokemon', :xl)

        expect(File).to have_received(:read).twice
      end

      it 'is updated and retained when the list has changed' do
        preloaded

        preloaded.blocklisted?('pokemon', :xl)
        preloaded.blocklisted?('password', :xl)
        preloaded.blocklisted?('querty')

        expect(File).to have_received(:read).twice
      end
    end
  end

  describe '#inspect' do
    it 'returns a short string including its memory reference' do
      expect(checker.inspect).to include("0x#{checker.__id__.to_s(16)}")
      expect(checker.inspect.length).to be < 100
    end
  end
end

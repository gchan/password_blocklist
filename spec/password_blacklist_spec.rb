# frozen_string_literal: true

require 'spec_helper'

describe PasswordBlacklist do
  it 'has a version number' do
    expect(PasswordBlacklist::VERSION).not_to be_nil
  end

  describe '.blacklisted?' do
    it 'delegates to PasswordBlacklist::Checker with no list size param' do
      spy = spy('PasswordBlacklist::Checker')
      expect(PasswordBlacklist::Checker).to receive(:new).and_return(spy)

      described_class.blacklisted?('pokemon')
      expect(spy).to have_received(:blacklisted?).with('pokemon', :md)
    end

    it 'delegates to PasswordBlacklist::Checker with list size param' do
      spy = spy('PasswordBlacklist::Checker')
      expect(PasswordBlacklist::Checker).to receive(:new).and_return(spy)

      described_class.blacklisted?('pokemon', :lg)
      expect(spy).to have_received(:blacklisted?).with('pokemon', :lg)
    end
  end
end

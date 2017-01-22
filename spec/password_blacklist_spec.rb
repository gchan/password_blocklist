require 'spec_helper'

describe PasswordBlacklist do
  it 'has a version number' do
    expect(PasswordBlacklist::VERSION).not_to be nil
  end

  describe '.blacklisted?' do
    it 'delegates to PasswordBlacklist::Checker' do
      spy = spy('PasswordBlacklist::Checker')
      expect(PasswordBlacklist::Checker).to receive(:new).and_return(spy)

      PasswordBlacklist.blacklisted?('pokemon')
      expect(spy).to have_received(:blacklisted?).with('pokemon')
    end
  end
end

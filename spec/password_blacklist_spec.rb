# frozen_string_literal: true

require 'spec_helper'

describe PasswordBlacklist do
  it 'has a version number' do
    expect(PasswordBlacklist::VERSION).not_to be_nil
  end

  describe '.blacklisted?' do
    let(:double) { instance_double('PasswordBlacklist::Checker', blacklisted?: true) }

    before do
      allow(PasswordBlacklist::Checker).to receive(:new).and_return(double)
    end

    it 'delegates to PasswordBlacklist::Checker with no list size param' do
      described_class.blacklisted?('pokemon')
      expect(double).to have_received(:blacklisted?).with('pokemon', :md)
    end

    it 'delegates to PasswordBlacklist::Checker with list size param' do
      described_class.blacklisted?('pokemon', :lg)
      expect(double).to have_received(:blacklisted?).with('pokemon', :lg)
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

describe PasswordBlocklist do
  it 'has a version number' do
    expect(PasswordBlocklist::VERSION).not_to be_nil
  end

  describe '.blocklisted?' do
    let(:double) { instance_double('PasswordBlocklist::Checker', blocklisted?: true) }

    before do
      allow(PasswordBlocklist::Checker).to receive(:new).and_return(double)
    end

    it 'delegates to PasswordBlocklist::Checker with no list size param' do
      described_class.blocklisted?('pokemon')
      expect(double).to have_received(:blocklisted?).with('pokemon', :md)
    end

    it 'delegates to PasswordBlocklist::Checker with list size param' do
      described_class.blocklisted?('pokemon', :lg)
      expect(double).to have_received(:blocklisted?).with('pokemon', :lg)
    end
  end
end

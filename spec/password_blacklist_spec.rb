require 'spec_helper'

describe PasswordBlacklist do
  it 'has a version number' do
    expect(PasswordBlacklist::VERSION).not_to be nil
  end

  describe '.test' do
    it 'delegates to PasswordBlacklist::Tester' do
      spy = spy('PasswordBlacklist::Tester')
      expect(PasswordBlacklist::Tester).to receive(:new).and_return(spy)

      PasswordBlacklist.test('pokemon')
      expect(spy).to have_received(:test).with('pokemon')
    end
  end
end

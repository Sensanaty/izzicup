require 'rails_helper'
require 'securerandom'

RSpec.describe User, type: :model do
  let(:michael) { User.new(email: "michael@email.com", password: "password", username: "michael") }

  it 'is valid with proper attributes' do
    expect(michael).to be_valid
  end

  it 'is not valid without an email' do
    michael.email = ''
    expect(michael).not_to be_valid, "Expect User to have an Email"
  end

  it 'is not valid without a password' do
    michael.password = ''
    expect(michael).not_to be_valid, "Expect User to have a Password"
  end

  it 'is not valid without a username' do
    michael.username = ''
    expect(michael).not_to be_valid, "Expect User to have a Username"
  end

  it 'can\'t have a password shorter than 8 characters' do
    michael.password = SecureRandom.base64(5).gsub(/=+$/,'').to_s
    expect(michael).not_to be_valid, "Expected a password with at least 8 characters, actual length was #{michael.password.length}"
  end

  it 'can\'t have a password longer than 128 characters' do
    michael.password = SecureRandom.base64(129).gsub(/=+$/,'').to_s
    expect(michael).not_to be_valid, "User Password cannot exceed 128 characters"
  end

  it 'is not able to have duplicate emails' do
    michael.save
    expect(duplicate = User.create(email: michael.email, password: "password", username: "duplicate")).to_not be_valid, "Users can't have duplicate email addresses"
  end

  it 'is not able to have duplicate usernames' do
    michael.save
    expect(duplicate = User.create(email: "duplicate@email.com", password: "password", username: michael.username)).to_not be_valid, "Users can't have the same username"
  end

  it 'has a concatinated username with no whitespaces' do
    michael.username = "mich ael"
    expect(michael).not_to be_valid, "Expected username to be concatenated before being saved"
  end

  it "can't have a username longer than 25 characters" do
    michael.username = SecureRandom.base64(20).gsub(/=+$/,'').size.to_s
    expect(michael).not_to be_valid, "Username can't be longer than 25 characters"
  end

end

require 'spec_helper'

describe Book do
  let(:book) { FactoryGirl.create(:book, title: "Brave new world") }
  it "should have a valid title" do
    expect(book.title).to eq "Brave new world"
  end
  it "should have a valid users" do
    expect(book.users).to eq []
  end
end

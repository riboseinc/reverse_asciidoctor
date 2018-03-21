require 'spec_helper'

describe ReverseAsciidoctor do

  let(:input)    { File.read('spec/assets/from_the_wild.html') }
  let(:document) { Nokogiri::HTML(input) }
  subject { ReverseAsciidoctor.convert(input) }

  it "should make sense of strong-crazy markup (as seen in the wild)" do
    expect(subject).to include "**. +\n \\*\\*\\* intentcast **: logo design** +**\n"
  end

  it "should not over escape * or _" do
    expect(subject).to include 'link:example.com/foo_bar[![](example.com/foo_bar.png) I\_AM\_HELPFUL]'
  end

end

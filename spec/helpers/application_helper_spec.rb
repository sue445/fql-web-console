require 'spec_helper'

describe ApplicationHelper, :type => :helper  do
  describe "#parse_link" do
    subject { helper.parse_link(text) }

    context "normal text" do
      let(:text) { "aaaa" }
      it { should == text }
    end

  end
end

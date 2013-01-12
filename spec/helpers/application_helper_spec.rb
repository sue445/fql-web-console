require 'spec_helper'

describe ApplicationHelper, :type => :helper  do
  describe "#parse_link" do
    subject { helper.parse_link(text) }

    context "normal text" do
      let(:text) { "aaaa" }
      it { should == text }
    end

    context "contain link" do
      let(:text) { "drecom http://www.drecom.co.jp" }
      it { should == %{drecom <a href="http://www.drecom.co.jp">http://www.drecom.co.jp</a>} }
    end

    context "image" do
      let(:text) { "drecom http://www.drecom.co.jp/shared/img/logo.png" }
      it { should == "drecom #{image_tag "http://www.drecom.co.jp/shared/img/logo.png"}" }
    end

  end
end

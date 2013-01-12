# -*- coding: utf-8 -*-
require 'spec_helper'

describe Fql do
  describe "#run_query" do
    it "should call FQL" do
      res = Fql.run_query <<-FQL
    SELECT uid
         , name
         , pic_square
      FROM user
     WHERE username = 'sue445'
      FQL

      p res
      p ENV["FB_ACCESS_TOKEN"]
      p ENV["FB_APP_KEY"]
      p ENV["FB_APP_SECRET"]

      res.length.should == 1
    end
  end
end
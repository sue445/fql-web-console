# -*- coding: utf-8 -*-

module Fql
  def run_query(query)
    # https://gist.github.com/752914
    FbGraph::Query.new(query).fetch(ENV["ACCESS_TOKEN"])
  rescue FbGraph::InvalidToken => e
    url = "https://graph.facebook.com/oauth/access_token?client_id=#{ENV["APP_ID"]}&client_secret=#{ENV["APP_SECRET"]}&grant_type=client_credentials"
    raise "access token is invalid. please access '#{url}' and update access_token"
  end

  module_function :run_query
end
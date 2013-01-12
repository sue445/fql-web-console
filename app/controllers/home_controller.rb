class HomeController < ApplicationController
  def index
  end

  def run_query
    fql_result = Fql.run_query(params[:query])
    @res = {
        :status => "success",
        :result => fql_result,
    }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @res }
    end
  rescue => e
    res = {
        :status => "error",
        :result => e.inspect,
    }
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => res }
    end
  end
end

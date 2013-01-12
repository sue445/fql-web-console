class HomeController < ApplicationController
  def index
  end

  def run_query
    @res = Fql.run_query(params[:query])

    respond_to do |format|
      format.html
      format.json { render :json => @res }
      format.csv {
        csv_data = ""
        if @res.length > 0
          @res[0].each do |key, value|
            csv_data += key.to_s
            csv_data += ","
          end
          csv_data += "\n"
        end
        @res.each do |row|
          row.each do |key, value|
            csv_data += value.to_s
            csv_data += ","
          end
          csv_data += "\n"
        end
        render :text => csv_data
      }
    end
  rescue => e
    @res = e.inspect

    respond_to do |format|
      format.html
      format.json { render :json => @res }
      format.csv  { render :text => @res }
    end
  end
end

class HomeController < ApplicationController
  def index
  	@journalisms = Journalism.desc(:updated_at).limit(3)
  end

  def product
  end

  def about
  end

  def job
  end

  

end

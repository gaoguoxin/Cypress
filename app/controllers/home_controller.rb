class HomeController < ApplicationController
  def index
  	@journalisms = Journalism.valid.desc(:updated_at).limit(3)
  end

  def product
  end

  def about
  	@jour = Journalism.valid.desc(:updated_at).first
  end

  def contact
  end

  def clients
  end

  def job
  end
end

class HomeController < ApplicationController
  def index
  	@journalisms = Journalism.valid.desc(:updated_at).limit(3)
  end

  def product
  end

  def about
  	@jour = Journalism.valid.desc(:updated_at).first
  end

  #循环产业园
  def circulate
  end

  #经销商
  def agency
  end

  #美味厨房
  def galley
  end

  #循环产业园
  def circulate
  end

  def contact
  end

  def clients
  end

  def job
  end
end

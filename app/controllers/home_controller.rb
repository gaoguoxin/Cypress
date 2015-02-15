class HomeController < ApplicationController
  def index
  	@journalisms = Journalism.valid.desc(:updated_at).limit(3)
  end

  def product
  end

  def about
  	@jours = Journalism.valid.desc(:updated_at).limit(2)
  end

  #循环产业园
  def circulate
  end

  #经销商
  def agency
  end

  #美味厨房
  def bszcf
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

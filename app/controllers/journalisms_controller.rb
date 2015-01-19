class JournalismsController < ApplicationController
	def index
		@journalisms = Journalism.valid.desc(:updated_at).page(params[:page]).per(10)
		@journalism  = Journalism.valid.desc(:updated_at).first
	end

	def show
		@jour = Journalism.find(params[:id])
		@journalisms = Journalism.valid.desc(:updated_at).page(params[:page]).per(10)
	end
end

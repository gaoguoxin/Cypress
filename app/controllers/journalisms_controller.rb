class JournalismsController < ApplicationController
	def index
		@journalisms = Journalism.valid.desc(:updated_at)
	end

	def show
		@jour = Journalism.find(params[:id])
		@journalisms = Journalism.valid.desc(:updated_at)
	end
end

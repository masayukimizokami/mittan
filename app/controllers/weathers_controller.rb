class WeathersController < ApplicationController
   before_action :set_q

  def index
  end

   def set_q
      @q = Cook.ransack(params[:q])
   end
end

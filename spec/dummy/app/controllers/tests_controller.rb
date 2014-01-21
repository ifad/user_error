class TestsController < ApplicationController
  def index
    raise ActiveRecord::ActiveRecordError
  end

  def show
    raise ActionController::InvalidAuthenticityToken
  end

  def new
    raise Dummy::Exception
  end
end

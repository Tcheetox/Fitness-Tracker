class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  require 'logger'
  logger = Logger.new(STDOUT)
end

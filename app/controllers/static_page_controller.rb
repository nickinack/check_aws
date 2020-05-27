class StaticPageController < ApplicationController
  def home
    render html: "You are at the home page"
  end

  def help
    render html: "You are at the help page"
  end
end

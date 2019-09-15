class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

    def index
    end

    def privacy
    end

    def team
    end

    def careers
    end
end

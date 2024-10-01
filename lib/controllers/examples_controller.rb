module DiscourseChallenges
  class ExamplesController < ::ApplicationController
    def index
      render json: { message: "Hello from Discourse Challenges!" }
    end
  end
end

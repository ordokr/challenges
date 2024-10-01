# frozen_string_literal: true

DiscourseChallenges::Engine.routes.draw do
  get "/examples" => "examples#index"
  # define routes here
end

Discourse::Application.routes.draw do
  mount ::DiscourseChallenges::Engine, at: "/challenges"
end

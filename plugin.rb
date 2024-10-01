# frozen_string_literal: true

# name: discourse-challenges
# about: Adds quests and challenges to Discourse, with sound feedback
# version: 0.1
# authors: Your Name
# url: https://yourforum.com/plugin
# required_version: 2.7.0

enabled_site_setting :challenges_enabled

module ::DiscourseChallenges
  PLUGIN_NAME = "discourse-challenges"

  class Engine < ::Rails::Engine
    engine_name PLUGIN_NAME
    isolate_namespace DiscourseChallenges
  end
end

# Ensure you include the engine and routing correctly
after_initialize do
  # Place your challenge logic here, such as tracking progress or rewarding users
end

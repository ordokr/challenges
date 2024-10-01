# frozen_string_literal: true

# name: discourse-challenges
# about: Adds quests and challenges to Discourse
# meta_topic_id: TODO
# version: 0.1
# authors: Tim Vail
# url: https://cafe.ordo.kr
# required_version: 2.7.0

enabled_site_setting :challenges_enabled

module ::DiscourseChallenges
  PLUGIN_NAME = "discourse-challenges"

  class Engine < ::Rails::Engine
    engine_name PLUGIN_NAME
    isolate_namespace DiscourseChallenges
  end
end

# If you have additional engine code or need to isolate plugin logic in files
# require_relative "lib/discourse_challenges/engine"

after_initialize do
  # This is where the core functionality of the plugin goes
  class WeeklyPostChallenge
    def self.track_progress(user)
      # Count the number of posts the user made in the last 7 days
      posts_count = Post
                    .where(user_id: user.id)
                    .where("created_at >= ?", 1.week.ago)
                    .count

      # Check if the user has made at least 10 posts
      if posts_count >= 10
        # Grant a badge if the challenge criteria are met
        BadgeGranter.grant(user, Badge.find_by(name: 'Weekly Posting Champ'))
      end
    end
  end

  # Add any additional plugin initialization code here
end

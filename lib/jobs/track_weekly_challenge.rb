module Jobs
  class TrackWeeklyChallenge < ::Jobs::Scheduled
    every 1.day

    def execute(args)
      # Find all users and track their progress
      User.find_each do |user|
        ::DiscourseChallenges::WeeklyPostChallenge.track_progress(user)
      end
    end
  end
end

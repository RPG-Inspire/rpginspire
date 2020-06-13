namespace :oneoff do
  namespace :topics do

    desc "update vote sum cache"
    task :calc_vote_sum_all => :environment do
      Topic.in_batches.each_record do |topic|
        unless Actions::Topic.calculate_topic_score(topic).save
          p "Failed to save [#{topic.id}] (#{topic.title}"
        end
      end
    end
  end
end

require './app/jobs/parse_news_job'

desc "This task does nothing"
# https://lenta.ru/rss/news
#


task :parse, [:schedule, :channel] => :environment do |t, args|

  channel = args.channel.present? ? args.channel : "https://lenta.ru/rss/news"
  job_name = "ParseNews " + channel.gsub(/(https:\/\/|http:\/\/|(\.[a-z]*)+|(\/[a-z]*)+)/, '')
  schedule = args.schedule.present? ? args.schedule : "*/5 * * * *"

  job = Sidekiq::Cron::Job.new(name: job_name, cron: schedule, class: "ParseNewsJob", args: channel)
  if job.valid?
    job.save
  else
    puts 'Произошла ошибка'
    puts job.errors
  end
end
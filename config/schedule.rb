require 'whenever'

Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379/0' }
    config.on(:startup) do
      Sidekiq.schedule = {
        'my_job' => {
          'class' => 'DogWorker',
          'args' => [],
          'cron' => "*/1 * * * *", # every 2 hours
          'queue' => 'default'
        }
      }
      Sidekiq::Scheduler.reload_schedule!
    end
  end
  
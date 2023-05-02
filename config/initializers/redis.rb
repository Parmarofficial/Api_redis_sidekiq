require 'redis'

redis_config = {
  host: ENV['REDIS_HOST'] || 'localhost',
  port: ENV['REDIS_PORT'] || 6379,
  db:   ENV['REDIS_DB']   || 0
}

$redis = Redis.new(redis_config)

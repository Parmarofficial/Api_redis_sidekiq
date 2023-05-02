# app/workers/dog_worker.rb
class DogWorker
    require 'sidekiq'

    include Sidekiq::Worker

    def perform
      pet_images = $redis.get('dog_images')
  
      unless pet_images
        url = 'http://shibe.online/api/shibes?count=10'
        response = RestClient.get(url)
        pet_images = JSON.parse(response.body)
  
        $redis.set('dog_images', pet_images.to_json)
      else
        pet_images = JSON.parse(pet_images)
      end
  
      pet_images.each do |image_url|
        Pet.create(image_url: image_url)
      end
  
      Rails.logger.info "#{pet_images.length} pets saved to the database"
    end
  end
  
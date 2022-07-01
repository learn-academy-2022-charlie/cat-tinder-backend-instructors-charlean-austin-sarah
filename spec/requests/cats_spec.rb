require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it 'returns all the cats from the database when the endpoint of get /cats is hit' do
      
      # I need something in my testing database to get back from the request
      Cat.create(name: 'Mosey', age: 6, enjoys: 'showing up randomly where she is not expected', image: 'https://thiscatdoesnotexist.com/')
  
      # I need to make a request to my appilcation
      get '/cats'
  
      # define a variable that is the response
      mosey = JSON.parse(response.body)

      p mosey
      p 'HERE IS MOSEY'
      # I need to assert that the response is correct
        # status code
      expect(response).to have_http_status(200)
        # payload
      expect(mosey.length).to eq 1
      #      ActionController::MissingExactTemplate:
      #  CatsController#index is missing a template for request formats: text/html
    end
  end
  describe "POST /create" do
    it 'creates a cat' do
      
      # I need something to send to my application to have it loaded into the database
      cat_params = {
        cat: {
          name: 'Mosey',
          age: 6,
          enjoys: 'showing up randomly where she is not expected',
          image: 'https://thiscatdoesnotexist.com/'
        }
      }
      
      # I need to make a request to my appilcation to create the object we made
      post '/cats', params: cat_params
      # I need to assert that the response is correct
        # status code
      expect(response).to have_http_status(200)
  
      # define a variable that is in the database
      cat = Cat.first
      # assert that the item in the DB is the same we sent over
      expect(cat.name).to eq 'Mosey'
      expect(cat.age).to eq 6
      expect(cat.enjoys).to eq 'showing up randomly where she is not expected'
      expect(cat.image).to eq 'https://thiscatdoesnotexist.com/'

    end
    it 'does not create a cat without a name' do
      
      # I need something to send to my application to have it loaded into the database
      cat_params = {
        cat: {
          age: 6,
          enjoys: 'showing up randomly where she is not expected',
          image: 'https://thiscatdoesnotexist.com/'
        }
      }
      
      # I need to make a request to my appilcation to create the object we made
      post '/cats', params: cat_params
      # I need to assert that the response is correct
        # status code
      expect(response).to have_http_status(422)
  
      # define a variable that is in the database
      cat = JSON.parse(response.body)
      # assert that the item in the DB is the same we sent over
     expect(cat['name']).to include "can't be blank"
     
    end
    it 'does not create a cat without an age' do
      
      # I need something to send to my application to have it loaded into the database
      cat_params = {
        cat: {
          name: 'Mosey',
          
          enjoys: 'showing up randomly where she is not expected',
          image: 'https://thiscatdoesnotexist.com/'
        }
      }
      
      # I need to make a request to my appilcation to create the object we made
      post '/cats', params: cat_params
      # I need to assert that the response is correct
        # status code
      expect(response).to have_http_status(422)
  
      # define a variable that is in the database
      cat = JSON.parse(response.body)
      # assert that the item in the DB is the same we sent over
     expect(cat['age']).to include "can't be blank"
    end
    it 'does not create a cat without an enjoys' do
      
      # I need something to send to my application to have it loaded into the database
      cat_params = {
        cat: {
          name: 'Mosey',
          
          age: 6,
          image: 'https://thiscatdoesnotexist.com/'
        }
      }
      
      # I need to make a request to my appilcation to create the object we made
      post '/cats', params: cat_params
      # I need to assert that the response is correct
        # status code
      expect(response).to have_http_status(422)
  
      # define a variable that is in the database
      cat = JSON.parse(response.body)
      # assert that the item in the DB is the same we sent over
     expect(cat['enjoys']).to include "can't be blank"
    end
  end
  describe "PATCH /update" do
    it "it updates a cat that exists in the database" do
     
      Cat.create(name: 'Mosey', age: 6, enjoys: 'showing up randomly where she is not expected', image: 'https://thiscatdoesnotexist.com/')

      cat = Cat.first

      # I need something to send to my application to have it loaded into the database
      updated_cat_params = {
              cat: {
                name: 'Mosey',
                age: 7,
                enjoys: 'showing up randomly where she is not expected',
                image: 'https://thiscatdoesnotexist.com/'
              }
            }
      # I need to make a request to my appilcation to create the object we made
      patch "/cats/#{cat.id}", params: updated_cat_params
      # I need to assert that the response is correct
        # status code
      expect(response).to have_http_status(200)
      # define a variable that is in the database
      updated_cat = Cat.find(cat.id)

      expect(cat.age).to eq 6
      expect(updated_cat.age).to eq 7
      # assert that the item in the DB is the same we sent over
    end
  end

end

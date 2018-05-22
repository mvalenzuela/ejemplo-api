require 'rails_helper'

RSpec.describe 'Buses API', type: :request do
  # initialize test data
  let!(:buses) { create_list(:bus, 10) }
  let(:bus_id) { buses.first.id }

  # Test suite for GET /todos
  describe 'GET /buses' do
    # make HTTP get request before each example
    before { get '/buses' }

    it 'returns buses' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  describe 'GET /buses/:id' do
    before { get "/buses/#{bus_id}" }

    context 'when the record exists' do
      it 'returns the bus' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(bus_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:bus_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Bus/)
      end
    end
  end

  # Test suite for POST /todos
  describe 'POST /buses' do
    # valid payload
    let(:valid_attributes) { { route: 'C02', arrival_estimation: 'hola' } }

    context 'when the request is valid' do
      before { post '/buses', params: valid_attributes }

      it 'creates a bus' do
        expect(json['route']).to eq('C02')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/buses', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /todos/:id
  describe 'PUT /buses/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/buses/#{bus_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /buses/:id' do
    before { delete "/buses/#{bus_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

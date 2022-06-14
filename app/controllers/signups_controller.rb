class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record
    
    # def index
    #     signups = Signup.all
    #     render json: signups, status: :ok
    # end

    def create
       signup = Signup.create!(signup_params) 
       render json: signup.activity, status: :created
    end

    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def invalid_record(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end

class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index 
        activities = Activity.all 
        render json: activities, status: :ok 
    end

    def destroy
        no_more = Activity.find(params[:id])
        no_more.destroy
        head :no_content
    end

    private 

    def render_not_found
        render json: {error: "Activity not found"}. status: :not_found
    end
end

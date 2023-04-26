require_relative "../../lib/chat_gpt.rb"

class RecommendationsController < ApplicationController
  include OpenAIApiService

  def my_recommendations
    # Get form data from params
    query = params[:query]
    recommendation_type = params[:recommendation_type]
    options = params[:options]

    # Call API service
    response =
      OpenAIApiService.generate_recommendations(
        query,
        recommendation_type,
        options
      )

    @recommendations = response["choices"][0]["text"]

    # Render response in my_recommendations view
    render "recommendations/my_recommendations"
  end
end

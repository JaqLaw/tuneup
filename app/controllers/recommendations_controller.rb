require_relative "../../lib/chat_gpt.rb"

class RecommendationsController < ApplicationController
  include OpenAIApiService

  def my_recommendations
    # Get form data from params
    query = params[:query]
    recommendation_type = params[:recommendation_type]

    # make sure they select at least one option
    if params[:options].present?
      options = params[:options]

      # Call API service
      response =
        OpenAIApiService.generate_recommendations(
          query,
          recommendation_type,
          options
        )
      # handle api exception
      if response
        @recommendations = response["choices"][0]["text"]

        # Render response in my_recommendations view
        render "recommendations/my_recommendations"
      else
        flash[:alert] = "There was an error, please try again"
        redirect_to root_path
      end
    else
      flash[:alert] = "Please select at least one matching option"
      redirect_to root_path
    end
  end
end

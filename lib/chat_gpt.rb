module OpenAIApiService
  def self.generate_recommendations(query, recommendation_type, options)
    require "openai"

    client =
      OpenAI::Client.new(
        access_token: Rails.application.credentials.openAI[:openAI_api_key]
      )

    prompt =
      "Acting as a music analyst and expert, give me 5 #{recommendation_type} recommendations that 
    have a similar #{options.join(", ")} as #{query}. Give a two sentence explanation for each recommendation choice."

    response =
      client.completions(
        parameters: {
          model: "text-davinci-003",
          prompt: prompt,
          max_tokens: 500
        }
      )

    object = JSON.parse(response)
  end
end

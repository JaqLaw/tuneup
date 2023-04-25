module OpenAIApiService
  def generate_recommendations
    require "openai"

    client =
      OpenAI::Client.new(
        access_token: Rails.application.credentials.openAI[:openAI_api_key]
      )

    prompt = "What is ruby metaprogramming?"

    response =
      client.completions(
        parameters: {
          model: "text-davinci-003",
          prompt: prompt,
          max_tokens: 200
        }
      )

    # puts response["choices"][0]["text"]
  end
end

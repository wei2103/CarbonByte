require "openai"

class ChatBotService
  def initialize()
    @client = OpenAI::Client.new(
      access_token: ENV["OPENAI_API_KEY"]
    )
  end

  def start_chat(prompt)
    response = @client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt }],
        temperature: 0.3
      }
    )

    response.dig("choices", 0, "message", "content")
  end
end

require "openai"

class ChatBotService
  def initialize()
    @client = OpenAI::Client.new(
      access_token: "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"
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

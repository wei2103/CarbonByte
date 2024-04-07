class Reply < ApplicationRecord
  # belongs_to :user
  belongs_to :post

  # If the text limit over 280 characters, it will truncate the message and add ... at the end
  before_save :truncate_message

  private

  def truncate_message
    self.message = message[0..279] + "..." if message.length > 280
  end
end

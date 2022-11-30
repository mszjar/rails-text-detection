class NotesController < ApplicationController
  def index
    @notes = Note.all
    text_detection
  end

  def text_detection
    path = "#{Rails.root}/app/assets/images/test_ticket.jpeg"
    @image = RTesseract.new(path, lang: 'eng')
    @image.to_s
  end
end

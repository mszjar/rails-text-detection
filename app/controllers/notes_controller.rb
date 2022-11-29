# require "google/cloud/vision"

class NotesController < ApplicationController
  def index
    @notes = Note.all
    detection
  end

  def detection

    file_name = '/home/mszjar/code/mszjar/rails-text-detection/app/assets/images/Screenshot from 2022-11-29 15-01-56.png'
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new

    response = image_annotator.document_text_detection image: file_name

    @text = ""
    response.responses.each do |res|
      res.text_annotations.each do |annotation|
        text << annotation.description
      end
    end
    @text
  end
end

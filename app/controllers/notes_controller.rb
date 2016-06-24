class NotesController < ApplicationController
  def edit
    @note = Note.find_by(id: params[:id])
  end

  def update
    @note = Note.find_by(id: params[:id])
    @note.update(description: params[:description])
    redirect_to "/clients/#{@note.client_id}"
  end
end

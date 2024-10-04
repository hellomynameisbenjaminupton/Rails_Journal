class JournalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_journal, only: [:edit, :update, :destroy, :show]

  def index
    @journals = current_user.journals.order(created_at: :desc)
  end

  def new
    @journal = current_user.journals.build
  end

  def create
    @journal = current_user.journals.build(journal_params)
    if @journal.save
      redirect_to journals_path, notice: 'Journal entry created successfully.'
    else
      render :new
    end
  end

  def edit
    # The @journal is set in the before_action
  end

  def update
    if @journal.update(journal_params)
      redirect_to journals_path, notice: 'Journal entry updated successfully.'
    else
      render :edit
    end
  end

  def show
    @journal = Journal.find(params[:id])
  end

  def destroy
    @journal.destroy
    redirect_to journals_path, notice: 'Journal entry deleted successfully.'
  end  

  private

  def set_journal
    @journal = current_user.journals.find(params[:id]) # Find the journal for the current user
  end

  def journal_params
    params.require(:journal).permit(:title, :body)
  end
end

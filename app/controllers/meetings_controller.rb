class MeetingsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]


def index

  @search = Meeting.search do
    fulltext params[:search]
  end
  @meetings = @search.results

  @meetings_by_date = @meetings.group_by(&:date)
  @date = params[:date] ? Date.parse(params[:date]) : Date.today
end

def show

end

def new

  @meeting = current_user.meetings.build
end

def create

  @meeting = current_user.meetings.build(meeting_params)
  @meeting.user_id = current_user.id

  if @meeting.save
    redirect_to "/meetings"
    else render "new"
  end
end

def edit
end

def update
  if @meeting.update(meeting_params)
    redirect_to "/meetings", notice: "Erfolgreich editiert!"
  else render "edit"
  end
end

def destroy
  if @meeting.destroy
    redirect_to "/meetings"
  end
end

def history
  @meetings = Meeting.all
end


private


def set_meeting
  @meeting = Meeting.find(params[:id])
end

def meeting_params
  params.require(:meeting).permit(:name, :contactpsn_id, :description, :date, :category)
end

end

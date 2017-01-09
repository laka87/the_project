class MeetingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meeting, only: [:show, :edit, :update, :destroy, :complete]

  autocomplete :contact, :contact_name, full: true

def index



@search = Meeting.search(params[:q])
@meetings = @search.result.includes(:contact)


@meetings_by_user = @meetings.paginate(:page => params[:page],:per_page => 5)

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
    @meeting.update_attribute(:completed_at, nil)
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

def complete
  if @meeting.update_attribute(:completed_at, Time.now)
  redirect_to "/meetings", notice: "Termin manuell abgeschlossen!"
  end
end

private


def set_meeting
  @meeting = Meeting.find(params[:id])
end

def meeting_params
  params.require(:meeting).permit(:meeting_name, :contactpsn_id, :contact_id, :contact_title, :description, :date, :category, :time_of_meeting)
end



end

class SaleController < ApplicationController
  def index
    @rooms = Room.all
  end
  def getBookings
    dateParam=getDateOfWeek
    fromDate=dateParam.at_beginning_of_week.beginning_of_day
    toDate=dateParam.at_end_of_week.end_of_day
    @bookings = Booking.where(:at => fromDate..toDate).order("at")
    respond_to do |format|
      format.json { render json: @bookings.to_json(:include => [:room,:customer]) }
    end
  end
  def getDatesInAWeek
    dateParam=getDateOfWeek
    monday=dateParam.at_beginning_of_week
    datesInAWeekJSON={mo:formatDateOfWeek(monday),tu:formatDateOfWeek(monday+1),we:formatDateOfWeek(monday+2),th:formatDateOfWeek(monday+3),
      fr:formatDateOfWeek(monday+4),sa:formatDateOfWeek(monday+5),su:formatDateOfWeek(monday+6)}.to_json
    respond_to do |format|
      format.json { render json: datesInAWeekJSON}
    end
  end
  def getDateOfWeek
    dateParam=Time.zone.now.to_date
    if params.has_key?(:dateOfWeek)
      dateParam=params[:dateOfWeek].to_date
    end
    return dateParam
  end
  def formatDateOfWeek(dateOfWeek)
    return dateOfWeek.strftime("%d-%m-%Y")
  end
end

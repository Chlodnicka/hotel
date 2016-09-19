class Reservation < ApplicationRecord
  belongs_to :room

  before_create :set_status

  def set_status
    self.status = "created"
  end

  STATUS_MAP = {
      "created" => "Created",
      "paid" => "Paid",
      "accepted" => "Accepted",
      "deleted" => "deleted"
  }

  validate :end_date_after_start_date?
  validate :empty_room?

  def empty_room?
    reservations = Reservation.where("room_id = ?", self.room_id)
    reservations.each do |reservation|
      if self.start_date >= reservation.start_date && self.finish_date <= reservation.finish_date
        errors.add :finish_date, "Room is taken - dates are exactly the same or your visit is included in reservation already made"
      else
        if self.start_date >=reservation.start_date && self.start_date <= reservation.finish_date
          errors.add :start_date, "Room is taken - your first days of visit are already taken"
        else
          if self.start_date <= reservation.start_date && self.finish_date >= reservation.start_date
            errors.add :finish_date, "Room is taken - your last days of visit are already taken"
          end
        end
      end

    end
  end

  def end_date_after_start_date?
    if finish_date < start_date
      errors.add :finish_date, "must be after start date"
    end
  end

  before_save do
    room = Room.find self.room_id
    days = self.finish_date - self.start_date
    self.changed_price = room.price * self.changed_count_of_person * days
    self.proper_price = room.price * room.count_of_person * days
  end

end

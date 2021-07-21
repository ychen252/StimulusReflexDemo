module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # identified_by :session_id
    identified_by :current_user
    identified_by :session_id
    # def connect
    #   self.session_id = request.session.id
    # end
    def connect
      self.current_user = env["warden"].user
      self.session_id = request.session.id
      reject_unauthorized_connection unless self.current_user || self.session_id
    end
  end
end

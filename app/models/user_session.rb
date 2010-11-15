class UserSession
  def initialize(session)
    @session = session
  end
  
  def add_active_poll(active_poll)
    @session[:active_poll_id] = active_poll.id
  end
end
class UserSession
  
  def initialize(session)
    @session = session
  end
  
  def id
    @session[:session_id]
  end
  
  def active_poll
    @session[:active_poll_id]
  end
  
  def participant
    @session[:participant]
  end
  
  def active_poll=(active_poll)
    @session[:active_poll_id] = active_poll.id
    participant = active_poll.report.participants.build
    participant.user_session = id
    if !participant.save
      # Error check here
    end
    @session[:participant] = participant.id
  end
  
  def unbind()
    @session[:active_poll_id] = nil;
  end
end
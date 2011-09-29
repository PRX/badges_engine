class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    if self.current_user = browserid_authenticate
      redirect_to user_path(current_user)
    else
      render :action=>'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
  
  protected

  def browserid_authenticate
    assertion = params[:browserid_assertion]

    unless assertion
      logger.error "Params did not include assertion: '#{params.inspect}'"
      return nil
    end

    begin
      audience = request.host_with_port
      http = Net::HTTP.new('browserid.org', 443)
      http.use_ssl = true
      headers = {'Content-Type' => 'application/x-www-form-urlencoded'}
      data = "audience="+audience+"&assertion="+assertion
      response = http.post("/verify", data, headers)
    rescue Exception => e
      logger.error "Net::HTTP error: '#{e.message}'"
      return nil
    end
    
    unless response.kind_of?(Net::HTTPSuccess)
      logger.error "Net::HTTP response not a success: '#{response.inspect}'"
      return nil
    end

    if !response || response.body.blank?
      logger.error "Net::HTTP response was blank or nil: '#{response.inspect}'"
      return nil
    end

    email, status, bid_resp = nil
    begin
      bid_resp = JSON.parse(response.body || "{}")
      email = bid_resp['email']
      status = bid_resp['status']
    rescue JSON::ParserError => err
      logger.error "BrowserId returning bad JSON data: '#{response.body}'"
      return nil
    end
    
    if email && (status == 'okay')
      users = Array(User.where(:email=>bid_resp['email']))
      if users.size == 1
        users.first
      elsif users.size == 0
        # create the user
        User.create(:email=>email)
      else
        logger.error "Too many users have the provided email address. Please resolve duplicates: '#{email}'"
        return nil
      end
    else
      logger.error "email blank or assertion status not okay: '#{bid_resp.inspect}'"
      return nil
    end

  end
  
end
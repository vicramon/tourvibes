class Customdomain  
  def self.matches?(request)  
    request.domain != 'herokuapp.com' && request.domain != 'impactprep.com' && request.domain != 'localhost'
  end  
end
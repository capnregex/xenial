
class Proxy
  attr_accessor :env

  # http_proxy
  # http_proxy_user
  # http_proxy_pass
  # https_proxy
  # https_proxy_user
  # https_proxy_pass
  # no_proxy
  
  def initialize env
    @env = env.select do |k,v|
      case k.downcase
      when /lang/ then true
      when /user/ then true
      when /logname/ then true
      when /proxy/ then true
      else false
      end
    end
  end

  def http
    @http ||= env['http_proxy'] || env['HTTP_PROXY']
  end

  def https
    @https ||= env['https_proxy'] || env['HTTPS_PROXY']
  end

  def no
    @no ||= env['no_proxy'] || env['NO_PROXY']
  end

  def http?
    ! http.empty?
  end

  def https?
    ! https.empty?
  end

  def no?
    ! no.empty?
  end

  def to_h
    {
      http: http,
      https: https,
      no: no
    }
  end

end



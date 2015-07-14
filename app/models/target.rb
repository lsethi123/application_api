
require 'timeout'
require 'socket'
class Target < ActiveRecord::Base
  belongs_to :appliance

  validates :appliance_id, presence:   true

  validates :hostname,     presence:   true,
                           uniqueness: true

  validates :address,      presence:   true,
                           format:     {with: Resolv::IPv4::Regex}
  enum status:[:Down,:Up]

  def check_and_update_status
    status = 0
    if ping(self.address)
    status = 1
    end
    self.update(status:status)
  end

  def ping(host)
    begin
      Timeout.timeout(5) do
        s = TCPSocket.new(host, 'echo')
        s.close
        return true
      end
    rescue Errno::ECONNREFUSED
      return true
    rescue Timeout::Error, Errno::ENETUNREACH, Errno::EHOSTUNREACH
      return false
    end
  end
end

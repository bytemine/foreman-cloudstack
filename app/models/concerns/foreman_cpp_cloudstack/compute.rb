require 'socket'
require 'timeout'
require 'zlib'

module ForemanCPPCloudstack::Compute
  extend Orchestration::Compute

  def setUserData
    logger.info "Rendering UserData template for #{name}"
    template   = configTemplate(:kind => "user_data")
    @host      = self
    # For some reason this renders as 'built' in spoof view but 'provision' when
    # actually used. For now, use foreman_url('built') in the template
    if self.provider.downcase == "cloudstack"
      logger.info "computing cloudstack userdata"
      wio = StringIO.new("w")
      w_gz = Zlib::GzipWriter.new(wio)
      w_gz.write(unattended_render(template.template))
      w_gz.close
      self.compute_attributes[:user_data] = Base64.strict_encode64(wio.string)
    else
      self.compute_attributes[:user_data] = unattended_render(template.template)
    end
    self.handle_ca
    return false if errors.any?
    logger.info "Revoked old certificates and enabled autosign for UserData"
  end
end

module OWD
  class APIError < StandardError
    attr_accessor :owd_error_type, :owd_error_message
    def initialize details = {}
      self.owd_error_type    = details['type']
      self.owd_error_message = details['message']
      super("#{owd_error_type}: #{owd_error_message}")
    end
  end
end

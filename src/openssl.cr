require "openssl"

module OpenSSL
  class OpenSSLError < Exception
    getter err
    getter err_msg

    def initialize(msg = nil)
      unless (err = @err = LibCrypto.get_error) == 0
        @err_msg = String.new(LibCrypto.err_error_string(err, nil))
        msg = msg ? "#{msg}: #{@err_msg}": @err_msg
      end
      super(msg)
    end
  end

end

lib LibCrypto
  alias EVP_PKEY = Void*
end

require "./bio/*"
require "./lib/*"
require "./pkey/*"

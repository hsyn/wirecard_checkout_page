module WirecardCheckoutPage
  class CheckedResponse
    include WirecardCheckoutPage::Utils

    def initialize(params)
      @params = stringify_keys(params).freeze
    end

    attr_reader :params

    def valid?
      WirecardCheckoutPage::ResponseChecksum.new(@params).valid?
    end

    def success?
      valid? && @params['paymentState'] == 'SUCCESS'
    end

    def message
      @params['message']
    end
  end
end

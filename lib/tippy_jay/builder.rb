module Tippy
  class Builder
    def initialize total:, gratuity:
      @total = total
      @gratuity = gratuity
    end

    def generate
      return total_calculator if number_based?
      string_based
    end

    def string_based
      case @gratuity.downcase
      when 'high'     then total_calculator 25
      when 'standard' then total_calculator 18
      when 'low'    then total_calculator 15
      end
    end

    def number_based?
      (@gratuity.is_a? Numeric) || (@gratuity.match? /^[0-9]\d*(\.\d+)?$/)
    end

    def total_calculator gratuity = @gratuity
      @total += @total * (gratuity.to_f / 100)
    end
  end
end

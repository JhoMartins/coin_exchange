require 'rest-client'
require 'json'

module Currency
  def self.exchange currency, currency_destination, quantity
    begin
      res = RestClient.get "http://api.fixer.io/latest?base=#{currency}&symbols=#{currency_destination}"
      value = JSON.parse(res.body)['rates'][currency_destination]
      return { value: (value * quantity).round(2), currency_quota: value.round(4) }
    rescue
      return 'Problem in Conversion'
    end
  end

  def self.quota_period start_date = Date.current - 7.days, end_date = Date.current, currency, currency_destination
    begin
      hash = Hash.new
      hash[:date] = []
      hash[:value] = []
      date = start_date
      loop do
        res = RestClient.get "http://api.fixer.io/#{date}?base=#{currency}"
        value = JSON.parse(res.body)['rates'][currency_destination]
        hash[:date] << date.strftime
        hash[:value] << value
        date = date + 1.day
        break if date > end_date
      end
      return hash
    rescue
      return "Problem in request period"
    end
  end
end

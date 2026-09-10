# frozen_string_literal: true

require 'bundler/setup'
require_relative '../lib/yf_as_dataframe'

failures = []
failures << 'version' if YfAsDataframe::VERSION.to_s.empty?
ticker = YfAsDataframe::Ticker.new('AAPL')
failures << 'instantiate' unless ticker.is_a?(YfAsDataframe::Ticker)
failures << 'symbol' unless ticker.ticker == 'AAPL'

if failures.empty?
  puts 'test_ticker: ok'
else
  abort "test_ticker failed: #{failures.join(', ')}"
end

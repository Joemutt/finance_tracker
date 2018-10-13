# frozen_string_literal: true

class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.new_from_lookup(symbol)
    looked_up_stock = StockQuote::Stock.quote(symbol)
    new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, latest_price: looked_up_stock.latest_price)
rescue Exception => e
  # nil
end

  def self.find_by_ticker(symbol)
    where(ticker: symbol).first
  end
end

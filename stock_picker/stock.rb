stocks = [17, 3, 6, 9, 15, 8, 6, 1, 10]

def stock_picker ( stocks )
  max_profit = 0
  buy_sell = []
  buy = 0
  sell = 0

  stocks.reverse.map { |a| 
    stocks.take( stocks.length - stocks.reverse.index(a) ).map { |b| 
      if a - b > max_profit
        max_profit = a - b
        buy = stocks.index(b)
        sell = stocks.index(a)
      end
      }
    }

   p buy_sell << buy << sell

end

stock_picker(stocks)

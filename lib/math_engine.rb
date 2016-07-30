module MathEngine

  def find_average(data)
    (data.reduce(:+) / data.length.to_f)
  end

  def standard_deviation(data, average, total)
    Math.sqrt(
      sum_of_squared_data(data, average) / (total - 1)
    ).round(2)
  end

  def sum_of_squared_data(data, average)
    data.reduce(0) do |result, number|
      result += ((number - average)**2)
      result
    end
  end

  def above_std_dev(avg, std_dev, amount = 1)
    avg + (std_dev * amount)
  end

  def below_std_dev(avg, std_dev, amount = 1)
    avg - (std_dev * amount)
  end

end

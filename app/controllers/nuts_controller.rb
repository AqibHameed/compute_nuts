class NutsController < ApplicationController
  
  def index     
  end

  def maximum_amount_of_nuts
    #Read the number of lines in the text aread field
    @number_of_lines = params[:input][:text].split("\r\n").reject(&:empty?)
    #Conatain the list of max amount of nuts
    @list_x = []
    @number_of_lines.each do |line|
        line = line.split(",")
        d = line[0].to_i
        n = line[1].to_i
        f = line[2].to_i
        c = line[3].to_i
        x = calMaxAmountOfNuts(d, n, f, c)
        @list_x.push(x)
    end  
    render "index"
  end  
end




private

def calMaxAmountOfNuts(d, n, f, c)
  #carry all nuts in one tour
  if n <= c
    nutsReachedAtDestination = n - d * f
    return nutsReachedAtDestination >= 0.0 ?
           nutsReachedAtDestination :
           0.0 #no fuel
  end
  #Total number of tours forward and backward 
  numTours = 2 * (n / c.to_f).ceil - 1
  #fuel consume per kilometer
  fuelConsumePerKm = numTours * f
  #Remaining nuts after number of nuts to be consumed
  remainingNuts = c * ((n / c.to_f).ceil - 1.0)
  #Distance covered to fetching the nuts
  dis = (n - remainingNuts) / fuelConsumePerKm
  #If distance covered greater or equal to the remaining distance
  return n - d * fuelConsumePerKm if dis >= d
  #Recursively call the function untill reach the destination 
  #or out of the fuel
  calMaxAmountOfNuts(d - dis, remainingNuts, f, c)
end

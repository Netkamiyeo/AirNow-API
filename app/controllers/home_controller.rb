class HomeController < ApplicationController
  def index
  	require 'net/http'
  	require 'json'
  	@url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=89129&distance=0&API_KEY=32F53F7A-CD39-4F83-A668-0723D1B23155'
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@output = JSON.parse(@response)
  	#Check if result is empty
  	if @output.empty?
  		@finaloutput = "ERROR!"
  	elsif !@output
  		@finaloutput = "error!"
  	else
  		@finaloutput = @output[0]['AQI']
  		end

  		if @finaloutput == "ERROR!"

  			@api_color = "gray"

  		elsif @finaloutput <= 50

  			@api_color = "green"
  			@api_description = "Air quality is considered satisfactory, and air pollution poses little or no risk."
  			@aqi_name = "Good (0 - 50)"

  		elsif @finaloutput >= 51 && @finaloutput <= 100

  		@api_color = "yellow"
  		@api_description = "Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution."
  		@aqi_name = "Moderate (51 - 100)"

   		elsif @finaloutput >= 101 && @finaloutput <= 150

  		@api_color = "orange"
  		@api_description = "Although general public is not likely to be affected at this AQI range, people with lung disease, older adults and children are at a greater risk from exposure to ozone, whereas persons with heart and lung disease, older adults and children are at greater risk from the presence of particles in the air."
  		@aqi_name = "Unhealthy for Sensitive Groups (101 - 150)"

  		elsif @finaloutput >= 151 && @finaloutput <= 200

  		@api_color = "red"
  		@api_description = "Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects."
  		@aqi_name = "Unhealthy (151 - 200)"

  		elsif @finaloutput >= 201 && @finaloutput <= 300

  		@api_color = "purple"
  		@api_description = "Health alert: everyone may experience more serious health effects."
  		@aqi_name = "Very Unhealthy (201 - 300)"

  		elsif @finaloutput >= 301 && @finaloutput <= 500

  		@api_color = "maroon"
  		@api_description = "Health warnings of emergency conditions. The entire population is more likely to be affected."
  		@aqi_name = "Hazardous (301 - 500)"

  		else
  		@api_color =""

  		end

  end

  def zipcode
  	  	@zip_query = params[:zipcode]

  	if params[:zipcode] == ""
  		@zip_query = "Hey you forgot to enter a zipcode!"
  	elsif params[:zipcode]
  		# DO API STUFF



  		require 'net/http'
  	require 'json'
  	@url = 'http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=' +@zip_query+ '&distance=0&API_KEY=32F53F7A-CD39-4F83-A668-0723D1B23155'
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@output = JSON.parse(@response)
  	#Check if result is empty
  	if @output.empty?
  		@finaloutput = "ERROR!"
  	elsif !@output
  		@finaloutput = "error!"
  	else
  		@finaloutput = @output[0]['AQI']
  		end

  		if @finaloutput == "ERROR!"

  			@api_color = "gray"

  		elsif @finaloutput <= 50

  			@api_color = "green"
  			@api_description = "Air quality is considered satisfactory, and air pollution poses little or no risk."
  			@aqi_name = "Good (0 - 50)"

  		elsif @finaloutput >= 51 && @finaloutput <= 100

  		@api_color = "yellow"
  		@api_description = "Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution."
  		@aqi_name = "Moderate (51 - 100)"

   		elsif @finaloutput >= 101 && @finaloutput <= 150

  		@api_color = "orange"
  		@api_description = "Although general public is not likely to be affected at this AQI range, people with lung disease, older adults and children are at a greater risk from exposure to ozone, whereas persons with heart and lung disease, older adults and children are at greater risk from the presence of particles in the air."
  		@aqi_name = "Unhealthy for Sensitive Groups (101 - 150)"

  		elsif @finaloutput >= 151 && @finaloutput <= 200

  		@api_color = "red"
  		@api_description = "Everyone may begin to experience health effects; members of sensitive groups may experience more serious health effects."
  		@aqi_name = "Unhealthy (151 - 200)"

  		elsif @finaloutput >= 201 && @finaloutput <= 300

  		@api_color = "purple"
  		@api_description = "Health alert: everyone may experience more serious health effects."
  		@aqi_name = "Very Unhealthy (201 - 300)"

  		elsif @finaloutput >= 301 && @finaloutput <= 500

  		@api_color = "maroon"
  		@api_description = "Health warnings of emergency conditions. The entire population is more likely to be affected."
  		@aqi_name = "Hazardous (301 - 500)"

  		else
  		@api_color =""

  		end

  end



  		
  	end
  end


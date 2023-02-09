module CaienaHelpers
  # Helpers que podem ser utilizados em vários lugares da API
  # Assim, reduzimos a redundância de códigos

  
  def json
    JSON.parse(response.body)
  end
end
class Api::SeedController < Api::FruitController
  def create
    map_and_save(201)
  end

  def update
    # Force json-api ID to match the route id.
    begin
      params[:data][:id] = resource.id
    rescue NoMethodError
      return jsonapi_422(nil)
    end

    map_and_save(200)
  end

  protected

  def map_and_save(success_code)
    mapper = get_mapper
    return jsonapi_422(nil) unless mapper.data

    if mapper.save_all
      jsonapi_response mapper.data, options_for_response, success_code
    else
      json_response mapper.all_errors, 422
    end
  end
end

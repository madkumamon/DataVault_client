class StoredDataController < ApplicationController
  def index
    @stored_datum = access_token.get("/api/stored_data").parsed if access_token
  end

  def create
    access_token.post("/api/stored_data", params: {stored_datum: {key: params[:key], value: params[:value]}})
    redirect_to root_url
  end
end

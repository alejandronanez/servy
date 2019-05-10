defmodule Servy.BearController do
  alias Servy.Conv
  alias Servy.Wildthings

  def index(%Conv{} = conv) do
    bears = Wildthings.list_bears()

    # TODO: Transform into an HTML list

    %{conv | status: 200, resp_body: bears}
  end

  def show(%Conv{} = conv, %{"id" => id}) do
    %{conv | status: 200, resp_body: "Bear #{id}"}
  end

  def create(%Conv{} = conv, %{"name" => name, "type" => type} = params) do 
    %{
      conv
      | status: 201,
        resp_body: "Created a #{type} bear named #{name}!"
    }
  end
end
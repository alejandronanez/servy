defmodule Servy.BearController do
  alias Servy.Conv
  alias Servy.Wildthings

  def index(%Conv{} = conv) do
    items =
      Wildthings.list_bears()
      |> Enum.filter(fn(bear) -> bear.type == "Grizzly" end)
      |> Enum.sort(fn(bear1, bear2) -> bear1.name <= bear2.name end)
      |> Enum.map(fn(bear) -> "<li>#{bear.name} - #{bear.type}</li>" end)
      |> Enum.join


    %{conv | status: 200, resp_body: "<ul>#{items}</ul>"}
  end

  def show(%Conv{} = conv, %{"id" => id}) do
    bear = Wildthings.get_bear(id)

    %{conv | status: 200, resp_body: "<h1>Bear #{bear.id}: #{bear.name}</h1>"}
  end

  def create(%Conv{} = conv, %{"name" => name, "type" => type}) do 
    %{
      conv
      | status: 201,
        resp_body: "Created a #{type} bear named #{name}!"
    }
  end
end
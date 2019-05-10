defmodule Servy.BearController do
  alias Servy.Conv
  alias Servy.Wildthings
  alias Servy.Bear

  defp bear_item(bear) do
    "<li>#{bear.name} - #{bear.type}</li>"
  end

  def index(%Conv{} = conv) do
    items =
      Wildthings.list_bears()
      |> Enum.filter(fn(bear) -> Bear.is_grizzly(bear) end)
      |> Enum.sort(fn(bear1, bear2) -> Bear.order_asc_by_name(bear1, bear2) end)
      |> Enum.map(fn(bear) -> bear_item(bear) end)
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
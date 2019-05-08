defmodule Servy.Handler do
  def handle(request) do
    request
      |> parse
      |> route
      |> format_response
  end 

  def parse(request) do
    conv = %{method: "GET", path: "/wildthings", resp_body: ""}
  end

  def route(conv) do
    conv = %{method: "GET", path: "/wildthings", resp_body: "Bear, Lions, Tiger"}
  end

  def format_response(conv) do
    
  end
end
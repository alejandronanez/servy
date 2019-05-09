defmodule Servy.Parser do
  alias Servy.Conv

  def parse(request) do
    # Split the request into [...rest, params]
    [top, params_string] = String.split(request, "\n\n")

    # Split ...rest into request line, and headers
    [request_line | header_lines] = String.split(top, "\n")

    # Get method and path from the request
    [method, path, _] = String.split(request_line, " ")

    params = parse_params(params_string)

    %Conv{method: method, path: path, params: params}
  end

  def parse_params(params_string) do
    params_string |> String.trim() |> URI.decode_query()
  end
end

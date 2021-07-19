defmodule SurfaceBootstrap.Form do
  use Surface.Component
  @doc "Helper function used by the form controls"
  def field_has_error?(form, field) do
    Enum.any?(form.errors, fn {field_name, _} ->
      field_name == field
    end)
  end

  @doc "Helper function used by the form controls"
  def field_has_change?(form, field)

  def field_has_change?(%{source: atom}, _field) when is_atom(atom), do: false

  def field_has_change?(form, field) do
    field_value =
      Ecto.Changeset.get_change(form.source, field, nil) ||
        Map.get(form.params, to_string(field), nil)

    !change_blank?(field_value)
  end

  def render(assigns) do
    ~F"""

    """
  end

  defp change_blank?(""), do: true
  defp change_blank?(nil), do: true
  defp change_blank?(_), do: false
end

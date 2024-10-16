defmodule TestappWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use TestappWeb, :controller` and
  `use TestappWeb, :live_view`.
  """
  use TestappWeb, :html

  embed_templates "layouts/*"
end

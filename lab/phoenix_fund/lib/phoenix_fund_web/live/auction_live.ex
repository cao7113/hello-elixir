defmodule PhoenixFundWeb.AuctionLive do
  use PhoenixFundWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :raised, 0)}
  end

  def render(assigns) do
    ~L"""
       <h1>Cabinet of Curiosities</h1>
       <div id="auction">
           <div class="meter">
             <span style="width: <%= @raised %>%">
               $<%= @raised %> USD
             </span>
           </div>
        </div>
    """
  end
end

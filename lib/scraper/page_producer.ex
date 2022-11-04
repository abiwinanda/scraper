defmodule Scraper.PageProducer do
  use GenStage
  require Logger

  def start_link(_args) do
    intial_state = []
    GenStage.start_link(__MODULE__, intial_state, name: __MODULE__)
  end

  def init(initial_state) do
    Logger.info("PageProducer init")
    {:producer, initial_state}
  end

  def handle_demand(demand, state) do
    Logger.info("PageProducer received demand for #{demand} pages")
    events = []
    {:noreply, events, state}
  end
end